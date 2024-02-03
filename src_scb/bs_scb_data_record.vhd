-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
--
-- use work.SCB2SPB_Type.all; -- BS2_protocol_V0.56_20231121
-- signal Chan_Pkt : SCB2SPB_Pkt_300_Type;
-- signal Chan_Str : std_logic_vector(2399 downto 0) := (others => '0');
--
--
-- Chan_Str <= conv_ch_bitvector(Chan_Pkt);
-- Chan_Pkt <= conv_ch_packet(Chan_Str);
--
--
package SCB2SPB_Type is
  -- constant
  constant ADDRESS_WIDTH : natural := 7;
  constant DATA_WIDTH : natural := 32;
  constant C_DATA_ZERO : std_logic_vector(DATA_WIDTH - 1 downto 0) := (others => '0');
  constant C_CH_START : std_logic_vector(ADDRESS_WIDTH - 1 downto 0) := std_logic_vector(to_unsigned(36, ADDRESS_WIDTH)); -- X"24"; -- ch1 : 36 from 0
  constant C_CH_END : std_logic_vector(ADDRESS_WIDTH - 1 downto 0) := std_logic_vector(to_unsigned(72, ADDRESS_WIDTH)); -- X"48"; -- ch37 : 72 from 0
  constant C_CMD_END_N1 : std_logic_vector(ADDRESS_WIDTH - 1 downto 0) := std_logic_vector(to_unsigned(73, ADDRESS_WIDTH)); -- X"49"; -- 73 
  constant C_CMD_END : std_logic_vector(ADDRESS_WIDTH - 1 downto 0) := std_logic_vector(to_unsigned(74, ADDRESS_WIDTH)); -- X"4A"; -- 74 : from 0 , 300 byte / 4 = 75
  constant C_CMD_END_P1 : std_logic_vector(ADDRESS_WIDTH - 1 downto 0) := std_logic_vector(to_unsigned(75, ADDRESS_WIDTH)); -- X"4B"; -- 75
  --
  --
  --
  type CH_Data_148_Type is array (natural range 1 to 37) of std_logic_vector(31 downto 0);
  --
  --
  -- type CH_Data_148_Type is record
  --   1 : std_logic_vector(31 downto 0);
  --   2 : std_logic_vector(31 downto 0);
  --   others : std_logic_vector(31 downto 0);
  -- end record;  --  CH_Data_148_Type
  --
  --
  type Data_152_Type is record
    CH_Data : CH_Data_148_Type;
    Reserved : std_logic_vector(31 downto 0);
  end record; --  Data_152_Type
  --
  --
  type Trigger_State_1_Type is record
    TE_TX_TRIG : std_logic;
    TE_RX_TRIG : std_logic;
    TX_TRIG : std_logic;
    TX_P_GATE : std_logic;
    ReservedBit04 : std_logic;
    ReservedBit05 : std_logic;
    ReservedBit06 : std_logic;
    ReservedBit07 : std_logic;
  end record; --  Trigger_State_1_Type
  --
  --
  type SP_Zynq_SelfTest_Result_2_Type is record
    ReservedBit00 : std_logic;
    ReservedBit01 : std_logic;
    ReservedBit02 : std_logic;
    ReservedBit03 : std_logic;
    ReservedBit04 : std_logic;
    ReservedBit05 : std_logic;
    ReservedBit06 : std_logic;
    ReservedBit07 : std_logic;
    ReservedBit10 : std_logic;
    ReservedBit11 : std_logic;
    ReservedBit12 : std_logic;
    ReservedBit13 : std_logic;
    ReservedBit14 : std_logic;
    ReservedBit15 : std_logic;
    ReservedBit16 : std_logic;
    ReservedBit17 : std_logic;
  end record; --  SP_Zynq_SelfTest_Result_2_Type
  --
  --
  type PA_FPGA_SelfTest_Result_2_Type is record
    PCM_Boot : std_logic;
    PAM1_Boot : std_logic;
    PAM2_Boot : std_logic;
    PAM3_Boot : std_logic;
    PAM4_Boot : std_logic;
    PAM5_Boot : std_logic;
    PAM6_Boot : std_logic;
    PAM7_Boot : std_logic;
    CMD_DATA_ERR : std_logic;
    Temp_warn : std_logic;
    ReservedBit02 : std_logic;
    ReservedBit03 : std_logic;
    PAB_ST_RESULT : std_logic;
    ReservedBit05 : std_logic;
    ReservedBit06 : std_logic;
    ReservedBit07 : std_logic;
  end record; --  PA_FPGA_SelfTest_Result_2_Type
  --
  --
  type SC_FPGA_SelfTest_Result_2_Type is record
    SC_MEM : std_logic;
    ReservedBit01 : std_logic;
    ReservedBit02 : std_logic;
    ReservedBit03 : std_logic;
    SC_FPGA : std_logic;
    ReservedBit05 : std_logic;
    ReservedBit06 : std_logic;
    ReservedBit07 : std_logic;
    SC_GTP : std_logic;
    SC_LVDS : std_logic;
    SC_UART : std_logic;
    ReservedBit13 : std_logic;
    ReservedBit14 : std_logic;
    ReservedBit15 : std_logic;
    ReservedBit16 : std_logic;
    ReservedBit17 : std_logic;
  end record; --  SC_FPGA_SelfTest_Result_2_Type
  --
  --
  type FPGA_Zynq_Control_1_Type is record
    PLC_State : std_logic;
    DAQ_Count_Reset : std_logic;
    AD_On_Result : std_logic;
    ReservedBit03 : std_logic;
    ReservedBit04 : std_logic;
    SC_FPGA_Reset : std_logic;
    PA_FPGA_Reset : std_logic;
    Ping_On_Off : std_logic;
  end record; --  FPGA_Zynq_Control_1_Type
  --
  --
  type FPGA_State_40_Type is record
    DAQCounter : std_logic_vector(31 downto 0);
    SC_GainValue : std_logic_vector(7 downto 0);
    FPGA_Zynq_Control : FPGA_Zynq_Control_1_Type;
    PA_FPGA_Temperature : std_logic_vector(7 downto 0);
    SC_FPGA_Temperature : std_logic_vector(7 downto 0);
    SP_AH_Zynq_Temperature : std_logic_vector(7 downto 0);
    SP_P1_Zynq_Temperature : std_logic_vector(7 downto 0);
    SP_P2_Zynq_Temperature : std_logic_vector(7 downto 0);
    SC2SP_GTP_ERR : std_logic_vector(7 downto 0);
    AH2P1_GTP_ERR : std_logic_vector(7 downto 0);
    AH2P2_GTP_ERR : std_logic_vector(7 downto 0);
    P12AH_GTP_ERR : std_logic_vector(7 downto 0);
    P22AH_GTP_ERR : std_logic_vector(7 downto 0);
    SC_FPGA_SelfTest_Result : SC_FPGA_SelfTest_Result_2_Type;
    PA_FPGA_SelfTest_Result : PA_FPGA_SelfTest_Result_2_Type;
    SP_Zynq_SelfTest_Result : SP_Zynq_SelfTest_Result_2_Type;
    TX_Voltage_Sample1 : std_logic_vector(15 downto 0);
    TX_Voltage_Sample2 : std_logic_vector(15 downto 0);
    TX_DC_Voltage_Sample1 : std_logic_vector(15 downto 0);
    TX_DC_Voltage_Sample2 : std_logic_vector(15 downto 0);
    TX_DC_Current_Sample1 : std_logic_vector(15 downto 0);
    TX_DC_Current_Sample2 : std_logic_vector(15 downto 0);
    Trigger_State : Trigger_State_1_Type;
    Reserved_9 : std_logic_vector(39 downto 0);
  end record; --  FPGA_State_40_Type
  --
  --
  type GC_Event_4_2_Type is record
    Enable : std_logic;
    Detect : std_logic;
    Closein : std_logic;
    Fail : std_logic;
    ESAD_Chk : std_logic;
    ESAD_HV : std_logic;
    ESAD_Power : std_logic;
    ReservedBit07 : std_logic;
    ReservedBit08 : std_logic;
    ReservedBit09 : std_logic;
    ReservedBit10 : std_logic;
    ReservedBit11 : std_logic;
    Leakage_Det : std_logic;
    ReservedBit13 : std_logic;
    ReservedBit14 : std_logic;
    M_Stop : std_logic;
  end record; --  GC_Event_4_2_Type
  --
  --
  type GC_Event_3_2_Type is record
    Beam_Steering : std_logic_vector(3 downto 0);
    ReservedBit04 : std_logic;
    ReservedBit05 : std_logic;
    ReservedBit06 : std_logic;
    ReservedBit07 : std_logic;
    ReservedBit08 : std_logic;
    ReservedBit09 : std_logic;
    ReservedBit10 : std_logic;
    ReservedBit11 : std_logic;
    ReservedBit12 : std_logic;
    ReservedBit13 : std_logic;
    ReservedBit14 : std_logic;
    ReservedBit15 : std_logic;
  end record; --  GC_Event_3_2_Type
  --
  --
  type GC_Event_2_2_Type is record
    Pre_Enable : std_logic;
    Enable : std_logic;
    V_Target : std_logic;
    Speed_Mode1 : std_logic;
    Speed_Mode2 : std_logic;
    Homming_Enable : std_logic;
    Homming_Mode : std_logic;
    Inhibit : std_logic;
    Hold_In : std_logic;
    Target_Det : std_logic;
    Target_Loss : std_logic;
    ACM_Det : std_logic;
    Pre_ACO_Chk : std_logic;
    ACO_Det : std_logic;
    ReservedBit14 : std_logic;
    ReservedBit15 : std_logic;
  end record; --  GC_Event_2_2_Type
  --
  --
  type GC_Event_1_2_Type is record
    ReservedBit00 : std_logic;
    HILS_Mode : std_logic;
    EXHD_Mode : std_logic;
    C_Range : std_logic;
    E_Range : std_logic;
    ReservedBit05 : std_logic;
    Close_In : std_logic;
    Terminal_Homing : std_logic;
    Fire : std_logic;
    EOM : std_logic;
    Motor_Start : std_logic;
    Motor_Stop : std_logic;
    Ceiling_Det : std_logic;
    Floor_Det : std_logic;
    Surface_Det : std_logic;
    EOR : std_logic;
  end record; --  GC_Event_1_2_Type
  --
  --
  type GC_Command_2_Type is record
    PLC : std_logic;
    AD_On : std_logic;
    ReservedBit02 : std_logic;
    ReservedBit03 : std_logic;
    Pre_Enable : std_logic;
    Enable : std_logic;
    ReservedBit06 : std_logic;
    ReservedBit07 : std_logic;
    Salvo_On : std_logic;
    Band_Sel : std_logic;
    Mode_Set : std_logic;
    PRI_Start : std_logic;
    Test_Mode_Set : std_logic;
    REC_Disable_Set : std_logic;
    Test_Trig : std_logic;
    ReservedBit15 : std_logic;
  end record; --  GC_Command_2_Type
  --
  --
  type GC_INFO_56_Type is record
    GC_Count : std_logic_vector(31 downto 0);
    GC_Command : GC_Command_2_Type;
    Reserved_0 : std_logic_vector(15 downto 0);
    GC_Event_1 : GC_Event_1_2_Type;
    GC_Event_2 : GC_Event_2_2_Type;
    GC_Event_3 : GC_Event_3_2_Type;
    GC_Event_4 : GC_Event_4_2_Type;
    Speed_Mode : std_logic_vector(7 downto 0);
    Search_Pattern : std_logic_vector(7 downto 0);
    Pulse_Freq : std_logic_vector(7 downto 0);
    Pulse_Type : std_logic_vector(7 downto 0);
    Pulse_Length : std_logic_vector(7 downto 0);
    PRE_Pulse : std_logic_vector(7 downto 0);
    PRI : std_logic_vector(7 downto 0);
    Beam_Steering : std_logic_vector(7 downto 0);
    BAT_VOLT : std_logic_vector(15 downto 0);
    Reserved_1 : std_logic_vector(47 downto 0);
    TORP_N : std_logic_vector(31 downto 0);
    TORP_E : std_logic_vector(31 downto 0);
    TORP_D : std_logic_vector(15 downto 0);
    TORP_Roll : std_logic_vector(15 downto 0);
    TORP_Pitch : std_logic_vector(15 downto 0);
    TORP_Yaw : std_logic_vector(15 downto 0);
    ACT_On_Off : std_logic_vector(7 downto 0);
    Reserved_2 : std_logic_vector(55 downto 0);
  end record; --  GC_INFO_56_Type
  --
  --
  type Save_Beam_INFO_2_Type is record
    Save_R3 : std_logic;
    Save_R2 : std_logic;
    Save_R1 : std_logic;
    Save_R0 : std_logic;
    Save_C : std_logic;
    Save_L0 : std_logic;
    Save_L1 : std_logic;
    Save_L2 : std_logic;
    Optic_On : std_logic;
    Ethernet_On : std_logic;
    TE_Data_Input : std_logic_vector(1 downto 0);
    ReservedBit04 : std_logic;
    ReservedBit05 : std_logic;
    ReservedBit06 : std_logic;
    Save_L3 : std_logic;
  end record; --  Save_Beam_INFO_2_Type
  --
  --
  type PA_Tx_FPGA_CMD_16_Type is record
    PRI : std_logic_vector(5 downto 0);
    Tx_Reset : std_logic;
    Tx_Trigger : std_logic;
    Tx_Pulse_Interval : std_logic_vector(6 downto 0);
    Number_of_Tx : std_logic;
    Beam_Steering_Angle : std_logic_vector(7 downto 0);
    Tx1_Pulse_Length : std_logic_vector(6 downto 0);
    Tx1_Type : std_logic;
    Tx1_Start_Frequency : std_logic_vector(14 downto 0);
    ReservedBit07_1 : std_logic;
    Tx1_Sweep_Frequency : std_logic_vector(7 downto 0);
    Tx2_Pulse_Length : std_logic_vector(6 downto 0);
    Tx2_Type : std_logic;
    Tx2_Start_Frequency : std_logic_vector(14 downto 0);
    ReservedBit07_2 : std_logic;
    Tx2_Sweep_Frequency : std_logic_vector(7 downto 0);
    Beam_Weighting_Select : std_logic_vector(3 downto 0);
    Ramping_Time : std_logic_vector(3 downto 0);
    Battery_Voltage : std_logic_vector(15 downto 0);
    Stave_Selection_Number : std_logic_vector(3 downto 0);
    Reserved_1 : std_logic;
    Reserved_2 : std_logic;
    Test_Mode : std_logic;
    Stave_Tx_Mode : std_logic;
    Stave_Weight : std_logic_vector(7 downto 0);
  end record; --  PA_Tx_FPGA_CMD_16_Type
  --
  --
  type SC_Rx_FPGA_CMD_8_Type is record
    TVG : std_logic_vector(3 downto 0);
    REC_Mode : std_logic_vector(1 downto 0);
    ReservedBit06_0 : std_logic;
    ReservedBit07_0 : std_logic;
    PLC : std_logic;
    DAQ_Count_Reset : std_logic;
    AD_On : std_logic;
    Gain_Mode : std_logic;
    BPF_On_Off : std_logic;
    Pass_Active : std_logic;
    Reset : std_logic;
    Stop_Run : std_logic;
    REC_On_Off : std_logic;
    PLC_Mode : std_logic_vector(1 downto 0);
    Data_Path : std_logic;
    ReservedBit04 : std_logic;
    ReservedBit05 : std_logic;
    ReservedBit06 : std_logic;
    ReservedBit07 : std_logic;
    Gain : std_logic_vector(7 downto 0);
    Reserved : std_logic_vector(31 downto 0);
  end record; --  SC_Rx_FPGA_CMD_8_Type
  --
  --
  type FPGA_CMD_36_Type is record
    Reserved_0 : std_logic_vector(31 downto 0);
    SC_Rx_FPGA_CMD : SC_Rx_FPGA_CMD_8_Type;
    PA_Tx_FPGA_CMD : PA_Tx_FPGA_CMD_16_Type;
    Save_Beam_INFO : Save_Beam_INFO_2_Type;
    Reserved_1 : std_logic_vector(47 downto 0);
  end record; --  FPGA_CMD_36_Type
  --
  -- SCB2SPB_Pkt_300_Type
  type SCB2SPB_Pkt_300_Type is record
    Start_Bytes : std_logic_vector(31 downto 0);
    Count : std_logic_vector(31 downto 0);
    Command : std_logic_vector(15 downto 0);
    ACK : std_logic_vector(15 downto 0);
    FPGA_CMD : FPGA_CMD_36_Type;
    GC_INFO : GC_INFO_56_Type;
    FPGA_State : FPGA_State_40_Type;
    Data : Data_152_Type;
    Checksum : std_logic_vector(15 downto 0);
    Stop_Bytes : std_logic_vector(15 downto 0);
  end record; --  SCB2SPB_Pkt_300_Type
  --
  --

  --
  --
  --
  --
  -- //=============================================================================
  -- //=============================================================================
  -- //=============================================================================
  --
  --
  ----
  constant CH_Data_148_i : CH_Data_148_Type := (
    1 => X"00000000",
    2 => X"00000000",
    others => X"00000000"
  );
  --
  --
  constant Data_152_i : Data_152_Type := (
    CH_Data => CH_Data_148_i,
    Reserved => X"00000000"
  );
  --
  --
  constant Trigger_State_1_i : Trigger_State_1_Type := (
    TE_TX_TRIG => '0',
    TE_RX_TRIG => '0',
    TX_TRIG => '0',
    TX_P_GATE => '0',
    ReservedBit04 => '0',
    ReservedBit05 => '0',
    ReservedBit06 => '0',
    ReservedBit07 => '0'
  );
  --
  --
  constant SP_Zynq_SelfTest_Result_2_i : SP_Zynq_SelfTest_Result_2_Type := (
    ReservedBit00 => '0',
    ReservedBit01 => '0',
    ReservedBit02 => '0',
    ReservedBit03 => '0',
    ReservedBit04 => '0',
    ReservedBit05 => '0',
    ReservedBit06 => '0',
    ReservedBit07 => '0',
    ReservedBit10 => '0',
    ReservedBit11 => '0',
    ReservedBit12 => '0',
    ReservedBit13 => '0',
    ReservedBit14 => '0',
    ReservedBit15 => '0',
    ReservedBit16 => '0',
    ReservedBit17 => '0'
  );
  --
  --
  constant PA_FPGA_SelfTest_Result_2_i : PA_FPGA_SelfTest_Result_2_Type := (
    PCM_Boot => '0',
    PAM1_Boot => '0',
    PAM2_Boot => '0',
    PAM3_Boot => '0',
    PAM4_Boot => '0',
    PAM5_Boot => '0',
    PAM6_Boot => '0',
    PAM7_Boot => '0',
    CMD_DATA_ERR => '0',
    Temp_warn => '0',
    ReservedBit02 => '0',
    ReservedBit03 => '0',
    PAB_ST_RESULT => '0',
    ReservedBit05 => '0',
    ReservedBit06 => '0',
    ReservedBit07 => '0'
  );
  --
  --
  constant SC_FPGA_SelfTest_Result_2_i : SC_FPGA_SelfTest_Result_2_Type := (
    SC_MEM => '0',
    ReservedBit01 => '0',
    ReservedBit02 => '0',
    ReservedBit03 => '0',
    SC_FPGA => '0',
    ReservedBit05 => '0',
    ReservedBit06 => '0',
    ReservedBit07 => '0',
    SC_GTP => '0',
    SC_LVDS => '0',
    SC_UART => '0',
    ReservedBit13 => '0',
    ReservedBit14 => '0',
    ReservedBit15 => '0',
    ReservedBit16 => '0',
    ReservedBit17 => '0'
  );
  --
  --
  constant FPGA_Zynq_Control_1_i : FPGA_Zynq_Control_1_Type := (
    PLC_State => '0',
    DAQ_Count_Reset => '0',
    AD_On_Result => '0',
    ReservedBit03 => '0',
    ReservedBit04 => '0',
    SC_FPGA_Reset => '0',
    PA_FPGA_Reset => '0',
    Ping_On_Off => '0'
  );
  --
  --
  constant FPGA_State_40_i : FPGA_State_40_Type := (
    DAQCounter => X"00000000",
    SC_GainValue => X"00",
    FPGA_Zynq_Control => FPGA_Zynq_Control_1_i,
    PA_FPGA_Temperature => X"00",
    SC_FPGA_Temperature => X"00",
    SP_AH_Zynq_Temperature => X"00",
    SP_P1_Zynq_Temperature => X"00",
    SP_P2_Zynq_Temperature => X"00",
    SC2SP_GTP_ERR => X"00",
    AH2P1_GTP_ERR => X"00",
    AH2P2_GTP_ERR => X"00",
    P12AH_GTP_ERR => X"00",
    P22AH_GTP_ERR => X"00",
    SC_FPGA_SelfTest_Result => SC_FPGA_SelfTest_Result_2_i,
    PA_FPGA_SelfTest_Result => PA_FPGA_SelfTest_Result_2_i,
    SP_Zynq_SelfTest_Result => SP_Zynq_SelfTest_Result_2_i,
    TX_Voltage_Sample1 => X"0000",
    TX_Voltage_Sample2 => X"0000",
    TX_DC_Voltage_Sample1 => X"0000",
    TX_DC_Voltage_Sample2 => X"0000",
    TX_DC_Current_Sample1 => X"0000",
    TX_DC_Current_Sample2 => X"0000",
    Trigger_State => Trigger_State_1_i,
    Reserved_9 => (others => '0')
  );
  --
  --
  constant GC_Event_4_2_i : GC_Event_4_2_Type := (
    Enable => '0',
    Detect => '0',
    Closein => '0',
    Fail => '0',
    ESAD_Chk => '0',
    ESAD_HV => '0',
    ESAD_Power => '0',
    ReservedBit07 => '0',
    ReservedBit08 => '0',
    ReservedBit09 => '0',
    ReservedBit10 => '0',
    ReservedBit11 => '0',
    Leakage_Det => '0',
    ReservedBit13 => '0',
    ReservedBit14 => '0',
    M_Stop => '0'
  );
  --
  --
  constant GC_Event_3_2_i : GC_Event_3_2_Type := (
    Beam_Steering => (others => '0'),
    ReservedBit04 => '0',
    ReservedBit05 => '0',
    ReservedBit06 => '0',
    ReservedBit07 => '0',
    ReservedBit08 => '0',
    ReservedBit09 => '0',
    ReservedBit10 => '0',
    ReservedBit11 => '0',
    ReservedBit12 => '0',
    ReservedBit13 => '0',
    ReservedBit14 => '0',
    ReservedBit15 => '0'
  );
  --
  --
  constant GC_Event_2_2_i : GC_Event_2_2_Type := (
    Pre_Enable => '0',
    Enable => '0',
    V_Target => '0',
    Speed_Mode1 => '0',
    Speed_Mode2 => '0',
    Homming_Enable => '0',
    Homming_Mode => '0',
    Inhibit => '0',
    Hold_In => '0',
    Target_Det => '0',
    Target_Loss => '0',
    ACM_Det => '0',
    Pre_ACO_Chk => '0',
    ACO_Det => '0',
    ReservedBit14 => '0',
    ReservedBit15 => '0'
  );
  --
  --
  constant GC_Event_1_2_i : GC_Event_1_2_Type := (
    ReservedBit00 => '0',
    HILS_Mode => '0',
    EXHD_Mode => '0',
    C_Range => '0',
    E_Range => '0',
    ReservedBit05 => '0',
    Close_In => '0',
    Terminal_Homing => '0',
    Fire => '0',
    EOM => '0',
    Motor_Start => '0',
    Motor_Stop => '0',
    Ceiling_Det => '0',
    Floor_Det => '0',
    Surface_Det => '0',
    EOR => '0'
  );
  --
  --
  constant GC_Command_2_i : GC_Command_2_Type := (
    PLC => '0',
    AD_On => '0',
    ReservedBit02 => '0',
    ReservedBit03 => '0',
    Pre_Enable => '0',
    Enable => '0',
    ReservedBit06 => '0',
    ReservedBit07 => '0',
    Salvo_On => '0',
    Band_Sel => '0',
    Mode_Set => '0',
    PRI_Start => '0',
    Test_Mode_Set => '0',
    REC_Disable_Set => '0',
    Test_Trig => '0',
    ReservedBit15 => '0'
  );
  --
  --
  constant GC_INFO_56_i : GC_INFO_56_Type := (
    GC_Count => X"00000000",
    GC_Command => GC_Command_2_i,
    Reserved_0 => X"0000",
    GC_Event_1 => GC_Event_1_2_i,
    GC_Event_2 => GC_Event_2_2_i,
    GC_Event_3 => GC_Event_3_2_i,
    GC_Event_4 => GC_Event_4_2_i,
    Speed_Mode => X"00",
    Search_Pattern => X"00",
    Pulse_Freq => X"00",
    Pulse_Type => X"00",
    Pulse_Length => X"00",
    PRE_Pulse => X"00",
    PRI => X"00",
    Beam_Steering => X"00",
    BAT_VOLT => X"0000",
    Reserved_1 => (others => '0'),
    TORP_N => X"00000000",
    TORP_E => X"00000000",
    TORP_D => X"0000",
    TORP_Roll => X"0000",
    TORP_Pitch => X"0000",
    TORP_Yaw => X"0000",
    ACT_On_Off => X"00",
    Reserved_2 => (others => '0')
  );
  --
  --
  constant Save_Beam_INFO_2_i : Save_Beam_INFO_2_Type := (
    Save_R3 => '0',
    Save_R2 => '0',
    Save_R1 => '0',
    Save_R0 => '0',
    Save_C => '0',
    Save_L0 => '0',
    Save_L1 => '0',
    Save_L2 => '0',
    Optic_On => '0',
    Ethernet_On => '0',
    TE_Data_Input => (others => '0'),
    ReservedBit04 => '0',
    ReservedBit05 => '0',
    ReservedBit06 => '0',
    Save_L3 => '0'
  );
  --
  --
  constant PA_Tx_FPGA_CMD_16_i : PA_Tx_FPGA_CMD_16_Type := (
    PRI => (others => '0'),
    Tx_Reset => '0',
    Tx_Trigger => '0',
    Tx_Pulse_Interval => (others => '0'),
    Number_of_Tx => '0',
    Beam_Steering_Angle => X"00",
    Tx1_Pulse_Length => (others => '0'),
    Tx1_Type => '0',
    Tx1_Start_Frequency => (others => '0'),
    ReservedBit07_1 => '0',
    Tx1_Sweep_Frequency => X"00",
    Tx2_Pulse_Length => (others => '0'),
    Tx2_Type => '0',
    Tx2_Start_Frequency => (others => '0'),
    ReservedBit07_2 => '0',
    Tx2_Sweep_Frequency => X"00",
    Beam_Weighting_Select => (others => '0'),
    Ramping_Time => (others => '0'),
    Battery_Voltage => X"0000",
    Stave_Selection_Number => (others => '0'),
    Reserved_1 => '0',
    Reserved_2 => '0',
    Test_Mode => '0',
    Stave_Tx_Mode => '0',
    Stave_Weight => X"00"
  );
  --
  --
  constant SC_Rx_FPGA_CMD_8_i : SC_Rx_FPGA_CMD_8_Type := (
    TVG => (others => '0'),
    REC_Mode => (others => '0'),
    ReservedBit06_0 => '0',
    ReservedBit07_0 => '0',
    PLC => '0',
    DAQ_Count_Reset => '0',
    AD_On => '0',
    Gain_Mode => '0',
    BPF_On_Off => '0',
    Pass_Active => '0',
    Reset => '0',
    Stop_Run => '0',
    REC_On_Off => '0',
    PLC_Mode => (others => '0'),
    Data_Path => '0',
    ReservedBit04 => '0',
    ReservedBit05 => '0',
    ReservedBit06 => '0',
    ReservedBit07 => '0',
    Gain => X"00",
    Reserved => X"00000000"
  );
  --
  --
  constant FPGA_CMD_36_i : FPGA_CMD_36_Type := (
    Reserved_0 => X"00000000",
    SC_Rx_FPGA_CMD => SC_Rx_FPGA_CMD_8_i,
    PA_Tx_FPGA_CMD => PA_Tx_FPGA_CMD_16_i,
    Save_Beam_INFO => Save_Beam_INFO_2_i,
    Reserved_1 => (others => '0')
  );
  --

  constant SCB2SPB_Pkt_300_i : SCB2SPB_Pkt_300_Type := (
    Start_Bytes => X"7F7F7F7F",
    Count => X"00000000",
    Command => X"0000",
    ACK => X"0000",
    FPGA_CMD => FPGA_CMD_36_i,
    GC_INFO => GC_INFO_56_i,
    FPGA_State => FPGA_State_40_i,
    Data => Data_152_i,
    Checksum => X"CCCC",
    Stop_Bytes => X"8181"
  );
  --
  --
  --
  --
  function conv_ch_packet (bitvector : std_logic_vector) return SCB2SPB_Pkt_300_Type;
  function conv_ch_bitvector (pkt : SCB2SPB_Pkt_300_Type) return std_logic_vector;

