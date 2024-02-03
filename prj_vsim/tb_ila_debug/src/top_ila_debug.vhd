-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
--
entity top_ila_debug is
  port (
    clk_200M : in std_logic;
    clk_125M : in std_logic;
    clk_50M : in std_logic;
    bs_pl_dip_sw_0 : in std_logic_vector (0 downto 0);
    bs_pl_led_out_0 : out std_logic_vector (1 downto 0)
  );
end entity;
--
architecture rtl of top_ila_debug is
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
      m_axis_bs_aurora_atx_tdata : out std_logic_vector(DATA_WIDTH - 1 downto 0);
      -- 
      s_rd_bs_aurora_atx_tstart : in std_logic;

      reset_n : in std_logic;
      Clk : in std_logic
      --    
    );
  end component;
  --
  component bs_ila_ram_debug is
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
  end component;
  --  
  component bs_ila_debug is
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
  
      ila_data : out std_logic_vector(ADDRESS_MAX * 8 - 1 downto 0);
  
      reset_n : in std_logic;
      Clk : in std_logic 
      --    
    );
  end component;
  --  
  component bs_scb_data_record_pin is
    port (
      --
      rt_ch_data_01 : out std_logic_vector(31 downto 0);
      rt_ch_data_02 : out std_logic_vector(31 downto 0);
      rt_ch_data_03 : out std_logic_vector(31 downto 0);
      rt_ch_data_04 : out std_logic_vector(31 downto 0);
      rt_ch_data_05 : out std_logic_vector(31 downto 0);
      rt_ch_data_06 : out std_logic_vector(31 downto 0);
      rt_ch_data_07 : out std_logic_vector(31 downto 0);
      rt_ch_data_08 : out std_logic_vector(31 downto 0);
      rt_ch_data_09 : out std_logic_vector(31 downto 0);
      rt_ch_data_10 : out std_logic_vector(31 downto 0);
      rt_ch_data_11 : out std_logic_vector(31 downto 0);
      rt_ch_data_12 : out std_logic_vector(31 downto 0);
      rt_ch_data_13 : out std_logic_vector(31 downto 0);
      rt_ch_data_14 : out std_logic_vector(31 downto 0);
      rt_ch_data_15 : out std_logic_vector(31 downto 0);
      rt_ch_data_16 : out std_logic_vector(31 downto 0);
      rt_ch_data_17 : out std_logic_vector(31 downto 0);
      rt_ch_data_18 : out std_logic_vector(31 downto 0);
      rt_ch_data_19 : out std_logic_vector(31 downto 0);
      rt_ch_data_20 : out std_logic_vector(31 downto 0);
      rt_ch_data_21 : out std_logic_vector(31 downto 0);
      rt_ch_data_22 : out std_logic_vector(31 downto 0);
      rt_ch_data_23 : out std_logic_vector(31 downto 0);
      rt_ch_data_24 : out std_logic_vector(31 downto 0);
      rt_ch_data_25 : out std_logic_vector(31 downto 0);
      rt_ch_data_26 : out std_logic_vector(31 downto 0);
      rt_ch_data_27 : out std_logic_vector(31 downto 0);
      rt_ch_data_28 : out std_logic_vector(31 downto 0);
      rt_ch_data_29 : out std_logic_vector(31 downto 0);
      rt_ch_data_30 : out std_logic_vector(31 downto 0);
      rt_ch_data_31 : out std_logic_vector(31 downto 0);
      rt_ch_data_32 : out std_logic_vector(31 downto 0);
      rt_ch_data_33 : out std_logic_vector(31 downto 0);
      rt_ch_data_34 : out std_logic_vector(31 downto 0);
      rt_ch_data_35 : out std_logic_vector(31 downto 0);
      rt_ch_data_36 : out std_logic_vector(31 downto 0);
      rt_ch_data_37 : out std_logic_vector(31 downto 0);
      --
      rt_Start_Bytes : out std_logic_vector(31 downto 0);
      rt_Count : out std_logic_vector(31 downto 0);
      rt_Checksum : out std_logic_vector(15 downto 0);
      rt_Stop_Bytes : out std_logic_vector(15 downto 0);
      --
      rt_Save_R3 : out std_logic;
      rt_Save_R2 : out std_logic;
      rt_Save_R1 : out std_logic;
      rt_Save_R0 : out std_logic;
      rt_Save_C : out std_logic;
      rt_Save_L0 : out std_logic;
      rt_Save_L1 : out std_logic;
      rt_Save_L2 : out std_logic;
      rt_Save_L3 : out std_logic;
      --    
      rt_Optic_On : out std_logic;
      rt_Ethernet_On : out std_logic;
      rt_TE_Data_Input : out std_logic_vector(1 downto 0);
      --
      Chan_Str : in std_logic_vector(2399 downto 0)
    );
  end component;--  
  --  
  --  
  --  
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
  signal test_tdata : std_logic_vector(31 downto 0) := (others => '0');
  --
  --
  signal ila_data_bs_ila_ram_debug_0 : std_logic_vector(300 * 8 - 1 downto 0) := (others => '0');
  signal ila_data_bs_ila_debug_0 : std_logic_vector(300 * 8 - 1 downto 0) := (others => '0');
  --
      -- componet [ bs_scb_data_record_pin_0 ] signal define
    --    
