-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
--
entity top_uart is
  port (
    a_rxd : in std_logic;
    a_txd : out std_logic;
    b_rxd : in std_logic;
    b_txd : out std_logic;
    c_rxd : in std_logic;
    c_txd : out std_logic;
    d_rxd : in std_logic;
    d_txd : out std_logic;
    clk_200M : in std_logic;
    clk_125M : in std_logic;
    clk_50M : in std_logic;
    bs_pl_dip_sw_0 : in std_logic_vector (3 downto 0);
    bs_pl_led_out_0 : out std_logic_vector (3 downto 0)
  );
end entity;
--
architecture rtl of top_uart is
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
  component bs_uart_atx_data_ramp_gen is
    generic (
      ADDRESS_MAX : natural := 100;
      ADDRESS_WIDTH : natural := 8;
      DATA_WIDTH : natural := 8
    );
    port (
      --    
      m_axis_bs_uart_atx_tvalid : out std_logic;
      m_axis_bs_uart_atx_tready : in std_logic;
      m_axis_bs_uart_atx_tlast : out std_logic;
      m_axis_bs_uart_atx_tkeep : out std_logic_vector(DATA_WIDTH/8 - 1 downto 0);
      m_axis_bs_uart_atx_tdata : out std_logic_vector(DATA_WIDTH - 1 downto 0);

      s_rd_bs_uart_atx_tstart : in std_logic;

      reset_n : in std_logic;
      Clk : in std_logic
      --    
    );
  end component;
  --
  component bs_uart_tx is
    generic (
      BS_MCLK : natural := 200;
      BS_BAUDRATE : natural := 921600;
      BS_UART_MAX : natural := 100
    );
    port (
      --    
      s_axis_bs_uart_tx_tvalid : in std_logic;
      s_axis_bs_uart_tx_tready : out std_logic;
      s_axis_bs_uart_tx_tlast : in std_logic;
      s_axis_bs_uart_tx_tkeep : in std_logic_vector(0 downto 0);
      s_axis_bs_uart_tx_tdata : in std_logic_vector(7 downto 0);

      m_bs_uart_tx_done : out std_logic;

      m_bs_uart_txd : out std_logic;

      reset_n : in std_logic;
      Clk : in std_logic
      --    
    );
  end component;
  --  
  component bs_uart_rx is
    generic (
      BS_MCLK : natural := 200;
      BS_BAUDRATE : natural := 921600;
      BS_UART_MAX : natural := 100
    );
    port (
      --    
      m_axis_bs_uart_rx_tvalid : out std_logic;
      m_axis_bs_uart_rx_tlast : out std_logic;
      m_axis_bs_uart_rx_tkeep : out std_logic_vector(0 downto 0);
      m_axis_bs_uart_rx_tdata : out std_logic_vector(7 downto 0);

      s_bs_uart_rxd : in std_logic;

      reset_n : in std_logic;
      Clk : in std_logic
      --    
    );
  end component;
  --
  component bs_uart_ram is
    generic (
      ADDRESS_MAX : natural := 100;
      ADDRESS_WIDTH : natural := 8;
      DATA_WIDTH : natural := 8
    );
    port (
      --    
      s_axis_bs_uart_ram_tvalid : in std_logic;
      s_axis_bs_uart_ram_tlast : in std_logic;
      s_axis_bs_uart_ram_tkeep : in std_logic_vector(DATA_WIDTH/8 - 1 downto 0);
      s_axis_bs_uart_ram_tdata : in std_logic_vector(DATA_WIDTH - 1 downto 0);

      m_rd_bs_uart_ram_tnext : out std_logic;
      s_rd_bs_uart_ram_taddr : in std_logic_vector(ADDRESS_WIDTH - 1 downto 0);
      s_rd_bs_uart_ram_tdata : out std_logic_vector(DATA_WIDTH - 1 downto 0);

      reset_n : in std_logic;
      Clk : in std_logic
      --    
    );
  end component;
  --
  component bs_uart_atx_ext is
    generic (
      ADDRESS_MAX : natural := 100;
      ADDRESS_WIDTH : natural := 8;
      DATA_WIDTH : natural := 8
    );
    port (
      --    
      m_axis_bs_uart_atx_tvalid : out std_logic;
      m_axis_bs_uart_atx_tready : in std_logic;
      m_axis_bs_uart_atx_tlast : out std_logic;
      m_axis_bs_uart_atx_tkeep : out std_logic_vector(DATA_WIDTH/8 - 1 downto 0);
      m_axis_bs_uart_atx_tdata : out std_logic_vector(DATA_WIDTH - 1 downto 0);

      s_rd_bs_uart_atx_tstart : in std_logic;
      m_rd_bs_uart_atx_taddr : out std_logic_vector(ADDRESS_WIDTH - 1 downto 0);
      m_rd_bs_uart_atx_tdata : in std_logic_vector(DATA_WIDTH - 1 downto 0);

      reset_n : in std_logic;
      Clk : in std_logic
      --    
    );
  end component;
  --
  component bs_uart_ram_rx_32 is
    generic (
      ADDRESS_MAX : natural := 100
    );
    port (
      --    
      s_axis_bs_uart_ram_rx_32_tvalid : in std_logic;
      s_axis_bs_uart_ram_rx_32_tlast : in std_logic;
      s_axis_bs_uart_ram_rx_32_tkeep : in std_logic_vector(0 downto 0);
      s_axis_bs_uart_ram_rx_32_tdata : in std_logic_vector(7 downto 0);

      m_rd_bs_uart_ram_rx_32_tnext : out std_logic;
      s_rd_bs_uart_ram_rx_32_taddr : in std_logic_vector(7 downto 0);
      s_rd_bs_uart_ram_rx_32_tdata : out std_logic_vector(31 downto 0);

      reset_n : in std_logic;
      Clk_rd : in std_logic;
      Clk : in std_logic
      --    
    );
  end component;
  --
  component bs_uart_ram_tx_32 is
    generic (
      ADDRESS_MAX : natural := 100
    );
    port (
      --    
      s_axis_bs_uart_ram_tx_32_tvalid : in std_logic;
      s_axis_bs_uart_ram_tx_32_tlast : in std_logic;
      s_axis_bs_uart_ram_tx_32_tkeep : in std_logic_vector(3 downto 0);
      s_axis_bs_uart_ram_tx_32_tdata : in std_logic_vector(31 downto 0);

      m_rd_bs_uart_ram_tx_32_tnext : out std_logic;
      s_rd_bs_uart_ram_tx_32_taddr : in std_logic_vector(7 downto 0);
      s_rd_bs_uart_ram_tx_32_tdata : out std_logic_vector(7 downto 0);

      reset_n : in std_logic;
      Clk_rd : in std_logic;
      Clk : in std_logic
      --    
    );
  end component;
  --
  component bs_uart_tx_rd is
    generic (
      BS_MCLK : natural := 200;
      BS_BAUDRATE : natural := 921600;
      BS_UART_MAX : natural := 100
    );
    port (
      --    
      s_rd_bs_uart_tx_tstart : in std_logic;
      s_rd_bs_uart_tx_taddr : out std_logic_vector(7 downto 0);
      s_rd_bs_uart_tx_tdata : in std_logic_vector(7 downto 0);

      m_bs_uart_tx_done : out std_logic;

      m_bs_uart_txd : out std_logic;

      reset_n : in std_logic;
      Clk : in std_logic
      --    
    );
  end component;
  --
  component bs_uart_ram_tx_apb is
    generic (
      ADDRESS_MAX : natural := 100
    );
    port (
      --    
      s_apb_paddr : in std_logic_vector(31 downto 0);
      s_apb_psel : in std_logic;
      s_apb_penable : in std_logic;
      s_apb_pwrite : in std_logic;
      s_apb_pwdata : in std_logic_vector(31 downto 0);
      s_apb_pready : out std_logic;
      s_apb_prdata : out std_logic_vector(31 downto 0);
      s_apb_pslverr : out std_logic;
      s_axi_aresetn : in std_logic;
      s_axi_aclk : in std_logic;

      m_rd_bs_uart_ram_tx_apb_tnext : out std_logic;
      s_rd_bs_uart_ram_tx_apb_taddr : in std_logic_vector(7 downto 0);
      s_rd_bs_uart_ram_tx_apb_tdata : out std_logic_vector(7 downto 0);

      reset_n : in std_logic;
      Clk_rd : in std_logic
      --    
    );
  end component;
  --
  component bs_uart_ram_rx_apb is
    generic (
      ADDRESS_MAX : natural := 100
    );
    port (
      --    
      s_apb_paddr : in std_logic_vector(31 downto 0);
      s_apb_psel : in std_logic;
      s_apb_penable : in std_logic;
      s_apb_pwrite : in std_logic;
      s_apb_pwdata : in std_logic_vector(31 downto 0);
      s_apb_pready : out std_logic;
      s_apb_prdata : out std_logic_vector(31 downto 0);
      s_apb_pslverr : out std_logic;
      s_axi_aresetn : in std_logic;
      s_axi_aclk : in std_logic;

      m_bs_usrt_ram_rx_apb_tstart_n : out std_logic;
      s_axis_bs_uart_ram_rx_apb_tvalid : in std_logic;
      s_axis_bs_uart_ram_rx_apb_tlast : in std_logic;
      s_axis_bs_uart_ram_rx_apb_tkeep : in std_logic_vector(0 downto 0);
      s_axis_bs_uart_ram_rx_apb_tdata : in std_logic_vector(7 downto 0);

      reset_n : in std_logic;
      Clk : in std_logic
      --    
    );
  end component;
  --
  component bs_uart_apb_rw is
    generic (
      APB_SLAVE : natural := 2;
      ADDRESS_MAX : natural := 100
    );
    port (
      --    
      s_apb_pstart_n : in std_logic;
      --    
      m_apb_paddr : out std_logic_vector(31 downto 0);
      m_apb_psel : out std_logic_vector(APB_SLAVE - 1 downto 0);
      m_apb_penable : out std_logic;
      m_apb_pwrite : out std_logic;
      m_apb_pwdata : out std_logic_vector(31 downto 0);
      m_apb_pready : in std_logic_vector(APB_SLAVE - 1 downto 0);
      m_apb_prdata : in std_logic_vector(31 downto 0);
      m_apb_pslverr : in std_logic_vector(APB_SLAVE - 1 downto 0);
      s_axi_aresetn : in std_logic;
      s_axi_aclk : in std_logic
      --    
    );
  end component;
  --
  --
  --
  --
  --
  --
  --
  -- componet [ bs_sw_led_i ] signal define
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
  signal vcc_out : std_logic := '0';
  signal gnd_out : std_logic := '0';
  --
  -- componet [ bs_5usec_i ] signal define
  signal tpulse_5us : std_logic := '0';
  signal tpulse_5us_i : std_logic := '0';
  signal tpulse_ms : std_logic := '0';
  --
  -- componet [ bs_uart_atx_data_ramp_gen_i ] signal define
  --
  -- signal m_axis_bs_uart_atx_tvalid_bs_uart_atx_data_ramp_gen_i : std_logic := '0';
  -- signal m_axis_bs_uart_atx_tready_bs_uart_atx_data_ramp_gen_i : std_logic := '0';
  -- signal m_axis_bs_uart_atx_tlast_bs_uart_atx_data_ramp_gen_i : std_logic := '0';
  -- signal m_axis_bs_uart_atx_tdata_bs_uart_atx_data_ramp_gen_i : std_logic_vector(7 downto 0) := (others => '0');
  --
  -- componet [ bs_uart_tx_i ] signal define
  --
  signal s_axis_bs_uart_tx_tvalid_bs_uart_tx_i : std_logic := '0';
  signal s_axis_bs_uart_tx_tready_bs_uart_tx_i : std_logic := '0';
  signal s_axis_bs_uart_tx_tlast_bs_uart_tx_i : std_logic := '0';
  signal s_axis_bs_uart_tx_tdata_bs_uart_tx_i : std_logic_vector(7 downto 0) := (others => '0');
  --
  signal m_bs_uart_tx_done_bs_uart_tx_i : std_logic := '0';
  --
  signal m_bs_uart_txd : std_logic := '0';
  --
  -- componet [ bs_uart_rx_i ] signal define
  --
  signal m_axis_bs_uart_rx_tvalid_bs_uart_rx_i : std_logic := '0';
  signal m_axis_bs_uart_rx_tlast_bs_uart_rx_i : std_logic := '0';
  signal m_axis_bs_uart_rx_tdata_bs_uart_rx_i : std_logic_vector(7 downto 0) := (others => '0');
  signal m_axis_bs_uart_rx_tvalid_bs_uart_rx_2 : std_logic := '0';
  signal m_axis_bs_uart_rx_tlast_bs_uart_rx_2 : std_logic := '0';
  signal m_axis_bs_uart_rx_tdata_bs_uart_rx_2 : std_logic_vector(7 downto 0) := (others => '0');
  signal m_axis_bs_uart_rx_tvalid_bs_uart_rx_3 : std_logic := '0';
  signal m_axis_bs_uart_rx_tlast_bs_uart_rx_3 : std_logic := '0';
  signal m_axis_bs_uart_rx_tdata_bs_uart_rx_3 : std_logic_vector(7 downto 0) := (others => '0');
  signal m_axis_bs_uart_rx_tvalid_bs_uart_rx_0 : std_logic := '0';
  signal m_axis_bs_uart_rx_tlast_bs_uart_rx_0 : std_logic := '0';
  signal m_axis_bs_uart_rx_tdata_bs_uart_rx_0 : std_logic_vector(7 downto 0) := (others => '0');
  --
  -- componet [ bs_uart_ram_i ] signal define
  --
  signal m_rd_bs_uart_ram_tnext_bs_uart_ram_0 : std_logic := '0';
  signal s_rd_bs_uart_ram_taddr_bs_uart_ram_0 : std_logic_vector(7 downto 0) := (others => '0');
  signal s_rd_bs_uart_ram_tdata_bs_uart_ram_0 : std_logic_vector(7 downto 0) := (others => '0');
  --
  -- componet [ bs_uart_atx_ext_i ] signal define
  --
  signal m_axis_bs_uart_atx_tvalid_bs_uart_atx_ext_1 : std_logic := '0';
  signal m_axis_bs_uart_atx_tready_bs_uart_atx_ext_1 : std_logic := '0';
  signal m_axis_bs_uart_atx_tlast_bs_uart_atx_ext_1 : std_logic := '0';
  signal m_axis_bs_uart_atx_tdata_bs_uart_atx_ext_1 : std_logic_vector(7 downto 0) := (others => '0');

  signal s_rd_bs_uart_atx_tstart_bs_uart_atx_ext_1 : std_logic := '0';
  signal m_rd_bs_uart_atx_taddr_bs_uart_atx_ext_1 : std_logic_vector(7 downto 0) := (others => '0');
  signal m_rd_bs_uart_atx_tdata_bs_uart_atx_ext_1 : std_logic_vector(7 downto 0) := (others => '0');
  --
  -- componet [ bs_uart_atx_ext_i ] signal define
  --
  signal m_axis_bs_uart_atx_tvalid_bs_uart_atx_ext_2 : std_logic := '0';
  signal m_axis_bs_uart_atx_tready_bs_uart_atx_ext_2 : std_logic := '0';
  signal m_axis_bs_uart_atx_tlast_bs_uart_atx_ext_2 : std_logic := '0';
  signal m_axis_bs_uart_atx_tdata_bs_uart_atx_ext_2 : std_logic_vector(31 downto 0) := (others => '0');

  signal s_rd_bs_uart_atx_tstart_bs_uart_atx_ext_2 : std_logic := '0';
  signal m_rd_bs_uart_atx_taddr_bs_uart_atx_ext_2 : std_logic_vector(7 downto 0) := (others => '0');
  signal m_rd_bs_uart_atx_tdata_bs_uart_atx_ext_2 : std_logic_vector(31 downto 0) := (others => '0');
  --
  -- componet [ bs_uart_tx_rd_i ] signal define
  --
  signal s_rd_bs_uart_tx_tstart_bs_uart_tx_rd_2 : std_logic := '0';
  signal s_rd_bs_uart_tx_taddr_bs_uart_tx_rd_2 : std_logic_vector(7 downto 0) := (others => '0');
  signal s_rd_bs_uart_tx_tdata_bs_uart_tx_rd_2 : std_logic_vector(7 downto 0) := (others => '0');

  signal m_bs_uart_tx_done_bs_uart_tx_rd_2 : std_logic := '0';
  --
  -- componet [ bs_uart_tx_rd_i ] signal define
  --
  signal s_rd_bs_uart_tx_tstart_bs_uart_tx_rd_3 : std_logic := '0';
  signal s_rd_bs_uart_tx_taddr_bs_uart_tx_rd_3 : std_logic_vector(7 downto 0) := (others => '0');
  signal s_rd_bs_uart_tx_tdata_bs_uart_tx_rd_3 : std_logic_vector(7 downto 0) := (others => '0');

  signal m_bs_uart_tx_done_bs_uart_tx_rd_3 : std_logic := '0';
  --
  -- componet [ bs_uart_apb_rw_i ] signal define
  --
  signal s_apb_pstart_n_bs_uart_apb_rw_3 : std_logic := '0';

  signal s_apb_paddr_bs_uart_apb_rw_3 : std_logic_vector(31 downto 0) := (others => '0');
  signal s_apb_psel_bs_uart_apb_rw_3 : std_logic_vector(1 downto 0) := (others => '0');
  signal s_apb_penable_bs_uart_apb_rw_3 : std_logic := '0';
  signal s_apb_pwrite_bs_uart_apb_rw_3 : std_logic := '0';
  signal s_apb_pwdata_bs_uart_apb_rw_3 : std_logic_vector(31 downto 0) := (others => '0');
  signal s_apb_pready_bs_uart_apb_rw_3 : std_logic_vector(1 downto 0) := (others => '0');
  signal s_apb_prdata_bs_uart_apb_rw_3 : std_logic_vector(31 downto 0) := (others => '0');
  signal s_apb_pslverr_bs_uart_apb_rw_3 : std_logic_vector(1 downto 0) := (others => '0');

  --
  --
  --
  --
