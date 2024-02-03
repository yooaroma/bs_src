-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
--
entity top_aurora is
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
    clk_200M : in std_logic;
    clk_125M : in std_logic;
    clk_50M : in std_logic;
    bs_pl_dip_sw_0 : in std_logic_vector (3 downto 0);
    bs_pl_led_out_0 : out std_logic_vector (3 downto 0)
  );
end entity;
--
architecture rtl of top_aurora is
  --
  component bs_reset_n is
    generic (
      BS_MCLK : natural := 200;
      RESET_NS_MAX : natural := 500
    );
    port (
      --    
      reset_n : out std_logic;
      Clk : in std_logic
      --    
    );
  end component;
  --
  component bs_5usec is
    generic (
      BS_MCLK : natural := 200
    );
    port (
      --    
      tpulse_5us : out std_logic;
      Clk : in std_logic
      --    
    );
  end component;
  --
  component bs_msec is
    generic (
      BS_MS_MAX : natural := 50
    );
    port (
      --    
      tpulse_ms : out std_logic;
      tpulse_5us : in std_logic;
      Clk : in std_logic
      --    
    );
  end component;
  --
  component bs_cnt is
    generic (
      BS_CNT_MAX : natural := 1000
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
  component bs_sw_led is
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
      m_led_out : out std_logic_vector(3 downto 0)
      --    
    );
  end component;
  --
  -- componet [ bs_sw_led_i ] signal define
  --
  signal m_dip_0_bs_sw_led_i : std_logic := '0';
  signal m_dip_1_bs_sw_led_i : std_logic := '0';
  signal m_dip_2_bs_sw_led_i : std_logic := '0';
  signal m_dip_3_bs_sw_led_i : std_logic := '0';

  signal s_led_0_bs_sw_led_i : std_logic := '0';
  signal s_led_1_bs_sw_led_i : std_logic := '0';
  signal s_led_2_bs_sw_led_i : std_logic := '0';
  signal s_led_3_bs_sw_led_i : std_logic := '0';
  --
  -- componet [ bs_reset_n_i ] signal define
  signal reset_n : std_logic := '0';
  signal aurora_reset_n : std_logic := '0';
  signal aurora_gt_reset_n : std_logic := '0';
  signal vcc_out : std_logic := '0';
  signal gnd_out : std_logic := '0';
  --
  -- componet [ bs_5usec_i ] signal define
  signal tpulse_5sec : std_logic := '0';
  signal tpulse_5ms : std_logic := '0';
  signal tpulse_5us : std_logic := '0';
  signal tpulse_start_i : std_logic := '0';
  --
  --
  --
  component bs_aurora_atx_data_ramp_gen is
    generic (
      ADDRESS_MAX : natural := 300;
      ADDRESS_WIDTH : natural := 7;
      DATA_WIDTH : natural := 32
    );
    port (
      --    
      m_axis_bs_aurora_atx_tvalid : out std_logic;
      m_axis_bs_aurora_atx_tready : in std_logic;
      m_axis_bs_aurora_atx_tlast : out std_logic;
      m_axis_bs_aurora_atx_tkeep : out std_logic_vector(3 downto 0);
      m_axis_bs_aurora_atx_tdata : out std_logic_vector(DATA_WIDTH - 1 downto 0);

      s_rd_bs_aurora_atx_tstart : in std_logic;

      reset_n : in std_logic;
      Clk : in std_logic
      --    
    );
  end component;
  --
  component bs_aurora_ram is
    generic (
      ADDRESS_MAX : natural := 300;
      ADDRESS_WIDTH : natural := 7;
      DATA_WIDTH : natural := 32
    );
    port (
      --    
      s_axis_bs_aurora_ram_tvalid : in std_logic;
      s_axis_bs_aurora_ram_tlast : in std_logic;
      s_axis_bs_aurora_ram_tkeep : in std_logic_vector(3 downto 0);
      s_axis_bs_aurora_ram_tdata : in std_logic_vector(DATA_WIDTH - 1 downto 0);

      m_rd_bs_aurora_ram_tnext : out std_logic;
      s_rd_bs_aurora_ram_taddr : in std_logic_vector(ADDRESS_WIDTH - 1 downto 0);
      s_rd_bs_aurora_ram_tdata : out std_logic_vector(DATA_WIDTH - 1 downto 0);

      reset_n : in std_logic;
      Clk_rd : in std_logic;
      Clk : in std_logic
      --    
    );
  end component;
  --
  component bs_aurora_atx_ext is
    generic (
      ADDRESS_MAX : natural := 300;
      ADDRESS_WIDTH : natural := 7;
      DATA_WIDTH : natural := 32
    );
    port (
      --    
      m_axis_bs_aurora_atx_tvalid : out std_logic;
      m_axis_bs_aurora_atx_tready : in std_logic;
      m_axis_bs_aurora_atx_tlast : out std_logic;
      m_axis_bs_aurora_atx_tkeep : out std_logic_vector(3 downto 0);
      m_axis_bs_aurora_atx_tdata : out std_logic_vector(DATA_WIDTH - 1 downto 0);

      s_rd_bs_aurora_atx_tstart : in std_logic;
      m_rd_bs_aurora_atx_taddr : out std_logic_vector(ADDRESS_WIDTH - 1 downto 0);
      m_rd_bs_aurora_atx_tdata : in std_logic_vector(DATA_WIDTH - 1 downto 0);

      reset_n : in std_logic;
      Clk : in std_logic
      --    
    );
  end component;
  --
  -- componet [ bs_aurora_atx_ext_i ] signal define
  --
  signal s_rd_bs_aurora_atx_tstart_bs_aurora_atx_ext_1 : std_logic := '0';
  signal m_rd_bs_aurora_atx_taddr_bs_aurora_atx_ext_1 : std_logic_vector(6 downto 0) := (others => '0');
  signal m_rd_bs_aurora_atx_tdata_bs_aurora_atx_ext_1 : std_logic_vector(31 downto 0) := (others => '0');
  --
  -- componet [ bs_aurora_ram_0 ] signal define
  --
  signal m_rd_bs_aurora_ram_tnext_bs_aurora_ram_0 : std_logic := '0';
  signal s_rd_bs_aurora_ram_taddr_bs_aurora_ram_0 : std_logic_vector(6 downto 0) := (others => '0');
  signal s_rd_bs_aurora_ram_tdata_bs_aurora_ram_0 : std_logic_vector(31 downto 0) := (others => '0');
  --
  --
  --
  --
  --
  --
  --
  --
  --
  --
  --
  --
  --