signal rt_ch_data_01_bs_scb_data_record_pin_0 : std_logic_vector(31 downto 0) := (others => '0');
signal rt_ch_data_02_bs_scb_data_record_pin_0 : std_logic_vector(31 downto 0) := (others => '0');
signal rt_ch_data_03_bs_scb_data_record_pin_0 : std_logic_vector(31 downto 0) := (others => '0');
signal rt_ch_data_04_bs_scb_data_record_pin_0 : std_logic_vector(31 downto 0) := (others => '0');
signal rt_ch_data_05_bs_scb_data_record_pin_0 : std_logic_vector(31 downto 0) := (others => '0');
signal rt_ch_data_06_bs_scb_data_record_pin_0 : std_logic_vector(31 downto 0) := (others => '0');
signal rt_ch_data_07_bs_scb_data_record_pin_0 : std_logic_vector(31 downto 0) := (others => '0');
signal rt_ch_data_08_bs_scb_data_record_pin_0 : std_logic_vector(31 downto 0) := (others => '0');
signal rt_ch_data_09_bs_scb_data_record_pin_0 : std_logic_vector(31 downto 0) := (others => '0');
signal rt_ch_data_10_bs_scb_data_record_pin_0 : std_logic_vector(31 downto 0) := (others => '0');
signal rt_ch_data_11_bs_scb_data_record_pin_0 : std_logic_vector(31 downto 0) := (others => '0');
signal rt_ch_data_12_bs_scb_data_record_pin_0 : std_logic_vector(31 downto 0) := (others => '0');
signal rt_ch_data_13_bs_scb_data_record_pin_0 : std_logic_vector(31 downto 0) := (others => '0');
signal rt_ch_data_14_bs_scb_data_record_pin_0 : std_logic_vector(31 downto 0) := (others => '0');
signal rt_ch_data_15_bs_scb_data_record_pin_0 : std_logic_vector(31 downto 0) := (others => '0');
signal rt_ch_data_16_bs_scb_data_record_pin_0 : std_logic_vector(31 downto 0) := (others => '0');
signal rt_ch_data_17_bs_scb_data_record_pin_0 : std_logic_vector(31 downto 0) := (others => '0');
signal rt_ch_data_18_bs_scb_data_record_pin_0 : std_logic_vector(31 downto 0) := (others => '0');
signal rt_ch_data_19_bs_scb_data_record_pin_0 : std_logic_vector(31 downto 0) := (others => '0');
signal rt_ch_data_20_bs_scb_data_record_pin_0 : std_logic_vector(31 downto 0) := (others => '0');
signal rt_ch_data_21_bs_scb_data_record_pin_0 : std_logic_vector(31 downto 0) := (others => '0');
signal rt_ch_data_22_bs_scb_data_record_pin_0 : std_logic_vector(31 downto 0) := (others => '0');
signal rt_ch_data_23_bs_scb_data_record_pin_0 : std_logic_vector(31 downto 0) := (others => '0');
signal rt_ch_data_24_bs_scb_data_record_pin_0 : std_logic_vector(31 downto 0) := (others => '0');
signal rt_ch_data_25_bs_scb_data_record_pin_0 : std_logic_vector(31 downto 0) := (others => '0');
signal rt_ch_data_26_bs_scb_data_record_pin_0 : std_logic_vector(31 downto 0) := (others => '0');
signal rt_ch_data_27_bs_scb_data_record_pin_0 : std_logic_vector(31 downto 0) := (others => '0');
signal rt_ch_data_28_bs_scb_data_record_pin_0 : std_logic_vector(31 downto 0) := (others => '0');
signal rt_ch_data_29_bs_scb_data_record_pin_0 : std_logic_vector(31 downto 0) := (others => '0');
signal rt_ch_data_30_bs_scb_data_record_pin_0 : std_logic_vector(31 downto 0) := (others => '0');
signal rt_ch_data_31_bs_scb_data_record_pin_0 : std_logic_vector(31 downto 0) := (others => '0');
signal rt_ch_data_32_bs_scb_data_record_pin_0 : std_logic_vector(31 downto 0) := (others => '0');
signal rt_ch_data_33_bs_scb_data_record_pin_0 : std_logic_vector(31 downto 0) := (others => '0');
signal rt_ch_data_34_bs_scb_data_record_pin_0 : std_logic_vector(31 downto 0) := (others => '0');
signal rt_ch_data_35_bs_scb_data_record_pin_0 : std_logic_vector(31 downto 0) := (others => '0');
signal rt_ch_data_36_bs_scb_data_record_pin_0 : std_logic_vector(31 downto 0) := (others => '0');
signal rt_ch_data_37_bs_scb_data_record_pin_0 : std_logic_vector(31 downto 0) := (others => '0');

