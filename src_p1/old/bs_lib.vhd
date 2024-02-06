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
    --    
    Clk : in std_logic;
    Clk_sync : in std_logic;
    user_in : in std_logic;
    user_sync_out : out std_logic
    --    
  );
end entity;
--
architecture rtl of bs_sync_gen is
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
    prmry_aclk => Clk,
    prmry_resetn => '1',
    prmry_in => user_in,
    prmry_vect_in => "00",
    scndry_aclk => Clk_sync,
    scndry_resetn => '1',
    prmry_ack => open,
    scndry_out => user_in_i,
    scndry_vect_out => open
  );
  --
end architecture;
--
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
--
entity bs_expansion is
  generic (
    expansion_max : natural := 2 -- max 7
  );
  port (
    Clk : in std_logic;
    reset_n : in std_logic;
    tlast_in : in std_logic;
    tlast_out : out std_logic
  );
end entity;
--
architecture rtl of bs_expansion is
  signal bit_idx_n : std_logic_vector(expansion_max downto 0) := (others => '0');
begin
  --    
  p_last_expansion : process (Clk, reset_n)
  begin
    if (reset_n = '0') then
      bit_idx_n <= (others => '0');
    elsif (rising_edge(Clk)) then
      if (tlast_in = '1') then
        bit_idx_n <= (others => '1');
      else
        bit_idx_n <= bit_idx_n(expansion_max - 1 downto 0) & '0';
      end if;
    end if;
    tlast_out <= bit_idx_n(expansion_max);
  end process;
end architecture;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
--
entity bs_5us is
  generic (
    PULSE_MAX : natural := 1000
  );
  port (
    Clk : in std_logic;
    reset_n : in std_logic;
    tstart_level : in std_logic;
    tpulse_5us : out std_logic
  );
end entity;
--
architecture rtl of bs_5us is
  signal tstart_level_i : std_logic := '0';
  signal tpulse_5us_i : std_logic := '0';
  signal tpulse_5us_i_i : std_logic := '0';
  signal tvalid : std_logic := '0';
  signal bit_idx_n : std_logic_vector(10 downto 0) := (others => '0');
begin
  --    
  tpulse_5us <= tpulse_5us_i;
  p_last_expansion : process (Clk, reset_n)
  begin
    if (reset_n = '0') then
      bit_idx_n <= (others => '0');
      tvalid <= '0';
      tpulse_5us_i <= '0';
      tpulse_5us_i_i <= '0';
    elsif (rising_edge(Clk)) then
      tstart_level_i <= tstart_level;
      if ((tstart_level = '1') and (tstart_level_i = '0')) then -- 5ns : 5us pulse
        bit_idx_n <= (others => '0');
        tpulse_5us_i <= '1';
        tvalid <= '1';
      end if;
      if (tpulse_5us_i = '1') then
        tpulse_5us_i_i <= '1';
      end if;
      if (tpulse_5us_i_i = '1') then
        tpulse_5us_i_i <= '0';
        tpulse_5us_i <= '0';
      end if;
      if (tvalid = '1') and (bit_idx_n = PULSE_MAX) then
        bit_idx_n <= (others => '0');
        tpulse_5us_i <= '1';
      else
        bit_idx_n <= bit_idx_n + 1;
      end if;
    end if;
  end process;
end architecture;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
--
entity bs_oneshot is
  generic (
    PULSE_ONESHOT_MAX : natural := 10 -- 10 * 5 = 50 nsec
  );
  port (
    Clk : in std_logic;
    reset_n : in std_logic;
    tstart_level : in std_logic;
    tpulse_oneshot : out std_logic
  );
end entity;
--
architecture rtl of bs_oneshot is
  signal tstart_level_i : std_logic := '0';
  signal tpulse_oneshot_i : std_logic := '0';
  signal tpulse_oneshot_i_i : std_logic := '0';
  signal tvalid : std_logic := '0';
begin
  --    
  tpulse_oneshot <= tpulse_oneshot_i;
  p_last_expansion : process (Clk, reset_n)
    variable bit_idx_v : natural := 0;
  begin
    if (reset_n = '0') then
      bit_idx_v := 0;
      tvalid <= '0';
      tpulse_oneshot_i <= '0';
      tpulse_oneshot_i_i <= '0';
    elsif (rising_edge(Clk)) then
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
end architecture;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
--
entity bs_reset_gen is
  generic (
    reset_max : natural := 40
  );
  port (
    --    
    vcc_out : out std_logic;
    gnd_out : out std_logic;
    reset_n_out : out std_logic;
    Clk : in std_logic
    --    
  );
end entity;
--
architecture rtl of bs_reset_gen is
  --
  -- signal reset_n_i : std_logic := '0';
  signal bit_idx_i : std_logic_vector(7 downto 0);
  --
begin
  --
  vcc_out <= '1';
  gnd_out <= '0';
  reset_n_out <= bit_idx_i(6); -- reset_n_i;
  --
  p_reset_n : process (Clk)
  begin
    if (rising_edge(Clk)) then
      if (bit_idx_i(6) = '1') then
        bit_idx_i <= bit_idx_i;
      else
        bit_idx_i <= bit_idx_i + 1;
      end if;
    end if;
  end process;