end package SCB2SPB_Type;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
package body SCB2SPB_Type is

  function conv_ch_packet (bitvector : std_logic_vector) return SCB2SPB_Pkt_300_Type is
    variable pkt : SCB2SPB_Pkt_300_Type;
  begin
    --

    for ch in 1 to 37 loop
      pkt.Data.CH_Data(ch) := bitvector(ch * 32 - 1 + 1152 downto ch * 32 - 32 + 1152);
    end loop;

    --
    --
    --  type Data_152_Type is record
    --  bitvector(2335 downto 1152)
    pkt.Data.Reserved := bitvector(2367 downto 2336);
    --  end record;  --  Data_152_Type
    --
    --
    --  type Trigger_State_1_Type is record
    pkt.FPGA_State.Trigger_State.TE_TX_TRIG := bitvector(1104);
    pkt.FPGA_State.Trigger_State.TE_RX_TRIG := bitvector(1105);
    pkt.FPGA_State.Trigger_State.TX_TRIG := bitvector(1106);
    pkt.FPGA_State.Trigger_State.TX_P_GATE := bitvector(1107);
    pkt.FPGA_State.Trigger_State.ReservedBit04 := bitvector(1108);
    pkt.FPGA_State.Trigger_State.ReservedBit05 := bitvector(1109);
    pkt.FPGA_State.Trigger_State.ReservedBit06 := bitvector(1110);
    pkt.FPGA_State.Trigger_State.ReservedBit07 := bitvector(1111);
    --  end record;  --  Trigger_State_1_Type
    --
    --
    --  type SP_Zynq_SelfTest_Result_2_Type is record
    pkt.FPGA_State.SP_Zynq_SelfTest_Result.ReservedBit00 := bitvector(992);
    pkt.FPGA_State.SP_Zynq_SelfTest_Result.ReservedBit01 := bitvector(993);
    pkt.FPGA_State.SP_Zynq_SelfTest_Result.ReservedBit02 := bitvector(994);
    pkt.FPGA_State.SP_Zynq_SelfTest_Result.ReservedBit03 := bitvector(995);
    pkt.FPGA_State.SP_Zynq_SelfTest_Result.ReservedBit04 := bitvector(996);
    pkt.FPGA_State.SP_Zynq_SelfTest_Result.ReservedBit05 := bitvector(997);
    pkt.FPGA_State.SP_Zynq_SelfTest_Result.ReservedBit06 := bitvector(998);
    pkt.FPGA_State.SP_Zynq_SelfTest_Result.ReservedBit07 := bitvector(999);
    pkt.FPGA_State.SP_Zynq_SelfTest_Result.ReservedBit10 := bitvector(1000);
    pkt.FPGA_State.SP_Zynq_SelfTest_Result.ReservedBit11 := bitvector(1001);
    pkt.FPGA_State.SP_Zynq_SelfTest_Result.ReservedBit12 := bitvector(1002);
    pkt.FPGA_State.SP_Zynq_SelfTest_Result.ReservedBit13 := bitvector(1003);
    pkt.FPGA_State.SP_Zynq_SelfTest_Result.ReservedBit14 := bitvector(1004);
    pkt.FPGA_State.SP_Zynq_SelfTest_Result.ReservedBit15 := bitvector(1005);
    pkt.FPGA_State.SP_Zynq_SelfTest_Result.ReservedBit16 := bitvector(1006);
    pkt.FPGA_State.SP_Zynq_SelfTest_Result.ReservedBit17 := bitvector(1007);
    --  end record;  --  SP_Zynq_SelfTest_Result_2_Type
    --
    --
    --  type PA_FPGA_SelfTest_Result_2_Type is record
    pkt.FPGA_State.PA_FPGA_SelfTest_Result.PCM_Boot := bitvector(976);
    pkt.FPGA_State.PA_FPGA_SelfTest_Result.PAM1_Boot := bitvector(977);
    pkt.FPGA_State.PA_FPGA_SelfTest_Result.PAM2_Boot := bitvector(978);
    pkt.FPGA_State.PA_FPGA_SelfTest_Result.PAM3_Boot := bitvector(979);
    pkt.FPGA_State.PA_FPGA_SelfTest_Result.PAM4_Boot := bitvector(980);
    pkt.FPGA_State.PA_FPGA_SelfTest_Result.PAM5_Boot := bitvector(981);
    pkt.FPGA_State.PA_FPGA_SelfTest_Result.PAM6_Boot := bitvector(982);
    pkt.FPGA_State.PA_FPGA_SelfTest_Result.PAM7_Boot := bitvector(983);
    pkt.FPGA_State.PA_FPGA_SelfTest_Result.CMD_DATA_ERR := bitvector(984);
    pkt.FPGA_State.PA_FPGA_SelfTest_Result.Temp_warn := bitvector(985);
    pkt.FPGA_State.PA_FPGA_SelfTest_Result.ReservedBit02 := bitvector(986);
    pkt.FPGA_State.PA_FPGA_SelfTest_Result.ReservedBit03 := bitvector(987);
    pkt.FPGA_State.PA_FPGA_SelfTest_Result.PAB_ST_RESULT := bitvector(988);
    pkt.FPGA_State.PA_FPGA_SelfTest_Result.ReservedBit05 := bitvector(989);
    pkt.FPGA_State.PA_FPGA_SelfTest_Result.ReservedBit06 := bitvector(990);
    pkt.FPGA_State.PA_FPGA_SelfTest_Result.ReservedBit07 := bitvector(991);
    --  end record;  --  PA_FPGA_SelfTest_Result_2_Type
    --
    --
    --  type SC_FPGA_SelfTest_Result_2_Type is record
    pkt.FPGA_State.SC_FPGA_SelfTest_Result.SC_MEM := bitvector(960);
    pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit01 := bitvector(961);
    pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit02 := bitvector(962);
    pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit03 := bitvector(963);
    pkt.FPGA_State.SC_FPGA_SelfTest_Result.SC_FPGA := bitvector(964);
    pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit05 := bitvector(965);
    pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit06 := bitvector(966);
    pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit07 := bitvector(967);
    pkt.FPGA_State.SC_FPGA_SelfTest_Result.SC_GTP := bitvector(968);
    pkt.FPGA_State.SC_FPGA_SelfTest_Result.SC_LVDS := bitvector(969);
    pkt.FPGA_State.SC_FPGA_SelfTest_Result.SC_UART := bitvector(970);
    pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit13 := bitvector(971);
    pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit14 := bitvector(972);
    pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit15 := bitvector(973);
    pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit16 := bitvector(974);
    pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit17 := bitvector(975);
    --  end record;  --  SC_FPGA_SelfTest_Result_2_Type
    --
    --
    --  type FPGA_Zynq_Control_1_Type is record
    pkt.FPGA_State.FPGA_Zynq_Control.PLC_State := bitvector(872);
    pkt.FPGA_State.FPGA_Zynq_Control.DAQ_Count_Reset := bitvector(873);
    pkt.FPGA_State.FPGA_Zynq_Control.AD_On_Result := bitvector(874);
    pkt.FPGA_State.FPGA_Zynq_Control.ReservedBit03 := bitvector(875);
    pkt.FPGA_State.FPGA_Zynq_Control.ReservedBit04 := bitvector(876);
    pkt.FPGA_State.FPGA_Zynq_Control.SC_FPGA_Reset := bitvector(877);
    pkt.FPGA_State.FPGA_Zynq_Control.PA_FPGA_Reset := bitvector(878);
    pkt.FPGA_State.FPGA_Zynq_Control.Ping_On_Off := bitvector(879);
    --  end record;  --  FPGA_Zynq_Control_1_Type
    --
    --
    --  type FPGA_State_40_Type is record
    pkt.FPGA_State.DAQCounter := bitvector(863 downto 832);
    pkt.FPGA_State.SC_GainValue := bitvector(871 downto 864);
    --  bitvector(879 downto 872)
    pkt.FPGA_State.PA_FPGA_Temperature := bitvector(887 downto 880);
    pkt.FPGA_State.SC_FPGA_Temperature := bitvector(895 downto 888);
    pkt.FPGA_State.SP_AH_Zynq_Temperature := bitvector(903 downto 896);
    pkt.FPGA_State.SP_P1_Zynq_Temperature := bitvector(911 downto 904);
    pkt.FPGA_State.SP_P2_Zynq_Temperature := bitvector(919 downto 912);
    pkt.FPGA_State.SC2SP_GTP_ERR := bitvector(927 downto 920);
    pkt.FPGA_State.AH2P1_GTP_ERR := bitvector(935 downto 928);
    pkt.FPGA_State.AH2P2_GTP_ERR := bitvector(943 downto 936);
    pkt.FPGA_State.P12AH_GTP_ERR := bitvector(951 downto 944);
    pkt.FPGA_State.P22AH_GTP_ERR := bitvector(959 downto 952);
    --  bitvector(975 downto 960)
    --  bitvector(991 downto 976)
    --  bitvector(1007 downto 992)
    pkt.FPGA_State.TX_Voltage_Sample1 := bitvector(1023 downto 1008);
    pkt.FPGA_State.TX_Voltage_Sample2 := bitvector(1039 downto 1024);
    pkt.FPGA_State.TX_DC_Voltage_Sample1 := bitvector(1055 downto 1040);
    pkt.FPGA_State.TX_DC_Voltage_Sample2 := bitvector(1071 downto 1056);
    pkt.FPGA_State.TX_DC_Current_Sample1 := bitvector(1087 downto 1072);
    pkt.FPGA_State.TX_DC_Current_Sample2 := bitvector(1103 downto 1088);
    --  bitvector(1111 downto 1104)
    pkt.FPGA_State.Reserved_9 := bitvector(1151 downto 1112);
    --  end record;  --  FPGA_State_40_Type
    --
    --
    --  type GC_Event_4_2_Type is record
    pkt.GC_INFO.GC_Event_4.Enable := bitvector(496);
    pkt.GC_INFO.GC_Event_4.Detect := bitvector(497);
    pkt.GC_INFO.GC_Event_4.Closein := bitvector(498);
    pkt.GC_INFO.GC_Event_4.Fail := bitvector(499);
    pkt.GC_INFO.GC_Event_4.ESAD_Chk := bitvector(500);
    pkt.GC_INFO.GC_Event_4.ESAD_HV := bitvector(501);
    pkt.GC_INFO.GC_Event_4.ESAD_Power := bitvector(502);
    pkt.GC_INFO.GC_Event_4.ReservedBit07 := bitvector(503);
    pkt.GC_INFO.GC_Event_4.ReservedBit08 := bitvector(504);
    pkt.GC_INFO.GC_Event_4.ReservedBit09 := bitvector(505);
    pkt.GC_INFO.GC_Event_4.ReservedBit10 := bitvector(506);
    pkt.GC_INFO.GC_Event_4.ReservedBit11 := bitvector(507);
    pkt.GC_INFO.GC_Event_4.Leakage_Det := bitvector(508);
    pkt.GC_INFO.GC_Event_4.ReservedBit13 := bitvector(509);
    pkt.GC_INFO.GC_Event_4.ReservedBit14 := bitvector(510);
    pkt.GC_INFO.GC_Event_4.M_Stop := bitvector(511);
    --  end record;  --  GC_Event_4_2_Type
    --
    --
    --  type GC_Event_3_2_Type is record
    pkt.GC_INFO.GC_Event_3.Beam_Steering := bitvector(483 downto 480);
    pkt.GC_INFO.GC_Event_3.ReservedBit04 := bitvector(484);
    pkt.GC_INFO.GC_Event_3.ReservedBit05 := bitvector(485);
    pkt.GC_INFO.GC_Event_3.ReservedBit06 := bitvector(486);
    pkt.GC_INFO.GC_Event_3.ReservedBit07 := bitvector(487);
    pkt.GC_INFO.GC_Event_3.ReservedBit08 := bitvector(488);
    pkt.GC_INFO.GC_Event_3.ReservedBit09 := bitvector(489);
    pkt.GC_INFO.GC_Event_3.ReservedBit10 := bitvector(490);
    pkt.GC_INFO.GC_Event_3.ReservedBit11 := bitvector(491);
    pkt.GC_INFO.GC_Event_3.ReservedBit12 := bitvector(492);
    pkt.GC_INFO.GC_Event_3.ReservedBit13 := bitvector(493);
    pkt.GC_INFO.GC_Event_3.ReservedBit14 := bitvector(494);
    pkt.GC_INFO.GC_Event_3.ReservedBit15 := bitvector(495);
    --  end record;  --  GC_Event_3_2_Type
    --
    --
    --  type GC_Event_2_2_Type is record
    pkt.GC_INFO.GC_Event_2.Pre_Enable := bitvector(464);
    pkt.GC_INFO.GC_Event_2.Enable := bitvector(465);
    pkt.GC_INFO.GC_Event_2.V_Target := bitvector(466);
    pkt.GC_INFO.GC_Event_2.Speed_Mode1 := bitvector(467);
    pkt.GC_INFO.GC_Event_2.Speed_Mode2 := bitvector(468);
    pkt.GC_INFO.GC_Event_2.Homming_Enable := bitvector(469);
    pkt.GC_INFO.GC_Event_2.Homming_Mode := bitvector(470);
    pkt.GC_INFO.GC_Event_2.Inhibit := bitvector(471);
    pkt.GC_INFO.GC_Event_2.Hold_In := bitvector(472);
    pkt.GC_INFO.GC_Event_2.Target_Det := bitvector(473);
    pkt.GC_INFO.GC_Event_2.Target_Loss := bitvector(474);
    pkt.GC_INFO.GC_Event_2.ACM_Det := bitvector(475);
    pkt.GC_INFO.GC_Event_2.Pre_ACO_Chk := bitvector(476);
    pkt.GC_INFO.GC_Event_2.ACO_Det := bitvector(477);
    pkt.GC_INFO.GC_Event_2.ReservedBit14 := bitvector(478);
    pkt.GC_INFO.GC_Event_2.ReservedBit15 := bitvector(479);
    --  end record;  --  GC_Event_2_2_Type
    --
    --
    --  type GC_Event_1_2_Type is record
    pkt.GC_INFO.GC_Event_1.ReservedBit00 := bitvector(448);
    pkt.GC_INFO.GC_Event_1.HILS_Mode := bitvector(449);
    pkt.GC_INFO.GC_Event_1.EXHD_Mode := bitvector(450);
    pkt.GC_INFO.GC_Event_1.C_Range := bitvector(451);
    pkt.GC_INFO.GC_Event_1.E_Range := bitvector(452);
    pkt.GC_INFO.GC_Event_1.ReservedBit05 := bitvector(453);
    pkt.GC_INFO.GC_Event_1.Close_In := bitvector(454);
    pkt.GC_INFO.GC_Event_1.Terminal_Homing := bitvector(455);
    pkt.GC_INFO.GC_Event_1.Fire := bitvector(456);
    pkt.GC_INFO.GC_Event_1.EOM := bitvector(457);
    pkt.GC_INFO.GC_Event_1.Motor_Start := bitvector(458);
    pkt.GC_INFO.GC_Event_1.Motor_Stop := bitvector(459);
    pkt.GC_INFO.GC_Event_1.Ceiling_Det := bitvector(460);
    pkt.GC_INFO.GC_Event_1.Floor_Det := bitvector(461);
    pkt.GC_INFO.GC_Event_1.Surface_Det := bitvector(462);
    pkt.GC_INFO.GC_Event_1.EOR := bitvector(463);
    --  end record;  --  GC_Event_1_2_Type
    --
    --
    --  type GC_Command_2_Type is record
    pkt.GC_INFO.GC_Command.PLC := bitvector(416);
    pkt.GC_INFO.GC_Command.AD_On := bitvector(417);
    pkt.GC_INFO.GC_Command.ReservedBit02 := bitvector(418);
    pkt.GC_INFO.GC_Command.ReservedBit03 := bitvector(419);
    pkt.GC_INFO.GC_Command.Pre_Enable := bitvector(420);
    pkt.GC_INFO.GC_Command.Enable := bitvector(421);
    pkt.GC_INFO.GC_Command.ReservedBit06 := bitvector(422);
    pkt.GC_INFO.GC_Command.ReservedBit07 := bitvector(423);
    pkt.GC_INFO.GC_Command.Salvo_On := bitvector(424);
    pkt.GC_INFO.GC_Command.Band_Sel := bitvector(425);
    pkt.GC_INFO.GC_Command.Mode_Set := bitvector(426);
    pkt.GC_INFO.GC_Command.PRI_Start := bitvector(427);
    pkt.GC_INFO.GC_Command.Test_Mode_Set := bitvector(428);
    pkt.GC_INFO.GC_Command.REC_Disable_Set := bitvector(429);
    pkt.GC_INFO.GC_Command.Test_Trig := bitvector(430);
    pkt.GC_INFO.GC_Command.ReservedBit15 := bitvector(431);
    --  end record;  --  GC_Command_2_Type
    --
    --
    --  type GC_INFO_56_Type is record
    pkt.GC_INFO.GC_Count := bitvector(415 downto 384);
    --  bitvector(431 downto 416)
    pkt.GC_INFO.Reserved_0 := bitvector(447 downto 432);
    --  bitvector(463 downto 448)
    --  bitvector(479 downto 464)
    --  bitvector(495 downto 480)
    --  bitvector(511 downto 496)
    pkt.GC_INFO.Speed_Mode := bitvector(519 downto 512);
    pkt.GC_INFO.Search_Pattern := bitvector(527 downto 520);
    pkt.GC_INFO.Pulse_Freq := bitvector(535 downto 528);
    pkt.GC_INFO.Pulse_Type := bitvector(543 downto 536);
    pkt.GC_INFO.Pulse_Length := bitvector(551 downto 544);
    pkt.GC_INFO.PRE_Pulse := bitvector(559 downto 552);
    pkt.GC_INFO.PRI := bitvector(567 downto 560);
    pkt.GC_INFO.Beam_Steering := bitvector(575 downto 568);
    pkt.GC_INFO.BAT_VOLT := bitvector(591 downto 576);
    pkt.GC_INFO.Reserved_1 := bitvector(639 downto 592);
    pkt.GC_INFO.TORP_N := bitvector(671 downto 640);
    pkt.GC_INFO.TORP_E := bitvector(703 downto 672);
    pkt.GC_INFO.TORP_D := bitvector(719 downto 704);
    pkt.GC_INFO.TORP_Roll := bitvector(735 downto 720);
    pkt.GC_INFO.TORP_Pitch := bitvector(751 downto 736);
    pkt.GC_INFO.TORP_Yaw := bitvector(767 downto 752);
    pkt.GC_INFO.ACT_On_Off := bitvector(775 downto 768);
    pkt.GC_INFO.Reserved_2 := bitvector(831 downto 776);
    --  end record;  --  GC_INFO_56_Type
    --
    --
    --  type Save_Beam_INFO_2_Type is record
    pkt.FPGA_CMD.Save_Beam_INFO.Save_R3 := bitvector(320);
    pkt.FPGA_CMD.Save_Beam_INFO.Save_R2 := bitvector(321);
    pkt.FPGA_CMD.Save_Beam_INFO.Save_R1 := bitvector(322);
    pkt.FPGA_CMD.Save_Beam_INFO.Save_R0 := bitvector(323);
    pkt.FPGA_CMD.Save_Beam_INFO.Save_C := bitvector(324);
    pkt.FPGA_CMD.Save_Beam_INFO.Save_L0 := bitvector(325);
    pkt.FPGA_CMD.Save_Beam_INFO.Save_L1 := bitvector(326);
    pkt.FPGA_CMD.Save_Beam_INFO.Save_L2 := bitvector(327);
    pkt.FPGA_CMD.Save_Beam_INFO.Optic_On := bitvector(328);
    pkt.FPGA_CMD.Save_Beam_INFO.Ethernet_On := bitvector(329);
    pkt.FPGA_CMD.Save_Beam_INFO.TE_Data_Input := bitvector(331 downto 330);
    pkt.FPGA_CMD.Save_Beam_INFO.ReservedBit04 := bitvector(332);
    pkt.FPGA_CMD.Save_Beam_INFO.ReservedBit05 := bitvector(333);
    pkt.FPGA_CMD.Save_Beam_INFO.ReservedBit06 := bitvector(334);
    pkt.FPGA_CMD.Save_Beam_INFO.Save_L3 := bitvector(335);
    --  end record;  --  Save_Beam_INFO_2_Type
    --
    --
    --  type PA_Tx_FPGA_CMD_16_Type is record
    pkt.FPGA_CMD.PA_Tx_FPGA_CMD.PRI := bitvector(197 downto 192);
    pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx_Reset := bitvector(198);
    pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx_Trigger := bitvector(199);
    pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx_Pulse_Interval := bitvector(206 downto 200);
    pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Number_of_Tx := bitvector(207);
    pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Beam_Steering_Angle := bitvector(215 downto 208);
    pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx1_Pulse_Length := bitvector(222 downto 216);
    pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx1_Type := bitvector(223);
    pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx1_Start_Frequency := bitvector(238 downto 224);
    pkt.FPGA_CMD.PA_Tx_FPGA_CMD.ReservedBit07_1 := bitvector(239);
    pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx1_Sweep_Frequency := bitvector(247 downto 240);
    pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx2_Pulse_Length := bitvector(254 downto 248);
    pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx2_Type := bitvector(255);
    pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx2_Start_Frequency := bitvector(270 downto 256);
    pkt.FPGA_CMD.PA_Tx_FPGA_CMD.ReservedBit07_2 := bitvector(271);
    pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx2_Sweep_Frequency := bitvector(279 downto 272);
    pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Beam_Weighting_Select := bitvector(283 downto 280);
    pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Ramping_Time := bitvector(287 downto 284);
    pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Battery_Voltage := bitvector(303 downto 288);
    pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Stave_Selection_Number := bitvector(307 downto 304);
    pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Reserved_1 := bitvector(308);
    pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Reserved_2 := bitvector(309);
    pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Test_Mode := bitvector(310);
    pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Stave_Tx_Mode := bitvector(311);
    pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Stave_Weight := bitvector(319 downto 312);
    --  end record;  --  PA_Tx_FPGA_CMD_16_Type
    --
    --
    --  type SC_Rx_FPGA_CMD_8_Type is record
    pkt.FPGA_CMD.SC_Rx_FPGA_CMD.TVG := bitvector(131 downto 128);
    pkt.FPGA_CMD.SC_Rx_FPGA_CMD.REC_Mode := bitvector(133 downto 132);
    pkt.FPGA_CMD.SC_Rx_FPGA_CMD.ReservedBit06_0 := bitvector(134);
    pkt.FPGA_CMD.SC_Rx_FPGA_CMD.ReservedBit07_0 := bitvector(135);
    pkt.FPGA_CMD.SC_Rx_FPGA_CMD.PLC := bitvector(136);
    pkt.FPGA_CMD.SC_Rx_FPGA_CMD.DAQ_Count_Reset := bitvector(137);
    pkt.FPGA_CMD.SC_Rx_FPGA_CMD.AD_On := bitvector(138);
    pkt.FPGA_CMD.SC_Rx_FPGA_CMD.Gain_Mode := bitvector(139);
    pkt.FPGA_CMD.SC_Rx_FPGA_CMD.BPF_On_Off := bitvector(140);
    pkt.FPGA_CMD.SC_Rx_FPGA_CMD.Pass_Active := bitvector(141);
    pkt.FPGA_CMD.SC_Rx_FPGA_CMD.Reset := bitvector(142);
    pkt.FPGA_CMD.SC_Rx_FPGA_CMD.Stop_Run := bitvector(143);
    pkt.FPGA_CMD.SC_Rx_FPGA_CMD.REC_On_Off := bitvector(144);
    pkt.FPGA_CMD.SC_Rx_FPGA_CMD.PLC_Mode := bitvector(146 downto 145);
    pkt.FPGA_CMD.SC_Rx_FPGA_CMD.Data_Path := bitvector(147);
    pkt.FPGA_CMD.SC_Rx_FPGA_CMD.ReservedBit04 := bitvector(148);
    pkt.FPGA_CMD.SC_Rx_FPGA_CMD.ReservedBit05 := bitvector(149);
    pkt.FPGA_CMD.SC_Rx_FPGA_CMD.ReservedBit06 := bitvector(150);
    pkt.FPGA_CMD.SC_Rx_FPGA_CMD.ReservedBit07 := bitvector(151);
    pkt.FPGA_CMD.SC_Rx_FPGA_CMD.Gain := bitvector(159 downto 152);
    pkt.FPGA_CMD.SC_Rx_FPGA_CMD.Reserved := bitvector(191 downto 160);
    --  end record;  --  SC_Rx_FPGA_CMD_8_Type
    --
    --
    --  type FPGA_CMD_36_Type is record
    pkt.FPGA_CMD.Reserved_0 := bitvector(127 downto 96);
    --  bitvector(191 downto 128)
    --  bitvector(319 downto 192)
    --  bitvector(335 downto 320)
    pkt.FPGA_CMD.Reserved_1 := bitvector(383 downto 336);
    --  end record;  --  FPGA_CMD_36_Type
    --
    --  type SCB2SPB_Pkt_300_Type is record
    pkt.Start_Bytes := bitvector(31 downto 0);
    pkt.Count := bitvector(63 downto 32);
    pkt.Command := bitvector(79 downto 64);
    pkt.ACK := bitvector(95 downto 80);
    --  bitvector(383 downto 96)
    --  bitvector(831 downto 384)
    --  bitvector(1151 downto 832)
    --  bitvector(2367 downto 1152)
    pkt.Checksum := bitvector(2383 downto 2368);
    pkt.Stop_Bytes := bitvector(2399 downto 2384);
    --  end record;  --  SCB2SPB_Pkt_300_Type
    --
    
    return pkt;
    --
  end conv_ch_packet;

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
  -- //=============================================================================
  -- //=============================================================================
  -- //=============================================================================
  --
  function conv_ch_bitvector (pkt : SCB2SPB_Pkt_300_Type) return std_logic_vector is
    variable bitvector : std_logic_vector(2399 downto 0);
  begin
    --

    for ch in 1 to 37 loop
      bitvector(ch * 32 - 1 + 1152 downto ch * 32 - 32 + 1152) := pkt.Data.CH_Data(ch);
    end loop;

    --
    --
    --  type Data_152_Type is record
    --  bitvector(2335 downto 1152)
    bitvector(2367 downto 2336) := pkt.Data.Reserved;
    --  end record;  --  Data_152_Type
    --
    --
    --  type Trigger_State_1_Type is record
    bitvector(1104) := pkt.FPGA_State.Trigger_State.TE_TX_TRIG;
    bitvector(1105) := pkt.FPGA_State.Trigger_State.TE_RX_TRIG;
    bitvector(1106) := pkt.FPGA_State.Trigger_State.TX_TRIG;
    bitvector(1107) := pkt.FPGA_State.Trigger_State.TX_P_GATE;
    bitvector(1108) := pkt.FPGA_State.Trigger_State.ReservedBit04;
    bitvector(1109) := pkt.FPGA_State.Trigger_State.ReservedBit05;
    bitvector(1110) := pkt.FPGA_State.Trigger_State.ReservedBit06;
    bitvector(1111) := pkt.FPGA_State.Trigger_State.ReservedBit07;
    --  end record;  --  Trigger_State_1_Type
    --
    --
    --  type SP_Zynq_SelfTest_Result_2_Type is record
    bitvector(992) := pkt.FPGA_State.SP_Zynq_SelfTest_Result.ReservedBit00;
    bitvector(993) := pkt.FPGA_State.SP_Zynq_SelfTest_Result.ReservedBit01;
    bitvector(994) := pkt.FPGA_State.SP_Zynq_SelfTest_Result.ReservedBit02;
    bitvector(995) := pkt.FPGA_State.SP_Zynq_SelfTest_Result.ReservedBit03;
    bitvector(996) := pkt.FPGA_State.SP_Zynq_SelfTest_Result.ReservedBit04;
    bitvector(997) := pkt.FPGA_State.SP_Zynq_SelfTest_Result.ReservedBit05;
    bitvector(998) := pkt.FPGA_State.SP_Zynq_SelfTest_Result.ReservedBit06;
    bitvector(999) := pkt.FPGA_State.SP_Zynq_SelfTest_Result.ReservedBit07;
    bitvector(1000) := pkt.FPGA_State.SP_Zynq_SelfTest_Result.ReservedBit10;
    bitvector(1001) := pkt.FPGA_State.SP_Zynq_SelfTest_Result.ReservedBit11;
    bitvector(1002) := pkt.FPGA_State.SP_Zynq_SelfTest_Result.ReservedBit12;
    bitvector(1003) := pkt.FPGA_State.SP_Zynq_SelfTest_Result.ReservedBit13;
    bitvector(1004) := pkt.FPGA_State.SP_Zynq_SelfTest_Result.ReservedBit14;
    bitvector(1005) := pkt.FPGA_State.SP_Zynq_SelfTest_Result.ReservedBit15;
    bitvector(1006) := pkt.FPGA_State.SP_Zynq_SelfTest_Result.ReservedBit16;
    bitvector(1007) := pkt.FPGA_State.SP_Zynq_SelfTest_Result.ReservedBit17;
    --  end record;  --  SP_Zynq_SelfTest_Result_2_Type
    --
    --
    --  type PA_FPGA_SelfTest_Result_2_Type is record
    bitvector(976) := pkt.FPGA_State.PA_FPGA_SelfTest_Result.PCM_Boot;
    bitvector(977) := pkt.FPGA_State.PA_FPGA_SelfTest_Result.PAM1_Boot;
    bitvector(978) := pkt.FPGA_State.PA_FPGA_SelfTest_Result.PAM2_Boot;
    bitvector(979) := pkt.FPGA_State.PA_FPGA_SelfTest_Result.PAM3_Boot;
    bitvector(980) := pkt.FPGA_State.PA_FPGA_SelfTest_Result.PAM4_Boot;
    bitvector(981) := pkt.FPGA_State.PA_FPGA_SelfTest_Result.PAM5_Boot;
    bitvector(982) := pkt.FPGA_State.PA_FPGA_SelfTest_Result.PAM6_Boot;
    bitvector(983) := pkt.FPGA_State.PA_FPGA_SelfTest_Result.PAM7_Boot;
    bitvector(984) := pkt.FPGA_State.PA_FPGA_SelfTest_Result.CMD_DATA_ERR;
    bitvector(985) := pkt.FPGA_State.PA_FPGA_SelfTest_Result.Temp_warn;
    bitvector(986) := pkt.FPGA_State.PA_FPGA_SelfTest_Result.ReservedBit02;
    bitvector(987) := pkt.FPGA_State.PA_FPGA_SelfTest_Result.ReservedBit03;
    bitvector(988) := pkt.FPGA_State.PA_FPGA_SelfTest_Result.PAB_ST_RESULT;
    bitvector(989) := pkt.FPGA_State.PA_FPGA_SelfTest_Result.ReservedBit05;
    bitvector(990) := pkt.FPGA_State.PA_FPGA_SelfTest_Result.ReservedBit06;
    bitvector(991) := pkt.FPGA_State.PA_FPGA_SelfTest_Result.ReservedBit07;
    --  end record;  --  PA_FPGA_SelfTest_Result_2_Type
    --
    --
    --  type SC_FPGA_SelfTest_Result_2_Type is record
    bitvector(960) := pkt.FPGA_State.SC_FPGA_SelfTest_Result.SC_MEM;
    bitvector(961) := pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit01;
    bitvector(962) := pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit02;
    bitvector(963) := pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit03;
    bitvector(964) := pkt.FPGA_State.SC_FPGA_SelfTest_Result.SC_FPGA;
    bitvector(965) := pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit05;
    bitvector(966) := pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit06;
    bitvector(967) := pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit07;
    bitvector(968) := pkt.FPGA_State.SC_FPGA_SelfTest_Result.SC_GTP;
    bitvector(969) := pkt.FPGA_State.SC_FPGA_SelfTest_Result.SC_LVDS;
    bitvector(970) := pkt.FPGA_State.SC_FPGA_SelfTest_Result.SC_UART;
    bitvector(971) := pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit13;
    bitvector(972) := pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit14;
    bitvector(973) := pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit15;
    bitvector(974) := pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit16;
    bitvector(975) := pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit17;
    --  end record;  --  SC_FPGA_SelfTest_Result_2_Type
    --
    --
    --  type FPGA_Zynq_Control_1_Type is record
    bitvector(872) := pkt.FPGA_State.FPGA_Zynq_Control.PLC_State;
    bitvector(873) := pkt.FPGA_State.FPGA_Zynq_Control.DAQ_Count_Reset;
    bitvector(874) := pkt.FPGA_State.FPGA_Zynq_Control.AD_On_Result;
    bitvector(875) := pkt.FPGA_State.FPGA_Zynq_Control.ReservedBit03;
    bitvector(876) := pkt.FPGA_State.FPGA_Zynq_Control.ReservedBit04;
    bitvector(877) := pkt.FPGA_State.FPGA_Zynq_Control.SC_FPGA_Reset;
    bitvector(878) := pkt.FPGA_State.FPGA_Zynq_Control.PA_FPGA_Reset;
    bitvector(879) := pkt.FPGA_State.FPGA_Zynq_Control.Ping_On_Off;
    --  end record;  --  FPGA_Zynq_Control_1_Type
    --
    --
    --  type FPGA_State_40_Type is record
    bitvector(863 downto 832) := pkt.FPGA_State.DAQCounter;
    bitvector(871 downto 864) := pkt.FPGA_State.SC_GainValue;
    --  bitvector(879 downto 872)
    bitvector(887 downto 880) := pkt.FPGA_State.PA_FPGA_Temperature;
    bitvector(895 downto 888) := pkt.FPGA_State.SC_FPGA_Temperature;
    bitvector(903 downto 896) := pkt.FPGA_State.SP_AH_Zynq_Temperature;
    bitvector(911 downto 904) := pkt.FPGA_State.SP_P1_Zynq_Temperature;
    bitvector(919 downto 912) := pkt.FPGA_State.SP_P2_Zynq_Temperature;
    bitvector(927 downto 920) := pkt.FPGA_State.SC2SP_GTP_ERR;
    bitvector(935 downto 928) := pkt.FPGA_State.AH2P1_GTP_ERR;
    bitvector(943 downto 936) := pkt.FPGA_State.AH2P2_GTP_ERR;
    bitvector(951 downto 944) := pkt.FPGA_State.P12AH_GTP_ERR;
    bitvector(959 downto 952) := pkt.FPGA_State.P22AH_GTP_ERR;
    --  bitvector(975 downto 960)
    --  bitvector(991 downto 976)
    --  bitvector(1007 downto 992)
    bitvector(1023 downto 1008) := pkt.FPGA_State.TX_Voltage_Sample1;
    bitvector(1039 downto 1024) := pkt.FPGA_State.TX_Voltage_Sample2;
    bitvector(1055 downto 1040) := pkt.FPGA_State.TX_DC_Voltage_Sample1;
    bitvector(1071 downto 1056) := pkt.FPGA_State.TX_DC_Voltage_Sample2;
    bitvector(1087 downto 1072) := pkt.FPGA_State.TX_DC_Current_Sample1;
    bitvector(1103 downto 1088) := pkt.FPGA_State.TX_DC_Current_Sample2;
    --  bitvector(1111 downto 1104)
    bitvector(1151 downto 1112) := pkt.FPGA_State.Reserved_9;
    --  end record;  --  FPGA_State_40_Type
    --
    --
    --  type GC_Event_4_2_Type is record
    bitvector(496) := pkt.GC_INFO.GC_Event_4.Enable;
    bitvector(497) := pkt.GC_INFO.GC_Event_4.Detect;
    bitvector(498) := pkt.GC_INFO.GC_Event_4.Closein;
    bitvector(499) := pkt.GC_INFO.GC_Event_4.Fail;
    bitvector(500) := pkt.GC_INFO.GC_Event_4.ESAD_Chk;
    bitvector(501) := pkt.GC_INFO.GC_Event_4.ESAD_HV;
    bitvector(502) := pkt.GC_INFO.GC_Event_4.ESAD_Power;
    bitvector(503) := pkt.GC_INFO.GC_Event_4.ReservedBit07;
    bitvector(504) := pkt.GC_INFO.GC_Event_4.ReservedBit08;
    bitvector(505) := pkt.GC_INFO.GC_Event_4.ReservedBit09;
    bitvector(506) := pkt.GC_INFO.GC_Event_4.ReservedBit10;
    bitvector(507) := pkt.GC_INFO.GC_Event_4.ReservedBit11;
    bitvector(508) := pkt.GC_INFO.GC_Event_4.Leakage_Det;
    bitvector(509) := pkt.GC_INFO.GC_Event_4.ReservedBit13;
    bitvector(510) := pkt.GC_INFO.GC_Event_4.ReservedBit14;
    bitvector(511) := pkt.GC_INFO.GC_Event_4.M_Stop;
    --  end record;  --  GC_Event_4_2_Type
    --
    --
    --  type GC_Event_3_2_Type is record
    bitvector(483 downto 480) := pkt.GC_INFO.GC_Event_3.Beam_Steering;
    bitvector(484) := pkt.GC_INFO.GC_Event_3.ReservedBit04;
    bitvector(485) := pkt.GC_INFO.GC_Event_3.ReservedBit05;
    bitvector(486) := pkt.GC_INFO.GC_Event_3.ReservedBit06;
    bitvector(487) := pkt.GC_INFO.GC_Event_3.ReservedBit07;
    bitvector(488) := pkt.GC_INFO.GC_Event_3.ReservedBit08;
    bitvector(489) := pkt.GC_INFO.GC_Event_3.ReservedBit09;
    bitvector(490) := pkt.GC_INFO.GC_Event_3.ReservedBit10;
    bitvector(491) := pkt.GC_INFO.GC_Event_3.ReservedBit11;
    bitvector(492) := pkt.GC_INFO.GC_Event_3.ReservedBit12;
    bitvector(493) := pkt.GC_INFO.GC_Event_3.ReservedBit13;
    bitvector(494) := pkt.GC_INFO.GC_Event_3.ReservedBit14;
    bitvector(495) := pkt.GC_INFO.GC_Event_3.ReservedBit15;
    --  end record;  --  GC_Event_3_2_Type
    --
    --
    --  type GC_Event_2_2_Type is record
    bitvector(464) := pkt.GC_INFO.GC_Event_2.Pre_Enable;
    bitvector(465) := pkt.GC_INFO.GC_Event_2.Enable;
    bitvector(466) := pkt.GC_INFO.GC_Event_2.V_Target;
    bitvector(467) := pkt.GC_INFO.GC_Event_2.Speed_Mode1;
    bitvector(468) := pkt.GC_INFO.GC_Event_2.Speed_Mode2;
    bitvector(469) := pkt.GC_INFO.GC_Event_2.Homming_Enable;
    bitvector(470) := pkt.GC_INFO.GC_Event_2.Homming_Mode;
    bitvector(471) := pkt.GC_INFO.GC_Event_2.Inhibit;
    bitvector(472) := pkt.GC_INFO.GC_Event_2.Hold_In;
    bitvector(473) := pkt.GC_INFO.GC_Event_2.Target_Det;
    bitvector(474) := pkt.GC_INFO.GC_Event_2.Target_Loss;
    bitvector(475) := pkt.GC_INFO.GC_Event_2.ACM_Det;
    bitvector(476) := pkt.GC_INFO.GC_Event_2.Pre_ACO_Chk;
    bitvector(477) := pkt.GC_INFO.GC_Event_2.ACO_Det;
    bitvector(478) := pkt.GC_INFO.GC_Event_2.ReservedBit14;
    bitvector(479) := pkt.GC_INFO.GC_Event_2.ReservedBit15;
    --  end record;  --  GC_Event_2_2_Type
    --
    --
    --  type GC_Event_1_2_Type is record
    bitvector(448) := pkt.GC_INFO.GC_Event_1.ReservedBit00;
    bitvector(449) := pkt.GC_INFO.GC_Event_1.HILS_Mode;
    bitvector(450) := pkt.GC_INFO.GC_Event_1.EXHD_Mode;
    bitvector(451) := pkt.GC_INFO.GC_Event_1.C_Range;
    bitvector(452) := pkt.GC_INFO.GC_Event_1.E_Range;
    bitvector(453) := pkt.GC_INFO.GC_Event_1.ReservedBit05;
    bitvector(454) := pkt.GC_INFO.GC_Event_1.Close_In;
    bitvector(455) := pkt.GC_INFO.GC_Event_1.Terminal_Homing;
    bitvector(456) := pkt.GC_INFO.GC_Event_1.Fire;
    bitvector(457) := pkt.GC_INFO.GC_Event_1.EOM;
    bitvector(458) := pkt.GC_INFO.GC_Event_1.Motor_Start;
    bitvector(459) := pkt.GC_INFO.GC_Event_1.Motor_Stop;
    bitvector(460) := pkt.GC_INFO.GC_Event_1.Ceiling_Det;
    bitvector(461) := pkt.GC_INFO.GC_Event_1.Floor_Det;
    bitvector(462) := pkt.GC_INFO.GC_Event_1.Surface_Det;
    bitvector(463) := pkt.GC_INFO.GC_Event_1.EOR;
    --  end record;  --  GC_Event_1_2_Type
    --
    --
    --  type GC_Command_2_Type is record
    bitvector(416) := pkt.GC_INFO.GC_Command.PLC;
    bitvector(417) := pkt.GC_INFO.GC_Command.AD_On;
    bitvector(418) := pkt.GC_INFO.GC_Command.ReservedBit02;
    bitvector(419) := pkt.GC_INFO.GC_Command.ReservedBit03;
    bitvector(420) := pkt.GC_INFO.GC_Command.Pre_Enable;
    bitvector(421) := pkt.GC_INFO.GC_Command.Enable;
    bitvector(422) := pkt.GC_INFO.GC_Command.ReservedBit06;
    bitvector(423) := pkt.GC_INFO.GC_Command.ReservedBit07;
    bitvector(424) := pkt.GC_INFO.GC_Command.Salvo_On;
    bitvector(425) := pkt.GC_INFO.GC_Command.Band_Sel;
    bitvector(426) := pkt.GC_INFO.GC_Command.Mode_Set;
    bitvector(427) := pkt.GC_INFO.GC_Command.PRI_Start;
    bitvector(428) := pkt.GC_INFO.GC_Command.Test_Mode_Set;
    bitvector(429) := pkt.GC_INFO.GC_Command.REC_Disable_Set;
    bitvector(430) := pkt.GC_INFO.GC_Command.Test_Trig;
    bitvector(431) := pkt.GC_INFO.GC_Command.ReservedBit15;
    --  end record;  --  GC_Command_2_Type
    --
    --
    --  type GC_INFO_56_Type is record
    bitvector(415 downto 384) := pkt.GC_INFO.GC_Count;
    --  bitvector(431 downto 416)
    bitvector(447 downto 432) := pkt.GC_INFO.Reserved_0;
    --  bitvector(463 downto 448)
    --  bitvector(479 downto 464)
    --  bitvector(495 downto 480)
    --  bitvector(511 downto 496)
    bitvector(519 downto 512) := pkt.GC_INFO.Speed_Mode;
    bitvector(527 downto 520) := pkt.GC_INFO.Search_Pattern;
    bitvector(535 downto 528) := pkt.GC_INFO.Pulse_Freq;
    bitvector(543 downto 536) := pkt.GC_INFO.Pulse_Type;
    bitvector(551 downto 544) := pkt.GC_INFO.Pulse_Length;
    bitvector(559 downto 552) := pkt.GC_INFO.PRE_Pulse;
    bitvector(567 downto 560) := pkt.GC_INFO.PRI;
    bitvector(575 downto 568) := pkt.GC_INFO.Beam_Steering;
    bitvector(591 downto 576) := pkt.GC_INFO.BAT_VOLT;
    bitvector(639 downto 592) := pkt.GC_INFO.Reserved_1;
    bitvector(671 downto 640) := pkt.GC_INFO.TORP_N;
    bitvector(703 downto 672) := pkt.GC_INFO.TORP_E;
    bitvector(719 downto 704) := pkt.GC_INFO.TORP_D;
    bitvector(735 downto 720) := pkt.GC_INFO.TORP_Roll;
    bitvector(751 downto 736) := pkt.GC_INFO.TORP_Pitch;
    bitvector(767 downto 752) := pkt.GC_INFO.TORP_Yaw;
    bitvector(775 downto 768) := pkt.GC_INFO.ACT_On_Off;
    bitvector(831 downto 776) := pkt.GC_INFO.Reserved_2;
    --  end record;  --  GC_INFO_56_Type
    --
    --
    --  type Save_Beam_INFO_2_Type is record
    bitvector(320) := pkt.FPGA_CMD.Save_Beam_INFO.Save_R3;
    bitvector(321) := pkt.FPGA_CMD.Save_Beam_INFO.Save_R2;
    bitvector(322) := pkt.FPGA_CMD.Save_Beam_INFO.Save_R1;
    bitvector(323) := pkt.FPGA_CMD.Save_Beam_INFO.Save_R0;
    bitvector(324) := pkt.FPGA_CMD.Save_Beam_INFO.Save_C;
    bitvector(325) := pkt.FPGA_CMD.Save_Beam_INFO.Save_L0;
    bitvector(326) := pkt.FPGA_CMD.Save_Beam_INFO.Save_L1;
    bitvector(327) := pkt.FPGA_CMD.Save_Beam_INFO.Save_L2;
    bitvector(328) := pkt.FPGA_CMD.Save_Beam_INFO.Optic_On;
    bitvector(329) := pkt.FPGA_CMD.Save_Beam_INFO.Ethernet_On;
    bitvector(331 downto 330) := pkt.FPGA_CMD.Save_Beam_INFO.TE_Data_Input;
    bitvector(332) := pkt.FPGA_CMD.Save_Beam_INFO.ReservedBit04;
    bitvector(333) := pkt.FPGA_CMD.Save_Beam_INFO.ReservedBit05;
    bitvector(334) := pkt.FPGA_CMD.Save_Beam_INFO.ReservedBit06;
    bitvector(335) := pkt.FPGA_CMD.Save_Beam_INFO.Save_L3;
    --  end record;  --  Save_Beam_INFO_2_Type
    --
    --
    --  type PA_Tx_FPGA_CMD_16_Type is record
    bitvector(197 downto 192) := pkt.FPGA_CMD.PA_Tx_FPGA_CMD.PRI;
    bitvector(198) := pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx_Reset;
    bitvector(199) := pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx_Trigger;
    bitvector(206 downto 200) := pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx_Pulse_Interval;
    bitvector(207) := pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Number_of_Tx;
    bitvector(215 downto 208) := pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Beam_Steering_Angle;
    bitvector(222 downto 216) := pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx1_Pulse_Length;
    bitvector(223) := pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx1_Type;
    bitvector(238 downto 224) := pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx1_Start_Frequency;
    bitvector(239) := pkt.FPGA_CMD.PA_Tx_FPGA_CMD.ReservedBit07_1;
    bitvector(247 downto 240) := pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx1_Sweep_Frequency;
    bitvector(254 downto 248) := pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx2_Pulse_Length;
    bitvector(255) := pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx2_Type;
    bitvector(270 downto 256) := pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx2_Start_Frequency;
    bitvector(271) := pkt.FPGA_CMD.PA_Tx_FPGA_CMD.ReservedBit07_2;
    bitvector(279 downto 272) := pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx2_Sweep_Frequency;
    bitvector(283 downto 280) := pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Beam_Weighting_Select;
    bitvector(287 downto 284) := pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Ramping_Time;
    bitvector(303 downto 288) := pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Battery_Voltage;
    bitvector(307 downto 304) := pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Stave_Selection_Number;
    bitvector(308) := pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Reserved_1;
    bitvector(309) := pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Reserved_2;
    bitvector(310) := pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Test_Mode;
    bitvector(311) := pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Stave_Tx_Mode;
    bitvector(319 downto 312) := pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Stave_Weight;
    --  end record;  --  PA_Tx_FPGA_CMD_16_Type
    --
    --
    --  type SC_Rx_FPGA_CMD_8_Type is record
    bitvector(131 downto 128) := pkt.FPGA_CMD.SC_Rx_FPGA_CMD.TVG;
    bitvector(133 downto 132) := pkt.FPGA_CMD.SC_Rx_FPGA_CMD.REC_Mode;
    bitvector(134) := pkt.FPGA_CMD.SC_Rx_FPGA_CMD.ReservedBit06_0;
    bitvector(135) := pkt.FPGA_CMD.SC_Rx_FPGA_CMD.ReservedBit07_0;
    bitvector(136) := pkt.FPGA_CMD.SC_Rx_FPGA_CMD.PLC;
    bitvector(137) := pkt.FPGA_CMD.SC_Rx_FPGA_CMD.DAQ_Count_Reset;
    bitvector(138) := pkt.FPGA_CMD.SC_Rx_FPGA_CMD.AD_On;
    bitvector(139) := pkt.FPGA_CMD.SC_Rx_FPGA_CMD.Gain_Mode;
    bitvector(140) := pkt.FPGA_CMD.SC_Rx_FPGA_CMD.BPF_On_Off;
    bitvector(141) := pkt.FPGA_CMD.SC_Rx_FPGA_CMD.Pass_Active;
    bitvector(142) := pkt.FPGA_CMD.SC_Rx_FPGA_CMD.Reset;
    bitvector(143) := pkt.FPGA_CMD.SC_Rx_FPGA_CMD.Stop_Run;
    bitvector(144) := pkt.FPGA_CMD.SC_Rx_FPGA_CMD.REC_On_Off;
    bitvector(146 downto 145) := pkt.FPGA_CMD.SC_Rx_FPGA_CMD.PLC_Mode;
    bitvector(147) := pkt.FPGA_CMD.SC_Rx_FPGA_CMD.Data_Path;
    bitvector(148) := pkt.FPGA_CMD.SC_Rx_FPGA_CMD.ReservedBit04;
    bitvector(149) := pkt.FPGA_CMD.SC_Rx_FPGA_CMD.ReservedBit05;
    bitvector(150) := pkt.FPGA_CMD.SC_Rx_FPGA_CMD.ReservedBit06;
    bitvector(151) := pkt.FPGA_CMD.SC_Rx_FPGA_CMD.ReservedBit07;
    bitvector(159 downto 152) := pkt.FPGA_CMD.SC_Rx_FPGA_CMD.Gain;
    bitvector(191 downto 160) := pkt.FPGA_CMD.SC_Rx_FPGA_CMD.Reserved;
    --  end record;  --  SC_Rx_FPGA_CMD_8_Type
    --
    --
    --  type FPGA_CMD_36_Type is record
    bitvector(127 downto 96) := pkt.FPGA_CMD.Reserved_0;
    --  bitvector(191 downto 128)
    --  bitvector(319 downto 192)
    --  bitvector(335 downto 320)
    bitvector(383 downto 336) := pkt.FPGA_CMD.Reserved_1;
    --  end record;  --  FPGA_CMD_36_Type
    --
    --
    --  type SCB2SPB_Pkt_300_Type is record
    bitvector(31 downto 0) := pkt.Start_Bytes;
    bitvector(63 downto 32) := pkt.Count;
    bitvector(79 downto 64) := pkt.Command;
    bitvector(95 downto 80) := pkt.ACK;
    --  bitvector(383 downto 96)
    --  bitvector(831 downto 384)
    --  bitvector(1151 downto 832)
    --  bitvector(2367 downto 1152)
    bitvector(2383 downto 2368) := pkt.Checksum;
    bitvector(2399 downto 2384) := pkt.Stop_Bytes;
    --  end record;  --  SCB2SPB_Pkt_300_Type
    --
    
    return bitvector;
    --
  end conv_ch_bitvector;
  --
  --
  -- //=============================================================================
  -- //=============================================================================
  -- //=============================================================================
end package body SCB2SPB_Type;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================