signal rt_Start_Bytes_bs_scb_data_record_pin_0 : std_logic_vector(31 downto 0) := (others => '0');
signal rt_Count_bs_scb_data_record_pin_0 : std_logic_vector(31 downto 0) := (others => '0');
signal rt_Checksum_bs_scb_data_record_pin_0 : std_logic_vector(15 downto 0) := (others => '0');
signal rt_Stop_Bytes_bs_scb_data_record_pin_0 : std_logic_vector(15 downto 0) := (others => '0');

signal rt_Save_R3_bs_scb_data_record_pin_0 : std_logic := '0';
signal rt_Save_R2_bs_scb_data_record_pin_0 : std_logic := '0';
signal rt_Save_R1_bs_scb_data_record_pin_0 : std_logic := '0';
signal rt_Save_R0_bs_scb_data_record_pin_0 : std_logic := '0';
signal rt_Save_C_bs_scb_data_record_pin_0 : std_logic := '0';
signal rt_Save_L0_bs_scb_data_record_pin_0 : std_logic := '0';
signal rt_Save_L1_bs_scb_data_record_pin_0 : std_logic := '0';
signal rt_Save_L2_bs_scb_data_record_pin_0 : std_logic := '0';
signal rt_Save_L3_bs_scb_data_record_pin_0 : std_logic := '0';

