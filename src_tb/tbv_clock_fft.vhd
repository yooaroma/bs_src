-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tb_clock is
end entity;

architecture MAPPED of tb_clock is

  --*************************Parameter Declarations**************************
  -- 125.0MHz GT Reference clock
  constant CLOCKPERIOD_1 : time := 5.0 ns; -- 200M
  constant CLOCKPERIOD_2 : time := 8.0 ns; -- 125M
  constant CLOCKPERIOD_3 : time := 20.0 ns; -- 50M
  constant DLY : time := 1 ns;
  --********************************Signal Declarations**********************************

  --Freerunning Clock
  signal clk_200M_i : std_logic := '0';
  signal clk_125M_i : std_logic := '0';
  signal clk_50M_i : std_logic := '0';
  -- Component Declarations --

  component top_fft is
    port (
      --        
      s_axis_0_bs_aurora_atx_tvalid : out std_logic;
      s_axis_0_bs_aurora_atx_tready : in std_logic;
      s_axis_0_bs_aurora_atx_tlast : out std_logic;
      s_axis_0_bs_aurora_atx_tkeep : out std_logic_vector(3 downto 0);
      s_axis_0_bs_aurora_atx_tdata : out std_logic_vector(31 downto 0);
      --     
      m_axis_0_bs_aurora_atx_tvalid : in std_logic;
      m_axis_0_bs_aurora_atx_tlast : in std_logic;
      m_axis_0_bs_aurora_atx_tkeep : in std_logic_vector(3 downto 0);
      m_axis_0_bs_aurora_atx_tdata : in std_logic_vector(31 downto 0);
      --
      s_axis_1_bs_aurora_atx_tvalid : out std_logic;
      s_axis_1_bs_aurora_atx_tready : in std_logic;
      s_axis_1_bs_aurora_atx_tlast : out std_logic;
      s_axis_1_bs_aurora_atx_tkeep : out std_logic_vector(3 downto 0);
      s_axis_1_bs_aurora_atx_tdata : out std_logic_vector(31 downto 0);
      --     
      m_axis_1_bs_aurora_atx_tvalid : in std_logic;
      m_axis_1_bs_aurora_atx_tlast : in std_logic;
      m_axis_1_bs_aurora_atx_tkeep : in std_logic_vector(3 downto 0);
      m_axis_1_bs_aurora_atx_tdata : in std_logic_vector(31 downto 0);
      --
      --
      clk_200M : in std_logic;
      clk_125M : in std_logic;
      clk_50M : in std_logic;
      bs_pl_dip_sw_0 : in std_logic_vector (3 downto 0);
      bs_pl_led_out_0 : out std_logic_vector (3 downto 0)
    );
  end component;
  --
  signal s_axis_0_bs_aurora_atx_tvalid_i : std_logic;
  signal s_axis_0_bs_aurora_atx_tready_i : std_logic;
  signal s_axis_0_bs_aurora_atx_tlast_i : std_logic;
  signal s_axis_0_bs_aurora_atx_tkeep_i : std_logic_vector(3 downto 0);
  signal s_axis_0_bs_aurora_atx_tdata_i : std_logic_vector(31 downto 0);
  signal m_axis_0_bs_aurora_atx_tvalid_i : std_logic;
  signal m_axis_0_bs_aurora_atx_tlast_i : std_logic;
  signal m_axis_0_bs_aurora_atx_tkeep_i : std_logic_vector(3 downto 0);
  signal m_axis_0_bs_aurora_atx_tdata_i : std_logic_vector(31 downto 0);
  signal s_axis_1_bs_aurora_atx_tvalid_i : std_logic;
  signal s_axis_1_bs_aurora_atx_tready_i : std_logic;
  signal s_axis_1_bs_aurora_atx_tlast_i : std_logic;
  signal s_axis_1_bs_aurora_atx_tkeep_i : std_logic_vector(3 downto 0);
  signal s_axis_1_bs_aurora_atx_tdata_i : std_logic_vector(31 downto 0);
  signal m_axis_1_bs_aurora_atx_tvalid_i : std_logic;
  signal m_axis_1_bs_aurora_atx_tlast_i : std_logic;
  signal m_axis_1_bs_aurora_atx_tkeep_i : std_logic_vector(3 downto 0);
  signal m_axis_1_bs_aurora_atx_tdata_i : std_logic_vector(31 downto 0);
  --
