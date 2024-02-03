-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use ieee.std_logic_unsigned.all;
use work.SCB2SPB_Type.all; -- BS2_protocol_V0.56_20231121
--
entity bs_ila_ram_debug is
  generic (
    ADDRESS_MAX : natural := 300;
    ADDRESS_WIDTH : natural := 9;
    DATA_WIDTH : natural := 32
  );
  port (
    --    
    s_axis_bs_aurora_ram_tvalid : in std_logic;
    s_axis_bs_aurora_ram_tlast : in std_logic;
    s_axis_bs_aurora_ram_tkeep : in std_logic_vector(3 downto 0);
    s_axis_bs_aurora_ram_tdata : in std_logic_vector(DATA_WIDTH - 1 downto 0);
    -- 
    m_rd_bs_aurora_ram_tnext : out std_logic;
    s_rd_bs_aurora_ram_taddr : in std_logic_vector(ADDRESS_WIDTH - 3 downto 0);
    s_rd_bs_aurora_ram_tdata : out std_logic_vector(DATA_WIDTH - 1 downto 0);
    -- 
    ila_data : out std_logic_vector(ADDRESS_MAX * 8 - 1 downto 0);
    --
    reset_n : in std_logic;
    Clk_rd : in std_logic;
    Clk : in std_logic
    --    
  );
end entity;
--
architecture rtl of bs_ila_ram_debug is
  --
  component bs_sync_gen is
    port (
      --    
      Clk : in std_logic;
      Clk_sync : in std_logic;
      user_in : in std_logic;
      user_sync_out : out std_logic
      --    
    );
  end component;
  --
  component bs_expansion is
    generic (
      BS_PULSE_MAX : natural := 2
    );
    port (
      --    
      tpulse_out : out std_logic;
      tpulse_in : in std_logic;
      Clk : in std_logic
      --    
    );
  end component;
  --
  constant ADDRESS_MAX_WORD_CNT : natural := (DATA_WIDTH / 8); -- 75
  constant ADDRESS_MAX_WORD : natural := (ADDRESS_MAX / ADDRESS_MAX_WORD_CNT); -- 75
  constant C_DATA_ZERO : std_logic_vector(DATA_WIDTH - 1 downto 0) := (others => '0');
  --
  -- ram or rom  
  constant DPRAM_ADDRESS_WIDTH : natural := ADDRESS_WIDTH - 1; -- 256 * 2 = double buffer
  type ram_type is array (0 to (2 ** DPRAM_ADDRESS_WIDTH) - 1) of std_logic_vector(DATA_WIDTH - 1 downto 0);
  signal RAM : ram_type := (others => (others => '0'));
  attribute ram_style : string;
  attribute ram_style of RAM : signal is "block";
  signal wr_taddr_i : std_logic_vector(DPRAM_ADDRESS_WIDTH - 2 downto 0);
  signal wr_taddr_high : std_logic;
  signal wr_taddr_high_i : std_logic;
  signal rd_taddr_high : std_logic;
  signal s_axis_bs_aurora_ram_tlast_i : std_logic := '0';
  signal s_axis_bs_aurora_ram_tlast_i_i : std_logic := '0';
  -- signal
  signal ila_data_r : std_logic_vector(ADDRESS_MAX * 8 - 1 downto 0) := (others => '0');
  signal Chan_Pkt_r : SCB2SPB_Pkt_300_Type;
  -- signal Chan_Str_r : std_logic_vector(2399 downto 0) := (others => '0');
  --
begin

  -- ila_data_r <= conv_ch_bitvector(ila_data_r);
  Chan_Pkt_r <= conv_ch_packet(ila_data_r);
  --
  ila_data <= ila_data_r;
  --
  m_rd_bs_aurora_ram_tnext <= s_axis_bs_aurora_ram_tlast_i_i;

  p_wr : process (Clk, reset_n)
    variable idx_v : natural := 0;
  begin
    if (reset_n = '0') then
      wr_taddr_i <= (others => '0');
      wr_taddr_high <= '0';
      idx_v := 0;
    elsif (rising_edge(Clk)) then
      if (s_axis_bs_aurora_ram_tvalid = '1') then
        ila_data_r(idx_v * 32 + 31 downto idx_v * 32) <= s_axis_bs_aurora_ram_tdata;
        RAM(conv_integer(wr_taddr_high & wr_taddr_i)) <= s_axis_bs_aurora_ram_tdata;
        if (s_axis_bs_aurora_ram_tlast = '1') then
          wr_taddr_i <= (others => '0');
          wr_taddr_high <= not wr_taddr_high;
          idx_v := 0;
        else
          wr_taddr_i <= wr_taddr_i + '1';
          idx_v := idx_v + 1;
        end if;
      end if;
    end if;
  end process;

  p_rd : process (Clk_rd)
  begin
    rd_taddr_high <= not wr_taddr_high_i;
    if (rising_edge(Clk_rd)) then
      s_rd_bs_aurora_ram_tdata <= RAM(conv_integer(rd_taddr_high & s_rd_bs_aurora_ram_taddr)) after 1 ns;
    end if;
  end process;

  bs_expansion_i : bs_expansion
  generic map
  (
    BS_PULSE_MAX => 2
  )
  port map
  (
    --    
    tpulse_out => s_axis_bs_aurora_ram_tlast_i,
    tpulse_in => s_axis_bs_aurora_ram_tlast,
    Clk => Clk
    --    
  );
  --
  bs_sync_gen_0 : bs_sync_gen
  port map
  (
    --    
    Clk => Clk,
    Clk_sync => Clk_rd,
    user_in => s_axis_bs_aurora_ram_tlast_i,
    user_sync_out => s_axis_bs_aurora_ram_tlast_i_i
    --    
  );
  --
  bs_sync_gen_1 : bs_sync_gen
  port map
  (
    --    
    Clk => Clk,
    Clk_sync => Clk_rd,
    user_in => wr_taddr_high,
    user_sync_out => wr_taddr_high_i
    --    
  );
end architecture;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================