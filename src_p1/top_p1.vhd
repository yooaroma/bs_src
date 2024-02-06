-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
--
entity top_fft32k is
  port (
    clk_200M : in std_logic;
    clk_125M : in std_logic;
    clk_50M : in std_logic;
    bs_pl_dip_sw_0 : in std_logic_vector (3 downto 0);
    bs_pl_led_out_0 : out std_logic_vector (3 downto 0)
  );
end entity;
--
architecture rtl of top_fft32k is
  --
  component p1_clock is
    generic (
      PULSE_MAX : natural := 1000
    );
    port (
      --    
      vcc_out : out std_logic;
      gnd_out : out std_logic;

      m_dip_0 : out std_logic;
      m_dip_1 : out std_logic;
      m_dip_2 : out std_logic;
      m_dip_3 : out std_logic;
      s_dip_in : in std_logic_vector(3 downto 0);

      s_led_0 : in std_logic;
      s_led_1 : in std_logic;
      s_led_2 : in std_logic;
      s_led_3 : in std_logic;
      m_led_out : out std_logic_vector(3 downto 0);

      tpulse_5us : out std_logic;
      gt_reset_n : out std_logic;
      reset_n : out std_logic;
      Clk : in std_logic
      --    
    );
  end component;
  --
  component p1_atx_data_ramp_gen is
    generic (
      ADDRESS_MAX : natural := 75; -- 300 / 4 = 75
      ADDRESS_WIDTH : natural := 7;
      DATA_WIDTH : natural := 32
    );
    port (
      --    
      m_axis_p1_atx_tvalid : out std_logic;
      m_axis_p1_atx_tready : in std_logic;
      m_axis_p1_atx_tlast : out std_logic;
      m_axis_p1_atx_tdata : out std_logic_vector(31 downto 0);
      -- 
      m_rd_p1_atx_tstart : in std_logic;
      --
      reset_n : in std_logic;
      Clk : in std_logic
      --    
    );
  end component;
  --
  component p1_ram is
    generic (
      ADDRESS_MAX : natural := 75;
      ADDRESS_WIDTH : natural := 7;
      DATA_WIDTH : natural := 32
    );
    port (
      --    
      s_axis_p1_ram_tvalid : in std_logic;
      s_axis_p1_ram_tlast : in std_logic;
      s_axis_p1_ram_tdata : in std_logic_vector(31 downto 0);

      m_rd_p1_ram_tnext : out std_logic;
      s_rd_p1_ram_taddr : in std_logic_vector(6 downto 0);
      s_rd_p1_ram_tdata : out std_logic_vector(31 downto 0);

      reset_n : in std_logic;
      Clk_rd : in std_logic;
      Clk : in std_logic
      --    
    );
  end component;
  --
  component p1_main is
    generic (
      ADDRESS_MAX : natural := 75;
      ADDRESS_WIDTH : natural := 7;
      DATA_WIDTH : natural := 32
    );
    port (
      --    
      m_axis_cmd_tvalid : out std_logic;
      m_axis_cmd_tlast : out std_logic;
      m_axis_cmd_tdata : out std_logic_vector(31 downto 0);

      m_axis_bit_00_tvalid : out std_logic;
      m_axis_bit_00_tdata : out std_logic_vector(31 downto 0);

      m_axis_bit_01_tvalid : out std_logic;
      m_axis_bit_01_tdata : out std_logic_vector(31 downto 0);

      m_axis_bit_02_tvalid : out std_logic;
      m_axis_bit_02_tdata : out std_logic_vector(31 downto 0);

      m_axis_bit_03_tvalid : out std_logic;
      m_axis_bit_03_tdata : out std_logic_vector(31 downto 0);

      m_axis_bit_04_tvalid : out std_logic;
      m_axis_bit_04_tdata : out std_logic_vector(31 downto 0);

      m_axis_bit_05_tvalid : out std_logic;
      m_axis_bit_05_tdata : out std_logic_vector(31 downto 0);

      m_axis_bit_06_tvalid : out std_logic;
      m_axis_bit_06_tdata : out std_logic_vector(31 downto 0);

      m_axis_bit_07_tvalid : out std_logic;
      m_axis_bit_07_tdata : out std_logic_vector(31 downto 0);

      m_axis_bit_08_tvalid : out std_logic;
      m_axis_bit_08_tdata : out std_logic_vector(31 downto 0);

      m_axis_bit_09_tvalid : out std_logic;
      m_axis_bit_09_tdata : out std_logic_vector(31 downto 0);

      m_axis_bit_10_tvalid : out std_logic;
      m_axis_bit_10_tdata : out std_logic_vector(31 downto 0);

      m_axis_bit_11_tvalid : out std_logic;
      m_axis_bit_11_tdata : out std_logic_vector(31 downto 0);

      m_axis_bit_12_tvalid : out std_logic;
      m_axis_bit_12_tdata : out std_logic_vector(31 downto 0);

      m_axis_bit_13_tvalid : out std_logic;
      m_axis_bit_13_tdata : out std_logic_vector(31 downto 0);

      m_axis_bit_14_tvalid : out std_logic;
      m_axis_bit_14_tdata : out std_logic_vector(31 downto 0);

      m_axis_bit_15_tvalid : out std_logic;
      m_axis_bit_15_tdata : out std_logic_vector(31 downto 0);

      m_axis_bit_16_tvalid : out std_logic;
      m_axis_bit_16_tdata : out std_logic_vector(31 downto 0);

      m_axis_bit_17_tvalid : out std_logic;
      m_axis_bit_17_tdata : out std_logic_vector(31 downto 0);

      m_axis_bit_18_tvalid : out std_logic;
      m_axis_bit_18_tdata : out std_logic_vector(31 downto 0);

      m_rd_p1_main_taddr : out std_logic_vector(6 downto 0);
      m_rd_p1_main_tdata : in std_logic_vector(31 downto 0);

      s_p1_main_tstart : in std_logic;

      reset_n : in std_logic;
      Clk : in std_logic
      --    
    );
  end component;
  --
  component p1_buff32k is
    generic (
      ADDRESS_WIDTH : natural := 15;
      DATA_WIDTH : natural := 32
    );
    port (
      --    
      s_axis_p1_buff32k_tvalid : in std_logic;
      s_axis_p1_buff32k_tdata : in std_logic_vector(31 downto 0);

      m_rd_p1_buff32k_tnext : out std_logic;
      s_rd_p1_buff32k_taddr : in std_logic_vector(14 downto 0);
      s_rd_p1_buff32k_tdata : out std_logic_vector(31 downto 0);

      reset_n : in std_logic;
      Clk : in std_logic
      --    
    );
  end component;
  --
  --
  --
  -- componet [ p1_buff32k_i ] signal define

  signal m_rd_p1_buff32k_tnext_p1_buff32k_i : std_logic := '0';
  signal s_rd_p1_buff32k_taddr_p1_buff32k_i : std_logic_vector(14 downto 0) := (others => '0');
  signal s_rd_p1_buff32k_tdata_p1_buff32k_i : std_logic_vector(31 downto 0) := (others => '0');

  -- componet [ p1_main_i ] signal define

  signal m_axis_cmd_tvalid_p1_main_i : std_logic := '0';
  signal m_axis_cmd_tlast_p1_main_i : std_logic := '0';
  signal m_axis_cmd_tdata_p1_main_i : std_logic_vector(31 downto 0) := (others => '0');

  signal m_axis_bit_00_tvalid_p1_main_i : std_logic := '0';
  signal m_axis_bit_00_tdata_p1_main_i : std_logic_vector(31 downto 0) := (others => '0');

  signal m_axis_bit_01_tvalid_p1_main_i : std_logic := '0';
  signal m_axis_bit_01_tdata_p1_main_i : std_logic_vector(31 downto 0) := (others => '0');

  signal m_axis_bit_02_tvalid_p1_main_i : std_logic := '0';
  signal m_axis_bit_02_tdata_p1_main_i : std_logic_vector(31 downto 0) := (others => '0');

  signal m_axis_bit_03_tvalid_p1_main_i : std_logic := '0';
  signal m_axis_bit_03_tdata_p1_main_i : std_logic_vector(31 downto 0) := (others => '0');

  signal m_axis_bit_04_tvalid_p1_main_i : std_logic := '0';
  signal m_axis_bit_04_tdata_p1_main_i : std_logic_vector(31 downto 0) := (others => '0');

  signal m_axis_bit_05_tvalid_p1_main_i : std_logic := '0';
  signal m_axis_bit_05_tdata_p1_main_i : std_logic_vector(31 downto 0) := (others => '0');

  signal m_axis_bit_06_tvalid_p1_main_i : std_logic := '0';
  signal m_axis_bit_06_tdata_p1_main_i : std_logic_vector(31 downto 0) := (others => '0');

  signal m_axis_bit_07_tvalid_p1_main_i : std_logic := '0';
  signal m_axis_bit_07_tdata_p1_main_i : std_logic_vector(31 downto 0) := (others => '0');

  signal m_axis_bit_08_tvalid_p1_main_i : std_logic := '0';
  signal m_axis_bit_08_tdata_p1_main_i : std_logic_vector(31 downto 0) := (others => '0');

  signal m_axis_bit_09_tvalid_p1_main_i : std_logic := '0';
  signal m_axis_bit_09_tdata_p1_main_i : std_logic_vector(31 downto 0) := (others => '0');

  signal m_axis_bit_10_tvalid_p1_main_i : std_logic := '0';
  signal m_axis_bit_10_tdata_p1_main_i : std_logic_vector(31 downto 0) := (others => '0');

  signal m_axis_bit_11_tvalid_p1_main_i : std_logic := '0';
  signal m_axis_bit_11_tdata_p1_main_i : std_logic_vector(31 downto 0) := (others => '0');

  signal m_axis_bit_12_tvalid_p1_main_i : std_logic := '0';
  signal m_axis_bit_12_tdata_p1_main_i : std_logic_vector(31 downto 0) := (others => '0');

  signal m_axis_bit_13_tvalid_p1_main_i : std_logic := '0';
  signal m_axis_bit_13_tdata_p1_main_i : std_logic_vector(31 downto 0) := (others => '0');

  signal m_axis_bit_14_tvalid_p1_main_i : std_logic := '0';
  signal m_axis_bit_14_tdata_p1_main_i : std_logic_vector(31 downto 0) := (others => '0');

  signal m_axis_bit_15_tvalid_p1_main_i : std_logic := '0';
  signal m_axis_bit_15_tdata_p1_main_i : std_logic_vector(31 downto 0) := (others => '0');

  signal m_axis_bit_16_tvalid_p1_main_i : std_logic := '0';
  signal m_axis_bit_16_tdata_p1_main_i : std_logic_vector(31 downto 0) := (others => '0');

  signal m_axis_bit_17_tvalid_p1_main_i : std_logic := '0';
  signal m_axis_bit_17_tdata_p1_main_i : std_logic_vector(31 downto 0) := (others => '0');

  signal m_axis_bit_18_tvalid_p1_main_i : std_logic := '0';
  signal m_axis_bit_18_tdata_p1_main_i : std_logic_vector(31 downto 0) := (others => '0');

  -- componet [ p1_ram_i ] signal define

  signal s_axis_p1_ram_tvalid_p1_ram_i : std_logic := '0';
  signal s_axis_p1_ram_tlast_p1_ram_i : std_logic := '0';
  signal s_axis_p1_ram_tdata_p1_ram_i : std_logic_vector(31 downto 0) := (others => '0');

  signal m_rd_p1_ram_tnext_p1_ram_i : std_logic := '0';
  signal s_rd_p1_ram_taddr_p1_ram_i : std_logic_vector(6 downto 0) := (others => '0');
  signal s_rd_p1_ram_tdata_p1_ram_i : std_logic_vector(31 downto 0) := (others => '0');

  -- componet [ p1_clock_i ] signal define

  signal vcc_out_p1_clock_i : std_logic := '0';
  signal gnd_out_p1_clock_i : std_logic := '0';

  signal m_dip_0_p1_clock_i : std_logic := '0';
  signal m_dip_1_p1_clock_i : std_logic := '0';
  signal m_dip_2_p1_clock_i : std_logic := '0';
  signal m_dip_3_p1_clock_i : std_logic := '0';
  -- signal s_dip_in_p1_clock_i : std_logic_vector(3 downto 0) := (others => '0');

  signal s_led_0_p1_clock_i : std_logic := '0';
  signal s_led_1_p1_clock_i : std_logic := '0';
  signal s_led_2_p1_clock_i : std_logic := '0';
  signal s_led_3_p1_clock_i : std_logic := '0';
  -- signal m_led_out_p1_clock_i : std_logic_vector(3 downto 0) := (others => '0');

  signal tpulse_5us : std_logic := '0';
  signal gt_reset_n : std_logic := '0';
  signal reset_n : std_logic := '0';

  --