begin
  --____________________________Clocks____________________________
  process
  begin
    clk_200M_i <= '0';
    wait for CLOCKPERIOD_1 / 2;
    clk_200M_i <= '1';
    wait for CLOCKPERIOD_1 / 2;
  end process;
  --____________________________Clocks____________________________
  process
  begin
    clk_125M_i <= '0';
    wait for CLOCKPERIOD_2 / 2;
    clk_125M_i <= '1';
    wait for CLOCKPERIOD_2 / 2;
  end process;
  --____________________________Clocks____________________________
  process
  begin
    clk_50M_i <= '0';
    wait for CLOCKPERIOD_3 / 2;
    clk_50M_i <= '1';
    wait for CLOCKPERIOD_3 / 2;
  end process;
  --____________________________Clocks____________________________
  bs_pl_dip_sw <= "1100";
  --
  s_axis_0_bs_aurora_atx_tready_i <= '1';
  --
  m_axis_0_bs_aurora_atx_tvalid_i <= s_axis_1_bs_aurora_atx_tvalid_i;
  m_axis_0_bs_aurora_atx_tlast_i <= s_axis_1_bs_aurora_atx_tlast_i;
  m_axis_0_bs_aurora_atx_tkeep_i <= s_axis_1_bs_aurora_atx_tkeep_i;
  m_axis_0_bs_aurora_atx_tdata_i <= s_axis_1_bs_aurora_atx_tdata_i;
  --
  s_axis_1_bs_aurora_atx_tready_i <= '1';
  --
  m_axis_1_bs_aurora_atx_tvalid_i <= s_axis_0_bs_aurora_atx_tvalid_i;
  m_axis_1_bs_aurora_atx_tlast_i <= s_axis_0_bs_aurora_atx_tlast_i;
  m_axis_1_bs_aurora_atx_tkeep_i <= s_axis_0_bs_aurora_atx_tkeep_i;
  m_axis_1_bs_aurora_atx_tdata_i <= s_axis_0_bs_aurora_atx_tdata_i;
  --
  top_aurora_i : top_aurora
  port map
  (
    s_axis_0_bs_aurora_atx_tvalid => s_axis_0_bs_aurora_atx_tvalid_i,
    s_axis_0_bs_aurora_atx_tready => s_axis_0_bs_aurora_atx_tready_i,
    s_axis_0_bs_aurora_atx_tlast => s_axis_0_bs_aurora_atx_tlast_i,
    s_axis_0_bs_aurora_atx_tkeep => s_axis_0_bs_aurora_atx_tkeep_i,
    s_axis_0_bs_aurora_atx_tdata => s_axis_0_bs_aurora_atx_tdata_i,
    --
    m_axis_0_bs_aurora_atx_tvalid => m_axis_0_bs_aurora_atx_tvalid_i,
    m_axis_0_bs_aurora_atx_tlast => m_axis_0_bs_aurora_atx_tlast_i,
    m_axis_0_bs_aurora_atx_tkeep => m_axis_0_bs_aurora_atx_tkeep_i,
    m_axis_0_bs_aurora_atx_tdata => m_axis_0_bs_aurora_atx_tdata_i,
    --
    s_axis_1_bs_aurora_atx_tvalid => s_axis_1_bs_aurora_atx_tvalid_i,
    s_axis_1_bs_aurora_atx_tready => s_axis_1_bs_aurora_atx_tready_i,
    s_axis_1_bs_aurora_atx_tlast => s_axis_1_bs_aurora_atx_tlast_i,
    s_axis_1_bs_aurora_atx_tkeep => s_axis_1_bs_aurora_atx_tkeep_i,
    s_axis_1_bs_aurora_atx_tdata => s_axis_1_bs_aurora_atx_tdata_i,
    --
    m_axis_1_bs_aurora_atx_tvalid => m_axis_1_bs_aurora_atx_tvalid_i,
    m_axis_1_bs_aurora_atx_tlast => m_axis_1_bs_aurora_atx_tlast_i,
    m_axis_1_bs_aurora_atx_tkeep => m_axis_1_bs_aurora_atx_tkeep_i,
    m_axis_1_bs_aurora_atx_tdata => m_axis_1_bs_aurora_atx_tdata_i,
    --
    clk_200M => clk_200M_i,
    clk_125M => clk_125M_i,
    clk_50M => clk_50M_i,
    bs_pl_dip_sw_0(3 downto 0) => bs_pl_dip_sw(3 downto 0),
    bs_pl_led_out_0(3 downto 0) => bs_pl_led_out(3 downto 0)
  );
  --
end architecture;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================