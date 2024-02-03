-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
--
entity top_uart_debug is
  port (
    a_rxd : in std_logic;
    a_txd : out std_logic;
    clk_200M : in std_logic;
    clk_125M : in std_logic;
    clk_50M : in std_logic;
    bs_pl_dip_sw_0 : in std_logic_vector (0 downto 0);
    bs_pl_led_out_0 : out std_logic_vector (1 downto 0)
  );
end entity;
--
architecture rtl of top_uart_debug is
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
  component bs_usec is
    generic (
      BS_MCLK : natural := 200;
      BS_US_RDY_MAX : natural := 1;
      BS_US_MAX : natural := 5
    );
    port (
      --    
      tpulse_us : out std_logic;
      Clk : in std_logic
      --    
    );
  end component;
  --  
  component bs_aurora_atx_data_ramp_gen is
    generic (
      ADDRESS_MAX : natural := 300;
      ADDRESS_WIDTH : natural := 9;
      DATA_WIDTH : natural := 32
    );
    port (
      --    
      m_axis_bs_aurora_atx_tvalid : out std_logic;
      m_axis_bs_aurora_atx_tready : in std_logic;
      m_axis_bs_aurora_atx_tlast : out std_logic;
      m_axis_bs_aurora_atx_tkeep : out std_logic_vector(3 downto 0);
      m_axis_bs_aurora_atx_tdata : out std_logic_vector(DATA_WIDTH-1 downto 0);
  
      s_rd_bs_aurora_atx_tstart : in std_logic;
  
      reset_n : in std_logic;
      Clk : in std_logic
      --    
    );
  end component;
  --
  component bs_uart_ram_tx_32_debug is
    generic (
      ADDRESS_MAX : natural := 100;
      ADDRESS_WIDTH : natural := 7;
      DATA_WIDTH : natural := 32
    );
    port (
      --    
      s_axis_bs_uart_ram_tx_32_tvalid : in std_logic;
      s_axis_bs_uart_ram_tx_32_tready : out std_logic;
      s_axis_bs_uart_ram_tx_32_tlast : in std_logic;
      s_axis_bs_uart_ram_tx_32_tkeep : in std_logic_vector((DATA_WIDTH / 8) - 1 downto 0);
      s_axis_bs_uart_ram_tx_32_tdata : in std_logic_vector(DATA_WIDTH - 1 downto 0);

      m_rd_bs_uart_ram_tx_32_tnext : out std_logic;
      s_rd_bs_uart_ram_tx_32_taddr : in std_logic_vector(ADDRESS_WIDTH - 1 downto 0);
      s_rd_bs_uart_ram_tx_32_tdata : out std_logic_vector((DATA_WIDTH/4) - 1 downto 0);

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
      ADDRESS_MAX : natural := 100;
      ADDRESS_WIDTH : natural := 7;
      DATA_WIDTH : natural := 8
    );
    port (
      --    
      s_rd_bs_uart_tx_tstart : in std_logic;
      s_rd_bs_uart_tx_taddr : out std_logic_vector(ADDRESS_WIDTH - 1 downto 0);
      s_rd_bs_uart_tx_tdata : in std_logic_vector(DATA_WIDTH - 1 downto 0);

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
      ADDRESS_WIDTH : natural := 7;
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
  --  
  --  
  --  
  signal reset_n : std_logic := '0';
  signal tpulse_us : std_logic := '0';
  signal tpulse_5us : std_logic := '0';
  signal tpulse_10us : std_logic := '0';
  signal tpulse_10ms : std_logic := '0';
  signal tpulse_5sec : std_logic := '0';
  --
  -- componet [ bs_aurora_atx_data_ramp_gen_0 ] signal define
  signal m_axis_bs_aurora_atx_tvalid_bs_aurora_atx_data_ramp_gen_0 : std_logic := '0';
  signal m_axis_bs_aurora_atx_tready_bs_aurora_atx_data_ramp_gen_0 : std_logic := '0';
  signal m_axis_bs_aurora_atx_tlast_bs_aurora_atx_data_ramp_gen_0 : std_logic := '0';
  signal m_axis_bs_aurora_atx_tkeep_bs_aurora_atx_data_ramp_gen_0 : std_logic_vector(3 downto 0) := (others => '0');
  signal m_axis_bs_aurora_atx_tdata_bs_aurora_atx_data_ramp_gen_0 : std_logic_vector(31 downto 0) := (others => '0');
  -- componet [ bs_uart_tx_rd_0 ] signal define

  signal s_rd_bs_uart_tx_taddr_bs_uart_tx_rd_0 : std_logic_vector(8 downto 0) := (others => '0');
  signal s_rd_bs_uart_tx_tdata_bs_uart_tx_rd_0 : std_logic_vector(7 downto 0) := (others => '0');

  signal m_bs_uart_tx_done_bs_uart_tx_rd_0 : std_logic := '0';
  -- componet [ bs_uart_rx_0 ] signal define

  signal m_axis_bs_uart_rx_tvalid_bs_uart_rx_0 : std_logic := '0';
  signal m_axis_bs_uart_rx_tlast_bs_uart_rx_0 : std_logic := '0';
  signal m_axis_bs_uart_rx_tkeep_bs_uart_rx_0 : std_logic_vector(0 downto 0) := (others => '0');
  signal m_axis_bs_uart_rx_tdata_bs_uart_rx_0 : std_logic_vector(7 downto 0) := (others => '0');

  -- componet [ bs_uart_ram_0 ] signal define

  signal s_axis_bs_uart_ram_tvalid_bs_uart_ram_0 : std_logic := '0';
  signal s_axis_bs_uart_ram_tlast_bs_uart_ram_0 : std_logic := '0';
  signal s_axis_bs_uart_ram_tkeep_bs_uart_ram_0 : std_logic_vector(0 downto 0) := (others => '0');
  signal s_axis_bs_uart_ram_tdata_bs_uart_ram_0 : std_logic_vector(7 downto 0) := (others => '0');

  signal m_rd_bs_uart_ram_tnext_bs_uart_ram_0 : std_logic := '0';
  signal s_rd_bs_uart_ram_taddr_bs_uart_ram_0 : std_logic_vector(8 downto 0) := (others => '0');
  signal s_rd_bs_uart_ram_tdata_bs_uart_ram_0 : std_logic_vector(7 downto 0) := (others => '0');
  --
  --
begin

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
  bs_reset_n_0 : bs_reset_n
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
  bs_5usec_0 : bs_5usec
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
  bs_usec_0 : bs_usec
  generic map(
    BS_MCLK => 200,
    BS_US_RDY_MAX => 10,
    BS_US_MAX => 10
  )
  port map(
    --    
    tpulse_us => tpulse_10us,
    Clk => clk_200M
    --    
  );
  --
  bs_cnt_0 : bs_cnt
  generic map(
    BS_CNT_MAX => 1000
  )
  port map(
    --    
    tpulse_out => tpulse_10ms,
    tpulse_in => tpulse_10us,
    Clk => clk_200M
    --    
  );
  --
  bs_cnt_1 : bs_cnt
  generic map(
    BS_CNT_MAX => 500
  )
  port map(
    --    
    tpulse_out => tpulse_5sec,
    tpulse_in => tpulse_10ms,
    Clk => clk_200M
    --    
  );
  --
  bs_aurora_atx_data_ramp_gen_0 : bs_aurora_atx_data_ramp_gen
  generic map(
    ADDRESS_MAX => 300,
    ADDRESS_WIDTH => 9,
    DATA_WIDTH => 32
  )
  port map(
    --    
    m_axis_bs_aurora_atx_tvalid => m_axis_bs_aurora_atx_tvalid_bs_aurora_atx_data_ramp_gen_0,
    m_axis_bs_aurora_atx_tready => m_axis_bs_aurora_atx_tready_bs_aurora_atx_data_ramp_gen_0,
    m_axis_bs_aurora_atx_tlast => m_axis_bs_aurora_atx_tlast_bs_aurora_atx_data_ramp_gen_0,
    m_axis_bs_aurora_atx_tkeep => m_axis_bs_aurora_atx_tkeep_bs_aurora_atx_data_ramp_gen_0,
    m_axis_bs_aurora_atx_tdata => m_axis_bs_aurora_atx_tdata_bs_aurora_atx_data_ramp_gen_0,

    s_rd_bs_aurora_atx_tstart => tpulse_5us,

    reset_n => reset_n,
    Clk => clk_200M
    --    
  );
  --
  bs_uart_ram_tx_32_debug_0 : bs_uart_ram_tx_32_debug
  generic map(
    ADDRESS_MAX => 300,
    ADDRESS_WIDTH => 9,
    DATA_WIDTH => 32
  )
  port map(
    --    
    s_axis_bs_uart_ram_tx_32_tvalid => m_axis_bs_aurora_atx_tvalid_bs_aurora_atx_data_ramp_gen_0,
    s_axis_bs_uart_ram_tx_32_tready => m_axis_bs_aurora_atx_tready_bs_aurora_atx_data_ramp_gen_0,
    s_axis_bs_uart_ram_tx_32_tlast => m_axis_bs_aurora_atx_tlast_bs_aurora_atx_data_ramp_gen_0,
    s_axis_bs_uart_ram_tx_32_tkeep => m_axis_bs_aurora_atx_tkeep_bs_aurora_atx_data_ramp_gen_0,
    s_axis_bs_uart_ram_tx_32_tdata => m_axis_bs_aurora_atx_tdata_bs_aurora_atx_data_ramp_gen_0,

    m_rd_bs_uart_ram_tx_32_tnext => open,
    s_rd_bs_uart_ram_tx_32_taddr => s_rd_bs_uart_tx_taddr_bs_uart_tx_rd_0,
    s_rd_bs_uart_ram_tx_32_tdata => s_rd_bs_uart_tx_tdata_bs_uart_tx_rd_0,

    reset_n => reset_n,
    Clk_rd => clk_200M,
    Clk => clk_200M
    --    
  );
  --
  bs_uart_tx_rd_0 : bs_uart_tx_rd
  generic map(
    BS_MCLK => 200,
    BS_BAUDRATE => 115200,
    ADDRESS_MAX => 300,
    ADDRESS_WIDTH => 9,
    DATA_WIDTH => 8
  )
  port map(
    --    
    s_rd_bs_uart_tx_tstart => tpulse_5sec,
    s_rd_bs_uart_tx_taddr => s_rd_bs_uart_tx_taddr_bs_uart_tx_rd_0,
    s_rd_bs_uart_tx_tdata => s_rd_bs_uart_tx_tdata_bs_uart_tx_rd_0,

    m_bs_uart_tx_done => m_bs_uart_tx_done_bs_uart_tx_rd_0,

    m_bs_uart_txd => a_txd,

    reset_n => reset_n,
    Clk => clk_200M
    --    
  );
  --
  bs_uart_rx_0 : bs_uart_rx
  generic map(
    BS_MCLK => 200,
    BS_BAUDRATE => 115200,
    BS_UART_MAX => 300
  )
  port map(
    --    
    m_axis_bs_uart_rx_tvalid => m_axis_bs_uart_rx_tvalid_bs_uart_rx_0,
    m_axis_bs_uart_rx_tlast => m_axis_bs_uart_rx_tlast_bs_uart_rx_0,
    m_axis_bs_uart_rx_tkeep => m_axis_bs_uart_rx_tkeep_bs_uart_rx_0,
    m_axis_bs_uart_rx_tdata => m_axis_bs_uart_rx_tdata_bs_uart_rx_0,

    s_bs_uart_rxd => a_rxd,

    reset_n => reset_n,
    Clk => clk_200M
    --    
  );
  --
  bs_uart_ram_0 : bs_uart_ram
  generic map(
    ADDRESS_MAX => 300,
    ADDRESS_WIDTH => 9,
    DATA_WIDTH => 8
  )
  port map(
    --    
    s_axis_bs_uart_ram_tvalid => m_axis_bs_uart_rx_tvalid_bs_uart_rx_0,
    s_axis_bs_uart_ram_tlast => m_axis_bs_uart_rx_tlast_bs_uart_rx_0,
    s_axis_bs_uart_ram_tkeep => m_axis_bs_uart_rx_tkeep_bs_uart_rx_0,
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

end architecture;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================