begin
  --
  --
  --
  bs_expansion_i : bs_expansion
  generic map(
    BS_PULSE_MAX => 2
  )
  port map(
    --    
    tpulse_out => tpulse_5us_i,
    tpulse_in => tpulse_5us,
    Clk => clk_200M
    --    
  );
  --
  bs_msec_i : bs_msec
  generic map(
    BS_MS_MAX => 50
  )
  port map(
    --    
    tpulse_ms => tpulse_ms,
    tpulse_5us => tpulse_5us,
    Clk => clk_200M
    --    
  );
  --
  bs_5usec_i : bs_5usec
  generic map(
    BS_MCLK => 200
  )
  port map(
    --    
    tpulse_5us => tpulse_5us,
    Clk => clk_200M
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
  -- m_axis_bs_uart_atx_tready_bs_uart_atx_data_ramp_gen_i <= '1';
  --
  bs_uart_atx_data_ramp_gen_0 : bs_uart_atx_data_ramp_gen
  generic map(
    ADDRESS_MAX => 100,
    ADDRESS_WIDTH => 8,
    DATA_WIDTH => 8
  )
  port map(
    --    
    m_axis_bs_uart_atx_tvalid => s_axis_bs_uart_tx_tvalid_bs_uart_tx_i,
    m_axis_bs_uart_atx_tready => s_axis_bs_uart_tx_tready_bs_uart_tx_i,
    m_axis_bs_uart_atx_tlast => s_axis_bs_uart_tx_tlast_bs_uart_tx_i,
    m_axis_bs_uart_atx_tkeep => open,
    m_axis_bs_uart_atx_tdata => s_axis_bs_uart_tx_tdata_bs_uart_tx_i,

    s_rd_bs_uart_atx_tstart => tpulse_ms,

    reset_n => reset_n,
    Clk => clk_200M
    --    
  );
  --
  --
  bs_uart_tx_0 : bs_uart_tx
  generic map(
    BS_MCLK => 200,
    BS_BAUDRATE => 921600,
    BS_UART_MAX => 100
  )
  port map(
    --    
    s_axis_bs_uart_tx_tvalid => s_axis_bs_uart_tx_tvalid_bs_uart_tx_i,
    s_axis_bs_uart_tx_tready => s_axis_bs_uart_tx_tready_bs_uart_tx_i,
    s_axis_bs_uart_tx_tlast => s_axis_bs_uart_tx_tlast_bs_uart_tx_i,
    s_axis_bs_uart_tx_tkeep => (others =>'1'),
    s_axis_bs_uart_tx_tdata => s_axis_bs_uart_tx_tdata_bs_uart_tx_i,

    m_bs_uart_tx_done => m_bs_uart_tx_done_bs_uart_tx_i,

    m_bs_uart_txd => a_txd,

    reset_n => reset_n,
    Clk => clk_200M
    --    
  );
  --
  bs_uart_rx_1 : bs_uart_rx
  generic map(
    BS_MCLK => 200,
    BS_BAUDRATE => 921600,
    BS_UART_MAX => 100
  )
  port map(
    --    
    m_axis_bs_uart_rx_tvalid => m_axis_bs_uart_rx_tvalid_bs_uart_rx_i,
    m_axis_bs_uart_rx_tlast => m_axis_bs_uart_rx_tlast_bs_uart_rx_i,
    m_axis_bs_uart_rx_tkeep => open,
    m_axis_bs_uart_rx_tdata => m_axis_bs_uart_rx_tdata_bs_uart_rx_i,

    s_bs_uart_rxd => b_rxd,

    reset_n => reset_n,
    Clk => clk_200M
    --    
  );
  --
  bs_uart_ram_1 : bs_uart_ram
  generic map(
    ADDRESS_MAX => 100,
    ADDRESS_WIDTH => 8,
    DATA_WIDTH => 8
  )
  port map(
    --    
    s_axis_bs_uart_ram_tvalid => m_axis_bs_uart_rx_tvalid_bs_uart_rx_i,
    s_axis_bs_uart_ram_tlast => m_axis_bs_uart_rx_tlast_bs_uart_rx_i,
    s_axis_bs_uart_ram_tkeep => (others =>'1'),
    s_axis_bs_uart_ram_tdata => m_axis_bs_uart_rx_tdata_bs_uart_rx_i,

    m_rd_bs_uart_ram_tnext => s_rd_bs_uart_atx_tstart_bs_uart_atx_ext_1,
    s_rd_bs_uart_ram_taddr => m_rd_bs_uart_atx_taddr_bs_uart_atx_ext_1,
    s_rd_bs_uart_ram_tdata => m_rd_bs_uart_atx_tdata_bs_uart_atx_ext_1,

    reset_n => reset_n,
    Clk => clk_200M
    --    
  );
  --
  bs_uart_atx_ext_1 : bs_uart_atx_ext
  generic map(
    ADDRESS_MAX => 100,
    ADDRESS_WIDTH => 8,
    DATA_WIDTH => 8
  )
  port map(
    --    
    m_axis_bs_uart_atx_tvalid => m_axis_bs_uart_atx_tvalid_bs_uart_atx_ext_1,
    m_axis_bs_uart_atx_tready => m_axis_bs_uart_atx_tready_bs_uart_atx_ext_1,
    m_axis_bs_uart_atx_tlast => m_axis_bs_uart_atx_tlast_bs_uart_atx_ext_1,
    m_axis_bs_uart_atx_tkeep => open,
    m_axis_bs_uart_atx_tdata => m_axis_bs_uart_atx_tdata_bs_uart_atx_ext_1,

    s_rd_bs_uart_atx_tstart => s_rd_bs_uart_atx_tstart_bs_uart_atx_ext_1,
    m_rd_bs_uart_atx_taddr => m_rd_bs_uart_atx_taddr_bs_uart_atx_ext_1,
    m_rd_bs_uart_atx_tdata => m_rd_bs_uart_atx_tdata_bs_uart_atx_ext_1,

    reset_n => reset_n,
    Clk => clk_200M
    --    
  );
  --  
  bs_uart_tx_1 : bs_uart_tx
  generic map(
    BS_MCLK => 200,
    BS_BAUDRATE => 921600,
    BS_UART_MAX => 100
  )
  port map(
    --    
    s_axis_bs_uart_tx_tvalid => m_axis_bs_uart_atx_tvalid_bs_uart_atx_ext_1,
    s_axis_bs_uart_tx_tready => m_axis_bs_uart_atx_tready_bs_uart_atx_ext_1,
    s_axis_bs_uart_tx_tlast => m_axis_bs_uart_atx_tlast_bs_uart_atx_ext_1,
    s_axis_bs_uart_tx_tkeep => (others =>'1'),
    s_axis_bs_uart_tx_tdata => m_axis_bs_uart_atx_tdata_bs_uart_atx_ext_1,

    m_bs_uart_tx_done => open,

    m_bs_uart_txd => b_txd,

    reset_n => reset_n,
    Clk => clk_200M
    --    
  );
  --
  bs_uart_rx_2 : bs_uart_rx
  generic map(
    BS_MCLK => 200,
    BS_BAUDRATE => 921600,
    BS_UART_MAX => 100
  )
  port map(
    --    
    m_axis_bs_uart_rx_tvalid => m_axis_bs_uart_rx_tvalid_bs_uart_rx_2,
    m_axis_bs_uart_rx_tlast => m_axis_bs_uart_rx_tlast_bs_uart_rx_2,
    m_axis_bs_uart_rx_tkeep => open,
    m_axis_bs_uart_rx_tdata => m_axis_bs_uart_rx_tdata_bs_uart_rx_2,

    s_bs_uart_rxd => c_rxd,

    reset_n => reset_n,
    Clk => clk_200M
    --    
  );
  --
  bs_uart_ram_rx_32_2 : bs_uart_ram_rx_32
  generic map(
    ADDRESS_MAX => 100
  )
  port map(
    --    
    s_axis_bs_uart_ram_rx_32_tvalid => m_axis_bs_uart_rx_tvalid_bs_uart_rx_2,
    s_axis_bs_uart_ram_rx_32_tlast => m_axis_bs_uart_rx_tlast_bs_uart_rx_2,
    s_axis_bs_uart_ram_rx_32_tkeep =>(others =>'1'),
    s_axis_bs_uart_ram_rx_32_tdata => m_axis_bs_uart_rx_tdata_bs_uart_rx_2,

    m_rd_bs_uart_ram_rx_32_tnext => s_rd_bs_uart_atx_tstart_bs_uart_atx_ext_2,
    s_rd_bs_uart_ram_rx_32_taddr => m_rd_bs_uart_atx_taddr_bs_uart_atx_ext_2,
    s_rd_bs_uart_ram_rx_32_tdata => m_rd_bs_uart_atx_tdata_bs_uart_atx_ext_2,

    reset_n => reset_n,
    Clk_rd => clk_200M,
    Clk => clk_200M
    --    
  );
  --
  bs_uart_atx_ext_2 : bs_uart_atx_ext
  generic map(
    ADDRESS_MAX => 25,
    ADDRESS_WIDTH => 8,
    DATA_WIDTH => 32
  )
  port map(
    --    
    m_axis_bs_uart_atx_tvalid => m_axis_bs_uart_atx_tvalid_bs_uart_atx_ext_2,
    m_axis_bs_uart_atx_tready => '1',
    m_axis_bs_uart_atx_tlast => m_axis_bs_uart_atx_tlast_bs_uart_atx_ext_2,
    m_axis_bs_uart_atx_tkeep => open,
    m_axis_bs_uart_atx_tdata => m_axis_bs_uart_atx_tdata_bs_uart_atx_ext_2,

    s_rd_bs_uart_atx_tstart => s_rd_bs_uart_atx_tstart_bs_uart_atx_ext_2,
    m_rd_bs_uart_atx_taddr => m_rd_bs_uart_atx_taddr_bs_uart_atx_ext_2,
    m_rd_bs_uart_atx_tdata => m_rd_bs_uart_atx_tdata_bs_uart_atx_ext_2,

    reset_n => reset_n,
    Clk => clk_200M
    --    
  );
  --
  bs_uart_ram_tx_32_2 : bs_uart_ram_tx_32
  generic map(
    ADDRESS_MAX => 100
  )
  port map(
    --    
    s_axis_bs_uart_ram_tx_32_tvalid => m_axis_bs_uart_atx_tvalid_bs_uart_atx_ext_2,
    s_axis_bs_uart_ram_tx_32_tlast => m_axis_bs_uart_atx_tlast_bs_uart_atx_ext_2,
    s_axis_bs_uart_ram_tx_32_tkeep => (others =>'1'),
    s_axis_bs_uart_ram_tx_32_tdata => m_axis_bs_uart_atx_tdata_bs_uart_atx_ext_2,

    m_rd_bs_uart_ram_tx_32_tnext => s_rd_bs_uart_tx_tstart_bs_uart_tx_rd_2,
    s_rd_bs_uart_ram_tx_32_taddr => s_rd_bs_uart_tx_taddr_bs_uart_tx_rd_2,
    s_rd_bs_uart_ram_tx_32_tdata => s_rd_bs_uart_tx_tdata_bs_uart_tx_rd_2,

    reset_n => reset_n,
    Clk_rd => clk_200M,
    Clk => clk_200M
    --    
  );
  --
  bs_uart_tx_rd_2 : bs_uart_tx_rd
  generic map(
    BS_MCLK => 200,
    BS_BAUDRATE => 921600,
    BS_UART_MAX => 100
  )
  port map(
    --    
    s_rd_bs_uart_tx_tstart => s_rd_bs_uart_tx_tstart_bs_uart_tx_rd_2,
    s_rd_bs_uart_tx_taddr => s_rd_bs_uart_tx_taddr_bs_uart_tx_rd_2,
    s_rd_bs_uart_tx_tdata => s_rd_bs_uart_tx_tdata_bs_uart_tx_rd_2,

    m_bs_uart_tx_done => m_bs_uart_tx_done_bs_uart_tx_rd_2,

    m_bs_uart_txd => c_txd,

    reset_n => reset_n,
    Clk => clk_200M
    --    
  );
  --
  bs_uart_rx_3 : bs_uart_rx
  generic map(
    BS_MCLK => 200,
    BS_BAUDRATE => 921600,
    BS_UART_MAX => 100
  )
  port map(
    --    
    m_axis_bs_uart_rx_tvalid => m_axis_bs_uart_rx_tvalid_bs_uart_rx_3,
    m_axis_bs_uart_rx_tlast => m_axis_bs_uart_rx_tlast_bs_uart_rx_3,
    m_axis_bs_uart_rx_tkeep => open,
    m_axis_bs_uart_rx_tdata => m_axis_bs_uart_rx_tdata_bs_uart_rx_3,

    s_bs_uart_rxd => d_rxd,

    reset_n => reset_n,
    Clk => clk_200M
    --    
  );
  --
  bs_uart_ram_rx_apb_3 : bs_uart_ram_rx_apb
  generic map(
    ADDRESS_MAX => 100
  )
  port map(
    --    
    s_apb_paddr => s_apb_paddr_bs_uart_apb_rw_3,
    s_apb_psel => s_apb_psel_bs_uart_apb_rw_3(0),
    s_apb_penable => s_apb_penable_bs_uart_apb_rw_3,
    s_apb_pwrite => s_apb_pwrite_bs_uart_apb_rw_3,
    s_apb_pwdata => s_apb_pwdata_bs_uart_apb_rw_3,
    s_apb_pready => s_apb_pready_bs_uart_apb_rw_3(0),
    s_apb_prdata => s_apb_prdata_bs_uart_apb_rw_3,
    s_apb_pslverr => s_apb_pslverr_bs_uart_apb_rw_3(0),
    s_axi_aresetn => reset_n,
    s_axi_aclk => clk_200M,

    m_bs_usrt_ram_rx_apb_tstart_n => s_apb_pstart_n_bs_uart_apb_rw_3,
    s_axis_bs_uart_ram_rx_apb_tvalid => m_axis_bs_uart_rx_tvalid_bs_uart_rx_3,
    s_axis_bs_uart_ram_rx_apb_tlast => m_axis_bs_uart_rx_tlast_bs_uart_rx_3,
    s_axis_bs_uart_ram_rx_apb_tkeep => (others =>'1'),
    s_axis_bs_uart_ram_rx_apb_tdata => m_axis_bs_uart_rx_tdata_bs_uart_rx_3,

    reset_n => reset_n,
    Clk => clk_200M
    --    
  );
  --
  bs_uart_apb_rw_3 : bs_uart_apb_rw
  generic map(
    APB_SLAVE => 2,
    ADDRESS_MAX => 100
  )
  port map(
    --    
    s_apb_pstart_n => s_apb_pstart_n_bs_uart_apb_rw_3,
    --    
    m_apb_paddr => s_apb_paddr_bs_uart_apb_rw_3,
    m_apb_psel => s_apb_psel_bs_uart_apb_rw_3,
    m_apb_penable => s_apb_penable_bs_uart_apb_rw_3,
    m_apb_pwrite => s_apb_pwrite_bs_uart_apb_rw_3,
    m_apb_pwdata => s_apb_pwdata_bs_uart_apb_rw_3,
    m_apb_pready => s_apb_pready_bs_uart_apb_rw_3,
    m_apb_prdata => s_apb_prdata_bs_uart_apb_rw_3,
    m_apb_pslverr => s_apb_pslverr_bs_uart_apb_rw_3,
    s_axi_aresetn => reset_n,
    s_axi_aclk => clk_200M
    --    
  );
  --
  bs_uart_ram_tx_apb_3 : bs_uart_ram_tx_apb
  generic map(
    ADDRESS_MAX => 25
  )
  port map(
    --    
    s_apb_paddr => s_apb_paddr_bs_uart_apb_rw_3,
    s_apb_psel => s_apb_psel_bs_uart_apb_rw_3(1),
    s_apb_penable => s_apb_penable_bs_uart_apb_rw_3,
    s_apb_pwrite => s_apb_pwrite_bs_uart_apb_rw_3,
    s_apb_pwdata => s_apb_pwdata_bs_uart_apb_rw_3,
    s_apb_pready => s_apb_pready_bs_uart_apb_rw_3(1),
    s_apb_prdata => open,
    s_apb_pslverr => s_apb_pslverr_bs_uart_apb_rw_3(1),
    s_axi_aresetn => reset_n,
    s_axi_aclk => clk_200M,

    m_rd_bs_uart_ram_tx_apb_tnext => s_rd_bs_uart_tx_tstart_bs_uart_tx_rd_3,
    s_rd_bs_uart_ram_tx_apb_taddr => s_rd_bs_uart_tx_taddr_bs_uart_tx_rd_3,
    s_rd_bs_uart_ram_tx_apb_tdata => s_rd_bs_uart_tx_tdata_bs_uart_tx_rd_3,

    reset_n => reset_n,
    Clk_rd => clk_200M
    --    
  );
  --
  bs_uart_tx_rd_3 : bs_uart_tx_rd
  generic map(
    BS_MCLK => 200,
    BS_BAUDRATE => 921600,
    BS_UART_MAX => 100
  )
  port map(
    --    
    s_rd_bs_uart_tx_tstart => s_rd_bs_uart_tx_tstart_bs_uart_tx_rd_3,
    s_rd_bs_uart_tx_taddr => s_rd_bs_uart_tx_taddr_bs_uart_tx_rd_3,
    s_rd_bs_uart_tx_tdata => s_rd_bs_uart_tx_tdata_bs_uart_tx_rd_3,

    m_bs_uart_tx_done => m_bs_uart_tx_done_bs_uart_tx_rd_3,

    m_bs_uart_txd => d_txd,

    reset_n => reset_n,
    Clk => clk_200M
    --    
  );
  --
  bs_uart_rx_0 : bs_uart_rx
  generic map(
    BS_MCLK => 200,
    BS_BAUDRATE => 921600,
    BS_UART_MAX => 100
  )
  port map(
    --    
    m_axis_bs_uart_rx_tvalid => m_axis_bs_uart_rx_tvalid_bs_uart_rx_0,
    m_axis_bs_uart_rx_tlast => m_axis_bs_uart_rx_tlast_bs_uart_rx_0,
    m_axis_bs_uart_rx_tkeep => open,
    m_axis_bs_uart_rx_tdata => m_axis_bs_uart_rx_tdata_bs_uart_rx_0,

    s_bs_uart_rxd => a_rxd,

    reset_n => reset_n,
    Clk => clk_200M
    --    
  );

  --
  bs_uart_ram_0 : bs_uart_ram
  generic map(
    ADDRESS_MAX => 100,
    ADDRESS_WIDTH => 8,
    DATA_WIDTH => 8
  )
  port map(
    --    
    s_axis_bs_uart_ram_tvalid => m_axis_bs_uart_rx_tvalid_bs_uart_rx_0,
    s_axis_bs_uart_ram_tlast => m_axis_bs_uart_rx_tlast_bs_uart_rx_0,
    s_axis_bs_uart_ram_tkeep => (others =>'1'),
    s_axis_bs_uart_ram_tdata => m_axis_bs_uart_rx_tdata_bs_uart_rx_0,

    m_rd_bs_uart_ram_tnext => m_rd_bs_uart_ram_tnext_bs_uart_ram_0,
    s_rd_bs_uart_ram_taddr => s_rd_bs_uart_ram_taddr_bs_uart_ram_0,
    s_rd_bs_uart_ram_tdata => s_rd_bs_uart_ram_tdata_bs_uart_ram_0,

    reset_n => reset_n,
    Clk => clk_200M
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
end architecture;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================