end architecture;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
--
entity bs_start_gen is
  generic (
    gt_reset_max : natural := 1000
  );
  port (
    --    
    pulse_level : out std_logic;
    reset_gt_n_out : out std_logic;
    reset_n : in std_logic;
    Clk : in std_logic
    --    
  );
end entity;
--
architecture rtl of bs_start_gen is
  --
  signal reset_gt_n_i : std_logic := '0';
  signal reset_gt_n_i_i : std_logic := '0';
  signal pulse_oneshot_i : std_logic := '0';
  signal pulse_oneshot_i_i : std_logic := '0';
  signal bit_idx_i : std_logic_vector(10 downto 0) := (others => '0');
  --
begin
  --
  reset_gt_n_out <= reset_gt_n_i_i;
  pulse_level <= pulse_oneshot_i_i;
  --
  p_reset_n : process (Clk)
  begin
    if (reset_n = '0') then
      reset_gt_n_i <= '0';
      pulse_oneshot_i <= '0';
      reset_gt_n_i_i <= '0';
      pulse_oneshot_i_i <= '0';
      bit_idx_i <= (others => '0');
    elsif (rising_edge(Clk)) then
      reset_gt_n_i_i <= reset_gt_n_i;
      pulse_oneshot_i_i <= pulse_oneshot_i;
      if (reset_gt_n_i = '0') and (bit_idx_i(4) = '1') then
        reset_gt_n_i <= '1';
      elsif (pulse_oneshot_i = '0') and (bit_idx_i(5) = '1') then
        pulse_oneshot_i <= '1';
      end if;
      if (bit_idx_i(10) = '1') then
        bit_idx_i <= bit_idx_i;
      else
        bit_idx_i <= bit_idx_i + "00000000001";
      end if;
    end if;
  end process;
end architecture;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
--
entity bs_sw_led is
  port (
    --    
    bs_pl_dip_sw : in std_logic_vector(3 downto 0);
    bs_pl_led_0 : in std_logic;
    bs_pl_led_1 : in std_logic;
    bs_pl_led_2 : in std_logic;
    bs_pl_led_3 : in std_logic;
    -- 
    bs_pl_dip_high : out std_logic_vector(1 downto 0);
    bs_pl_dip_low : out std_logic_vector(1 downto 0);
    bs_pl_led_out : out std_logic_vector(3 downto 0);
    bs_pl_dip_sw_out : out std_logic_vector(3 downto 0);
    -- 
    Clk : in std_logic
    --    
  );
end entity;
--
architecture rtl of bs_sw_led is
  --
  signal bs_pl_led_out_i : std_logic_vector(3 downto 0) := (others => '0');
  signal bs_pl_led_out_i_i : std_logic_vector(3 downto 0) := (others => '0');
  signal bs_pl_led_out_i_i_i : std_logic_vector(3 downto 0) := (others => '0');
  signal bs_pl_dip_sw_out_i : std_logic_vector(3 downto 0) := (others => '0');
  signal bs_pl_dip_sw_out_i_i : std_logic_vector(3 downto 0) := (others => '0');
  --
begin
  bs_pl_led_out_i(0) <= bs_pl_led_0;
  bs_pl_led_out_i(1) <= bs_pl_led_1;
  bs_pl_led_out_i(2) <= bs_pl_led_2;
  bs_pl_led_out_i(3) <= bs_pl_led_3;
  bs_pl_led_out <= bs_pl_led_out_i_i;
  bs_pl_dip_sw_out <= bs_pl_dip_sw_out_i_i;
  bs_pl_dip_high <= bs_pl_dip_sw_out_i_i(3 downto 2);
  bs_pl_dip_low <= bs_pl_dip_sw_out_i_i(1 downto 0);
  p_init : process (Clk)
  begin
    if (rising_edge(Clk)) then
      bs_pl_led_out_i_i <= bs_pl_led_out_i;
      bs_pl_led_out_i_i_i <= bs_pl_led_out_i_i;
      bs_pl_dip_sw_out_i <= bs_pl_dip_sw;
      bs_pl_dip_sw_out_i_i <= bs_pl_dip_sw_out_i;
    end if;
  end process;
  --
end architecture;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
--
entity bs_led is
  port (
    --    
    bs_pl_led_0 : in std_logic;
    bs_pl_led_1 : in std_logic;
    bs_pl_led_2 : in std_logic;
    bs_pl_led_3 : in std_logic;
    -- 
    bs_pl_led_out : out std_logic_vector(3 downto 0)
    -- 
  );
end entity;
--
architecture rtl of bs_led is
  --
begin
  --
  bs_pl_led_out(0) <= bs_pl_led_0;
  bs_pl_led_out(1) <= bs_pl_led_1;
  bs_pl_led_out(2) <= bs_pl_led_2;
  bs_pl_led_out(3) <= bs_pl_led_3;
  --
end architecture;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================