begin
  --
  --
  --
  s_led_0_bs_sw_led_i <= '0';
  s_led_1_bs_sw_led_i <= '1';
  s_led_2_bs_sw_led_i <= '0';
  s_led_3_bs_sw_led_i <= '1';
  --
  bs_sw_led_i : bs_sw_led
  port map(
    --    
    vcc_out => vcc_out,
    gnd_out => gnd_out,

    m_dip_0 => m_dip_0_bs_sw_led_i,
    m_dip_1 => m_dip_1_bs_sw_led_i,
    m_dip_2 => m_dip_2_bs_sw_led_i,
    m_dip_3 => m_dip_3_bs_sw_led_i,
    s_dip_in => bs_pl_dip_sw_0,

    s_led_0 => s_led_0_bs_sw_led_i,
    s_led_1 => s_led_1_bs_sw_led_i,
    s_led_2 => s_led_2_bs_sw_led_i,
    s_led_3 => s_led_3_bs_sw_led_i,
    m_led_out => bs_pl_led_out_0
    --    
  );
  --
  bs_reset_n_i : bs_reset_n
  generic map(
    BS_MCLK => 200,
    RESET_NS_MAX => 500
  )
  port map(
    --    
    reset_n => reset_n,
    Clk => clk_200M
    --    
  );
  --  
  bs_aurora_reset_n_i : bs_reset_n
  generic map(
    BS_MCLK => 125,
    RESET_NS_MAX => 500
  )
  port map(
    --    
    reset_n => aurora_reset_n,
    Clk => clk_125M
    --    
  );
  --
  bs_aurora_gt_reset_n_i : bs_reset_n
  generic map(
    BS_MCLK => 125,
    RESET_NS_MAX => 1000
  )
  port map(
    --    
    reset_n => aurora_gt_reset_n,
    Clk => clk_125M
    --    
  );
  --
  bs_5usec_i : bs_5usec
  generic map(
    BS_MCLK => 125
  )
  port map(
    --    
    tpulse_5us => tpulse_5us,
    Clk => clk_125M
    --    
  );
  --
  bs_expansion_i : bs_expansion
  generic map(
    BS_PULSE_MAX => 2
  )
  port map(
    --    
    tpulse_out => tpulse_start_i,
    tpulse_in => tpulse_5sec,
    Clk => clk_125M
    --    
  );
  --
  bs_cnt_0 : bs_cnt
  generic map (
    BS_CNT_MAX => 20
  )
  port map (
    --    
    tpulse_out => tpulse_5ms,
    tpulse_in => tpulse_5us,
    Clk => clk_125M 
    --    
  );
  --
  bs_cnt_1 : bs_cnt
  generic map (
    BS_CNT_MAX => 10
  )
  port map (
    --    
    tpulse_out => tpulse_5sec,
    tpulse_in => tpulse_5ms,
    Clk => clk_125M 
    --    
  );
  --
  --
  --
  --
  --
  bs_aurora_atx_data_ramp_gen_0 : bs_aurora_atx_data_ramp_gen
  generic map(
    ADDRESS_MAX => 300,
    ADDRESS_WIDTH => 7,
    DATA_WIDTH => 32
  )
  port map(
    --    
    m_axis_bs_aurora_atx_tvalid => s_axis_0_bs_aurora_atx_tvalid,
    m_axis_bs_aurora_atx_tready => '1',
    m_axis_bs_aurora_atx_tlast => s_axis_0_bs_aurora_atx_tlast,
    m_axis_bs_aurora_atx_tkeep => open,
    m_axis_bs_aurora_atx_tdata => s_axis_0_bs_aurora_atx_tdata,

    s_rd_bs_aurora_atx_tstart => tpulse_start_i,

    reset_n => aurora_reset_n,
    Clk => clk_125M
    --    
  );
  --  
  --
  bs_aurora_ram_1 : bs_aurora_ram
  generic map(
    ADDRESS_MAX => 300,
    ADDRESS_WIDTH => 7,
    DATA_WIDTH => 32
  )
  port map(
    --    
    s_axis_bs_aurora_ram_tvalid => m_axis_1_bs_aurora_atx_tvalid,
    s_axis_bs_aurora_ram_tlast => m_axis_1_bs_aurora_atx_tlast,
    s_axis_bs_aurora_ram_tkeep => "1111",
    s_axis_bs_aurora_ram_tdata => m_axis_1_bs_aurora_atx_tdata,

    m_rd_bs_aurora_ram_tnext => s_rd_bs_aurora_atx_tstart_bs_aurora_atx_ext_1,
    s_rd_bs_aurora_ram_taddr => m_rd_bs_aurora_atx_taddr_bs_aurora_atx_ext_1,
    s_rd_bs_aurora_ram_tdata => m_rd_bs_aurora_atx_tdata_bs_aurora_atx_ext_1,

    reset_n => aurora_reset_n,
    Clk_rd => clk_125M,
    Clk => clk_125M
    --    
  );
  --
  bs_aurora_atx_ext_1 : bs_aurora_atx_ext
  generic map(
    ADDRESS_MAX => 300,
    ADDRESS_WIDTH => 7,
    DATA_WIDTH => 32
  )
  port map(
    --    
    m_axis_bs_aurora_atx_tvalid => s_axis_1_bs_aurora_atx_tvalid,
    m_axis_bs_aurora_atx_tready => '1',
    m_axis_bs_aurora_atx_tlast => s_axis_1_bs_aurora_atx_tlast,
    m_axis_bs_aurora_atx_tkeep => open,
    m_axis_bs_aurora_atx_tdata => s_axis_1_bs_aurora_atx_tdata,

    s_rd_bs_aurora_atx_tstart => s_rd_bs_aurora_atx_tstart_bs_aurora_atx_ext_1,
    m_rd_bs_aurora_atx_taddr => m_rd_bs_aurora_atx_taddr_bs_aurora_atx_ext_1,
    m_rd_bs_aurora_atx_tdata => m_rd_bs_aurora_atx_tdata_bs_aurora_atx_ext_1,

    reset_n => aurora_reset_n,
    Clk => clk_125M
    --    
  );
  --
  bs_aurora_ram_0 : bs_aurora_ram
  generic map(
    ADDRESS_MAX => 300,
    ADDRESS_WIDTH => 7,
    DATA_WIDTH => 32
  )
  port map(
    --    
    s_axis_bs_aurora_ram_tvalid => m_axis_0_bs_aurora_atx_tvalid,
    s_axis_bs_aurora_ram_tlast => m_axis_0_bs_aurora_atx_tlast,
    s_axis_bs_aurora_ram_tkeep => "1111",
    s_axis_bs_aurora_ram_tdata => m_axis_0_bs_aurora_atx_tdata,

    m_rd_bs_aurora_ram_tnext => m_rd_bs_aurora_ram_tnext_bs_aurora_ram_0,
    s_rd_bs_aurora_ram_taddr => s_rd_bs_aurora_ram_taddr_bs_aurora_ram_0,
    s_rd_bs_aurora_ram_tdata => s_rd_bs_aurora_ram_tdata_bs_aurora_ram_0,

    reset_n => aurora_reset_n,
    Clk_rd => clk_125M,
    Clk => clk_125M
    --    
  );
  --
  --
  --
  --
  --
  --
  --
  --
  --
  --
  --
  --
  --
  --
  --
  --
  --
  --
  --
  --
  --
  --
  --
  --
end architecture;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================