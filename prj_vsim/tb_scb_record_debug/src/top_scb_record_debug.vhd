-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
--
entity top_scb_record_debug is
  port (
    clk_200M : in std_logic;
    clk_125M : in std_logic;
    clk_50M : in std_logic;
    bs_pl_dip_sw_0 : in std_logic_vector (0 downto 0);
    bs_pl_led_out_0 : out std_logic_vector (1 downto 0)
  );
end entity;
--
architecture rtl of top_scb_record_debug is
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
  component bs_scb_record_gen is
    generic (
      ADDRESS_MAX : natural := 300;
      ADDRESS_WIDTH : natural := 9;
      RECORD_ID : std_logic_vector(15 downto 0) := X"3161";
      DATA_WIDTH : natural := 32
    );
    port (
      --    
      m_axis_tvalid : out std_logic;
      m_axis_tready : in std_logic;
      m_axis_tlast : out std_logic;
      m_axis_tkeep : out std_logic_vector(3 downto 0);
      m_axis_tdata : out std_logic_vector(DATA_WIDTH - 1 downto 0);

      m_record_data : out std_logic_vector(ADDRESS_MAX * 8 - 1 downto 0);

      s_tstart : in std_logic;

      reset_2_n : in std_logic;
      reset_1_n : in std_logic;
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
      --  type Data_152_Type is record
      --  bitvector(2335 downto 1152)
      pkt_Data_Reserved : out std_logic_vector(31 downto 0); --                     (32)
      --  end record;  --  Data_152_Type

      --
      --  type Trigger_State_1_Type is record
      pkt_FPGA_State_Trigger_State_TE_TX_TRIG : out std_logic; --                     (1)
      pkt_FPGA_State_Trigger_State_TE_RX_TRIG : out std_logic; --                     (1)
      pkt_FPGA_State_Trigger_State_TX_TRIG : out std_logic; --                     (1)
      pkt_FPGA_State_Trigger_State_TX_P_GATE : out std_logic; --                     (1)
      pkt_FPGA_State_Trigger_State_ReservedBit04 : out std_logic; --                     (1)
      pkt_FPGA_State_Trigger_State_ReservedBit05 : out std_logic; --                     (1)
      pkt_FPGA_State_Trigger_State_ReservedBit06 : out std_logic; --                     (1)
      pkt_FPGA_State_Trigger_State_ReservedBit07 : out std_logic; --                     (1)
      --  end record;  --  Trigger_State_1_Type
      --
      --
      --  type SP_Zynq_SelfTest_Result_2_Type is record
      pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit00 : out std_logic; --                     (1)
      pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit01 : out std_logic; --                     (1)
      pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit02 : out std_logic; --                     (1)
      pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit03 : out std_logic; --                     (1)
      pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit04 : out std_logic; --                     (1)
      pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit05 : out std_logic; --                     (1)
      pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit06 : out std_logic; --                     (1)
      pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit07 : out std_logic; --                     (1)
      pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit10 : out std_logic; --                     (1)
      pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit11 : out std_logic; --                     (1)
      pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit12 : out std_logic; --                     (1)
      pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit13 : out std_logic; --                     (1)
      pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit14 : out std_logic; --                     (1)
      pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit15 : out std_logic; --                     (1)
      pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit16 : out std_logic; --                     (1)
      pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit17 : out std_logic; --                     (1)
      --  end record;  --  SP_Zynq_SelfTest_Result_2_Type
      --
      --
      --  type PA_FPGA_SelfTest_Result_2_Type is record
      pkt_FPGA_State_PA_FPGA_SelfTest_Result_PCM_Boot : out std_logic; --                     (1)
      pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM1_Boot : out std_logic; --                     (1)
      pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM2_Boot : out std_logic; --                     (1)
      pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM3_Boot : out std_logic; --                     (1)
      pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM4_Boot : out std_logic; --                     (1)
      pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM5_Boot : out std_logic; --                     (1)
      pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM6_Boot : out std_logic; --                     (1)
      pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM7_Boot : out std_logic; --                     (1)
      pkt_FPGA_State_PA_FPGA_SelfTest_Result_CMD_DATA_ERR : out std_logic; --                     (1)
      pkt_FPGA_State_PA_FPGA_SelfTest_Result_Temp_warn : out std_logic; --                     (1)
      pkt_FPGA_State_PA_FPGA_SelfTest_Result_ReservedBit02 : out std_logic; --                     (1)
      pkt_FPGA_State_PA_FPGA_SelfTest_Result_ReservedBit03 : out std_logic; --                     (1)
      pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAB_ST_RESULT : out std_logic; --                     (1)
      pkt_FPGA_State_PA_FPGA_SelfTest_Result_ReservedBit05 : out std_logic; --                     (1)
      pkt_FPGA_State_PA_FPGA_SelfTest_Result_ReservedBit06 : out std_logic; --                     (1)
      pkt_FPGA_State_PA_FPGA_SelfTest_Result_ReservedBit07 : out std_logic; --                     (1)
      --  end record;  --  PA_FPGA_SelfTest_Result_2_Type
      --
      --
      --  type SC_FPGA_SelfTest_Result_2_Type is record
      pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_MEM : out std_logic; --                     (1)
      pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit01 : out std_logic; --                     (1)
      pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit02 : out std_logic; --                     (1)
      pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit03 : out std_logic; --                     (1)
      pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_FPGA : out std_logic; --                     (1)
      pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit05 : out std_logic; --                     (1)
      pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit06 : out std_logic; --                     (1)
      pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit07 : out std_logic; --                     (1)
      pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_GTP : out std_logic; --                     (1)
      pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_LVDS : out std_logic; --                     (1)
      pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_UART : out std_logic; --                     (1)
      pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit13 : out std_logic; --                     (1)
      pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit14 : out std_logic; --                     (1)
      pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit15 : out std_logic; --                     (1)
      pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit16 : out std_logic; --                     (1)
      pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit17 : out std_logic; --                     (1)
      --  end record;  --  SC_FPGA_SelfTest_Result_2_Type
      --
      --
      --  type FPGA_Zynq_Control_1_Type is record
      pkt_FPGA_State_FPGA_Zynq_Control_PLC_State : out std_logic; --                     (1)
      pkt_FPGA_State_FPGA_Zynq_Control_DAQ_Count_Reset : out std_logic; --                     (1)
      pkt_FPGA_State_FPGA_Zynq_Control_AD_On_Result : out std_logic; --                     (1)
      pkt_FPGA_State_FPGA_Zynq_Control_ReservedBit03 : out std_logic; --                     (1)
      pkt_FPGA_State_FPGA_Zynq_Control_ReservedBit04 : out std_logic; --                     (1)
      pkt_FPGA_State_FPGA_Zynq_Control_SC_FPGA_Reset : out std_logic; --                     (1)
      pkt_FPGA_State_FPGA_Zynq_Control_PA_FPGA_Reset : out std_logic; --                     (1)
      pkt_FPGA_State_FPGA_Zynq_Control_Ping_On_Off : out std_logic; --                     (1)
      --  end record;  --  FPGA_Zynq_Control_1_Type
      --
      --
      --  type FPGA_State_40_Type is record
      pkt_FPGA_State_DAQCounter : out std_logic_vector(31 downto 0); --                     (32)
      pkt_FPGA_State_SC_GainValue : out std_logic_vector(7 downto 0); --                     (8)
      --  bitvector(879 downto 872)
      pkt_FPGA_State_PA_FPGA_Temperature : out std_logic_vector(7 downto 0); --                     (8)
      pkt_FPGA_State_SC_FPGA_Temperature : out std_logic_vector(7 downto 0); --                     (8)
      pkt_FPGA_State_SP_AH_Zynq_Temperature : out std_logic_vector(7 downto 0); --                     (8)
      pkt_FPGA_State_SP_P1_Zynq_Temperature : out std_logic_vector(7 downto 0); --                     (8)
      pkt_FPGA_State_SP_P2_Zynq_Temperature : out std_logic_vector(7 downto 0); --                     (8)
      pkt_FPGA_State_SC2SP_GTP_ERR : out std_logic_vector(7 downto 0); --                     (8)
      pkt_FPGA_State_AH2P1_GTP_ERR : out std_logic_vector(7 downto 0); --                     (8)
      pkt_FPGA_State_AH2P2_GTP_ERR : out std_logic_vector(7 downto 0); --                     (8)
      pkt_FPGA_State_P12AH_GTP_ERR : out std_logic_vector(7 downto 0); --                     (8)
      pkt_FPGA_State_P22AH_GTP_ERR : out std_logic_vector(7 downto 0); --                     (8)
      --  bitvector(975 downto 960)
      --  bitvector(991 downto 976)
      --  bitvector(1007 downto 992)
      pkt_FPGA_State_TX_Voltage_Sample1 : out std_logic_vector(15 downto 0); --                     (16)
      pkt_FPGA_State_TX_Voltage_Sample2 : out std_logic_vector(15 downto 0); --                     (16)
      pkt_FPGA_State_TX_DC_Voltage_Sample1 : out std_logic_vector(15 downto 0); --                     (16)
      pkt_FPGA_State_TX_DC_Voltage_Sample2 : out std_logic_vector(15 downto 0); --                     (16)
      pkt_FPGA_State_TX_DC_Current_Sample1 : out std_logic_vector(15 downto 0); --                     (16)
      pkt_FPGA_State_TX_DC_Current_Sample2 : out std_logic_vector(15 downto 0); --                     (16)
      --  bitvector(1111 downto 1104)
      pkt_FPGA_State_Reserved_9 : out std_logic_vector(39 downto 0); --                     (40)
      --  end record;  --  FPGA_State_40_Type
      --
      --
      --  type GC_Event_4_2_Type is record
      pkt_GC_INFO_GC_Event_4_Enable : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_4_Detect : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_4_Closein : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_4_Fail : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_4_ESAD_Chk : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_4_ESAD_HV : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_4_ESAD_Power : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_4_ReservedBit07 : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_4_ReservedBit08 : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_4_ReservedBit09 : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_4_ReservedBit10 : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_4_ReservedBit11 : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_4_Leakage_Det : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_4_ReservedBit13 : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_4_ReservedBit14 : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_4_M_Stop : out std_logic; --                     (1)
      --  end record;  --  GC_Event_4_2_Type
      --
      --
      --  type GC_Event_3_2_Type is record
      pkt_GC_INFO_GC_Event_3_Beam_Steering : out std_logic_vector(3 downto 0); --                     (4)
      pkt_GC_INFO_GC_Event_3_ReservedBit04 : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_3_ReservedBit05 : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_3_ReservedBit06 : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_3_ReservedBit07 : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_3_ReservedBit08 : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_3_ReservedBit09 : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_3_ReservedBit10 : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_3_ReservedBit11 : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_3_ReservedBit12 : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_3_ReservedBit13 : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_3_ReservedBit14 : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_3_ReservedBit15 : out std_logic; --                     (1)
      --  end record;  --  GC_Event_3_2_Type
      --
      --
      --  type GC_Event_2_2_Type is record
      pkt_GC_INFO_GC_Event_2_Pre_Enable : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_2_Enable : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_2_V_Target : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_2_Speed_Mode1 : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_2_Speed_Mode2 : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_2_Homming_Enable : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_2_Homming_Mode : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_2_Inhibit : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_2_Hold_In : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_2_Target_Det : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_2_Target_Loss : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_2_ACM_Det : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_2_Pre_ACO_Chk : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_2_ACO_Det : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_2_ReservedBit14 : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_2_ReservedBit15 : out std_logic; --                     (1)
      --  end record;  --  GC_Event_2_2_Type
      --
      --
      --  type GC_Event_1_2_Type is record
      pkt_GC_INFO_GC_Event_1_ReservedBit00 : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_1_HILS_Mode : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_1_EXHD_Mode : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_1_C_Range : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_1_E_Range : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_1_ReservedBit05 : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_1_Close_In : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_1_Terminal_Homing : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_1_Fire : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_1_EOM : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_1_Motor_Start : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_1_Motor_Stop : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_1_Ceiling_Det : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_1_Floor_Det : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_1_Surface_Det : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Event_1_EOR : out std_logic; --                     (1)
      --  end record;  --  GC_Event_1_2_Type
      --
      --
      --  type GC_Command_2_Type is record
      pkt_GC_INFO_GC_Command_PLC : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Command_AD_On : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Command_ReservedBit02 : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Command_ReservedBit03 : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Command_Pre_Enable : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Command_Enable : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Command_ReservedBit06 : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Command_ReservedBit07 : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Command_Salvo_On : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Command_Band_Sel : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Command_Mode_Set : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Command_PRI_Start : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Command_Test_Mode_Set : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Command_REC_Disable_Set : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Command_Test_Trig : out std_logic; --                     (1)
      pkt_GC_INFO_GC_Command_ReservedBit15 : out std_logic; --                     (1)
      --  end record;  --  GC_Command_2_Type
      --
      --
      --  type GC_INFO_56_Type is record
      pkt_GC_INFO_GC_Count : out std_logic_vector(31 downto 0); --                     (32)
      --  bitvector(431 downto 416)
      pkt_GC_INFO_Reserved_0 : out std_logic_vector(15 downto 0); --                     (16)
      --  bitvector(463 downto 448)
      --  bitvector(479 downto 464)
      --  bitvector(495 downto 480)
      --  bitvector(511 downto 496)
      pkt_GC_INFO_Speed_Mode : out std_logic_vector(7 downto 0); --                     (8)
      pkt_GC_INFO_Search_Pattern : out std_logic_vector(7 downto 0); --                     (8)
      pkt_GC_INFO_Pulse_Freq : out std_logic_vector(7 downto 0); --                     (8)
      pkt_GC_INFO_Pulse_Type : out std_logic_vector(7 downto 0); --                     (8)
      pkt_GC_INFO_Pulse_Length : out std_logic_vector(7 downto 0); --                     (8)
      pkt_GC_INFO_PRE_Pulse : out std_logic_vector(7 downto 0); --                     (8)
      pkt_GC_INFO_PRI : out std_logic_vector(7 downto 0); --                     (8)
      pkt_GC_INFO_Beam_Steering : out std_logic_vector(7 downto 0); --                     (8)
      pkt_GC_INFO_BAT_VOLT : out std_logic_vector(15 downto 0); --                     (16)
      pkt_GC_INFO_Reserved_1 : out std_logic_vector(47 downto 0); --                     (48)
      pkt_GC_INFO_TORP_N : out std_logic_vector(31 downto 0); --                     (32)
      pkt_GC_INFO_TORP_E : out std_logic_vector(31 downto 0); --                     (32)
      pkt_GC_INFO_TORP_D : out std_logic_vector(15 downto 0); --                     (16)
      pkt_GC_INFO_TORP_Roll : out std_logic_vector(15 downto 0); --                     (16)
      pkt_GC_INFO_TORP_Pitch : out std_logic_vector(15 downto 0); --                     (16)
      pkt_GC_INFO_TORP_Yaw : out std_logic_vector(15 downto 0); --                     (16)
      pkt_GC_INFO_ACT_On_Off : out std_logic_vector(7 downto 0); --                     (8)
      pkt_GC_INFO_Reserved_2 : out std_logic_vector(55 downto 0); --                     (56)
      --  end record;  --  GC_INFO_56_Type
      --
      --
      --  type Save_Beam_INFO_2_Type is record
      pkt_FPGA_CMD_Save_Beam_INFO_Save_R3 : out std_logic; --                     (1)
      pkt_FPGA_CMD_Save_Beam_INFO_Save_R2 : out std_logic; --                     (1)
      pkt_FPGA_CMD_Save_Beam_INFO_Save_R1 : out std_logic; --                     (1)
      pkt_FPGA_CMD_Save_Beam_INFO_Save_R0 : out std_logic; --                     (1)
      pkt_FPGA_CMD_Save_Beam_INFO_Save_C : out std_logic; --                     (1)
      pkt_FPGA_CMD_Save_Beam_INFO_Save_L0 : out std_logic; --                     (1)
      pkt_FPGA_CMD_Save_Beam_INFO_Save_L1 : out std_logic; --                     (1)
      pkt_FPGA_CMD_Save_Beam_INFO_Save_L2 : out std_logic; --                     (1)
      pkt_FPGA_CMD_Save_Beam_INFO_Optic_On : out std_logic; --                     (1)
      pkt_FPGA_CMD_Save_Beam_INFO_Ethernet_On : out std_logic; --                     (1)
      pkt_FPGA_CMD_Save_Beam_INFO_TE_Data_Input : out std_logic_vector(1 downto 0); --                     (2)
      pkt_FPGA_CMD_Save_Beam_INFO_ReservedBit04 : out std_logic; --                     (1)
      pkt_FPGA_CMD_Save_Beam_INFO_ReservedBit05 : out std_logic; --                     (1)
      pkt_FPGA_CMD_Save_Beam_INFO_ReservedBit06 : out std_logic; --                     (1)
      pkt_FPGA_CMD_Save_Beam_INFO_Save_L3 : out std_logic; --                     (1)
      --  end record;  --  Save_Beam_INFO_2_Type
      --
      --
      --  type PA_Tx_FPGA_CMD_16_Type is record
      pkt_FPGA_CMD_PA_Tx_FPGA_CMD_PRI : out std_logic_vector(5 downto 0); --                     (6)
      pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx_Reset : out std_logic; --                     (1)
      pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx_Trigger : out std_logic; --                     (1)
      pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx_Pulse_Interval : out std_logic_vector(6 downto 0); --                     (7)
      pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Number_of_Tx : out std_logic; --                     (1)
      pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Beam_Steering_Angle : out std_logic_vector(7 downto 0); --                     (8)
      pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx1_Pulse_Length : out std_logic_vector(6 downto 0); --                     (7)
      pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx1_Type : out std_logic; --                     (1)
      pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx1_Start_Frequency : out std_logic_vector(14 downto 0); --                     (15)
      pkt_FPGA_CMD_PA_Tx_FPGA_CMD_ReservedBit07_1 : out std_logic; --                     (1)
      pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx1_Sweep_Frequency : out std_logic_vector(7 downto 0); --                     (8)
      pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx2_Pulse_Length : out std_logic_vector(6 downto 0); --                     (7)
      pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx2_Type : out std_logic; --                     (1)
      pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx2_Start_Frequency : out std_logic_vector(14 downto 0); --                     (15)
      pkt_FPGA_CMD_PA_Tx_FPGA_CMD_ReservedBit07_2 : out std_logic; --                     (1)
      pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx2_Sweep_Frequency : out std_logic_vector(7 downto 0); --                     (8)
      pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Beam_Weighting_Select : out std_logic_vector(3 downto 0); --                     (4)
      pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Ramping_Time : out std_logic_vector(3 downto 0); --                     (4)
      pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Battery_Voltage : out std_logic_vector(15 downto 0); --                     (16)
      pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Stave_Selection_Number : out std_logic_vector(3 downto 0); --                     (4)
      pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Reserved_1 : out std_logic; --                     (1)
      pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Reserved_2 : out std_logic; --                     (1)
      pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Test_Mode : out std_logic; --                     (1)
      pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Stave_Tx_Mode : out std_logic; --                     (1)
      pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Stave_Weight : out std_logic_vector(7 downto 0); --                     (8)
      --  end record;  --  PA_Tx_FPGA_CMD_16_Type
      --
      --
      --  type SC_Rx_FPGA_CMD_8_Type is record
      pkt_FPGA_CMD_SC_Rx_FPGA_CMD_TVG : out std_logic_vector(3 downto 0); --                     (4)
      pkt_FPGA_CMD_SC_Rx_FPGA_CMD_REC_Mode : out std_logic_vector(1 downto 0); --                     (2)
      pkt_FPGA_CMD_SC_Rx_FPGA_CMD_ReservedBit06_0 : out std_logic; --                     (1)
      pkt_FPGA_CMD_SC_Rx_FPGA_CMD_ReservedBit07_0 : out std_logic; --                     (1)
      pkt_FPGA_CMD_SC_Rx_FPGA_CMD_PLC : out std_logic; --                     (1)
      pkt_FPGA_CMD_SC_Rx_FPGA_CMD_DAQ_Count_Reset : out std_logic; --                     (1)
      pkt_FPGA_CMD_SC_Rx_FPGA_CMD_AD_On : out std_logic; --                     (1)
      pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Gain_Mode : out std_logic; --                     (1)
      pkt_FPGA_CMD_SC_Rx_FPGA_CMD_BPF_On_Off : out std_logic; --                     (1)
      pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Pass_Active : out std_logic; --                     (1)
      pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Reset : out std_logic; --                     (1)
      pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Stop_Run : out std_logic; --                     (1)
      pkt_FPGA_CMD_SC_Rx_FPGA_CMD_REC_On_Off : out std_logic; --                     (1)
      pkt_FPGA_CMD_SC_Rx_FPGA_CMD_PLC_Mode : out std_logic_vector(1 downto 0); --                     (2)
      pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Data_Path : out std_logic; --                     (1)
      pkt_FPGA_CMD_SC_Rx_FPGA_CMD_ReservedBit04 : out std_logic; --                     (1)
      pkt_FPGA_CMD_SC_Rx_FPGA_CMD_ReservedBit05 : out std_logic; --                     (1)
      pkt_FPGA_CMD_SC_Rx_FPGA_CMD_ReservedBit06 : out std_logic; --                     (1)
      pkt_FPGA_CMD_SC_Rx_FPGA_CMD_ReservedBit07 : out std_logic; --                     (1)
      pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Gain : out std_logic_vector(7 downto 0); --                     (8)
      pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Reserved : out std_logic_vector(31 downto 0); --                     (32)
      --  end record;  --  SC_Rx_FPGA_CMD_8_Type
      --
      --
      --  type FPGA_CMD_36_Type is record
      pkt_FPGA_CMD_Reserved_0 : out std_logic_vector(31 downto 0); --                     (32)
      --  bitvector(191 downto 128)
      --  bitvector(319 downto 192)
      --  bitvector(335 downto 320)
      pkt_FPGA_CMD_Reserved_1 : out std_logic_vector(47 downto 0); --                     (48)
      --  end record;  --  FPGA_CMD_36_Type
      --
      --
      --  type SCB2SPB_Pkt_300_Type is record
      pkt_Start_Bytes : out std_logic_vector(31 downto 0); --                     (32)
      pkt_Count : out std_logic_vector(31 downto 0); --                     (32)
      pkt_Command : out std_logic_vector(15 downto 0); --                     (16)
      pkt_ACK : out std_logic_vector(15 downto 0); --                     (16)
      --  bitvector(383 downto 96)
      --  bitvector(831 downto 384)
      --  bitvector(1151 downto 832)
      --  bitvector(2367 downto 1152)
      pkt_Checksum : out std_logic_vector(15 downto 0); --                     (16)
      pkt_Stop_Bytes : out std_logic_vector(15 downto 0); --                     (16)
      --  end record;  --  SCB2SPB_Pkt_300_Type
      --
      pkt_Data_CH_Data_1 : out std_logic_vector(31 downto 0); --   (32)   (1183 downto 1152);
      pkt_Data_CH_Data_2 : out std_logic_vector(31 downto 0); --   (32)   (1215 downto 1184);
      pkt_Data_CH_Data_3 : out std_logic_vector(31 downto 0); --   (32)   (1247 downto 1216);
      pkt_Data_CH_Data_4 : out std_logic_vector(31 downto 0); --   (32)   (1279 downto 1248);
      pkt_Data_CH_Data_5 : out std_logic_vector(31 downto 0); --   (32)   (1311 downto 1280);
      pkt_Data_CH_Data_6 : out std_logic_vector(31 downto 0); --   (32)   (1343 downto 1312);
      pkt_Data_CH_Data_7 : out std_logic_vector(31 downto 0); --   (32)   (1375 downto 1344);
      pkt_Data_CH_Data_8 : out std_logic_vector(31 downto 0); --   (32)   (1407 downto 1376);
      pkt_Data_CH_Data_9 : out std_logic_vector(31 downto 0); --   (32)   (1439 downto 1408);
      pkt_Data_CH_Data_10 : out std_logic_vector(31 downto 0); --   (32)   (1471 downto 1440);
      pkt_Data_CH_Data_11 : out std_logic_vector(31 downto 0); --   (32)   (1503 downto 1472);
      pkt_Data_CH_Data_12 : out std_logic_vector(31 downto 0); --   (32)   (1535 downto 1504);
      pkt_Data_CH_Data_13 : out std_logic_vector(31 downto 0); --   (32)   (1567 downto 1536);
      pkt_Data_CH_Data_14 : out std_logic_vector(31 downto 0); --   (32)   (1599 downto 1568);
      pkt_Data_CH_Data_15 : out std_logic_vector(31 downto 0); --   (32)   (1631 downto 1600);
      pkt_Data_CH_Data_16 : out std_logic_vector(31 downto 0); --   (32)   (1663 downto 1632);
      pkt_Data_CH_Data_17 : out std_logic_vector(31 downto 0); --   (32)   (1695 downto 1664);
      pkt_Data_CH_Data_18 : out std_logic_vector(31 downto 0); --   (32)   (1727 downto 1696);
      pkt_Data_CH_Data_19 : out std_logic_vector(31 downto 0); --   (32)   (1759 downto 1728);
      pkt_Data_CH_Data_20 : out std_logic_vector(31 downto 0); --   (32)   (1791 downto 1760);
      pkt_Data_CH_Data_21 : out std_logic_vector(31 downto 0); --   (32)   (1823 downto 1792);
      pkt_Data_CH_Data_22 : out std_logic_vector(31 downto 0); --   (32)   (1855 downto 1824);
      pkt_Data_CH_Data_23 : out std_logic_vector(31 downto 0); --   (32)   (1887 downto 1856);
      pkt_Data_CH_Data_24 : out std_logic_vector(31 downto 0); --   (32)   (1919 downto 1888);
      pkt_Data_CH_Data_25 : out std_logic_vector(31 downto 0); --   (32)   (1951 downto 1920);
      pkt_Data_CH_Data_26 : out std_logic_vector(31 downto 0); --   (32)   (1983 downto 1952);
      pkt_Data_CH_Data_27 : out std_logic_vector(31 downto 0); --   (32)   (2015 downto 1984);
      pkt_Data_CH_Data_28 : out std_logic_vector(31 downto 0); --   (32)   (2047 downto 2016);
      pkt_Data_CH_Data_29 : out std_logic_vector(31 downto 0); --   (32)   (2079 downto 2048);
      pkt_Data_CH_Data_30 : out std_logic_vector(31 downto 0); --   (32)   (2111 downto 2080);
      pkt_Data_CH_Data_31 : out std_logic_vector(31 downto 0); --   (32)   (2143 downto 2112);
      pkt_Data_CH_Data_32 : out std_logic_vector(31 downto 0); --   (32)   (2175 downto 2144);
      pkt_Data_CH_Data_33 : out std_logic_vector(31 downto 0); --   (32)   (2207 downto 2176);
      pkt_Data_CH_Data_34 : out std_logic_vector(31 downto 0); --   (32)   (2239 downto 2208);
      pkt_Data_CH_Data_35 : out std_logic_vector(31 downto 0); --   (32)   (2271 downto 2240);
      pkt_Data_CH_Data_36 : out std_logic_vector(31 downto 0); --   (32)   (2303 downto 2272);
      pkt_Data_CH_Data_37 : out std_logic_vector(31 downto 0); --   (32)   (2335 downto 2304);
      --
      bitvector : in std_logic_vector(2399 downto 0)
    );
  end component;
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
  --
  -- componet [ bs_scb_record_gen_0 ] signal define

  signal m_axis_tvalid_bs_scb_record_gen_0 : std_logic := '0';
  -- signal m_axis_tready_bs_scb_record_gen_0 : std_logic := '0';
  signal m_axis_tlast_bs_scb_record_gen_0 : std_logic := '0';
  signal m_axis_tkeep_bs_scb_record_gen_0 : std_logic_vector(3 downto 0) := (others => '0');
  signal m_axis_tdata_bs_scb_record_gen_0 : std_logic_vector(32 - 1 downto 0) := (others => '0');

  signal m_record_data_bs_scb_record_gen_0 : std_logic_vector(300 * 8 - 1 downto 0) := (others => '0');

  --
  signal ila_data_bs_ila_debug_0 : std_logic_vector(300 * 8 - 1 downto 0) := (others => '0');
  --
  --
  -- componet [ bs_ram_saxis_2_maxis_0 ] signal define

  signal m_axis_tvalid_bs_ram_saxis_2_maxis_0 : std_logic := '0';
  signal m_axis_tready_bs_ram_saxis_2_maxis_0 : std_logic := '0';
  signal m_axis_tlast_bs_ram_saxis_2_maxis_0 : std_logic := '0';
  signal m_axis_tkeep_bs_ram_saxis_2_maxis_0 : std_logic_vector(3 downto 0) := (others => '0');
  signal m_axis_tdata_bs_ram_saxis_2_maxis_0 : std_logic_vector(31 downto 0) := (others => '0');

  --
  --
  --
  --
  --  type Data_152_Type is record
  --  bitvector(2335 downto 1152)
  signal pkt_Data_Reserved_o : std_logic_vector(31 downto 0);
  --  end record;  --  Data_152_Type
  --  
  --  --
  --  type Trigger_State_1_Type is record
  signal pkt_FPGA_State_Trigger_State_TE_TX_TRIG_o : std_logic;
  signal pkt_FPGA_State_Trigger_State_TE_RX_TRIG_o : std_logic;
  signal pkt_FPGA_State_Trigger_State_TX_TRIG_o : std_logic;
  signal pkt_FPGA_State_Trigger_State_TX_P_GATE_o : std_logic;
  signal pkt_FPGA_State_Trigger_State_ReservedBit04_o : std_logic;
  signal pkt_FPGA_State_Trigger_State_ReservedBit05_o : std_logic;
  signal pkt_FPGA_State_Trigger_State_ReservedBit06_o : std_logic;
  signal pkt_FPGA_State_Trigger_State_ReservedBit07_o : std_logic;
  --  end record;  --  Trigger_State_1_Type
  --  
  --  --
  --  type SP_Zynq_SelfTest_Result_2_Type is record
  signal pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit00_o : std_logic;
  signal pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit01_o : std_logic;
  signal pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit02_o : std_logic;
  signal pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit03_o : std_logic;
  signal pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit04_o : std_logic;
  signal pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit05_o : std_logic;
  signal pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit06_o : std_logic;
  signal pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit07_o : std_logic;
  signal pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit10_o : std_logic;
  signal pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit11_o : std_logic;
  signal pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit12_o : std_logic;
  signal pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit13_o : std_logic;
  signal pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit14_o : std_logic;
  signal pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit15_o : std_logic;
  signal pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit16_o : std_logic;
  signal pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit17_o : std_logic;
  --  end record;  --  SP_Zynq_SelfTest_Result_2_Type
  --  
  --  --
  --  type PA_FPGA_SelfTest_Result_2_Type is record
  signal pkt_FPGA_State_PA_FPGA_SelfTest_Result_PCM_Boot_o : std_logic;
  signal pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM1_Boot_o : std_logic;
  signal pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM2_Boot_o : std_logic;
  signal pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM3_Boot_o : std_logic;
  signal pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM4_Boot_o : std_logic;
  signal pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM5_Boot_o : std_logic;
  signal pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM6_Boot_o : std_logic;
  signal pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM7_Boot_o : std_logic;
  signal pkt_FPGA_State_PA_FPGA_SelfTest_Result_CMD_DATA_ERR_o : std_logic;
  signal pkt_FPGA_State_PA_FPGA_SelfTest_Result_Temp_warn_o : std_logic;
  signal pkt_FPGA_State_PA_FPGA_SelfTest_Result_ReservedBit02_o : std_logic;
  signal pkt_FPGA_State_PA_FPGA_SelfTest_Result_ReservedBit03_o : std_logic;
  signal pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAB_ST_RESULT_o : std_logic;
  signal pkt_FPGA_State_PA_FPGA_SelfTest_Result_ReservedBit05_o : std_logic;
  signal pkt_FPGA_State_PA_FPGA_SelfTest_Result_ReservedBit06_o : std_logic;
  signal pkt_FPGA_State_PA_FPGA_SelfTest_Result_ReservedBit07_o : std_logic;
  --  end record;  --  PA_FPGA_SelfTest_Result_2_Type
  --  
  --  --
  --  type SC_FPGA_SelfTest_Result_2_Type is record
  signal pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_MEM_o : std_logic;
  signal pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit01_o : std_logic;
  signal pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit02_o : std_logic;
  signal pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit03_o : std_logic;
  signal pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_FPGA_o : std_logic;
  signal pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit05_o : std_logic;
  signal pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit06_o : std_logic;
  signal pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit07_o : std_logic;
  signal pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_GTP_o : std_logic;
  signal pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_LVDS_o : std_logic;
  signal pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_UART_o : std_logic;
  signal pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit13_o : std_logic;
  signal pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit14_o : std_logic;
  signal pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit15_o : std_logic;
  signal pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit16_o : std_logic;
  signal pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit17_o : std_logic;
  --  end record;  --  SC_FPGA_SelfTest_Result_2_Type
  --  
  --  --
  --  type FPGA_Zynq_Control_1_Type is record
  signal pkt_FPGA_State_FPGA_Zynq_Control_PLC_State_o : std_logic;
  signal pkt_FPGA_State_FPGA_Zynq_Control_DAQ_Count_Reset_o : std_logic;
  signal pkt_FPGA_State_FPGA_Zynq_Control_AD_On_Result_o : std_logic;
  signal pkt_FPGA_State_FPGA_Zynq_Control_ReservedBit03_o : std_logic;
  signal pkt_FPGA_State_FPGA_Zynq_Control_ReservedBit04_o : std_logic;
  signal pkt_FPGA_State_FPGA_Zynq_Control_SC_FPGA_Reset_o : std_logic;
  signal pkt_FPGA_State_FPGA_Zynq_Control_PA_FPGA_Reset_o : std_logic;
  signal pkt_FPGA_State_FPGA_Zynq_Control_Ping_On_Off_o : std_logic;
  --  end record;  --  FPGA_Zynq_Control_1_Type
  --  
  --  --
  --  type FPGA_State_40_Type is record
  signal pkt_FPGA_State_DAQCounter_o : std_logic_vector(31 downto 0);
  signal pkt_FPGA_State_SC_GainValue_o : std_logic_vector(7 downto 0);
  --  bitvector(879 downto 872)
  signal pkt_FPGA_State_PA_FPGA_Temperature_o : std_logic_vector(7 downto 0);
  signal pkt_FPGA_State_SC_FPGA_Temperature_o : std_logic_vector(7 downto 0);
  signal pkt_FPGA_State_SP_AH_Zynq_Temperature_o : std_logic_vector(7 downto 0);
  signal pkt_FPGA_State_SP_P1_Zynq_Temperature_o : std_logic_vector(7 downto 0);
  signal pkt_FPGA_State_SP_P2_Zynq_Temperature_o : std_logic_vector(7 downto 0);
  signal pkt_FPGA_State_SC2SP_GTP_ERR_o : std_logic_vector(7 downto 0);
  signal pkt_FPGA_State_AH2P1_GTP_ERR_o : std_logic_vector(7 downto 0);
  signal pkt_FPGA_State_AH2P2_GTP_ERR_o : std_logic_vector(7 downto 0);
  signal pkt_FPGA_State_P12AH_GTP_ERR_o : std_logic_vector(7 downto 0);
  signal pkt_FPGA_State_P22AH_GTP_ERR_o : std_logic_vector(7 downto 0);
  --  bitvector(975 downto 960)
  --  bitvector(991 downto 976)
  --  bitvector(1007 downto 992)
  signal pkt_FPGA_State_TX_Voltage_Sample1_o : std_logic_vector(15 downto 0);
  signal pkt_FPGA_State_TX_Voltage_Sample2_o : std_logic_vector(15 downto 0);
  signal pkt_FPGA_State_TX_DC_Voltage_Sample1_o : std_logic_vector(15 downto 0);
  signal pkt_FPGA_State_TX_DC_Voltage_Sample2_o : std_logic_vector(15 downto 0);
  signal pkt_FPGA_State_TX_DC_Current_Sample1_o : std_logic_vector(15 downto 0);
  signal pkt_FPGA_State_TX_DC_Current_Sample2_o : std_logic_vector(15 downto 0);
  --  bitvector(1111 downto 1104)
  signal pkt_FPGA_State_Reserved_9_o : std_logic_vector(39 downto 0);
  --  end record;  --  FPGA_State_40_Type
  --  
  --  --
  --  type GC_Event_4_2_Type is record
  signal pkt_GC_INFO_GC_Event_4_Enable_o : std_logic;
  signal pkt_GC_INFO_GC_Event_4_Detect_o : std_logic;
  signal pkt_GC_INFO_GC_Event_4_Closein_o : std_logic;
  signal pkt_GC_INFO_GC_Event_4_Fail_o : std_logic;
  signal pkt_GC_INFO_GC_Event_4_ESAD_Chk_o : std_logic;
  signal pkt_GC_INFO_GC_Event_4_ESAD_HV_o : std_logic;
  signal pkt_GC_INFO_GC_Event_4_ESAD_Power_o : std_logic;
  signal pkt_GC_INFO_GC_Event_4_ReservedBit07_o : std_logic;
  signal pkt_GC_INFO_GC_Event_4_ReservedBit08_o : std_logic;
  signal pkt_GC_INFO_GC_Event_4_ReservedBit09_o : std_logic;
  signal pkt_GC_INFO_GC_Event_4_ReservedBit10_o : std_logic;
  signal pkt_GC_INFO_GC_Event_4_ReservedBit11_o : std_logic;
  signal pkt_GC_INFO_GC_Event_4_Leakage_Det_o : std_logic;
  signal pkt_GC_INFO_GC_Event_4_ReservedBit13_o : std_logic;
  signal pkt_GC_INFO_GC_Event_4_ReservedBit14_o : std_logic;
  signal pkt_GC_INFO_GC_Event_4_M_Stop_o : std_logic;
  --  end record;  --  GC_Event_4_2_Type
  --  
  --  --
  --  type GC_Event_3_2_Type is record
  signal pkt_GC_INFO_GC_Event_3_Beam_Steering_o : std_logic_vector(3 downto 0);
  signal pkt_GC_INFO_GC_Event_3_ReservedBit04_o : std_logic;
  signal pkt_GC_INFO_GC_Event_3_ReservedBit05_o : std_logic;
  signal pkt_GC_INFO_GC_Event_3_ReservedBit06_o : std_logic;
  signal pkt_GC_INFO_GC_Event_3_ReservedBit07_o : std_logic;
  signal pkt_GC_INFO_GC_Event_3_ReservedBit08_o : std_logic;
  signal pkt_GC_INFO_GC_Event_3_ReservedBit09_o : std_logic;
  signal pkt_GC_INFO_GC_Event_3_ReservedBit10_o : std_logic;
  signal pkt_GC_INFO_GC_Event_3_ReservedBit11_o : std_logic;
  signal pkt_GC_INFO_GC_Event_3_ReservedBit12_o : std_logic;
  signal pkt_GC_INFO_GC_Event_3_ReservedBit13_o : std_logic;
  signal pkt_GC_INFO_GC_Event_3_ReservedBit14_o : std_logic;
  signal pkt_GC_INFO_GC_Event_3_ReservedBit15_o : std_logic;
  --  end record;  --  GC_Event_3_2_Type
  --  
  --  --
  --  type GC_Event_2_2_Type is record
  signal pkt_GC_INFO_GC_Event_2_Pre_Enable_o : std_logic;
  signal pkt_GC_INFO_GC_Event_2_Enable_o : std_logic;
  signal pkt_GC_INFO_GC_Event_2_V_Target_o : std_logic;
  signal pkt_GC_INFO_GC_Event_2_Speed_Mode1_o : std_logic;
  signal pkt_GC_INFO_GC_Event_2_Speed_Mode2_o : std_logic;
  signal pkt_GC_INFO_GC_Event_2_Homming_Enable_o : std_logic;
  signal pkt_GC_INFO_GC_Event_2_Homming_Mode_o : std_logic;
  signal pkt_GC_INFO_GC_Event_2_Inhibit_o : std_logic;
  signal pkt_GC_INFO_GC_Event_2_Hold_In_o : std_logic;
  signal pkt_GC_INFO_GC_Event_2_Target_Det_o : std_logic;
  signal pkt_GC_INFO_GC_Event_2_Target_Loss_o : std_logic;
  signal pkt_GC_INFO_GC_Event_2_ACM_Det_o : std_logic;
  signal pkt_GC_INFO_GC_Event_2_Pre_ACO_Chk_o : std_logic;
  signal pkt_GC_INFO_GC_Event_2_ACO_Det_o : std_logic;
  signal pkt_GC_INFO_GC_Event_2_ReservedBit14_o : std_logic;
  signal pkt_GC_INFO_GC_Event_2_ReservedBit15_o : std_logic;
  --  end record;  --  GC_Event_2_2_Type
  --  
  --  --
  --  type GC_Event_1_2_Type is record
  signal pkt_GC_INFO_GC_Event_1_ReservedBit00_o : std_logic;
  signal pkt_GC_INFO_GC_Event_1_HILS_Mode_o : std_logic;
  signal pkt_GC_INFO_GC_Event_1_EXHD_Mode_o : std_logic;
  signal pkt_GC_INFO_GC_Event_1_C_Range_o : std_logic;
  signal pkt_GC_INFO_GC_Event_1_E_Range_o : std_logic;
  signal pkt_GC_INFO_GC_Event_1_ReservedBit05_o : std_logic;
  signal pkt_GC_INFO_GC_Event_1_Close_In_o : std_logic;
  signal pkt_GC_INFO_GC_Event_1_Terminal_Homing_o : std_logic;
  signal pkt_GC_INFO_GC_Event_1_Fire_o : std_logic;
  signal pkt_GC_INFO_GC_Event_1_EOM_o : std_logic;
  signal pkt_GC_INFO_GC_Event_1_Motor_Start_o : std_logic;
  signal pkt_GC_INFO_GC_Event_1_Motor_Stop_o : std_logic;
  signal pkt_GC_INFO_GC_Event_1_Ceiling_Det_o : std_logic;
  signal pkt_GC_INFO_GC_Event_1_Floor_Det_o : std_logic;
  signal pkt_GC_INFO_GC_Event_1_Surface_Det_o : std_logic;
  signal pkt_GC_INFO_GC_Event_1_EOR_o : std_logic;
  --  end record;  --  GC_Event_1_2_Type
  --  
  --  --
  --  type GC_Command_2_Type is record
  signal pkt_GC_INFO_GC_Command_PLC_o : std_logic;
  signal pkt_GC_INFO_GC_Command_AD_On_o : std_logic;
  signal pkt_GC_INFO_GC_Command_ReservedBit02_o : std_logic;
  signal pkt_GC_INFO_GC_Command_ReservedBit03_o : std_logic;
  signal pkt_GC_INFO_GC_Command_Pre_Enable_o : std_logic;
  signal pkt_GC_INFO_GC_Command_Enable_o : std_logic;
  signal pkt_GC_INFO_GC_Command_ReservedBit06_o : std_logic;
  signal pkt_GC_INFO_GC_Command_ReservedBit07_o : std_logic;
  signal pkt_GC_INFO_GC_Command_Salvo_On_o : std_logic;
  signal pkt_GC_INFO_GC_Command_Band_Sel_o : std_logic;
  signal pkt_GC_INFO_GC_Command_Mode_Set_o : std_logic;
  signal pkt_GC_INFO_GC_Command_PRI_Start_o : std_logic;
  signal pkt_GC_INFO_GC_Command_Test_Mode_Set_o : std_logic;
  signal pkt_GC_INFO_GC_Command_REC_Disable_Set_o : std_logic;
  signal pkt_GC_INFO_GC_Command_Test_Trig_o : std_logic;
  signal pkt_GC_INFO_GC_Command_ReservedBit15_o : std_logic;
  --  end record;  --  GC_Command_2_Type
  --  
  --  --
  --  type GC_INFO_56_Type is record
  signal pkt_GC_INFO_GC_Count_o : std_logic_vector(31 downto 0);
  --  bitvector(431 downto 416)
  signal pkt_GC_INFO_Reserved_0_o : std_logic_vector(15 downto 0);
  --  bitvector(463 downto 448)
  --  bitvector(479 downto 464)
  --  bitvector(495 downto 480)
  --  bitvector(511 downto 496)
  signal pkt_GC_INFO_Speed_Mode_o : std_logic_vector(7 downto 0);
  signal pkt_GC_INFO_Search_Pattern_o : std_logic_vector(7 downto 0);
  signal pkt_GC_INFO_Pulse_Freq_o : std_logic_vector(7 downto 0);
  signal pkt_GC_INFO_Pulse_Type_o : std_logic_vector(7 downto 0);
  signal pkt_GC_INFO_Pulse_Length_o : std_logic_vector(7 downto 0);
  signal pkt_GC_INFO_PRE_Pulse_o : std_logic_vector(7 downto 0);
  signal pkt_GC_INFO_PRI_o : std_logic_vector(7 downto 0);
  signal pkt_GC_INFO_Beam_Steering_o : std_logic_vector(7 downto 0);
  signal pkt_GC_INFO_BAT_VOLT_o : std_logic_vector(15 downto 0);
  signal pkt_GC_INFO_Reserved_1_o : std_logic_vector(47 downto 0);
  signal pkt_GC_INFO_TORP_N_o : std_logic_vector(31 downto 0);
  signal pkt_GC_INFO_TORP_E_o : std_logic_vector(31 downto 0);
  signal pkt_GC_INFO_TORP_D_o : std_logic_vector(15 downto 0);
  signal pkt_GC_INFO_TORP_Roll_o : std_logic_vector(15 downto 0);
  signal pkt_GC_INFO_TORP_Pitch_o : std_logic_vector(15 downto 0);
  signal pkt_GC_INFO_TORP_Yaw_o : std_logic_vector(15 downto 0);
  signal pkt_GC_INFO_ACT_On_Off_o : std_logic_vector(7 downto 0);
  signal pkt_GC_INFO_Reserved_2_o : std_logic_vector(55 downto 0);
  --  end record;  --  GC_INFO_56_Type
  --  
  --  --
  --  type Save_Beam_INFO_2_Type is record
  signal pkt_FPGA_CMD_Save_Beam_INFO_Save_R3_o : std_logic;
  signal pkt_FPGA_CMD_Save_Beam_INFO_Save_R2_o : std_logic;
  signal pkt_FPGA_CMD_Save_Beam_INFO_Save_R1_o : std_logic;
  signal pkt_FPGA_CMD_Save_Beam_INFO_Save_R0_o : std_logic;
  signal pkt_FPGA_CMD_Save_Beam_INFO_Save_C_o : std_logic;
  signal pkt_FPGA_CMD_Save_Beam_INFO_Save_L0_o : std_logic;
  signal pkt_FPGA_CMD_Save_Beam_INFO_Save_L1_o : std_logic;
  signal pkt_FPGA_CMD_Save_Beam_INFO_Save_L2_o : std_logic;
  signal pkt_FPGA_CMD_Save_Beam_INFO_Optic_On_o : std_logic;
  signal pkt_FPGA_CMD_Save_Beam_INFO_Ethernet_On_o : std_logic;
  signal pkt_FPGA_CMD_Save_Beam_INFO_TE_Data_Input_o : std_logic_vector(1 downto 0);
  signal pkt_FPGA_CMD_Save_Beam_INFO_ReservedBit04_o : std_logic;
  signal pkt_FPGA_CMD_Save_Beam_INFO_ReservedBit05_o : std_logic;
  signal pkt_FPGA_CMD_Save_Beam_INFO_ReservedBit06_o : std_logic;
  signal pkt_FPGA_CMD_Save_Beam_INFO_Save_L3_o : std_logic;
  --  end record;  --  Save_Beam_INFO_2_Type
  --  
  --  --
  --  type PA_Tx_FPGA_CMD_16_Type is record
  signal pkt_FPGA_CMD_PA_Tx_FPGA_CMD_PRI_o : std_logic_vector(5 downto 0);
  signal pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx_Reset_o : std_logic;
  signal pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx_Trigger_o : std_logic;
  signal pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx_Pulse_Interval_o : std_logic_vector(6 downto 0);
  signal pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Number_of_Tx_o : std_logic;
  signal pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Beam_Steering_Angle_o : std_logic_vector(7 downto 0);
  signal pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx1_Pulse_Length_o : std_logic_vector(6 downto 0);
  signal pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx1_Type_o : std_logic;
  signal pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx1_Start_Frequency_o : std_logic_vector(14 downto 0);
  signal pkt_FPGA_CMD_PA_Tx_FPGA_CMD_ReservedBit07_1_o : std_logic;
  signal pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx1_Sweep_Frequency_o : std_logic_vector(7 downto 0);
  signal pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx2_Pulse_Length_o : std_logic_vector(6 downto 0);
  signal pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx2_Type_o : std_logic;
  signal pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx2_Start_Frequency_o : std_logic_vector(14 downto 0);
  signal pkt_FPGA_CMD_PA_Tx_FPGA_CMD_ReservedBit07_2_o : std_logic;
  signal pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx2_Sweep_Frequency_o : std_logic_vector(7 downto 0);
  signal pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Beam_Weighting_Select_o : std_logic_vector(3 downto 0);
  signal pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Ramping_Time_o : std_logic_vector(3 downto 0);
  signal pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Battery_Voltage_o : std_logic_vector(15 downto 0);
  signal pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Stave_Selection_Number_o : std_logic_vector(3 downto 0);
  signal pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Reserved_1_o : std_logic;
  signal pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Reserved_2_o : std_logic;
  signal pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Test_Mode_o : std_logic;
  signal pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Stave_Tx_Mode_o : std_logic;
  signal pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Stave_Weight_o : std_logic_vector(7 downto 0);
  --  end record;  --  PA_Tx_FPGA_CMD_16_Type
  --  
  --  --
  --  type SC_Rx_FPGA_CMD_8_Type is record
  signal pkt_FPGA_CMD_SC_Rx_FPGA_CMD_TVG_o : std_logic_vector(3 downto 0);
  signal pkt_FPGA_CMD_SC_Rx_FPGA_CMD_REC_Mode_o : std_logic_vector(1 downto 0);
  signal pkt_FPGA_CMD_SC_Rx_FPGA_CMD_ReservedBit06_0_o : std_logic;
  signal pkt_FPGA_CMD_SC_Rx_FPGA_CMD_ReservedBit07_0_o : std_logic;
  signal pkt_FPGA_CMD_SC_Rx_FPGA_CMD_PLC_o : std_logic;
  signal pkt_FPGA_CMD_SC_Rx_FPGA_CMD_DAQ_Count_Reset_o : std_logic;
  signal pkt_FPGA_CMD_SC_Rx_FPGA_CMD_AD_On_o : std_logic;
  signal pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Gain_Mode_o : std_logic;
  signal pkt_FPGA_CMD_SC_Rx_FPGA_CMD_BPF_On_Off_o : std_logic;
  signal pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Pass_Active_o : std_logic;
  signal pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Reset_o : std_logic;
  signal pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Stop_Run_o : std_logic;
  signal pkt_FPGA_CMD_SC_Rx_FPGA_CMD_REC_On_Off_o : std_logic;
  signal pkt_FPGA_CMD_SC_Rx_FPGA_CMD_PLC_Mode_o : std_logic_vector(1 downto 0);
  signal pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Data_Path_o : std_logic;
  signal pkt_FPGA_CMD_SC_Rx_FPGA_CMD_ReservedBit04_o : std_logic;
  signal pkt_FPGA_CMD_SC_Rx_FPGA_CMD_ReservedBit05_o : std_logic;
  signal pkt_FPGA_CMD_SC_Rx_FPGA_CMD_ReservedBit06_o : std_logic;
  signal pkt_FPGA_CMD_SC_Rx_FPGA_CMD_ReservedBit07_o : std_logic;
  signal pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Gain_o : std_logic_vector(7 downto 0);
  signal pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Reserved_o : std_logic_vector(31 downto 0);
  --  end record;  --  SC_Rx_FPGA_CMD_8_Type
  --  
  --  --
  --  type FPGA_CMD_36_Type is record
  signal pkt_FPGA_CMD_Reserved_0_o : std_logic_vector(31 downto 0);
  --  bitvector(191 downto 128)
  --  bitvector(319 downto 192)
  --  bitvector(335 downto 320)
  signal pkt_FPGA_CMD_Reserved_1_o : std_logic_vector(47 downto 0);
  --  end record;  --  FPGA_CMD_36_Type
  --  
  --  SCB2SPB_Pkt_300_Type
  --  type SCB2SPB_Pkt_300_Type is record
  signal pkt_Start_Bytes_o : std_logic_vector(31 downto 0);
  signal pkt_Count_o : std_logic_vector(31 downto 0);
  signal pkt_Command_o : std_logic_vector(15 downto 0);
  signal pkt_ACK_o : std_logic_vector(15 downto 0);
  --  bitvector(383 downto 96)
  --  bitvector(831 downto 384)
  --  bitvector(1151 downto 832)
  --  bitvector(2367 downto 1152)
  signal pkt_Checksum_o : std_logic_vector(15 downto 0);
  signal pkt_Stop_Bytes_o : std_logic_vector(15 downto 0);
  --  end record;  --  SCB2SPB_Pkt_300_Type

  signal pkt_Data_CH_Data_1_o : std_logic_vector(31 downto 0);
  signal pkt_Data_CH_Data_2_o : std_logic_vector(31 downto 0);
  signal pkt_Data_CH_Data_3_o : std_logic_vector(31 downto 0);
  signal pkt_Data_CH_Data_4_o : std_logic_vector(31 downto 0);
  signal pkt_Data_CH_Data_5_o : std_logic_vector(31 downto 0);
  signal pkt_Data_CH_Data_6_o : std_logic_vector(31 downto 0);
  signal pkt_Data_CH_Data_7_o : std_logic_vector(31 downto 0);
  signal pkt_Data_CH_Data_8_o : std_logic_vector(31 downto 0);
  signal pkt_Data_CH_Data_9_o : std_logic_vector(31 downto 0);
  signal pkt_Data_CH_Data_10_o : std_logic_vector(31 downto 0);
  signal pkt_Data_CH_Data_11_o : std_logic_vector(31 downto 0);
  signal pkt_Data_CH_Data_12_o : std_logic_vector(31 downto 0);
  signal pkt_Data_CH_Data_13_o : std_logic_vector(31 downto 0);
  signal pkt_Data_CH_Data_14_o : std_logic_vector(31 downto 0);
  signal pkt_Data_CH_Data_15_o : std_logic_vector(31 downto 0);
  signal pkt_Data_CH_Data_16_o : std_logic_vector(31 downto 0);
  signal pkt_Data_CH_Data_17_o : std_logic_vector(31 downto 0);
  signal pkt_Data_CH_Data_18_o : std_logic_vector(31 downto 0);
  signal pkt_Data_CH_Data_19_o : std_logic_vector(31 downto 0);
  signal pkt_Data_CH_Data_20_o : std_logic_vector(31 downto 0);
  signal pkt_Data_CH_Data_21_o : std_logic_vector(31 downto 0);
  signal pkt_Data_CH_Data_22_o : std_logic_vector(31 downto 0);
  signal pkt_Data_CH_Data_23_o : std_logic_vector(31 downto 0);
  signal pkt_Data_CH_Data_24_o : std_logic_vector(31 downto 0);
  signal pkt_Data_CH_Data_25_o : std_logic_vector(31 downto 0);
  signal pkt_Data_CH_Data_26_o : std_logic_vector(31 downto 0);
  signal pkt_Data_CH_Data_27_o : std_logic_vector(31 downto 0);
  signal pkt_Data_CH_Data_28_o : std_logic_vector(31 downto 0);
  signal pkt_Data_CH_Data_29_o : std_logic_vector(31 downto 0);
  signal pkt_Data_CH_Data_30_o : std_logic_vector(31 downto 0);
  signal pkt_Data_CH_Data_31_o : std_logic_vector(31 downto 0);
  signal pkt_Data_CH_Data_32_o : std_logic_vector(31 downto 0);
  signal pkt_Data_CH_Data_33_o : std_logic_vector(31 downto 0);
  signal pkt_Data_CH_Data_34_o : std_logic_vector(31 downto 0);
  signal pkt_Data_CH_Data_35_o : std_logic_vector(31 downto 0);
  signal pkt_Data_CH_Data_36_o : std_logic_vector(31 downto 0);
  signal pkt_Data_CH_Data_37_o : std_logic_vector(31 downto 0);

  signal bitvector_o : std_logic_vector(2399 downto 0);

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
    BS_MCLK => 50,
    RESET_NS_MAX => 500
  )
  port map(
    --    
    reset_n => reset_n,
    Clk => clk_50M
    --    
  );
  --
  bs_5usec_0 : bs_5usec
  generic map(
    BS_MCLK => 50
  )
  port map(
    --    
    tpulse_5us => tpulse_5us,
    Clk => clk_50M
    --    
  );
  --
  bs_scb_record_gen_0 : bs_scb_record_gen
  generic map(
    ADDRESS_MAX => 300,
    ADDRESS_WIDTH => 9,
    RECORD_ID => X"3161",
    DATA_WIDTH => 32
  )
  port map(
    --    
    m_axis_tvalid => m_axis_tvalid_bs_scb_record_gen_0,
    m_axis_tready => '1',
    m_axis_tlast => m_axis_tlast_bs_scb_record_gen_0,
    m_axis_tkeep => m_axis_tkeep_bs_scb_record_gen_0,
    m_axis_tdata => m_axis_tdata_bs_scb_record_gen_0,

    m_record_data => m_record_data_bs_scb_record_gen_0,

    s_tstart => tpulse_5us,

    reset_2_n => reset_n,
    reset_1_n => reset_n,
    Clk => clk_50M
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
    s_axis_bs_aurora_ram_tvalid => m_axis_tvalid_bs_scb_record_gen_0,
    s_axis_bs_aurora_ram_tlast => m_axis_tlast_bs_scb_record_gen_0,
    s_axis_bs_aurora_ram_tkeep => m_axis_tkeep_bs_scb_record_gen_0,
    s_axis_bs_aurora_ram_tdata => m_axis_tdata_bs_scb_record_gen_0,

    ila_data => ila_data_bs_ila_debug_0,

    reset_n => reset_n,
    Clk => clk_50M
    --    
  );
  --
  bs_scb_data_record_pin_0 : bs_scb_data_record_pin
  port map(
    --    
    --   
    --  type Data_152_Type is record
    -- bitvector(2335 downto 1152)
    pkt_Data_Reserved => pkt_Data_Reserved_o,
    --  end record;  --  Data_152_Type
    --  
    --  --
    --  type Trigger_State_1_Type is record
    pkt_FPGA_State_Trigger_State_TE_TX_TRIG => pkt_FPGA_State_Trigger_State_TE_TX_TRIG_o,
    pkt_FPGA_State_Trigger_State_TE_RX_TRIG => pkt_FPGA_State_Trigger_State_TE_RX_TRIG_o,
    pkt_FPGA_State_Trigger_State_TX_TRIG => pkt_FPGA_State_Trigger_State_TX_TRIG_o,
    pkt_FPGA_State_Trigger_State_TX_P_GATE => pkt_FPGA_State_Trigger_State_TX_P_GATE_o,
    pkt_FPGA_State_Trigger_State_ReservedBit04 => pkt_FPGA_State_Trigger_State_ReservedBit04_o,
    pkt_FPGA_State_Trigger_State_ReservedBit05 => pkt_FPGA_State_Trigger_State_ReservedBit05_o,
    pkt_FPGA_State_Trigger_State_ReservedBit06 => pkt_FPGA_State_Trigger_State_ReservedBit06_o,
    pkt_FPGA_State_Trigger_State_ReservedBit07 => pkt_FPGA_State_Trigger_State_ReservedBit07_o,
    --  end record;  --  Trigger_State_1_Type
    --  
    --  --
    --  type SP_Zynq_SelfTest_Result_2_Type is record
    pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit00 => pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit00_o,
    pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit01 => pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit01_o,
    pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit02 => pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit02_o,
    pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit03 => pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit03_o,
    pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit04 => pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit04_o,
    pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit05 => pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit05_o,
    pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit06 => pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit06_o,
    pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit07 => pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit07_o,
    pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit10 => pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit10_o,
    pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit11 => pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit11_o,
    pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit12 => pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit12_o,
    pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit13 => pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit13_o,
    pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit14 => pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit14_o,
    pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit15 => pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit15_o,
    pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit16 => pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit16_o,
    pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit17 => pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit17_o,
    --  end record;  --  SP_Zynq_SelfTest_Result_2_Type
    --  
    --  --
    --  type PA_FPGA_SelfTest_Result_2_Type is record
    pkt_FPGA_State_PA_FPGA_SelfTest_Result_PCM_Boot => pkt_FPGA_State_PA_FPGA_SelfTest_Result_PCM_Boot_o,
    pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM1_Boot => pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM1_Boot_o,
    pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM2_Boot => pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM2_Boot_o,
    pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM3_Boot => pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM3_Boot_o,
    pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM4_Boot => pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM4_Boot_o,
    pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM5_Boot => pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM5_Boot_o,
    pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM6_Boot => pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM6_Boot_o,
    pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM7_Boot => pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM7_Boot_o,
    pkt_FPGA_State_PA_FPGA_SelfTest_Result_CMD_DATA_ERR => pkt_FPGA_State_PA_FPGA_SelfTest_Result_CMD_DATA_ERR_o,
    pkt_FPGA_State_PA_FPGA_SelfTest_Result_Temp_warn => pkt_FPGA_State_PA_FPGA_SelfTest_Result_Temp_warn_o,
    pkt_FPGA_State_PA_FPGA_SelfTest_Result_ReservedBit02 => pkt_FPGA_State_PA_FPGA_SelfTest_Result_ReservedBit02_o,
    pkt_FPGA_State_PA_FPGA_SelfTest_Result_ReservedBit03 => pkt_FPGA_State_PA_FPGA_SelfTest_Result_ReservedBit03_o,
    pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAB_ST_RESULT => pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAB_ST_RESULT_o,
    pkt_FPGA_State_PA_FPGA_SelfTest_Result_ReservedBit05 => pkt_FPGA_State_PA_FPGA_SelfTest_Result_ReservedBit05_o,
    pkt_FPGA_State_PA_FPGA_SelfTest_Result_ReservedBit06 => pkt_FPGA_State_PA_FPGA_SelfTest_Result_ReservedBit06_o,
    pkt_FPGA_State_PA_FPGA_SelfTest_Result_ReservedBit07 => pkt_FPGA_State_PA_FPGA_SelfTest_Result_ReservedBit07_o,
    --  end record;  --  PA_FPGA_SelfTest_Result_2_Type
    --  
    --  --
    --  type SC_FPGA_SelfTest_Result_2_Type is record
    pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_MEM => pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_MEM_o,
    pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit01 => pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit01_o,
    pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit02 => pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit02_o,
    pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit03 => pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit03_o,
    pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_FPGA => pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_FPGA_o,
    pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit05 => pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit05_o,
    pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit06 => pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit06_o,
    pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit07 => pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit07_o,
    pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_GTP => pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_GTP_o,
    pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_LVDS => pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_LVDS_o,
    pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_UART => pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_UART_o,
    pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit13 => pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit13_o,
    pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit14 => pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit14_o,
    pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit15 => pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit15_o,
    pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit16 => pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit16_o,
    pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit17 => pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit17_o,
    --  end record;  --  SC_FPGA_SelfTest_Result_2_Type
    --  
    --  --
    --  type FPGA_Zynq_Control_1_Type is record
    pkt_FPGA_State_FPGA_Zynq_Control_PLC_State => pkt_FPGA_State_FPGA_Zynq_Control_PLC_State_o,
    pkt_FPGA_State_FPGA_Zynq_Control_DAQ_Count_Reset => pkt_FPGA_State_FPGA_Zynq_Control_DAQ_Count_Reset_o,
    pkt_FPGA_State_FPGA_Zynq_Control_AD_On_Result => pkt_FPGA_State_FPGA_Zynq_Control_AD_On_Result_o,
    pkt_FPGA_State_FPGA_Zynq_Control_ReservedBit03 => pkt_FPGA_State_FPGA_Zynq_Control_ReservedBit03_o,
    pkt_FPGA_State_FPGA_Zynq_Control_ReservedBit04 => pkt_FPGA_State_FPGA_Zynq_Control_ReservedBit04_o,
    pkt_FPGA_State_FPGA_Zynq_Control_SC_FPGA_Reset => pkt_FPGA_State_FPGA_Zynq_Control_SC_FPGA_Reset_o,
    pkt_FPGA_State_FPGA_Zynq_Control_PA_FPGA_Reset => pkt_FPGA_State_FPGA_Zynq_Control_PA_FPGA_Reset_o,
    pkt_FPGA_State_FPGA_Zynq_Control_Ping_On_Off => pkt_FPGA_State_FPGA_Zynq_Control_Ping_On_Off_o,
    --  end record;  --  FPGA_Zynq_Control_1_Type
    --  
    --  --
    --  type FPGA_State_40_Type is record
    pkt_FPGA_State_DAQCounter => pkt_FPGA_State_DAQCounter_o,
    pkt_FPGA_State_SC_GainValue => pkt_FPGA_State_SC_GainValue_o,
    -- bitvector(879 downto 872)
    pkt_FPGA_State_PA_FPGA_Temperature => pkt_FPGA_State_PA_FPGA_Temperature_o,
    pkt_FPGA_State_SC_FPGA_Temperature => pkt_FPGA_State_SC_FPGA_Temperature_o,
    pkt_FPGA_State_SP_AH_Zynq_Temperature => pkt_FPGA_State_SP_AH_Zynq_Temperature_o,
    pkt_FPGA_State_SP_P1_Zynq_Temperature => pkt_FPGA_State_SP_P1_Zynq_Temperature_o,
    pkt_FPGA_State_SP_P2_Zynq_Temperature => pkt_FPGA_State_SP_P2_Zynq_Temperature_o,
    pkt_FPGA_State_SC2SP_GTP_ERR => pkt_FPGA_State_SC2SP_GTP_ERR_o,
    pkt_FPGA_State_AH2P1_GTP_ERR => pkt_FPGA_State_AH2P1_GTP_ERR_o,
    pkt_FPGA_State_AH2P2_GTP_ERR => pkt_FPGA_State_AH2P2_GTP_ERR_o,
    pkt_FPGA_State_P12AH_GTP_ERR => pkt_FPGA_State_P12AH_GTP_ERR_o,
    pkt_FPGA_State_P22AH_GTP_ERR => pkt_FPGA_State_P22AH_GTP_ERR_o,
    -- bitvector(975 downto 960)
    -- bitvector(991 downto 976)
    -- bitvector(1007 downto 992)
    pkt_FPGA_State_TX_Voltage_Sample1 => pkt_FPGA_State_TX_Voltage_Sample1_o,
    pkt_FPGA_State_TX_Voltage_Sample2 => pkt_FPGA_State_TX_Voltage_Sample2_o,
    pkt_FPGA_State_TX_DC_Voltage_Sample1 => pkt_FPGA_State_TX_DC_Voltage_Sample1_o,
    pkt_FPGA_State_TX_DC_Voltage_Sample2 => pkt_FPGA_State_TX_DC_Voltage_Sample2_o,
    pkt_FPGA_State_TX_DC_Current_Sample1 => pkt_FPGA_State_TX_DC_Current_Sample1_o,
    pkt_FPGA_State_TX_DC_Current_Sample2 => pkt_FPGA_State_TX_DC_Current_Sample2_o,
    -- bitvector(1111 downto 1104)
    pkt_FPGA_State_Reserved_9 => pkt_FPGA_State_Reserved_9_o,
    --  end record;  --  FPGA_State_40_Type
    --  
    --  --
    --  type GC_Event_4_2_Type is record
    pkt_GC_INFO_GC_Event_4_Enable => pkt_GC_INFO_GC_Event_4_Enable_o,
    pkt_GC_INFO_GC_Event_4_Detect => pkt_GC_INFO_GC_Event_4_Detect_o,
    pkt_GC_INFO_GC_Event_4_Closein => pkt_GC_INFO_GC_Event_4_Closein_o,
    pkt_GC_INFO_GC_Event_4_Fail => pkt_GC_INFO_GC_Event_4_Fail_o,
    pkt_GC_INFO_GC_Event_4_ESAD_Chk => pkt_GC_INFO_GC_Event_4_ESAD_Chk_o,
    pkt_GC_INFO_GC_Event_4_ESAD_HV => pkt_GC_INFO_GC_Event_4_ESAD_HV_o,
    pkt_GC_INFO_GC_Event_4_ESAD_Power => pkt_GC_INFO_GC_Event_4_ESAD_Power_o,
    pkt_GC_INFO_GC_Event_4_ReservedBit07 => pkt_GC_INFO_GC_Event_4_ReservedBit07_o,
    pkt_GC_INFO_GC_Event_4_ReservedBit08 => pkt_GC_INFO_GC_Event_4_ReservedBit08_o,
    pkt_GC_INFO_GC_Event_4_ReservedBit09 => pkt_GC_INFO_GC_Event_4_ReservedBit09_o,
    pkt_GC_INFO_GC_Event_4_ReservedBit10 => pkt_GC_INFO_GC_Event_4_ReservedBit10_o,
    pkt_GC_INFO_GC_Event_4_ReservedBit11 => pkt_GC_INFO_GC_Event_4_ReservedBit11_o,
    pkt_GC_INFO_GC_Event_4_Leakage_Det => pkt_GC_INFO_GC_Event_4_Leakage_Det_o,
    pkt_GC_INFO_GC_Event_4_ReservedBit13 => pkt_GC_INFO_GC_Event_4_ReservedBit13_o,
    pkt_GC_INFO_GC_Event_4_ReservedBit14 => pkt_GC_INFO_GC_Event_4_ReservedBit14_o,
    pkt_GC_INFO_GC_Event_4_M_Stop => pkt_GC_INFO_GC_Event_4_M_Stop_o,
    --  end record;  --  GC_Event_4_2_Type
    --  
    --  --
    --  type GC_Event_3_2_Type is record
    pkt_GC_INFO_GC_Event_3_Beam_Steering => pkt_GC_INFO_GC_Event_3_Beam_Steering_o,
    pkt_GC_INFO_GC_Event_3_ReservedBit04 => pkt_GC_INFO_GC_Event_3_ReservedBit04_o,
    pkt_GC_INFO_GC_Event_3_ReservedBit05 => pkt_GC_INFO_GC_Event_3_ReservedBit05_o,
    pkt_GC_INFO_GC_Event_3_ReservedBit06 => pkt_GC_INFO_GC_Event_3_ReservedBit06_o,
    pkt_GC_INFO_GC_Event_3_ReservedBit07 => pkt_GC_INFO_GC_Event_3_ReservedBit07_o,
    pkt_GC_INFO_GC_Event_3_ReservedBit08 => pkt_GC_INFO_GC_Event_3_ReservedBit08_o,
    pkt_GC_INFO_GC_Event_3_ReservedBit09 => pkt_GC_INFO_GC_Event_3_ReservedBit09_o,
    pkt_GC_INFO_GC_Event_3_ReservedBit10 => pkt_GC_INFO_GC_Event_3_ReservedBit10_o,
    pkt_GC_INFO_GC_Event_3_ReservedBit11 => pkt_GC_INFO_GC_Event_3_ReservedBit11_o,
    pkt_GC_INFO_GC_Event_3_ReservedBit12 => pkt_GC_INFO_GC_Event_3_ReservedBit12_o,
    pkt_GC_INFO_GC_Event_3_ReservedBit13 => pkt_GC_INFO_GC_Event_3_ReservedBit13_o,
    pkt_GC_INFO_GC_Event_3_ReservedBit14 => pkt_GC_INFO_GC_Event_3_ReservedBit14_o,
    pkt_GC_INFO_GC_Event_3_ReservedBit15 => pkt_GC_INFO_GC_Event_3_ReservedBit15_o,
    --  end record;  --  GC_Event_3_2_Type
    --  
    --  --
    --  type GC_Event_2_2_Type is record
    pkt_GC_INFO_GC_Event_2_Pre_Enable => pkt_GC_INFO_GC_Event_2_Pre_Enable_o,
    pkt_GC_INFO_GC_Event_2_Enable => pkt_GC_INFO_GC_Event_2_Enable_o,
    pkt_GC_INFO_GC_Event_2_V_Target => pkt_GC_INFO_GC_Event_2_V_Target_o,
    pkt_GC_INFO_GC_Event_2_Speed_Mode1 => pkt_GC_INFO_GC_Event_2_Speed_Mode1_o,
    pkt_GC_INFO_GC_Event_2_Speed_Mode2 => pkt_GC_INFO_GC_Event_2_Speed_Mode2_o,
    pkt_GC_INFO_GC_Event_2_Homming_Enable => pkt_GC_INFO_GC_Event_2_Homming_Enable_o,
    pkt_GC_INFO_GC_Event_2_Homming_Mode => pkt_GC_INFO_GC_Event_2_Homming_Mode_o,
    pkt_GC_INFO_GC_Event_2_Inhibit => pkt_GC_INFO_GC_Event_2_Inhibit_o,
    pkt_GC_INFO_GC_Event_2_Hold_In => pkt_GC_INFO_GC_Event_2_Hold_In_o,
    pkt_GC_INFO_GC_Event_2_Target_Det => pkt_GC_INFO_GC_Event_2_Target_Det_o,
    pkt_GC_INFO_GC_Event_2_Target_Loss => pkt_GC_INFO_GC_Event_2_Target_Loss_o,
    pkt_GC_INFO_GC_Event_2_ACM_Det => pkt_GC_INFO_GC_Event_2_ACM_Det_o,
    pkt_GC_INFO_GC_Event_2_Pre_ACO_Chk => pkt_GC_INFO_GC_Event_2_Pre_ACO_Chk_o,
    pkt_GC_INFO_GC_Event_2_ACO_Det => pkt_GC_INFO_GC_Event_2_ACO_Det_o,
    pkt_GC_INFO_GC_Event_2_ReservedBit14 => pkt_GC_INFO_GC_Event_2_ReservedBit14_o,
    pkt_GC_INFO_GC_Event_2_ReservedBit15 => pkt_GC_INFO_GC_Event_2_ReservedBit15_o,
    --  end record;  --  GC_Event_2_2_Type
    --  
    --  --
    --  type GC_Event_1_2_Type is record
    pkt_GC_INFO_GC_Event_1_ReservedBit00 => pkt_GC_INFO_GC_Event_1_ReservedBit00_o,
    pkt_GC_INFO_GC_Event_1_HILS_Mode => pkt_GC_INFO_GC_Event_1_HILS_Mode_o,
    pkt_GC_INFO_GC_Event_1_EXHD_Mode => pkt_GC_INFO_GC_Event_1_EXHD_Mode_o,
    pkt_GC_INFO_GC_Event_1_C_Range => pkt_GC_INFO_GC_Event_1_C_Range_o,
    pkt_GC_INFO_GC_Event_1_E_Range => pkt_GC_INFO_GC_Event_1_E_Range_o,
    pkt_GC_INFO_GC_Event_1_ReservedBit05 => pkt_GC_INFO_GC_Event_1_ReservedBit05_o,
    pkt_GC_INFO_GC_Event_1_Close_In => pkt_GC_INFO_GC_Event_1_Close_In_o,
    pkt_GC_INFO_GC_Event_1_Terminal_Homing => pkt_GC_INFO_GC_Event_1_Terminal_Homing_o,
    pkt_GC_INFO_GC_Event_1_Fire => pkt_GC_INFO_GC_Event_1_Fire_o,
    pkt_GC_INFO_GC_Event_1_EOM => pkt_GC_INFO_GC_Event_1_EOM_o,
    pkt_GC_INFO_GC_Event_1_Motor_Start => pkt_GC_INFO_GC_Event_1_Motor_Start_o,
    pkt_GC_INFO_GC_Event_1_Motor_Stop => pkt_GC_INFO_GC_Event_1_Motor_Stop_o,
    pkt_GC_INFO_GC_Event_1_Ceiling_Det => pkt_GC_INFO_GC_Event_1_Ceiling_Det_o,
    pkt_GC_INFO_GC_Event_1_Floor_Det => pkt_GC_INFO_GC_Event_1_Floor_Det_o,
    pkt_GC_INFO_GC_Event_1_Surface_Det => pkt_GC_INFO_GC_Event_1_Surface_Det_o,
    pkt_GC_INFO_GC_Event_1_EOR => pkt_GC_INFO_GC_Event_1_EOR_o,
    --  end record;  --  GC_Event_1_2_Type
    --  
    --  --
    --  type GC_Command_2_Type is record
    pkt_GC_INFO_GC_Command_PLC => pkt_GC_INFO_GC_Command_PLC_o,
    pkt_GC_INFO_GC_Command_AD_On => pkt_GC_INFO_GC_Command_AD_On_o,
    pkt_GC_INFO_GC_Command_ReservedBit02 => pkt_GC_INFO_GC_Command_ReservedBit02_o,
    pkt_GC_INFO_GC_Command_ReservedBit03 => pkt_GC_INFO_GC_Command_ReservedBit03_o,
    pkt_GC_INFO_GC_Command_Pre_Enable => pkt_GC_INFO_GC_Command_Pre_Enable_o,
    pkt_GC_INFO_GC_Command_Enable => pkt_GC_INFO_GC_Command_Enable_o,
    pkt_GC_INFO_GC_Command_ReservedBit06 => pkt_GC_INFO_GC_Command_ReservedBit06_o,
    pkt_GC_INFO_GC_Command_ReservedBit07 => pkt_GC_INFO_GC_Command_ReservedBit07_o,
    pkt_GC_INFO_GC_Command_Salvo_On => pkt_GC_INFO_GC_Command_Salvo_On_o,
    pkt_GC_INFO_GC_Command_Band_Sel => pkt_GC_INFO_GC_Command_Band_Sel_o,
    pkt_GC_INFO_GC_Command_Mode_Set => pkt_GC_INFO_GC_Command_Mode_Set_o,
    pkt_GC_INFO_GC_Command_PRI_Start => pkt_GC_INFO_GC_Command_PRI_Start_o,
    pkt_GC_INFO_GC_Command_Test_Mode_Set => pkt_GC_INFO_GC_Command_Test_Mode_Set_o,
    pkt_GC_INFO_GC_Command_REC_Disable_Set => pkt_GC_INFO_GC_Command_REC_Disable_Set_o,
    pkt_GC_INFO_GC_Command_Test_Trig => pkt_GC_INFO_GC_Command_Test_Trig_o,
    pkt_GC_INFO_GC_Command_ReservedBit15 => pkt_GC_INFO_GC_Command_ReservedBit15_o,
    --  end record;  --  GC_Command_2_Type
    --  
    --  --
    --  type GC_INFO_56_Type is record
    pkt_GC_INFO_GC_Count => pkt_GC_INFO_GC_Count_o,
    -- bitvector(431 downto 416)
    pkt_GC_INFO_Reserved_0 => pkt_GC_INFO_Reserved_0_o,
    -- bitvector(463 downto 448)
    -- bitvector(479 downto 464)
    -- bitvector(495 downto 480)
    -- bitvector(511 downto 496)
    pkt_GC_INFO_Speed_Mode => pkt_GC_INFO_Speed_Mode_o,
    pkt_GC_INFO_Search_Pattern => pkt_GC_INFO_Search_Pattern_o,
    pkt_GC_INFO_Pulse_Freq => pkt_GC_INFO_Pulse_Freq_o,
    pkt_GC_INFO_Pulse_Type => pkt_GC_INFO_Pulse_Type_o,
    pkt_GC_INFO_Pulse_Length => pkt_GC_INFO_Pulse_Length_o,
    pkt_GC_INFO_PRE_Pulse => pkt_GC_INFO_PRE_Pulse_o,
    pkt_GC_INFO_PRI => pkt_GC_INFO_PRI_o,
    pkt_GC_INFO_Beam_Steering => pkt_GC_INFO_Beam_Steering_o,
    pkt_GC_INFO_BAT_VOLT => pkt_GC_INFO_BAT_VOLT_o,
    pkt_GC_INFO_Reserved_1 => pkt_GC_INFO_Reserved_1_o,
    pkt_GC_INFO_TORP_N => pkt_GC_INFO_TORP_N_o,
    pkt_GC_INFO_TORP_E => pkt_GC_INFO_TORP_E_o,
    pkt_GC_INFO_TORP_D => pkt_GC_INFO_TORP_D_o,
    pkt_GC_INFO_TORP_Roll => pkt_GC_INFO_TORP_Roll_o,
    pkt_GC_INFO_TORP_Pitch => pkt_GC_INFO_TORP_Pitch_o,
    pkt_GC_INFO_TORP_Yaw => pkt_GC_INFO_TORP_Yaw_o,
    pkt_GC_INFO_ACT_On_Off => pkt_GC_INFO_ACT_On_Off_o,
    pkt_GC_INFO_Reserved_2 => pkt_GC_INFO_Reserved_2_o,
    --  end record;  --  GC_INFO_56_Type
    --  
    --  --
    --  type Save_Beam_INFO_2_Type is record
    pkt_FPGA_CMD_Save_Beam_INFO_Save_R3 => pkt_FPGA_CMD_Save_Beam_INFO_Save_R3_o,
    pkt_FPGA_CMD_Save_Beam_INFO_Save_R2 => pkt_FPGA_CMD_Save_Beam_INFO_Save_R2_o,
    pkt_FPGA_CMD_Save_Beam_INFO_Save_R1 => pkt_FPGA_CMD_Save_Beam_INFO_Save_R1_o,
    pkt_FPGA_CMD_Save_Beam_INFO_Save_R0 => pkt_FPGA_CMD_Save_Beam_INFO_Save_R0_o,
    pkt_FPGA_CMD_Save_Beam_INFO_Save_C => pkt_FPGA_CMD_Save_Beam_INFO_Save_C_o,
    pkt_FPGA_CMD_Save_Beam_INFO_Save_L0 => pkt_FPGA_CMD_Save_Beam_INFO_Save_L0_o,
    pkt_FPGA_CMD_Save_Beam_INFO_Save_L1 => pkt_FPGA_CMD_Save_Beam_INFO_Save_L1_o,
    pkt_FPGA_CMD_Save_Beam_INFO_Save_L2 => pkt_FPGA_CMD_Save_Beam_INFO_Save_L2_o,
    pkt_FPGA_CMD_Save_Beam_INFO_Optic_On => pkt_FPGA_CMD_Save_Beam_INFO_Optic_On_o,
    pkt_FPGA_CMD_Save_Beam_INFO_Ethernet_On => pkt_FPGA_CMD_Save_Beam_INFO_Ethernet_On_o,
    pkt_FPGA_CMD_Save_Beam_INFO_TE_Data_Input => pkt_FPGA_CMD_Save_Beam_INFO_TE_Data_Input_o,
    pkt_FPGA_CMD_Save_Beam_INFO_ReservedBit04 => pkt_FPGA_CMD_Save_Beam_INFO_ReservedBit04_o,
    pkt_FPGA_CMD_Save_Beam_INFO_ReservedBit05 => pkt_FPGA_CMD_Save_Beam_INFO_ReservedBit05_o,
    pkt_FPGA_CMD_Save_Beam_INFO_ReservedBit06 => pkt_FPGA_CMD_Save_Beam_INFO_ReservedBit06_o,
    pkt_FPGA_CMD_Save_Beam_INFO_Save_L3 => pkt_FPGA_CMD_Save_Beam_INFO_Save_L3_o,
    --  end record;  --  Save_Beam_INFO_2_Type
    --  
    --  --
    --  type PA_Tx_FPGA_CMD_16_Type is record
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_PRI => pkt_FPGA_CMD_PA_Tx_FPGA_CMD_PRI_o,
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx_Reset => pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx_Reset_o,
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx_Trigger => pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx_Trigger_o,
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx_Pulse_Interval => pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx_Pulse_Interval_o,
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Number_of_Tx => pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Number_of_Tx_o,
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Beam_Steering_Angle => pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Beam_Steering_Angle_o,
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx1_Pulse_Length => pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx1_Pulse_Length_o,
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx1_Type => pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx1_Type_o,
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx1_Start_Frequency => pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx1_Start_Frequency_o,
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_ReservedBit07_1 => pkt_FPGA_CMD_PA_Tx_FPGA_CMD_ReservedBit07_1_o,
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx1_Sweep_Frequency => pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx1_Sweep_Frequency_o,
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx2_Pulse_Length => pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx2_Pulse_Length_o,
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx2_Type => pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx2_Type_o,
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx2_Start_Frequency => pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx2_Start_Frequency_o,
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_ReservedBit07_2 => pkt_FPGA_CMD_PA_Tx_FPGA_CMD_ReservedBit07_2_o,
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx2_Sweep_Frequency => pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx2_Sweep_Frequency_o,
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Beam_Weighting_Select => pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Beam_Weighting_Select_o,
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Ramping_Time => pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Ramping_Time_o,
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Battery_Voltage => pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Battery_Voltage_o,
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Stave_Selection_Number => pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Stave_Selection_Number_o,
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Reserved_1 => pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Reserved_1_o,
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Reserved_2 => pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Reserved_2_o,
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Test_Mode => pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Test_Mode_o,
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Stave_Tx_Mode => pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Stave_Tx_Mode_o,
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Stave_Weight => pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Stave_Weight_o,
    --  end record;  --  PA_Tx_FPGA_CMD_16_Type
    --  
    --  --
    --  type SC_Rx_FPGA_CMD_8_Type is record
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_TVG => pkt_FPGA_CMD_SC_Rx_FPGA_CMD_TVG_o,
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_REC_Mode => pkt_FPGA_CMD_SC_Rx_FPGA_CMD_REC_Mode_o,
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_ReservedBit06_0 => pkt_FPGA_CMD_SC_Rx_FPGA_CMD_ReservedBit06_0_o,
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_ReservedBit07_0 => pkt_FPGA_CMD_SC_Rx_FPGA_CMD_ReservedBit07_0_o,
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_PLC => pkt_FPGA_CMD_SC_Rx_FPGA_CMD_PLC_o,
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_DAQ_Count_Reset => pkt_FPGA_CMD_SC_Rx_FPGA_CMD_DAQ_Count_Reset_o,
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_AD_On => pkt_FPGA_CMD_SC_Rx_FPGA_CMD_AD_On_o,
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Gain_Mode => pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Gain_Mode_o,
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_BPF_On_Off => pkt_FPGA_CMD_SC_Rx_FPGA_CMD_BPF_On_Off_o,
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Pass_Active => pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Pass_Active_o,
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Reset => pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Reset_o,
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Stop_Run => pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Stop_Run_o,
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_REC_On_Off => pkt_FPGA_CMD_SC_Rx_FPGA_CMD_REC_On_Off_o,
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_PLC_Mode => pkt_FPGA_CMD_SC_Rx_FPGA_CMD_PLC_Mode_o,
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Data_Path => pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Data_Path_o,
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_ReservedBit04 => pkt_FPGA_CMD_SC_Rx_FPGA_CMD_ReservedBit04_o,
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_ReservedBit05 => pkt_FPGA_CMD_SC_Rx_FPGA_CMD_ReservedBit05_o,
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_ReservedBit06 => pkt_FPGA_CMD_SC_Rx_FPGA_CMD_ReservedBit06_o,
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_ReservedBit07 => pkt_FPGA_CMD_SC_Rx_FPGA_CMD_ReservedBit07_o,
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Gain => pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Gain_o,
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Reserved => pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Reserved_o,
    --  end record;  --  SC_Rx_FPGA_CMD_8_Type
    --  
    --  --
    --  type FPGA_CMD_36_Type is record
    pkt_FPGA_CMD_Reserved_0 => pkt_FPGA_CMD_Reserved_0_o,
    -- bitvector(191 downto 128)
    -- bitvector(319 downto 192)
    -- bitvector(335 downto 320)
    pkt_FPGA_CMD_Reserved_1 => pkt_FPGA_CMD_Reserved_1_o,
    --  end record;  --  FPGA_CMD_36_Type
    --  
    --  SCB2SPB_Pkt_300_Type
    --  type SCB2SPB_Pkt_300_Type is record
    pkt_Start_Bytes => pkt_Start_Bytes_o,
    pkt_Count => pkt_Count_o,
    pkt_Command => pkt_Command_o,
    pkt_ACK => pkt_ACK_o,
    -- bitvector(383 downto 96)
    -- bitvector(831 downto 384)
    -- bitvector(1151 downto 832)
    -- bitvector(2367 downto 1152)
    pkt_Checksum => pkt_Checksum_o,
    pkt_Stop_Bytes => pkt_Stop_Bytes_o,
    --  end record;  --  SCB2SPB_Pkt_300_Type

    pkt_Data_CH_Data_1 => pkt_Data_CH_Data_1_o,
    pkt_Data_CH_Data_2 => pkt_Data_CH_Data_2_o,
    pkt_Data_CH_Data_3 => pkt_Data_CH_Data_3_o,
    pkt_Data_CH_Data_4 => pkt_Data_CH_Data_4_o,
    pkt_Data_CH_Data_5 => pkt_Data_CH_Data_5_o,
    pkt_Data_CH_Data_6 => pkt_Data_CH_Data_6_o,
    pkt_Data_CH_Data_7 => pkt_Data_CH_Data_7_o,
    pkt_Data_CH_Data_8 => pkt_Data_CH_Data_8_o,
    pkt_Data_CH_Data_9 => pkt_Data_CH_Data_9_o,
    pkt_Data_CH_Data_10 => pkt_Data_CH_Data_10_o,
    pkt_Data_CH_Data_11 => pkt_Data_CH_Data_11_o,
    pkt_Data_CH_Data_12 => pkt_Data_CH_Data_12_o,
    pkt_Data_CH_Data_13 => pkt_Data_CH_Data_13_o,
    pkt_Data_CH_Data_14 => pkt_Data_CH_Data_14_o,
    pkt_Data_CH_Data_15 => pkt_Data_CH_Data_15_o,
    pkt_Data_CH_Data_16 => pkt_Data_CH_Data_16_o,
    pkt_Data_CH_Data_17 => pkt_Data_CH_Data_17_o,
    pkt_Data_CH_Data_18 => pkt_Data_CH_Data_18_o,
    pkt_Data_CH_Data_19 => pkt_Data_CH_Data_19_o,
    pkt_Data_CH_Data_20 => pkt_Data_CH_Data_20_o,
    pkt_Data_CH_Data_21 => pkt_Data_CH_Data_21_o,
    pkt_Data_CH_Data_22 => pkt_Data_CH_Data_22_o,
    pkt_Data_CH_Data_23 => pkt_Data_CH_Data_23_o,
    pkt_Data_CH_Data_24 => pkt_Data_CH_Data_24_o,
    pkt_Data_CH_Data_25 => pkt_Data_CH_Data_25_o,
    pkt_Data_CH_Data_26 => pkt_Data_CH_Data_26_o,
    pkt_Data_CH_Data_27 => pkt_Data_CH_Data_27_o,
    pkt_Data_CH_Data_28 => pkt_Data_CH_Data_28_o,
    pkt_Data_CH_Data_29 => pkt_Data_CH_Data_29_o,
    pkt_Data_CH_Data_30 => pkt_Data_CH_Data_30_o,
    pkt_Data_CH_Data_31 => pkt_Data_CH_Data_31_o,
    pkt_Data_CH_Data_32 => pkt_Data_CH_Data_32_o,
    pkt_Data_CH_Data_33 => pkt_Data_CH_Data_33_o,
    pkt_Data_CH_Data_34 => pkt_Data_CH_Data_34_o,
    pkt_Data_CH_Data_35 => pkt_Data_CH_Data_35_o,
    pkt_Data_CH_Data_36 => pkt_Data_CH_Data_36_o,
    pkt_Data_CH_Data_37 => pkt_Data_CH_Data_37_o,

    bitvector => ila_data_bs_ila_debug_0

    --    
  );
  --
  --
  --

end architecture;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================