-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
--
entity bs_sync_gen is
  port (
    clk : in std_logic;
    clk_sync : in std_logic;
    user_in : in std_logic;
    user_sync_out : out std_logic
  );
end entity;
--
architecture arch of bs_sync_gen is
  --
  -- componet
  --  
  component bs_aurora_8b10b_cdc_sync_exdes is
    generic (
      C_CDC_TYPE : integer range 0 to 2 := 1;
      -- 0 is pulse synch
      -- 1 is level synch
      -- 2 is ack based level sync
      C_RESET_STATE : integer range 0 to 1 := 0;
      -- 0 is reset not needed 
      -- 1 is reset needed 
      C_SINGLE_BIT : integer range 0 to 1 := 1;
      -- 0 is bus input
      -- 1 is single bit input
      C_FLOP_INPUT : integer range 0 to 1 := 0;
      C_VECTOR_WIDTH : integer range 0 to 32 := 32;
      C_MTBF_STAGES : integer range 0 to 6 := 2
      -- Vector Data witdth
    );
    port (
      prmry_aclk : in std_logic; --
      prmry_resetn : in std_logic; --
      prmry_in : in std_logic; --
      prmry_vect_in : in std_logic_vector --
      (C_VECTOR_WIDTH - 1 downto 0); --
      prmry_ack : out std_logic;
      --
      scndry_aclk : in std_logic; --
      scndry_resetn : in std_logic; --
      --
      -- Primary to Secondary Clock Crossing        
      --
      scndry_out : out std_logic; --
      --
      scndry_vect_out : out std_logic_vector --
      (C_VECTOR_WIDTH - 1 downto 0) --
    );
  end component;
  --
  -- signal
  --
  signal user_in_i : std_logic := '0';
  --
  --
begin
  --      
  --      
  --      
  --      
  --      
  user_sync_out <= user_in_i;
  --
  --
  --
  --
  --
  cdc_user_sync_i : bs_aurora_8b10b_cdc_sync_exdes
  generic map
  (
    c_cdc_type => 1, -- 0 is pulse synch -- 1 is level synch
    c_flop_input => 1,
    c_reset_state => 0, -- 0 is reset not needed  -- 1 is reset needed 
    c_single_bit => 1,
    c_vector_width => 2,
    c_mtbf_stages => 3
  )
  port map
  (
    prmry_aclk => clk,
    prmry_resetn => '1',
    prmry_in => user_in,
    prmry_vect_in => "00",
    scndry_aclk => clk_sync,
    scndry_resetn => '1',
    prmry_ack => open,
    scndry_out => user_in_i,
    scndry_vect_out => open
  );
  --
end arch;
--
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
--
entity bs_pulse_expansion is
  generic (
    expansion_max : natural := 5 -- max 7
  );
  port (
    clk : in std_logic;
    reset_n : in std_logic;
    tlast_in : in std_logic;
    tlast_out : out std_logic
  );
end entity;
--
architecture arch of bs_pulse_expansion is
begin
  --    
  p_last_expansion : process (clk, reset_n)
    variable bit_idx : std_logic_vector(expansion_max downto 0);
  begin
    if (reset_n = '0') then
      bit_idx := (others => '0');
    elsif (rising_edge(clk)) then
      if (tlast_in = '1') then
        bit_idx := (others => '1');
      else
        bit_idx := bit_idx(expansion_max - 1 downto 0) & '0';
      end if;
    end if;
    tlast_out <= bit_idx(expansion_max);
  end process;
end arch;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
--
entity bs_pulse_5us is
  generic (
    PULSE_MAX : natural := 1000
  );
  port (
    clk : in std_logic;
    reset_n : in std_logic;
    tstart_level : in std_logic;
    tpulse_5us : out std_logic
  );
end entity;
--
architecture arch of bs_pulse_5us is
  signal tstart_level_i : std_logic := '0';
  signal tpulse_5us_i : std_logic := '0';
  signal tpulse_5us_i_i : std_logic := '0';
  signal tvalid : std_logic := '0';
begin
  --    
  tpulse_5us <= tpulse_5us_i;
  p_last_expansion : process (clk, reset_n)
    variable bit_idx_v : natural := 0;
  begin
    if (reset_n = '0') then
      bit_idx_v := 0;
      tvalid <= '0';
      tpulse_5us_i <= '0';
      tpulse_5us_i_i <= '0';
    elsif (rising_edge(clk)) then
      tstart_level_i <= tstart_level;
      if ((tstart_level = '1') and (tstart_level_i = '0')) or (bit_idx_v = PULSE_MAX) then -- 5ns : 5us pulse
        bit_idx_v := 0;
        tpulse_5us_i <= '1';
      end if;
      if (tpulse_5us_i = '1') then
        tpulse_5us_i_i <= '1';
      end if;
      if (tpulse_5us_i_i = '1') then
        tpulse_5us_i_i <= '0';
        tpulse_5us_i <= '0';
        tvalid <= '1';
      end if;
      if (tvalid = '1') then
        bit_idx_v := bit_idx_v + 1;
      end if;
    end if;
  end process;
end arch;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
--
entity bs_pulse_oneshot is
  generic (
    PULSE_ONESHOT_MAX : natural := 10 -- 10 * 5 = 50 nsec
  );
  port (
    clk : in std_logic;
    reset_n : in std_logic;
    tstart_level : in std_logic;
    tpulse_oneshot : out std_logic
  );
end entity;
--
architecture arch of bs_pulse_oneshot is
  signal tstart_level_i : std_logic := '0';
  signal tpulse_oneshot_i : std_logic := '0';
  signal tpulse_oneshot_i_i : std_logic := '0';
  signal tvalid : std_logic := '0';
begin
  --    
  tpulse_oneshot <= tpulse_oneshot_i;
  p_last_expansion : process (clk, reset_n)
    variable bit_idx_v : natural := 0;
  begin
    if (reset_n = '0') then
      bit_idx_v := 0;
      tvalid <= '0';
      tpulse_oneshot_i <= '0';
      tpulse_oneshot_i_i <= '0';
    elsif (rising_edge(clk)) then
      tstart_level_i <= tstart_level;
      if ((tstart_level = '1') and (tstart_level_i = '0')) then 
        bit_idx_v := 0;
        tvalid <= '1';
      end if;
      if (tvalid = '1') then
        bit_idx_v := bit_idx_v + 1;
      end if;
      if (bit_idx_v = PULSE_ONESHOT_MAX) then -- 5ns : 50 ns pulse
        bit_idx_v := 0;
        tvalid <= '0';
        tpulse_oneshot_i <= '1';
      end if;
      if (tpulse_oneshot_i = '1') then
        tpulse_oneshot_i_i <= '1';
      end if;
      if (tpulse_oneshot_i_i = '1') then
        tpulse_oneshot_i_i <= '0';
        tpulse_oneshot_i <= '0';
      end if;
    end if;
  end process;
end arch;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
--
entity bs_reset_expansion is
  generic (
    expansion_max : natural := 10 -- 10 * 5 ns = 50 ns
  );
  port (
    clk : in std_logic;
    treset_n_in : in std_logic;
    treset_n_out : out std_logic
  );
end entity;
--
architecture arch of bs_reset_expansion is
begin
  --
  p_last_expansion : process (clk)
    variable bit_idx : std_logic_vector(expansion_max downto 0);
  begin
    if (rising_edge(clk)) then
      if (treset_n_in = '0') then
        bit_idx := (others => '0');
      else
        bit_idx := bit_idx(expansion_max - 1 downto 0) & '1';
      end if;
    end if;
    treset_n_out <= bit_idx(expansion_max);
  end process;
end arch;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================