begin
  --
  s_led_0_p1_clock_i <= '0';
  s_led_1_p1_clock_i <= '0';
  s_led_2_p1_clock_i <= '0';
  s_led_3_p1_clock_i <= '0';
  --
  p1_clock_i : p1_clock
  generic map(
    PULSE_MAX => 1250 -- 625 -- 1000 (8 ns * 625 = 5 us)
  )
  port map(
    --    
    vcc_out => vcc_out_p1_clock_i,
    gnd_out => gnd_out_p1_clock_i,

    m_dip_0 => m_dip_0_p1_clock_i,
    m_dip_1 => m_dip_1_p1_clock_i,
    m_dip_2 => m_dip_2_p1_clock_i,
    m_dip_3 => m_dip_3_p1_clock_i,
    s_dip_in => bs_pl_dip_sw_0,

    s_led_0 => s_led_0_p1_clock_i,
    s_led_1 => s_led_1_p1_clock_i,
    s_led_2 => s_led_2_p1_clock_i,
    s_led_3 => s_led_3_p1_clock_i,
    m_led_out => bs_pl_led_out_0,

    tpulse_5us => tpulse_5us,
    gt_reset_n => gt_reset_n,
    reset_n => reset_n,
    Clk => clk_125M
    --    
  );
  --
  p1_atx_data_ramp_gen_i : p1_atx_data_ramp_gen
  generic map(
    ADDRESS_MAX => 75,
    ADDRESS_WIDTH => 7,
    DATA_WIDTH => 32
  )
  port map(
    --    
    m_axis_p1_atx_tvalid => s_axis_p1_ram_tvalid_p1_ram_i,
    m_axis_p1_atx_tready => '1',
    m_axis_p1_atx_tlast => s_axis_p1_ram_tlast_p1_ram_i,
    m_axis_p1_atx_tdata => s_axis_p1_ram_tdata_p1_ram_i,

    m_rd_p1_atx_tstart => tpulse_5us,

    reset_n => reset_n,
    Clk => clk_125M
    --    
  );
  --
  p1_ram_i : p1_ram
  generic map(
    ADDRESS_MAX => 75,
    ADDRESS_WIDTH => 7,
    DATA_WIDTH => 32
  )
  port map(
    --    
    s_axis_p1_ram_tvalid => s_axis_p1_ram_tvalid_p1_ram_i,
    s_axis_p1_ram_tlast => s_axis_p1_ram_tlast_p1_ram_i,
    s_axis_p1_ram_tdata => s_axis_p1_ram_tdata_p1_ram_i,

    m_rd_p1_ram_tnext => m_rd_p1_ram_tnext_p1_ram_i,
    s_rd_p1_ram_taddr => s_rd_p1_ram_taddr_p1_ram_i,
    s_rd_p1_ram_tdata => s_rd_p1_ram_tdata_p1_ram_i,

    reset_n => reset_n,
    Clk_rd => clk_200M,
    Clk => clk_125M
    --    
  );
  --
  p1_main_i : p1_main
  generic map(
    ADDRESS_MAX => 75,
    ADDRESS_WIDTH => 7,
    DATA_WIDTH => 32
  )
  port map(
    --    
    m_axis_cmd_tvalid => m_axis_cmd_tvalid_p1_main_i,
    m_axis_cmd_tlast => m_axis_cmd_tlast_p1_main_i,
    m_axis_cmd_tdata => m_axis_cmd_tdata_p1_main_i,

    m_axis_bit_00_tvalid => m_axis_bit_00_tvalid_p1_main_i,
    m_axis_bit_00_tdata => m_axis_bit_00_tdata_p1_main_i,

    m_axis_bit_01_tvalid => m_axis_bit_01_tvalid_p1_main_i,
    m_axis_bit_01_tdata => m_axis_bit_01_tdata_p1_main_i,

    m_axis_bit_02_tvalid => m_axis_bit_02_tvalid_p1_main_i,
    m_axis_bit_02_tdata => m_axis_bit_02_tdata_p1_main_i,

    m_axis_bit_03_tvalid => m_axis_bit_03_tvalid_p1_main_i,
    m_axis_bit_03_tdata => m_axis_bit_03_tdata_p1_main_i,

    m_axis_bit_04_tvalid => m_axis_bit_04_tvalid_p1_main_i,
    m_axis_bit_04_tdata => m_axis_bit_04_tdata_p1_main_i,

    m_axis_bit_05_tvalid => m_axis_bit_05_tvalid_p1_main_i,
    m_axis_bit_05_tdata => m_axis_bit_05_tdata_p1_main_i,

    m_axis_bit_06_tvalid => m_axis_bit_06_tvalid_p1_main_i,
    m_axis_bit_06_tdata => m_axis_bit_06_tdata_p1_main_i,

    m_axis_bit_07_tvalid => m_axis_bit_07_tvalid_p1_main_i,
    m_axis_bit_07_tdata => m_axis_bit_07_tdata_p1_main_i,

    m_axis_bit_08_tvalid => m_axis_bit_08_tvalid_p1_main_i,
    m_axis_bit_08_tdata => m_axis_bit_08_tdata_p1_main_i,

    m_axis_bit_09_tvalid => m_axis_bit_09_tvalid_p1_main_i,
    m_axis_bit_09_tdata => m_axis_bit_09_tdata_p1_main_i,

    m_axis_bit_10_tvalid => m_axis_bit_10_tvalid_p1_main_i,
    m_axis_bit_10_tdata => m_axis_bit_10_tdata_p1_main_i,

    m_axis_bit_11_tvalid => m_axis_bit_11_tvalid_p1_main_i,
    m_axis_bit_11_tdata => m_axis_bit_11_tdata_p1_main_i,

    m_axis_bit_12_tvalid => m_axis_bit_12_tvalid_p1_main_i,
    m_axis_bit_12_tdata => m_axis_bit_12_tdata_p1_main_i,

    m_axis_bit_13_tvalid => m_axis_bit_13_tvalid_p1_main_i,
    m_axis_bit_13_tdata => m_axis_bit_13_tdata_p1_main_i,

    m_axis_bit_14_tvalid => m_axis_bit_14_tvalid_p1_main_i,
    m_axis_bit_14_tdata => m_axis_bit_14_tdata_p1_main_i,

    m_axis_bit_15_tvalid => m_axis_bit_15_tvalid_p1_main_i,
    m_axis_bit_15_tdata => m_axis_bit_15_tdata_p1_main_i,

    m_axis_bit_16_tvalid => m_axis_bit_16_tvalid_p1_main_i,
    m_axis_bit_16_tdata => m_axis_bit_16_tdata_p1_main_i,

    m_axis_bit_17_tvalid => m_axis_bit_17_tvalid_p1_main_i,
    m_axis_bit_17_tdata => m_axis_bit_17_tdata_p1_main_i,

    m_axis_bit_18_tvalid => m_axis_bit_18_tvalid_p1_main_i,
    m_axis_bit_18_tdata => m_axis_bit_18_tdata_p1_main_i,

    m_rd_p1_main_taddr => s_rd_p1_ram_taddr_p1_ram_i,
    m_rd_p1_main_tdata => s_rd_p1_ram_tdata_p1_ram_i,

    s_p1_main_tstart => m_rd_p1_ram_tnext_p1_ram_i,

    reset_n => reset_n,
    Clk => clk_200M
    --    
  );
  --
  p1_buff32k_0 : p1_buff32k
  generic map(
    ADDRESS_WIDTH => 15,
    DATA_WIDTH => 32
  )
  port map(
    --    
    s_axis_p1_buff32k_tvalid => m_axis_bit_00_tvalid_p1_main_i,
    s_axis_p1_buff32k_tdata => m_axis_bit_00_tdata_p1_main_i,

    m_rd_p1_buff32k_tnext => m_rd_p1_buff32k_tnext_p1_buff32k_i,
    s_rd_p1_buff32k_taddr => s_rd_p1_buff32k_taddr_p1_buff32k_i,
    s_rd_p1_buff32k_tdata => s_rd_p1_buff32k_tdata_p1_buff32k_i,

    reset_n => reset_n,
    Clk => clk_200M
    --    
  );

  --
end architecture;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================