signal rt_Optic_On_bs_scb_data_record_pin_0 : std_logic := '0';
signal rt_Ethernet_On_bs_scb_data_record_pin_0 : std_logic := '0';
signal rt_TE_Data_Input_bs_scb_data_record_pin_0 : std_logic_vector(1 downto 0) := (others => '0');
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
  bs_aurora_atx_data_ramp_gen_0 : bs_aurora_atx_data_ramp_gen
  generic map(
    ADDRESS_MAX => 300,
    ADDRESS_WIDTH => 9,
    DATA_WIDTH => 32
  )
  port map(
    --    
    m_axis_bs_aurora_atx_tvalid => m_axis_bs_aurora_atx_tvalid_bs_aurora_atx_data_ramp_gen_0,
    m_axis_bs_aurora_atx_tready => '1',
    m_axis_bs_aurora_atx_tlast => m_axis_bs_aurora_atx_tlast_bs_aurora_atx_data_ramp_gen_0,
    m_axis_bs_aurora_atx_tkeep => m_axis_bs_aurora_atx_tkeep_bs_aurora_atx_data_ramp_gen_0,
    m_axis_bs_aurora_atx_tdata => m_axis_bs_aurora_atx_tdata_bs_aurora_atx_data_ramp_gen_0,

    s_rd_bs_aurora_atx_tstart => tpulse_5us,

    reset_n => reset_n,
    Clk => clk_200M
    --    
  );
  --
  --
  bs_ila_ram_debug_0 : bs_ila_ram_debug
  generic map(
    ADDRESS_MAX => 300,
    ADDRESS_WIDTH => 9,
    DATA_WIDTH => 32
  )
  port map(
    --    
    s_axis_bs_aurora_ram_tvalid => m_axis_bs_aurora_atx_tvalid_bs_aurora_atx_data_ramp_gen_0,
    s_axis_bs_aurora_ram_tlast => m_axis_bs_aurora_atx_tlast_bs_aurora_atx_data_ramp_gen_0,
    s_axis_bs_aurora_ram_tkeep => m_axis_bs_aurora_atx_tkeep_bs_aurora_atx_data_ramp_gen_0,
    s_axis_bs_aurora_ram_tdata => m_axis_bs_aurora_atx_tdata_bs_aurora_atx_data_ramp_gen_0,

    m_rd_bs_aurora_ram_tnext => open,
    s_rd_bs_aurora_ram_taddr => (others => '0'),
    s_rd_bs_aurora_ram_tdata => open,

    ila_data => ila_data_bs_ila_ram_debug_0,

    reset_n => reset_n,
    Clk_rd => clk_200M,
    Clk => clk_200M
    --    
  );
  --
  bs_ila_debug_0 : bs_ila_debug
  generic map(
    ADDRESS_MAX => 300,
    ADDRESS_WIDTH => 9,
    DATA_WIDTH => 32
  )
  port map(
    --    
    s_axis_bs_aurora_ram_tvalid => m_axis_bs_aurora_atx_tvalid_bs_aurora_atx_data_ramp_gen_0,
    s_axis_bs_aurora_ram_tlast => m_axis_bs_aurora_atx_tlast_bs_aurora_atx_data_ramp_gen_0,
    s_axis_bs_aurora_ram_tkeep => m_axis_bs_aurora_atx_tkeep_bs_aurora_atx_data_ramp_gen_0,
    s_axis_bs_aurora_ram_tdata => m_axis_bs_aurora_atx_tdata_bs_aurora_atx_data_ramp_gen_0,

    ila_data => ila_data_bs_ila_debug_0,

    reset_n => reset_n,
    Clk => clk_200M
    --    
  );
  --
  bs_scb_data_record_pin_0 : bs_scb_data_record_pin
  port map (
    --    
    rt_ch_data_01 => rt_ch_data_01_bs_scb_data_record_pin_0,
    rt_ch_data_02 => rt_ch_data_02_bs_scb_data_record_pin_0,
    rt_ch_data_03 => rt_ch_data_03_bs_scb_data_record_pin_0,
    rt_ch_data_04 => rt_ch_data_04_bs_scb_data_record_pin_0,
    rt_ch_data_05 => rt_ch_data_05_bs_scb_data_record_pin_0,
    rt_ch_data_06 => rt_ch_data_06_bs_scb_data_record_pin_0,
    rt_ch_data_07 => rt_ch_data_07_bs_scb_data_record_pin_0,
    rt_ch_data_08 => rt_ch_data_08_bs_scb_data_record_pin_0,
    rt_ch_data_09 => rt_ch_data_09_bs_scb_data_record_pin_0,
    rt_ch_data_10 => rt_ch_data_10_bs_scb_data_record_pin_0,
    rt_ch_data_11 => rt_ch_data_11_bs_scb_data_record_pin_0,
    rt_ch_data_12 => rt_ch_data_12_bs_scb_data_record_pin_0,
    rt_ch_data_13 => rt_ch_data_13_bs_scb_data_record_pin_0,
    rt_ch_data_14 => rt_ch_data_14_bs_scb_data_record_pin_0,
    rt_ch_data_15 => rt_ch_data_15_bs_scb_data_record_pin_0,
    rt_ch_data_16 => rt_ch_data_16_bs_scb_data_record_pin_0,
    rt_ch_data_17 => rt_ch_data_17_bs_scb_data_record_pin_0,
    rt_ch_data_18 => rt_ch_data_18_bs_scb_data_record_pin_0,
    rt_ch_data_19 => rt_ch_data_19_bs_scb_data_record_pin_0,
    rt_ch_data_20 => rt_ch_data_20_bs_scb_data_record_pin_0,
    rt_ch_data_21 => rt_ch_data_21_bs_scb_data_record_pin_0,
    rt_ch_data_22 => rt_ch_data_22_bs_scb_data_record_pin_0,
    rt_ch_data_23 => rt_ch_data_23_bs_scb_data_record_pin_0,
    rt_ch_data_24 => rt_ch_data_24_bs_scb_data_record_pin_0,
    rt_ch_data_25 => rt_ch_data_25_bs_scb_data_record_pin_0,
    rt_ch_data_26 => rt_ch_data_26_bs_scb_data_record_pin_0,
    rt_ch_data_27 => rt_ch_data_27_bs_scb_data_record_pin_0,
    rt_ch_data_28 => rt_ch_data_28_bs_scb_data_record_pin_0,
    rt_ch_data_29 => rt_ch_data_29_bs_scb_data_record_pin_0,
    rt_ch_data_30 => rt_ch_data_30_bs_scb_data_record_pin_0,
    rt_ch_data_31 => rt_ch_data_31_bs_scb_data_record_pin_0,
    rt_ch_data_32 => rt_ch_data_32_bs_scb_data_record_pin_0,
    rt_ch_data_33 => rt_ch_data_33_bs_scb_data_record_pin_0,
    rt_ch_data_34 => rt_ch_data_34_bs_scb_data_record_pin_0,
    rt_ch_data_35 => rt_ch_data_35_bs_scb_data_record_pin_0,
    rt_ch_data_36 => rt_ch_data_36_bs_scb_data_record_pin_0,
    rt_ch_data_37 => rt_ch_data_37_bs_scb_data_record_pin_0,

    rt_Start_Bytes => rt_Start_Bytes_bs_scb_data_record_pin_0,
    rt_Count => rt_Count_bs_scb_data_record_pin_0,
    rt_Checksum => rt_Checksum_bs_scb_data_record_pin_0,
    rt_Stop_Bytes => rt_Stop_Bytes_bs_scb_data_record_pin_0,

    rt_Save_R3 => rt_Save_R3_bs_scb_data_record_pin_0,
    rt_Save_R2 => rt_Save_R2_bs_scb_data_record_pin_0,
    rt_Save_R1 => rt_Save_R1_bs_scb_data_record_pin_0,
    rt_Save_R0 => rt_Save_R0_bs_scb_data_record_pin_0,
    rt_Save_C => rt_Save_C_bs_scb_data_record_pin_0,
    rt_Save_L0 => rt_Save_L0_bs_scb_data_record_pin_0,
    rt_Save_L1 => rt_Save_L1_bs_scb_data_record_pin_0,
    rt_Save_L2 => rt_Save_L2_bs_scb_data_record_pin_0,
    rt_Save_L3 => rt_Save_L3_bs_scb_data_record_pin_0,

    rt_Optic_On => rt_Optic_On_bs_scb_data_record_pin_0,
    rt_Ethernet_On => rt_Ethernet_On_bs_scb_data_record_pin_0,
    rt_TE_Data_Input => rt_TE_Data_Input_bs_scb_data_record_pin_0,

    Chan_Str => ila_data_bs_ila_debug_0 
    --    
  );
  --
  --
  --
  --

end architecture;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================