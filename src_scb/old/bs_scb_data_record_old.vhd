-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
--
-- use work.SCB2SPB_Type.all; -- BS2_protocol_V0.56_20231121

-- signal Chan_Pkt : SC2SP_Pkt_300_Type;
-- signal Chan_Str : std_logic_vector(2399 downto 0) := (others => '0');
--
--
-- Chan_Str <= conv_ch_bitvector(Chan_Pkt);
-- Chan_Pkt <= conv_ch_packet(Chan_Str);
--


--
package SC2SP_Type is
  --
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
  type BS_1_BYTE_Type is array(7 downto 0) of std_logic;
  type BS_2_BYTE_Type is array(15 downto 0) of std_logic;
  type BS_4_BYTE_Type is array(31 downto 0) of std_logic;
  type CH_Data_Type is array (natural range 1 to 37) of std_logic_vector(31 downto 0);
  --
  --
  type SC_Rx_FPGA_CMD_4_Type is record
    TVG : std_logic_vector(3 downto 0);
    REC_Mode : std_logic_vector(1 downto 0);
    ReservedBit06_1 : std_logic;
    ReservedBit07_1 : std_logic;
    --
    PLC : std_logic;
    DAQ_Count_Reset : std_logic;
    AD_On : std_logic;
    Gain_Mode : std_logic;
    BPF_On_Off : std_logic;
    Pass_Active : std_logic;
    Reset : std_logic;
    Stop_Run : std_logic;
    --
    REC_On_Off : std_logic;
    PLC_Mode : std_logic_vector(1 downto 0);
    Data_Path : std_logic;
    ReservedBit04 : std_logic;
    ReservedBit05 : std_logic;
    ReservedBit06 : std_logic;
    ReservedBit07 : std_logic;
    --
    Gain : std_logic_vector(7 downto 0);
  end record; -- SC_Rx_FPGA_CMD_4_Type
  --
  type PA_Tx_FPGA_CMD_16_Type is record
    PRI : std_logic_vector(5 downto 0);
    Tx_Trigger : std_logic;
    Tx_Reset : std_logic;
    --
    Tx_Pulse_Interval : std_logic_vector(6 downto 0);
    Number_of_Tx : std_logic;
    --
    Beam_Steering_Angle : std_logic_vector(7 downto 0);
    --
    Tx1_Pulse_Length : std_logic_vector(6 downto 0);
    Tx1_Type : std_logic;
    --
    Tx1_Start_Frequency_I7_0I : std_logic_vector(7 downto 0);
    --
    Tx1_Start_Frequency_I14_8I : std_logic_vector(6 downto 0);
    ReservedBit07_1 : std_logic;
    --
    Tx1_Sweep_Frequency : std_logic_vector(7 downto 0);
    --
    Tx2_Pulse_Length : std_logic_vector(6 downto 0);
    Tx2_Type : std_logic;
    --
    Tx2_Start_Frequency_I7_0I : std_logic_vector(7 downto 0);
    --
    Tx2_Start_Frequency_I14_8I : std_logic_vector(6 downto 0);
    ReservedBit07_2 : std_logic;
    --
    Tx2_Sweep_Frequency : std_logic_vector(7 downto 0);
    --
    Beam_Weighting_Select : std_logic_vector(3 downto 0);
    Ramping_Time : std_logic_vector(3 downto 0);
    --
    Battery_Voltage_I7_0I : std_logic_vector(7 downto 0);
    --
    Battery_Voltage_I15_8I : std_logic_vector(7 downto 0);
    --
    Stave_Selection_Number : std_logic_vector(3 downto 0);
    Reserved_1 : std_logic;
    Reserved_2 : std_logic;
    Test_Mode : std_logic;
    Stave_Tx_Mode : std_logic;
    --
    Stave_Weight : std_logic_vector(7 downto 0);
  end record; -- PA_Tx_FPGA_CMD_16_Type
  --
  type SP_ZYNQ_CMD_2_Type is record
    Save_R3 : std_logic;
    Save_R2 : std_logic;
    Save_R1 : std_logic;
    Save_R0 : std_logic;
    Save_C : std_logic;
    Save_L0 : std_logic;
    Save_L1 : std_logic;
    Save_L2 : std_logic;
    --
    Optic_On : std_logic;
    Ethernet_On : std_logic;
    TE_Data_Input : std_logic_vector(1 downto 0);
    ReservedBit04 : std_logic;
    ReservedBit05 : std_logic;
    ReservedBit06 : std_logic;
    Save_L3 : std_logic;
  end record; -- SP_ZYNQ_CMD_2_Type
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
    --
    Salvo_On : std_logic;
    Band_Sel : std_logic;
    Mode_Set : std_logic;
    PRI_Start : std_logic;
    Test_Mode_Set : std_logic;
    REC_Disable_Set : std_logic;
    Test_Trig : std_logic;
    ReservedBit15 : std_logic;
  end record; -- GC_Command_2_Type
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
    --
    Fire : std_logic;
    EOM : std_logic;
    Motor_Start : std_logic;
    Motor_Stop : std_logic;
    Ceiling_Det : std_logic;
    Floor_Det : std_logic;
    Surface_Det : std_logic;
    EOR : std_logic;
  end record; -- GC_Event_1_2_Type
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
    --
    Hold_In : std_logic;
    Target_Det : std_logic;
    Target_Loss : std_logic;
    ACM_Det : std_logic;
    Pre_ACO_Chk : std_logic;
    ACO_Det : std_logic;
    ReservedBit14 : std_logic;
    ReservedBit15 : std_logic;
  end record; -- GC_Event_2_2_Type
  --

  type GC_Event_3_2_Type is record
    Beam_Steering : std_logic_vector(3 downto 0);
    ReservedBit04 : std_logic;
    ReservedBit05 : std_logic;
    ReservedBit06 : std_logic;
    ReservedBit07 : std_logic;
    --
    ReservedBit08 : std_logic;
    ReservedBit09 : std_logic;
    ReservedBit10 : std_logic;
    ReservedBit11 : std_logic;
    ReservedBit12 : std_logic;
    ReservedBit13 : std_logic;
    ReservedBit14 : std_logic;
    ReservedBit15 : std_logic;
  end record; -- GC_Event_3_2_Type
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
    --
    ReservedBit08 : std_logic;
    ReservedBit09 : std_logic;
    ReservedBit10 : std_logic;
    ReservedBit11 : std_logic;
    Leakage_Det : std_logic;
    ReservedBit13 : std_logic;
    ReservedBit14 : std_logic;
    M_Stop : std_logic;
  end record; -- GC_Event_4_2_Type
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
  end record; -- FPGA_Zynq_Control_1_Type
  --
  type SC_FPGA_SelfTest_Result_2_Type is record
    SC_GTP : std_logic;
    SC_LVDS : std_logic;
    SC_UART : std_logic;
    ReservedBit03 : std_logic;
    ReservedBit04 : std_logic;
    ReservedBit05 : std_logic;
    ReservedBit06 : std_logic;
    ReservedBit07 : std_logic;
    --
    SC_MEM : std_logic;
    ReservedBit09 : std_logic;
    ReservedBit10 : std_logic;
    ReservedBit11 : std_logic;
    SC_FPGA : std_logic;
    ReservedBit13 : std_logic;
    ReservedBit14 : std_logic;
    ReservedBit15 : std_logic;
  end record; -- SC_FPGA_SelfTest_Result_2_Type
  --
  type PA_FPGA_SelfTest_Result_2_Type is record
    CMD_DATA_ERR : std_logic;
    Temp_warn : std_logic;
    ReservedBit02 : std_logic;
    ReservedBit03 : std_logic;
    PAB_ST_RESULT : std_logic;
    ReservedBit05 : std_logic;
    ReservedBit06 : std_logic;
    ReservedBit07 : std_logic;
    --
    PCM_Boot : std_logic;
    PAM1_Boot : std_logic;
    PAM2_Boot : std_logic;
    PAM3_Boot : std_logic;
    PAM4_Boot : std_logic;
    PAM5_Boot : std_logic;
    PAM6_Boot : std_logic;
    PAM7_Boot : std_logic;
  end record; -- PA_FPGA_SelfTest_Result_2_Type
  --
  type Reserved_SP_Zynq_SelfTest_Result_2_Type is record
    ReservedBit00 : std_logic;
    ReservedBit01 : std_logic;
    ReservedBit02 : std_logic;
    ReservedBit03 : std_logic;
    ReservedBit04 : std_logic;
    ReservedBit05 : std_logic;
    ReservedBit06 : std_logic;
    ReservedBit07 : std_logic;
    --
    ReservedBit08 : std_logic;
    ReservedBit09 : std_logic;
    ReservedBit10 : std_logic;
    ReservedBit11 : std_logic;
    ReservedBit12 : std_logic;
    ReservedBit13 : std_logic;
    ReservedBit14 : std_logic;
    ReservedBit15 : std_logic;
  end record; -- Reserved_SP_Zynq_SelfTest_Result_2_Type
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
  end record; -- Trigger_State_1_Type
  --
  type BS_DATA_152_Type is record
    CH_Data : CH_Data_Type;
    Reserved : std_logic_vector(31 downto 0);
  end record; -- BS_DATA_152_Type
  --  
  type GC_INFO_56_Type is record
    GC_Count : std_logic_vector(31 downto 0);
    GC_Command : GC_Command_2_Type;
    Reserved_1 : std_logic_vector(15 downto 0);
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
    Reserved_2 : std_logic_vector(15 downto 0);
    Reserved_3 : std_logic_vector(15 downto 0);
    Reserved_4 : std_logic_vector(15 downto 0);
    TORP_N : std_logic_vector(31 downto 0);
    TORP_E : std_logic_vector(31 downto 0);
    TORP_D : std_logic_vector(15 downto 0);
    TORP_Roll : std_logic_vector(15 downto 0);
    TORP_Pitch : std_logic_vector(15 downto 0);
    TORP_Yaw : std_logic_vector(15 downto 0);
    ACT_On_Off : std_logic_vector(7 downto 0);
    Reserved_5 : std_logic_vector(7 downto 0);
    Reserved_6 : std_logic_vector(15 downto 0);
    Reserved_7 : std_logic_vector(15 downto 0);
    Reserved_8 : std_logic_vector(15 downto 0);
  end record; -- GC_INFO_56_Type
  --
  type FPGA_State_40_Type is record
    DAQCounter : std_logic_vector(31 downto 0);
    SC_GainValue : std_logic_vector(7 downto 0);
    FPGA_Zynq_Control : FPGA_Zynq_Control_1_Type;
    PA_FPGA_Temperature : std_logic_vector(7 downto 0);
    SC_FPGA_Temperature : std_logic_vector(7 downto 0);
    Reserved_1 : std_logic_vector(15 downto 0);
    Reserved_2 : std_logic_vector(15 downto 0);
    Reserved_3 : std_logic_vector(15 downto 0);
    Reserved_4 : std_logic_vector(15 downto 0);
    SC_FPGA_SelfTest_Result : SC_FPGA_SelfTest_Result_2_Type;
    PA_FPGA_SelfTest_Result : PA_FPGA_SelfTest_Result_2_Type;
    Reserved_SP_Zynq_SelfTest_Result : Reserved_SP_Zynq_SelfTest_Result_2_Type;
    TX_Voltage_Sample1 : std_logic_vector(15 downto 0);
    TX_Voltage_Sample2 : std_logic_vector(15 downto 0);
    TX_DC_Voltage_Sample1 : std_logic_vector(15 downto 0);
    TX_DC_Voltage_Sample2 : std_logic_vector(15 downto 0);
    TX_DC_Current_Sample1 : std_logic_vector(15 downto 0);
    TX_DC_Current_Sample2 : std_logic_vector(15 downto 0);
    Trigger_State : Trigger_State_1_Type;
    Reserved_5 : std_logic_vector(7 downto 0);
    Reserved_6 : std_logic_vector(15 downto 0);
    Reserved_7 : std_logic_vector(15 downto 0);
  end record; -- FPGA_State_40_Type
  --
  type FPGA_CMD_36_Type is record
    Reserved_1 : std_logic_vector(15 downto 0);
    Reserved_2 : std_logic_vector(15 downto 0);
    SC_Rx_FPGA_CMD : SC_Rx_FPGA_CMD_4_Type;
    Reserved_3 : std_logic_vector(15 downto 0);
    Reserved_4 : std_logic_vector(15 downto 0);
    PA_Tx_FPGA_CMD : PA_Tx_FPGA_CMD_16_Type;
    SP_ZYNQ_CMD : SP_ZYNQ_CMD_2_Type;
    Reserved_5 : std_logic_vector(15 downto 0);
    Reserved_6 : std_logic_vector(15 downto 0);
    Reserved_7 : std_logic_vector(15 downto 0);
  end record; -- FPGA_CMD_36_Type
  --
  --
  type SC2SP_Pkt_300_Type is record
    Start_Bytes : std_logic_vector(31 downto 0);
    Count : std_logic_vector(31 downto 0);
    Command : std_logic_vector(15 downto 0);
    ACK : std_logic_vector(15 downto 0);
    FPGA_CMD : FPGA_CMD_36_Type;
    GC_INFO : GC_INFO_56_Type;
    FPGA_State : FPGA_State_40_Type;
    BS_DATA : BS_DATA_152_Type;
    Checksum : std_logic_vector(15 downto 0);
    Stop_Bytes : std_logic_vector(15 downto 0);
  end record; -- SC2SP_Pkt_300_Type
  --
  -- //=============================================================================
  -- //=============================================================================
  -- //=============================================================================
  --
  constant SC_Rx_FPGA_CMD_4_i : SC_Rx_FPGA_CMD_4_Type := (
    TVG => "0000",
    REC_Mode => "00",
    ReservedBit06_1 => '0',
    ReservedBit07_1 => '0',
    --
    PLC => '0',
    DAQ_Count_Reset => '0',
    AD_On => '0',
    Gain_Mode => '0',
    BPF_On_Off => '0',
    Pass_Active => '0',
    Reset => '0',
    Stop_Run => '0',
    --
    REC_On_Off => '0',
    PLC_Mode => "00",
    Data_Path => '0',
    ReservedBit04 => '0',
    ReservedBit05 => '0',
    ReservedBit06 => '0',
    ReservedBit07 => '0',
    --
    Gain => "00000000"
  );
  --
  constant PA_Tx_FPGA_CMD_16_i : PA_Tx_FPGA_CMD_16_Type := (
    PRI => "000000",
    Tx_Trigger => '0',
    Tx_Reset => '0',
    --
    Tx_Pulse_Interval => "0000000",
    Number_of_Tx => '0',
    --
    Beam_Steering_Angle => "00000000",
    --
    Tx1_Pulse_Length => "0000000",
    Tx1_Type => '0',
    --
    Tx1_Start_Frequency_I7_0I => "00000000",
    --
    Tx1_Start_Frequency_I14_8I => "0000000",
    ReservedBit07_1 => '0',
    --
    Tx1_Sweep_Frequency => "00000000",
    --
    Tx2_Pulse_Length => "0000000",
    Tx2_Type => '0',
    --
    Tx2_Start_Frequency_I7_0I => "00000000",
    --
    Tx2_Start_Frequency_I14_8I => "0000000",
    ReservedBit07_2 => '0',
    --
    Tx2_Sweep_Frequency => "00000000",
    --
    Beam_Weighting_Select => "0000",
    Ramping_Time => "0000",
    --
    Battery_Voltage_I7_0I => "00000000",
    --
    Battery_Voltage_I15_8I => "00000000",
    --
    Stave_Selection_Number => "0000",
    Reserved_1 => '0',
    Reserved_2 => '0',
    Test_Mode => '0',
    Stave_Tx_Mode => '0',
    --
    Stave_Weight => "00000000"
  );
  --
  constant SP_ZYNQ_CMD_2_i : SP_ZYNQ_CMD_2_Type := (
    Save_R3 => '0',
    Save_R2 => '0',
    Save_R1 => '0',
    Save_R0 => '0',
    Save_C => '0',
    Save_L0 => '0',
    Save_L1 => '0',
    Save_L2 => '0',
    --
    Optic_On => '0',
    Ethernet_On => '0',
    TE_Data_Input => "00",
    ReservedBit04 => '0',
    ReservedBit05 => '0',
    ReservedBit06 => '0',
    Save_L3 => '0'
  );
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
    --
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
  constant GC_Event_1_2_i : GC_Event_1_2_Type := (
    ReservedBit00 => '0',
    HILS_Mode => '0',
    EXHD_Mode => '0',
    C_Range => '0',
    E_Range => '0',
    ReservedBit05 => '0',
    Close_In => '0',
    Terminal_Homing => '0',
    --
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
  constant GC_Event_2_2_i : GC_Event_2_2_Type := (
    Pre_Enable => '0',
    Enable => '0',
    V_Target => '0',
    Speed_Mode1 => '0',
    Speed_Mode2 => '0',
    Homming_Enable => '0',
    Homming_Mode => '0',
    Inhibit => '0',
    --
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

  constant GC_Event_3_2_i : GC_Event_3_2_Type := (
    Beam_Steering => "0000",
    ReservedBit04 => '0',
    ReservedBit05 => '0',
    ReservedBit06 => '0',
    ReservedBit07 => '0',
    --
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
  constant GC_Event_4_2_i : GC_Event_4_2_Type := (
    Enable => '0',
    Detect => '0',
    Closein => '0',
    Fail => '0',
    ESAD_Chk => '0',
    ESAD_HV => '0',
    ESAD_Power => '0',
    ReservedBit07 => '0',
    --
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
  constant SC_FPGA_SelfTest_Result_2_i : SC_FPGA_SelfTest_Result_2_Type := (
    SC_GTP => '0',
    SC_LVDS => '0',
    SC_UART => '0',
    ReservedBit03 => '0',
    ReservedBit04 => '0',
    ReservedBit05 => '0',
    ReservedBit06 => '0',
    ReservedBit07 => '0',
    --
    SC_MEM => '0',
    ReservedBit09 => '0',
    ReservedBit10 => '0',
    ReservedBit11 => '0',
    SC_FPGA => '0',
    ReservedBit13 => '0',
    ReservedBit14 => '0',
    ReservedBit15 => '0'
  );
  --
  constant PA_FPGA_SelfTest_Result_2_i : PA_FPGA_SelfTest_Result_2_Type := (
    CMD_DATA_ERR => '0',
    Temp_warn => '0',
    ReservedBit02 => '0',
    ReservedBit03 => '0',
    PAB_ST_RESULT => '0',
    ReservedBit05 => '0',
    ReservedBit06 => '0',
    ReservedBit07 => '0',
    --
    PCM_Boot => '0',
    PAM1_Boot => '0',
    PAM2_Boot => '0',
    PAM3_Boot => '0',
    PAM4_Boot => '0',
    PAM5_Boot => '0',
    PAM6_Boot => '0',
    PAM7_Boot => '0'
  );
  --
  constant Reserved_SP_Zynq_SelfTest_Result_2_i : Reserved_SP_Zynq_SelfTest_Result_2_Type := (
    ReservedBit00 => '0',
    ReservedBit01 => '0',
    ReservedBit02 => '0',
    ReservedBit03 => '0',
    ReservedBit04 => '0',
    ReservedBit05 => '0',
    ReservedBit06 => '0',
    ReservedBit07 => '0',
    --
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
  constant FPGA_CMD_36_i : FPGA_CMD_36_Type := (
    Reserved_1 => X"0000",
    Reserved_2 => X"0000",
    SC_Rx_FPGA_CMD => SC_Rx_FPGA_CMD_4_i,
    Reserved_3 => X"0000",
    Reserved_4 => X"0000",
    PA_Tx_FPGA_CMD => PA_Tx_FPGA_CMD_16_i,
    SP_ZYNQ_CMD => SP_ZYNQ_CMD_2_i,
    Reserved_5 => X"0000",
    Reserved_6 => X"0000",
    Reserved_7 => X"0000"
  );
  --
  constant GC_INFO_56_i : GC_INFO_56_Type := (
    GC_Count => X"00000000",
    GC_Command => GC_Command_2_i,
    Reserved_1 => X"0000",
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
    Reserved_2 => X"0000",
    Reserved_3 => X"0000",
    Reserved_4 => X"0000",
    TORP_N => X"00000000",
    TORP_E => X"00000000",
    TORP_D => X"0000",
    TORP_Roll => X"0000",
    TORP_Pitch => X"0000",
    TORP_Yaw => X"0000",
    ACT_On_Off => X"00",
    Reserved_5 => X"00",
    Reserved_6 => X"0000",
    Reserved_7 => X"0000",
    Reserved_8 => X"0000"
  );
  constant FPGA_State_40_i : FPGA_State_40_Type := (
    DAQCounter => X"00000000",
    SC_GainValue => X"00",
    FPGA_Zynq_Control => FPGA_Zynq_Control_1_i,
    PA_FPGA_Temperature => X"00",
    SC_FPGA_Temperature => X"00",
    Reserved_1 => X"0000",
    Reserved_2 => X"0000",
    Reserved_3 => X"0000",
    Reserved_4 => X"0000",
    SC_FPGA_SelfTest_Result => SC_FPGA_SelfTest_Result_2_i,
    PA_FPGA_SelfTest_Result => PA_FPGA_SelfTest_Result_2_i,
    Reserved_SP_Zynq_SelfTest_Result => Reserved_SP_Zynq_SelfTest_Result_2_i,
    TX_Voltage_Sample1 => X"0000",
    TX_Voltage_Sample2 => X"0000",
    TX_DC_Voltage_Sample1 => X"0000",
    TX_DC_Voltage_Sample2 => X"0000",
    TX_DC_Current_Sample1 => X"0000",
    TX_DC_Current_Sample2 => X"0000",
    Trigger_State => Trigger_State_1_i,
    Reserved_5 => X"00",
    Reserved_6 => X"0000",
    Reserved_7 => X"0000"
  );
  --
  constant CH_Data_i : CH_Data_Type := (
    1 => X"00000000",
    2 => X"00000000",
    others => X"00000000"
  );
  --
  constant BS_DATA_152_i : BS_DATA_152_Type := (
    CH_Data => CH_Data_i, -- CH_Data_Type(1 to 37),
    Reserved => X"00000000"
  );
  --
  constant sc2sp_300_i : SC2SP_Pkt_300_Type := (
    Start_Bytes => X"7F7F7F7F",
    Count => X"00000000",
    Command => X"0000",
    ACK => X"0000",
    FPGA_CMD => FPGA_CMD_36_i,
    GC_INFO => GC_INFO_56_i,
    FPGA_State => FPGA_State_40_i,
    BS_DATA => BS_DATA_152_i,
    Checksum => X"CCCC",
    Stop_Bytes => X"8181"
  );
  --

  function conv_ch_packet (bitvector : std_logic_vector) return SC2SP_Pkt_300_Type;
  function conv_ch_bitvector (pkt : SC2SP_Pkt_300_Type) return std_logic_vector;

end package SC2SP_Type;
package body SC2SP_Type is
  --
  --
  --
  --

  --
  function conv_ch_packet (bitvector : std_logic_vector) return SC2SP_Pkt_300_Type is
    variable pkt : SC2SP_Pkt_300_Type;
  begin
    --
    -- Start_Bytes : BS_4_BYTE_Type; -- 0
    pkt.Start_Bytes := bitvector(31 downto 0); -- : BS_4_BYTE_Type; -- 0
    -- Count : BS_4_BYTE_Type; -- 4
    pkt.Count := bitvector(63 downto 32); -- : BS_4_BYTE_Type; -- 4
    -- Command : BS_2_BYTE_Type; -- 8
    pkt.Command := bitvector(79 downto 64); -- : BS_2_BYTE_Type; -- 8
    -- ACK : BS_2_BYTE_Type; -- 10
    pkt.ACK := bitvector(95 downto 80); -- : BS_2_BYTE_Type; -- 10
    -- type FPGA_CMD_36_Type is record -- 12
    pkt.FPGA_CMD.Reserved_1 := bitvector(111 downto 96); -- : BS_2_BYTE_Type; -- 12
    pkt.FPGA_CMD.Reserved_2 := bitvector(127 downto 112); -- : BS_2_BYTE_Type; -- 14
    -- type SC_Rx_FPGA_CMD_4_Type is record -- 16
    pkt.FPGA_CMD.SC_Rx_FPGA_CMD.TVG := bitvector(131 downto 128); -- : std_logic_vector(3 downto 0);
    pkt.FPGA_CMD.SC_Rx_FPGA_CMD.REC_Mode := bitvector(133 downto 132); -- : std_logic_vector(1 downto 0);
    pkt.FPGA_CMD.SC_Rx_FPGA_CMD.ReservedBit06_1 := bitvector(134); -- : std_logic;
    pkt.FPGA_CMD.SC_Rx_FPGA_CMD.ReservedBit07_1 := bitvector(135); -- : std_logic;
    -- pkt.FPGA_CMD.SC_Rx_FPGA_CMD.-- 17
    pkt.FPGA_CMD.SC_Rx_FPGA_CMD.PLC := bitvector(136); -- : std_logic;
    pkt.FPGA_CMD.SC_Rx_FPGA_CMD.DAQ_Count_Reset := bitvector(137); -- : std_logic;
    pkt.FPGA_CMD.SC_Rx_FPGA_CMD.AD_On := bitvector(138); -- : std_logic;
    pkt.FPGA_CMD.SC_Rx_FPGA_CMD.Gain_Mode := bitvector(139); -- : std_logic;
    pkt.FPGA_CMD.SC_Rx_FPGA_CMD.BPF_On_Off := bitvector(140); -- : std_logic;
    pkt.FPGA_CMD.SC_Rx_FPGA_CMD.Pass_Active := bitvector(141); -- : std_logic;
    pkt.FPGA_CMD.SC_Rx_FPGA_CMD.Reset := bitvector(142); -- : std_logic;
    pkt.FPGA_CMD.SC_Rx_FPGA_CMD.Stop_Run := bitvector(143); -- : std_logic;
    -- pkt.FPGA_CMD.SC_Rx_FPGA_CMD.-- 18
    pkt.FPGA_CMD.SC_Rx_FPGA_CMD.REC_On_Off := bitvector(144); -- : std_logic;
    pkt.FPGA_CMD.SC_Rx_FPGA_CMD.PLC_Mode := bitvector(146 downto 145); -- : std_logic_vector(1 downto 0);
    pkt.FPGA_CMD.SC_Rx_FPGA_CMD.Data_Path := bitvector(147); -- : std_logic;
    pkt.FPGA_CMD.SC_Rx_FPGA_CMD.ReservedBit04 := bitvector(148); -- : std_logic;
    pkt.FPGA_CMD.SC_Rx_FPGA_CMD.ReservedBit05 := bitvector(149); -- : std_logic;
    pkt.FPGA_CMD.SC_Rx_FPGA_CMD.ReservedBit06 := bitvector(150); -- : std_logic;
    pkt.FPGA_CMD.SC_Rx_FPGA_CMD.ReservedBit07 := bitvector(151); -- : std_logic;
    -- pkt.FPGA_CMD.SC_Rx_FPGA_CMD.-- 19
    pkt.FPGA_CMD.SC_Rx_FPGA_CMD.Gain := bitvector(159 downto 152); -- : std_logic_vector(7 downto 0);
    -- end record; -- SC_Rx_FPGA_CMD_4_Type
    pkt.FPGA_CMD.Reserved_3 := bitvector(175 downto 160); -- : BS_2_BYTE_Type; -- 20
    pkt.FPGA_CMD.Reserved_4 := bitvector(191 downto 176); -- : BS_2_BYTE_Type; -- 22
    -- type PA_Tx_FPGA_CMD_16_Type is record -- 24
    pkt.FPGA_CMD.PA_Tx_FPGA_CMD.PRI := bitvector(197 downto 192); -- : std_logic_vector(5 downto 0);
    pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx_Trigger := bitvector(198); -- : std_logic;
    pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx_Reset := bitvector(199); -- : std_logic;
    -- pkt.FPGA_CMD.PA_Tx_FPGA_CMD.-- 25
    pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx_Pulse_Interval := bitvector(206 downto 200); -- : std_logic_vector(6 downto 0);
    pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Number_of_Tx := bitvector(207); -- : std_logic;
    -- pkt.FPGA_CMD.PA_Tx_FPGA_CMD.-- 26
    pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Beam_Steering_Angle := bitvector(215 downto 208); -- : std_logic_vector(7 downto 0);
    -- pkt.FPGA_CMD.PA_Tx_FPGA_CMD.-- 27
    pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx1_Pulse_Length := bitvector(222 downto 216); -- : std_logic_vector(6 downto 0);
    pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx1_Type := bitvector(223); -- : std_logic;
    -- pkt.FPGA_CMD.PA_Tx_FPGA_CMD.-- 28
    pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx1_Start_Frequency_I7_0I := bitvector(231 downto 224); -- : std_logic_vector(7 downto 0);
    -- pkt.FPGA_CMD.PA_Tx_FPGA_CMD.-- 29
    pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx1_Start_Frequency_I14_8I := bitvector(238 downto 232); -- : std_logic_vector(6 downto 0);
    pkt.FPGA_CMD.PA_Tx_FPGA_CMD.ReservedBit07_1 := bitvector(239); -- : std_logic;
    -- pkt.FPGA_CMD.PA_Tx_FPGA_CMD.-- 30
    pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx1_Sweep_Frequency := bitvector(247 downto 240); -- : std_logic_vector(7 downto 0);
    -- pkt.FPGA_CMD.PA_Tx_FPGA_CMD.-- 31
    pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx2_Pulse_Length := bitvector(254 downto 248); -- : std_logic_vector(6 downto 0);
    pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx2_Type := bitvector(255); -- : std_logic;
    -- pkt.FPGA_CMD.PA_Tx_FPGA_CMD.-- 32
    pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx2_Start_Frequency_I7_0I := bitvector(263 downto 256); -- : std_logic_vector(7 downto 0);
    -- pkt.FPGA_CMD.PA_Tx_FPGA_CMD.-- 33
    pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx2_Start_Frequency_I14_8I := bitvector(270 downto 264); -- : std_logic_vector(6 downto 0);
    pkt.FPGA_CMD.PA_Tx_FPGA_CMD.ReservedBit07_2 := bitvector(271); -- : std_logic;
    -- pkt.FPGA_CMD.PA_Tx_FPGA_CMD.-- 34
    pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx2_Sweep_Frequency := bitvector(279 downto 272); -- : std_logic_vector(7 downto 0);
    -- pkt.FPGA_CMD.PA_Tx_FPGA_CMD.-- 35
    pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Beam_Weighting_Select := bitvector(283 downto 280); -- : std_logic_vector(3 downto 0);
    pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Ramping_Time := bitvector(287 downto 284); -- : std_logic_vector(3 downto 0);
    -- pkt.FPGA_CMD.PA_Tx_FPGA_CMD.-- 36
    pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Battery_Voltage_I7_0I := bitvector(295 downto 288); -- : std_logic_vector(7 downto 0);
    -- pkt.FPGA_CMD.PA_Tx_FPGA_CMD.-- 37
    pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Battery_Voltage_I15_8I := bitvector(303 downto 296); -- : std_logic_vector(7 downto 0);
    -- pkt.FPGA_CMD.PA_Tx_FPGA_CMD.-- 38
    pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Stave_Selection_Number := bitvector(307 downto 304); -- : std_logic_vector(3 downto 0);
    pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Reserved_1 := bitvector(308); -- : std_logic;
    pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Reserved_2 := bitvector(309); -- : std_logic;
    pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Test_Mode := bitvector(310); -- : std_logic;
    pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Stave_Tx_Mode := bitvector(311); -- : std_logic;
    -- pkt.FPGA_CMD.PA_Tx_FPGA_CMD.-- 39
    pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Stave_Weight := bitvector(319 downto 312); -- : std_logic_vector(7 downto 0);
    -- end record; -- PA_Tx_FPGA_CMD_16_Type
    -- type SP_ZYNQ_CMD_2_Type is record -- 40
    pkt.FPGA_CMD.SP_ZYNQ_CMD.Save_R3 := bitvector(320); -- : std_logic;
    pkt.FPGA_CMD.SP_ZYNQ_CMD.Save_R2 := bitvector(321); -- : std_logic;
    pkt.FPGA_CMD.SP_ZYNQ_CMD.Save_R1 := bitvector(322); -- : std_logic;
    pkt.FPGA_CMD.SP_ZYNQ_CMD.Save_R0 := bitvector(323); -- : std_logic;
    pkt.FPGA_CMD.SP_ZYNQ_CMD.Save_C := bitvector(324); -- : std_logic;
    pkt.FPGA_CMD.SP_ZYNQ_CMD.Save_L0 := bitvector(325); -- : std_logic;
    pkt.FPGA_CMD.SP_ZYNQ_CMD.Save_L1 := bitvector(326); -- : std_logic;
    pkt.FPGA_CMD.SP_ZYNQ_CMD.Save_L2 := bitvector(327); -- : std_logic;
    -- pkt.FPGA_CMD.SP_ZYNQ_CMD.-- 41
    pkt.FPGA_CMD.SP_ZYNQ_CMD.Optic_On := bitvector(328); -- : std_logic;
    pkt.FPGA_CMD.SP_ZYNQ_CMD.Ethernet_On := bitvector(329); -- : std_logic;
    pkt.FPGA_CMD.SP_ZYNQ_CMD.TE_Data_Input := bitvector(331 downto 330); -- : std_logic_vector(1 downto 0);
    pkt.FPGA_CMD.SP_ZYNQ_CMD.ReservedBit04 := bitvector(332); -- : std_logic;
    pkt.FPGA_CMD.SP_ZYNQ_CMD.ReservedBit05 := bitvector(333); -- : std_logic;
    pkt.FPGA_CMD.SP_ZYNQ_CMD.ReservedBit06 := bitvector(334); -- : std_logic;
    pkt.FPGA_CMD.SP_ZYNQ_CMD.Save_L3 := bitvector(335); -- : std_logic;
    -- end record; -- SP_ZYNQ_CMD_2_Type 
    pkt.FPGA_CMD.Reserved_5 := bitvector(351 downto 336); -- : BS_2_BYTE_Type; -- 42
    pkt.FPGA_CMD.Reserved_6 := bitvector(367 downto 352); -- : BS_2_BYTE_Type; -- 44
    pkt.FPGA_CMD.Reserved_7 := bitvector(383 downto 368); -- : BS_2_BYTE_Type; -- 46
    -- end record; -- FPGA_CMD_36_Type
    -- GC_INFO : GC_INFO_56_Type; -- 48
    -- type GC_INFO_56_Type is record -- 48
    pkt.GC_INFO.GC_Count := bitvector(415 downto 384); -- : BS_4_BYTE_Type; -- 48
    -- pkt.GC_INFO.GC_Command : GC_Command_2_Type; -- 52
    -- type GC_Command_2_Type is record -- 52
    pkt.GC_INFO.GC_Command.PLC := bitvector(416); -- : std_logic;
    pkt.GC_INFO.GC_Command.AD_On := bitvector(417); -- : std_logic;
    pkt.GC_INFO.GC_Command.ReservedBit02 := bitvector(418); -- : std_logic;
    pkt.GC_INFO.GC_Command.ReservedBit03 := bitvector(419); -- : std_logic;
    pkt.GC_INFO.GC_Command.Pre_Enable := bitvector(420); -- : std_logic;
    pkt.GC_INFO.GC_Command.Enable := bitvector(421); -- : std_logic;
    pkt.GC_INFO.GC_Command.ReservedBit06 := bitvector(422); -- : std_logic;
    pkt.GC_INFO.GC_Command.ReservedBit07 := bitvector(423); -- : std_logic;
    -- pkt.GC_INFO.GC_Command.-- 53
    pkt.GC_INFO.GC_Command.Salvo_On := bitvector(424); -- : std_logic;
    pkt.GC_INFO.GC_Command.Band_Sel := bitvector(425); -- : std_logic;
    pkt.GC_INFO.GC_Command.Mode_Set := bitvector(426); -- : std_logic;
    pkt.GC_INFO.GC_Command.PRI_Start := bitvector(427); -- : std_logic;
    pkt.GC_INFO.GC_Command.Test_Mode_Set := bitvector(428); -- : std_logic;
    pkt.GC_INFO.GC_Command.REC_Disable_Set := bitvector(429); -- : std_logic;
    pkt.GC_INFO.GC_Command.Test_Trig := bitvector(430); -- : std_logic;
    pkt.GC_INFO.GC_Command.ReservedBit15 := bitvector(431); -- : std_logic;
    -- end record; -- GC_Command_2_Type
    pkt.GC_INFO.Reserved_1 := bitvector(447 downto 432); -- : BS_2_BYTE_Type; -- 54
    -- pkt.GC_INFO.GC_Event_1 : GC_Event_1_2_Type; -- 56
    -- type GC_Event_1_2_Type is record -- 56
    pkt.GC_INFO.GC_Event_1.ReservedBit00 := bitvector(448); -- : std_logic;
    pkt.GC_INFO.GC_Event_1.HILS_Mode := bitvector(449); -- : std_logic;
    pkt.GC_INFO.GC_Event_1.EXHD_Mode := bitvector(450); -- : std_logic;
    pkt.GC_INFO.GC_Event_1.C_Range := bitvector(451); -- : std_logic;
    pkt.GC_INFO.GC_Event_1.E_Range := bitvector(452); -- : std_logic;
    pkt.GC_INFO.GC_Event_1.ReservedBit05 := bitvector(453); -- : std_logic;
    pkt.GC_INFO.GC_Event_1.Close_In := bitvector(454); -- : std_logic;
    pkt.GC_INFO.GC_Event_1.Terminal_Homing := bitvector(455); -- : std_logic;
    -- pkt.GC_INFO.GC_Event_1.-- 57
    pkt.GC_INFO.GC_Event_1.Fire := bitvector(456); -- : std_logic;
    pkt.GC_INFO.GC_Event_1.EOM := bitvector(457); -- : std_logic;
    pkt.GC_INFO.GC_Event_1.Motor_Start := bitvector(458); -- : std_logic;
    pkt.GC_INFO.GC_Event_1.Motor_Stop := bitvector(459); -- : std_logic;
    pkt.GC_INFO.GC_Event_1.Ceiling_Det := bitvector(460); -- : std_logic;
    pkt.GC_INFO.GC_Event_1.Floor_Det := bitvector(461); -- : std_logic;
    pkt.GC_INFO.GC_Event_1.Surface_Det := bitvector(462); -- : std_logic;
    pkt.GC_INFO.GC_Event_1.EOR := bitvector(463); -- : std_logic;
    -- end record; -- GC_Event_1_2_Type
    -- pkt.GC_INFO.GC_Event_2 : GC_Event_2_2_Type; -- 58
    -- type GC_Event_2_2_Type is record
    pkt.GC_INFO.GC_Event_2.Pre_Enable := bitvector(464); -- : std_logic;
    pkt.GC_INFO.GC_Event_2.Enable := bitvector(465); -- : std_logic;
    pkt.GC_INFO.GC_Event_2.V_Target := bitvector(466); -- : std_logic;
    pkt.GC_INFO.GC_Event_2.Speed_Mode1 := bitvector(467); -- : std_logic;
    pkt.GC_INFO.GC_Event_2.Speed_Mode2 := bitvector(468); -- : std_logic;
    pkt.GC_INFO.GC_Event_2.Homming_Enable := bitvector(469); -- : std_logic;
    pkt.GC_INFO.GC_Event_2.Homming_Mode := bitvector(470); -- : std_logic;
    pkt.GC_INFO.GC_Event_2.Inhibit := bitvector(471); -- : std_logic;
    -- pkt.GC_INFO.GC_Event_2.-- 59
    pkt.GC_INFO.GC_Event_2.Hold_In := bitvector(472); -- : std_logic;
    pkt.GC_INFO.GC_Event_2.Target_Det := bitvector(473); -- : std_logic;
    pkt.GC_INFO.GC_Event_2.Target_Loss := bitvector(474); -- : std_logic;
    pkt.GC_INFO.GC_Event_2.ACM_Det := bitvector(475); -- : std_logic;
    pkt.GC_INFO.GC_Event_2.Pre_ACO_Chk := bitvector(476); -- : std_logic;
    pkt.GC_INFO.GC_Event_2.ACO_Det := bitvector(477); -- : std_logic;
    pkt.GC_INFO.GC_Event_2.ReservedBit14 := bitvector(478); -- : std_logic;
    pkt.GC_INFO.GC_Event_2.ReservedBit15 := bitvector(479); -- : std_logic;
    -- end record; -- GC_Event_2_2_Type
    -- pkt.GC_INFO.GC_Event_3 : GC_Event_3_2_Type; -- 60
    -- type GC_Event_3_2_Type is record
    pkt.GC_INFO.GC_Event_3.Beam_Steering := bitvector(483 downto 480); -- : std_logic_vector(3 downto 0);
    pkt.GC_INFO.GC_Event_3.ReservedBit04 := bitvector(484); -- : std_logic;
    pkt.GC_INFO.GC_Event_3.ReservedBit05 := bitvector(485); -- : std_logic;
    pkt.GC_INFO.GC_Event_3.ReservedBit06 := bitvector(486); -- : std_logic;
    pkt.GC_INFO.GC_Event_3.ReservedBit07 := bitvector(487); -- : std_logic;
    -- pkt.GC_INFO.GC_Event_3.-- 61
    pkt.GC_INFO.GC_Event_3.ReservedBit08 := bitvector(488); -- : std_logic;
    pkt.GC_INFO.GC_Event_3.ReservedBit09 := bitvector(489); -- : std_logic;
    pkt.GC_INFO.GC_Event_3.ReservedBit10 := bitvector(490); -- : std_logic;
    pkt.GC_INFO.GC_Event_3.ReservedBit11 := bitvector(491); -- : std_logic;
    pkt.GC_INFO.GC_Event_3.ReservedBit12 := bitvector(492); -- : std_logic;
    pkt.GC_INFO.GC_Event_3.ReservedBit13 := bitvector(493); -- : std_logic;
    pkt.GC_INFO.GC_Event_3.ReservedBit14 := bitvector(494); -- : std_logic;
    pkt.GC_INFO.GC_Event_3.ReservedBit15 := bitvector(495); -- : std_logic;
    -- end record; -- GC_Event_3_2_Type
    -- pkt.GC_INFO.GC_Event_4 : GC_Event_4_2_Type; -- 62
    -- type GC_Event_4_2_Type is record -- 62
    pkt.GC_INFO.GC_Event_4.Enable := bitvector(496); -- : std_logic;
    pkt.GC_INFO.GC_Event_4.Detect := bitvector(497); -- : std_logic;
    pkt.GC_INFO.GC_Event_4.Closein := bitvector(498); -- : std_logic;
    pkt.GC_INFO.GC_Event_4.Fail := bitvector(499); -- : std_logic;
    pkt.GC_INFO.GC_Event_4.ESAD_Chk := bitvector(500); -- : std_logic;
    pkt.GC_INFO.GC_Event_4.ESAD_HV := bitvector(501); -- : std_logic;
    pkt.GC_INFO.GC_Event_4.ESAD_Power := bitvector(502); -- : std_logic;
    pkt.GC_INFO.GC_Event_4.ReservedBit07 := bitvector(503); -- : std_logic;
    -- pkt.GC_INFO.GC_Event_4.-- 63
    pkt.GC_INFO.GC_Event_4.ReservedBit08 := bitvector(504); -- : std_logic;
    pkt.GC_INFO.GC_Event_4.ReservedBit09 := bitvector(505); -- : std_logic;
    pkt.GC_INFO.GC_Event_4.ReservedBit10 := bitvector(506); -- : std_logic;
    pkt.GC_INFO.GC_Event_4.ReservedBit11 := bitvector(507); -- : std_logic;
    pkt.GC_INFO.GC_Event_4.Leakage_Det := bitvector(508); -- : std_logic;
    pkt.GC_INFO.GC_Event_4.ReservedBit13 := bitvector(509); -- : std_logic;
    pkt.GC_INFO.GC_Event_4.ReservedBit14 := bitvector(510); -- : std_logic;
    pkt.GC_INFO.GC_Event_4.M_Stop := bitvector(511); -- : std_logic;
    -- end record; -- GC_Event_4_2_Type
    pkt.GC_INFO.Speed_Mode := bitvector(519 downto 512); -- : BS_1_BYTE_Type; -- 64
    pkt.GC_INFO.Search_Pattern := bitvector(527 downto 520); -- : BS_1_BYTE_Type; -- 65
    pkt.GC_INFO.Pulse_Freq := bitvector(535 downto 528); -- : BS_1_BYTE_Type; -- 66
    pkt.GC_INFO.Pulse_Type := bitvector(543 downto 536); -- : BS_1_BYTE_Type; -- 67
    pkt.GC_INFO.Pulse_Length := bitvector(551 downto 544); -- : BS_1_BYTE_Type; -- 68
    pkt.GC_INFO.PRE_Pulse := bitvector(559 downto 552); -- : BS_1_BYTE_Type; -- 69
    pkt.GC_INFO.PRI := bitvector(567 downto 560); -- : BS_1_BYTE_Type; -- 70
    pkt.GC_INFO.Beam_Steering := bitvector(575 downto 568); -- : BS_1_BYTE_Type; -- 71
    pkt.GC_INFO.BAT_VOLT := bitvector(591 downto 576); -- : BS_2_BYTE_Type; -- 72
    pkt.GC_INFO.Reserved_2 := bitvector(607 downto 592); -- : BS_2_BYTE_Type; -- 74
    pkt.GC_INFO.Reserved_3 := bitvector(623 downto 608); -- : BS_2_BYTE_Type; -- 76
    pkt.GC_INFO.Reserved_4 := bitvector(639 downto 624); -- : BS_2_BYTE_Type; -- 78
    pkt.GC_INFO.TORP_N := bitvector(671 downto 640); -- : BS_4_BYTE_Type; -- 80
    pkt.GC_INFO.TORP_E := bitvector(703 downto 672); -- : BS_4_BYTE_Type; -- 84
    pkt.GC_INFO.TORP_D := bitvector(719 downto 704); -- : BS_2_BYTE_Type; -- 88
    pkt.GC_INFO.TORP_Roll := bitvector(735 downto 720); -- : BS_2_BYTE_Type; -- 90
    pkt.GC_INFO.TORP_Pitch := bitvector(751 downto 736); -- : BS_2_BYTE_Type; -- 92
    pkt.GC_INFO.TORP_Yaw := bitvector(767 downto 752); -- : BS_2_BYTE_Type; -- 94
    pkt.GC_INFO.ACT_On_Off := bitvector(775 downto 768); -- : BS_1_BYTE_Type; -- 96
    pkt.GC_INFO.Reserved_5 := bitvector(783 downto 776); -- : BS_1_BYTE_Type; -- 97
    pkt.GC_INFO.Reserved_6 := bitvector(799 downto 784); -- : BS_2_BYTE_Type; -- 98
    pkt.GC_INFO.Reserved_7 := bitvector(815 downto 800); -- : BS_2_BYTE_Type; -- 100
    pkt.GC_INFO.Reserved_8 := bitvector(831 downto 816); -- : BS_2_BYTE_Type; -- 102
    -- end record; -- GC_INFO_56_Type
    -- FPGA_State : FPGA_State_40_Type; -- 104
    -- type FPGA_State_40_Type is record -- 104
    pkt.FPGA_State.DAQCounter := bitvector(863 downto 832); -- : BS_4_BYTE_Type; -- 104
    pkt.FPGA_State.SC_GainValue := bitvector(871 downto 864); -- : BS_1_BYTE_Type; -- 108
    -- pkt.FPGA_State.FPGA_Zynq_Control : FPGA_Zynq_Control_1_Type; -- 109
    -- type FPGA_Zynq_Control_1_Type is record -- 109
    pkt.FPGA_State.FPGA_Zynq_Control.PLC_State := bitvector(872); -- : std_logic;
    pkt.FPGA_State.FPGA_Zynq_Control.DAQ_Count_Reset := bitvector(873); -- : std_logic;
    pkt.FPGA_State.FPGA_Zynq_Control.AD_On_Result := bitvector(874); -- : std_logic;
    pkt.FPGA_State.FPGA_Zynq_Control.ReservedBit03 := bitvector(875); -- : std_logic;
    pkt.FPGA_State.FPGA_Zynq_Control.ReservedBit04 := bitvector(876); -- : std_logic;
    pkt.FPGA_State.FPGA_Zynq_Control.SC_FPGA_Reset := bitvector(877); -- : std_logic;
    pkt.FPGA_State.FPGA_Zynq_Control.PA_FPGA_Reset := bitvector(878); -- : std_logic;
    pkt.FPGA_State.FPGA_Zynq_Control.Ping_On_Off := bitvector(879); -- : std_logic;
    -- end record; -- FPGA_Zynq_Control_1_Type
    pkt.FPGA_State.PA_FPGA_Temperature := bitvector(887 downto 880); -- : BS_1_BYTE_Type; -- 110
    pkt.FPGA_State.SC_FPGA_Temperature := bitvector(895 downto 888); -- : BS_1_BYTE_Type; -- 111
    pkt.FPGA_State.Reserved_1 := bitvector(911 downto 896); -- : BS_2_BYTE_Type; -- 112
    pkt.FPGA_State.Reserved_2 := bitvector(927 downto 912); -- : BS_2_BYTE_Type; -- 114
    pkt.FPGA_State.Reserved_3 := bitvector(943 downto 928); -- : BS_2_BYTE_Type; -- 116
    pkt.FPGA_State.Reserved_4 := bitvector(959 downto 944); -- : BS_2_BYTE_Type; -- 118
    -- pkt.FPGA_State.SC_FPGA_SelfTest_Result : SC_FPGA_SelfTest_Result_2_Type; -- 120
    -- type SC_FPGA_SelfTest_Result_2_Type is record -- 120
    pkt.FPGA_State.SC_FPGA_SelfTest_Result.SC_GTP := bitvector(960); -- : std_logic;
    pkt.FPGA_State.SC_FPGA_SelfTest_Result.SC_LVDS := bitvector(961); -- : std_logic;
    pkt.FPGA_State.SC_FPGA_SelfTest_Result.SC_UART := bitvector(962); -- : std_logic;
    pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit03 := bitvector(963); -- : std_logic;
    pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit04 := bitvector(964); -- : std_logic;
    pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit05 := bitvector(965); -- : std_logic;
    pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit06 := bitvector(966); -- : std_logic;
    pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit07 := bitvector(967); -- : std_logic;
    -- pkt.FPGA_State.SC_FPGA_SelfTest_Result.-- 121
    pkt.FPGA_State.SC_FPGA_SelfTest_Result.SC_MEM := bitvector(968); -- : std_logic;
    pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit09 := bitvector(969); -- : std_logic;
    pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit10 := bitvector(970); -- : std_logic;
    pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit11 := bitvector(971); -- : std_logic;
    pkt.FPGA_State.SC_FPGA_SelfTest_Result.SC_FPGA := bitvector(972); -- : std_logic;
    pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit13 := bitvector(973); -- : std_logic;
    pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit14 := bitvector(974); -- : std_logic;
    pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit15 := bitvector(975); -- : std_logic;
    -- end record; -- SC_FPGA_SelfTest_Result_2_Type
    -- pkt.FPGA_State.PA_FPGA_SelfTest_Result : PA_FPGA_SelfTest_Result_2_Type; -- 122
    -- type PA_FPGA_SelfTest_Result_2_Type is record -- 122
    pkt.FPGA_State.PA_FPGA_SelfTest_Result.CMD_DATA_ERR := bitvector(976); -- : std_logic;
    pkt.FPGA_State.PA_FPGA_SelfTest_Result.Temp_warn := bitvector(977); -- : std_logic;
    pkt.FPGA_State.PA_FPGA_SelfTest_Result.ReservedBit02 := bitvector(978); -- : std_logic;
    pkt.FPGA_State.PA_FPGA_SelfTest_Result.ReservedBit03 := bitvector(979); -- : std_logic;
    pkt.FPGA_State.PA_FPGA_SelfTest_Result.PAB_ST_RESULT := bitvector(980); -- : std_logic;
    pkt.FPGA_State.PA_FPGA_SelfTest_Result.ReservedBit05 := bitvector(981); -- : std_logic;
    pkt.FPGA_State.PA_FPGA_SelfTest_Result.ReservedBit06 := bitvector(982); -- : std_logic;
    pkt.FPGA_State.PA_FPGA_SelfTest_Result.ReservedBit07 := bitvector(983); -- : std_logic;
    -- pkt.FPGA_State.PA_FPGA_SelfTest_Result.-- 123
    pkt.FPGA_State.PA_FPGA_SelfTest_Result.PCM_Boot := bitvector(984); -- : std_logic;
    pkt.FPGA_State.PA_FPGA_SelfTest_Result.PAM1_Boot := bitvector(985); -- : std_logic;
    pkt.FPGA_State.PA_FPGA_SelfTest_Result.PAM2_Boot := bitvector(986); -- : std_logic;
    pkt.FPGA_State.PA_FPGA_SelfTest_Result.PAM3_Boot := bitvector(987); -- : std_logic;
    pkt.FPGA_State.PA_FPGA_SelfTest_Result.PAM4_Boot := bitvector(988); -- : std_logic;
    pkt.FPGA_State.PA_FPGA_SelfTest_Result.PAM5_Boot := bitvector(989); -- : std_logic;
    pkt.FPGA_State.PA_FPGA_SelfTest_Result.PAM6_Boot := bitvector(990); -- : std_logic;
    pkt.FPGA_State.PA_FPGA_SelfTest_Result.PAM7_Boot := bitvector(991); -- : std_logic;
    -- end record; -- PA_FPGA_SelfTest_Result_2_Type
    -- pkt.FPGA_State.Reserved_SP_Zynq_SelfTest_Result : Reserved_SP_Zynq_SelfTest_Result_2_Type; -- 124
    -- type Reserved_SP_Zynq_SelfTest_Result_2_Type is record -- 124
    pkt.FPGA_State.Reserved_SP_Zynq_SelfTest_Result.ReservedBit00 := bitvector(992); -- : std_logic;
    pkt.FPGA_State.Reserved_SP_Zynq_SelfTest_Result.ReservedBit01 := bitvector(993); -- : std_logic;
    pkt.FPGA_State.Reserved_SP_Zynq_SelfTest_Result.ReservedBit02 := bitvector(994); -- : std_logic;
    pkt.FPGA_State.Reserved_SP_Zynq_SelfTest_Result.ReservedBit03 := bitvector(995); -- : std_logic;
    pkt.FPGA_State.Reserved_SP_Zynq_SelfTest_Result.ReservedBit04 := bitvector(996); -- : std_logic;
    pkt.FPGA_State.Reserved_SP_Zynq_SelfTest_Result.ReservedBit05 := bitvector(997); -- : std_logic;
    pkt.FPGA_State.Reserved_SP_Zynq_SelfTest_Result.ReservedBit06 := bitvector(998); -- : std_logic;
    pkt.FPGA_State.Reserved_SP_Zynq_SelfTest_Result.ReservedBit07 := bitvector(999); -- : std_logic;
    -- pkt.FPGA_State.Reserved_SP_Zynq_SelfTest_Result.-- 125
    pkt.FPGA_State.Reserved_SP_Zynq_SelfTest_Result.ReservedBit08 := bitvector(1000); -- : std_logic;
    pkt.FPGA_State.Reserved_SP_Zynq_SelfTest_Result.ReservedBit09 := bitvector(1001); -- : std_logic;
    pkt.FPGA_State.Reserved_SP_Zynq_SelfTest_Result.ReservedBit10 := bitvector(1002); -- : std_logic;
    pkt.FPGA_State.Reserved_SP_Zynq_SelfTest_Result.ReservedBit11 := bitvector(1003); -- : std_logic;
    pkt.FPGA_State.Reserved_SP_Zynq_SelfTest_Result.ReservedBit12 := bitvector(1004); -- : std_logic;
    pkt.FPGA_State.Reserved_SP_Zynq_SelfTest_Result.ReservedBit13 := bitvector(1005); -- : std_logic;
    pkt.FPGA_State.Reserved_SP_Zynq_SelfTest_Result.ReservedBit14 := bitvector(1006); -- : std_logic;
    pkt.FPGA_State.Reserved_SP_Zynq_SelfTest_Result.ReservedBit15 := bitvector(1007); -- : std_logic;
    -- end record; -- Reserved_SP_Zynq_SelfTest_Result_2_Type
    pkt.FPGA_State.TX_Voltage_Sample1 := bitvector(1023 downto 1008); -- : BS_2_BYTE_Type; -- 126
    pkt.FPGA_State.TX_Voltage_Sample2 := bitvector(1039 downto 1024); -- : BS_2_BYTE_Type; -- 128
    pkt.FPGA_State.TX_DC_Voltage_Sample1 := bitvector(1055 downto 1040); -- : BS_2_BYTE_Type; -- 130
    pkt.FPGA_State.TX_DC_Voltage_Sample2 := bitvector(1071 downto 1056); -- : BS_2_BYTE_Type; --132
    pkt.FPGA_State.TX_DC_Current_Sample1 := bitvector(1087 downto 1072); -- : BS_2_BYTE_Type; -- 134
    pkt.FPGA_State.TX_DC_Current_Sample2 := bitvector(1103 downto 1088); -- : BS_2_BYTE_Type; -- 136
    -- pkt.FPGA_State.Trigger_State : Trigger_State_1_Type; -- 138
    -- type Trigger_State_1_Type is record -- 138
    pkt.FPGA_State.Trigger_State.TE_TX_TRIG := bitvector(1104); -- : std_logic;
    pkt.FPGA_State.Trigger_State.TE_RX_TRIG := bitvector(1105); -- : std_logic;
    pkt.FPGA_State.Trigger_State.TX_TRIG := bitvector(1106); -- : std_logic;
    pkt.FPGA_State.Trigger_State.TX_P_GATE := bitvector(1107); -- : std_logic;
    pkt.FPGA_State.Trigger_State.ReservedBit04 := bitvector(1108); -- : std_logic;
    pkt.FPGA_State.Trigger_State.ReservedBit05 := bitvector(1109); -- : std_logic;
    pkt.FPGA_State.Trigger_State.ReservedBit06 := bitvector(1110); -- : std_logic;
    pkt.FPGA_State.Trigger_State.ReservedBit07 := bitvector(1111); -- : std_logic;
    -- end record; -- Trigger_State_1_Type
    pkt.FPGA_State.Reserved_5 := bitvector(1119 downto 1112); -- : BS_1_BYTE_Type; -- 139
    pkt.FPGA_State.Reserved_6 := bitvector(1135 downto 1120); -- : BS_2_BYTE_Type; -- 140
    pkt.FPGA_State.Reserved_7 := bitvector(1151 downto 1136); -- : BS_2_BYTE_Type; -- 142
    -- end record; -- FPGA_State_40_Type
    -- BS_DATA : BS_DATA_152_Type; -- 144 : 1152
    -- type BS_DATA_152_Type is record -- 144  : 1152
    -- pkt.BS_DATA.CH_Data : CH_Data_Type; -- 144 : 1152 : 36
    for ch in 1 to 37 loop
      pkt.BS_DATA.CH_Data(ch) := bitvector(ch * 32 - 1 + 1152 downto ch * 32 - 32 + 1152);
    end loop;
    pkt.BS_DATA.Reserved := bitvector(2367 downto 2336); -- : BS_4_BYTE_Type; -- 292
    -- end record; -- BS_DATA_152_Type
    -- Checksum : BS_2_BYTE_Type; -- 296
    pkt.Checksum := bitvector(2383 downto 2368); -- : BS_2_BYTE_Type; -- 296
    -- Stop_Bytes : BS_2_BYTE_Type; -- 298
    pkt.Stop_Bytes := bitvector(2399 downto 2384); -- : BS_2_BYTE_Type; -- 298
    -- end record; -- SC2SP_Pkt_300_Type
    return pkt;
  end conv_ch_packet;
  --
  --
  function conv_ch_bitvector (pkt : SC2SP_Pkt_300_Type) return std_logic_vector is
    variable bitvector : std_logic_vector(2399 downto 0);
  begin
    -- conv_ch_bitvector
    -- Start_Bytes : BS_4_BYTE_Type; -- 0
    bitvector(31 downto 0) := pkt.Start_Bytes; -- : BS_4_BYTE_Type; -- 0
    -- Count : BS_4_BYTE_Type; -- 4
    bitvector(63 downto 32) := pkt.Count; -- : BS_4_BYTE_Type; -- 4
    -- Command : BS_2_BYTE_Type; -- 8
    bitvector(79 downto 64) := pkt.Command; -- : BS_2_BYTE_Type; -- 8
    -- ACK : BS_2_BYTE_Type; -- 10
    bitvector(95 downto 80) := pkt.ACK; -- : BS_2_BYTE_Type; -- 10
    -- type FPGA_CMD_36_Type is record -- 12
    bitvector(111 downto 96) := pkt.FPGA_CMD.Reserved_1; -- : BS_2_BYTE_Type; -- 12
    bitvector(127 downto 112) := pkt.FPGA_CMD.Reserved_2; -- : BS_2_BYTE_Type; -- 14
    -- type SC_Rx_FPGA_CMD_4_Type is record -- 16
    bitvector(131 downto 128) := pkt.FPGA_CMD.SC_Rx_FPGA_CMD.TVG; -- : std_logic_vector(3 downto 0)           ;
    bitvector(133 downto 132) := pkt.FPGA_CMD.SC_Rx_FPGA_CMD.REC_Mode; -- : std_logic_vector(1 downto 0)           ;
    bitvector(134) := pkt.FPGA_CMD.SC_Rx_FPGA_CMD.ReservedBit06_1; -- : std_logic;
    bitvector(135) := pkt.FPGA_CMD.SC_Rx_FPGA_CMD.ReservedBit07_1; -- : std_logic;
    -- pkt.FPGA_CMD.SC_Rx_FPGA_CMD.-- 17
    bitvector(136) := pkt.FPGA_CMD.SC_Rx_FPGA_CMD.PLC; -- : std_logic;
    bitvector(137) := pkt.FPGA_CMD.SC_Rx_FPGA_CMD.DAQ_Count_Reset; -- : std_logic;
    bitvector(138) := pkt.FPGA_CMD.SC_Rx_FPGA_CMD.AD_On; -- : std_logic;
    bitvector(139) := pkt.FPGA_CMD.SC_Rx_FPGA_CMD.Gain_Mode; -- : std_logic;
    bitvector(140) := pkt.FPGA_CMD.SC_Rx_FPGA_CMD.BPF_On_Off; -- : std_logic;
    bitvector(141) := pkt.FPGA_CMD.SC_Rx_FPGA_CMD.Pass_Active; -- : std_logic;
    bitvector(142) := pkt.FPGA_CMD.SC_Rx_FPGA_CMD.Reset; -- : std_logic;
    bitvector(143) := pkt.FPGA_CMD.SC_Rx_FPGA_CMD.Stop_Run; -- : std_logic;
    -- pkt.FPGA_CMD.SC_Rx_FPGA_CMD.-- 18
    bitvector(144) := pkt.FPGA_CMD.SC_Rx_FPGA_CMD.REC_On_Off; -- : std_logic;
    bitvector(146 downto 145) := pkt.FPGA_CMD.SC_Rx_FPGA_CMD.PLC_Mode; -- : std_logic_vector(1 downto 0)           ;
    bitvector(147) := pkt.FPGA_CMD.SC_Rx_FPGA_CMD.Data_Path; -- : std_logic;
    bitvector(148) := pkt.FPGA_CMD.SC_Rx_FPGA_CMD.ReservedBit04; -- : std_logic;
    bitvector(149) := pkt.FPGA_CMD.SC_Rx_FPGA_CMD.ReservedBit05; -- : std_logic;
    bitvector(150) := pkt.FPGA_CMD.SC_Rx_FPGA_CMD.ReservedBit06; -- : std_logic;
    bitvector(151) := pkt.FPGA_CMD.SC_Rx_FPGA_CMD.ReservedBit07; -- : std_logic;
    -- pkt.FPGA_CMD.SC_Rx_FPGA_CMD.-- 19
    bitvector(159 downto 152) := pkt.FPGA_CMD.SC_Rx_FPGA_CMD.Gain; -- : std_logic_vector(7 downto 0)           ;
    -- end record; -- SC_Rx_FPGA_CMD_4_Type
    bitvector(175 downto 160) := pkt.FPGA_CMD.Reserved_3; -- : BS_2_BYTE_Type; -- 20
    bitvector(191 downto 176) := pkt.FPGA_CMD.Reserved_4; -- : BS_2_BYTE_Type; -- 22
    -- type PA_Tx_FPGA_CMD_16_Type is record -- 24
    bitvector(197 downto 192) := pkt.FPGA_CMD.PA_Tx_FPGA_CMD.PRI; -- : std_logic_vector(5 downto 0)           ;
    bitvector(198) := pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx_Trigger; -- : std_logic;
    bitvector(199) := pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx_Reset; -- : std_logic;
    -- pkt.FPGA_CMD.PA_Tx_FPGA_CMD.-- 25
    bitvector(206 downto 200) := pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx_Pulse_Interval; -- : std_logic_vector(6 downto 0)           ;
    bitvector(207) := pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Number_of_Tx; -- : std_logic;
    -- pkt.FPGA_CMD.PA_Tx_FPGA_CMD.-- 26
    bitvector(215 downto 208) := pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Beam_Steering_Angle; -- : std_logic_vector(7 downto 0)           ;
    -- pkt.FPGA_CMD.PA_Tx_FPGA_CMD.-- 27
    bitvector(222 downto 216) := pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx1_Pulse_Length; -- : std_logic_vector(6 downto 0)           ;
    bitvector(223) := pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx1_Type; -- : std_logic;
    -- pkt.FPGA_CMD.PA_Tx_FPGA_CMD.-- 28
    bitvector(231 downto 224) := pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx1_Start_Frequency_I7_0I; -- : std_logic_vector(7 downto 0)           ;
    -- pkt.FPGA_CMD.PA_Tx_FPGA_CMD.-- 29
    bitvector(238 downto 232) := pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx1_Start_Frequency_I14_8I; -- : std_logic_vector(6 downto 0)           ;
    bitvector(239) := pkt.FPGA_CMD.PA_Tx_FPGA_CMD.ReservedBit07_1; -- : std_logic;
    -- pkt.FPGA_CMD.PA_Tx_FPGA_CMD.-- 30
    bitvector(247 downto 240) := pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx1_Sweep_Frequency; -- : std_logic_vector(7 downto 0)           ;
    -- pkt.FPGA_CMD.PA_Tx_FPGA_CMD.-- 31
    bitvector(254 downto 248) := pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx2_Pulse_Length; -- : std_logic_vector(6 downto 0)           ;
    bitvector(255) := pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx2_Type; -- : std_logic;
    -- pkt.FPGA_CMD.PA_Tx_FPGA_CMD.-- 32
    bitvector(263 downto 256) := pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx2_Start_Frequency_I7_0I; -- : std_logic_vector(7 downto 0)           ;
    -- pkt.FPGA_CMD.PA_Tx_FPGA_CMD.-- 33
    bitvector(270 downto 264) := pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx2_Start_Frequency_I14_8I; -- : std_logic_vector(6 downto 0)           ;
    bitvector(271) := pkt.FPGA_CMD.PA_Tx_FPGA_CMD.ReservedBit07_2; -- : std_logic;
    -- pkt.FPGA_CMD.PA_Tx_FPGA_CMD.-- 34
    bitvector(279 downto 272) := pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx2_Sweep_Frequency; -- : std_logic_vector(7 downto 0)           ;
    -- pkt.FPGA_CMD.PA_Tx_FPGA_CMD.-- 35
    bitvector(283 downto 280) := pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Beam_Weighting_Select; -- : std_logic_vector(3 downto 0)           ;
    bitvector(287 downto 284) := pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Ramping_Time; -- : std_logic_vector(3 downto 0)           ;
    -- pkt.FPGA_CMD.PA_Tx_FPGA_CMD.-- 36
    bitvector(295 downto 288) := pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Battery_Voltage_I7_0I; -- : std_logic_vector(7 downto 0)           ;
    -- pkt.FPGA_CMD.PA_Tx_FPGA_CMD.-- 37
    bitvector(303 downto 296) := pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Battery_Voltage_I15_8I; -- : std_logic_vector(7 downto 0)           ;
    -- pkt.FPGA_CMD.PA_Tx_FPGA_CMD.-- 38
    bitvector(307 downto 304) := pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Stave_Selection_Number; -- : std_logic_vector(3 downto 0)           ;
    bitvector(308) := pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Reserved_1; -- : std_logic;
    bitvector(309) := pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Reserved_2; -- : std_logic;
    bitvector(310) := pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Test_Mode; -- : std_logic;
    bitvector(311) := pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Stave_Tx_Mode; -- : std_logic;
    -- pkt.FPGA_CMD.PA_Tx_FPGA_CMD.-- 39
    bitvector(319 downto 312) := pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Stave_Weight; -- : std_logic_vector(7 downto 0)           ;
    -- end record; -- PA_Tx_FPGA_CMD_16_Type
    -- type SP_ZYNQ_CMD_2_Type is record -- 40
    bitvector(320) := pkt.FPGA_CMD.SP_ZYNQ_CMD.Save_R3; -- : std_logic;
    bitvector(321) := pkt.FPGA_CMD.SP_ZYNQ_CMD.Save_R2; -- : std_logic;
    bitvector(322) := pkt.FPGA_CMD.SP_ZYNQ_CMD.Save_R1; -- : std_logic;
    bitvector(323) := pkt.FPGA_CMD.SP_ZYNQ_CMD.Save_R0; -- : std_logic;
    bitvector(324) := pkt.FPGA_CMD.SP_ZYNQ_CMD.Save_C; -- : std_logic;
    bitvector(325) := pkt.FPGA_CMD.SP_ZYNQ_CMD.Save_L0; -- : std_logic;
    bitvector(326) := pkt.FPGA_CMD.SP_ZYNQ_CMD.Save_L1; -- : std_logic;
    bitvector(327) := pkt.FPGA_CMD.SP_ZYNQ_CMD.Save_L2; -- : std_logic;
    -- pkt.FPGA_CMD.SP_ZYNQ_CMD.-- 41
    bitvector(328) := pkt.FPGA_CMD.SP_ZYNQ_CMD.Optic_On; -- : std_logic;
    bitvector(329) := pkt.FPGA_CMD.SP_ZYNQ_CMD.Ethernet_On; -- : std_logic;
    bitvector(331 downto 330) := pkt.FPGA_CMD.SP_ZYNQ_CMD.TE_Data_Input; -- : std_logic_vector(1 downto 0)           ;
    bitvector(332) := pkt.FPGA_CMD.SP_ZYNQ_CMD.ReservedBit04; -- : std_logic;
    bitvector(333) := pkt.FPGA_CMD.SP_ZYNQ_CMD.ReservedBit05; -- : std_logic;
    bitvector(334) := pkt.FPGA_CMD.SP_ZYNQ_CMD.ReservedBit06; -- : std_logic;
    bitvector(335) := pkt.FPGA_CMD.SP_ZYNQ_CMD.Save_L3; -- : std_logic;
    -- end record; -- SP_ZYNQ_CMD_2_Type 
    bitvector(351 downto 336) := pkt.FPGA_CMD.Reserved_5; -- : BS_2_BYTE_Type; -- 42
    bitvector(367 downto 352) := pkt.FPGA_CMD.Reserved_6; -- : BS_2_BYTE_Type; -- 44
    bitvector(383 downto 368) := pkt.FPGA_CMD.Reserved_7; -- : BS_2_BYTE_Type; -- 46
    -- end record; -- FPGA_CMD_36_Type
    -- GC_INFO : GC_INFO_56_Type; -- 48
    -- type GC_INFO_56_Type is record -- 48
    bitvector(415 downto 384) := pkt.GC_INFO.GC_Count; -- : BS_4_BYTE_Type; -- 48
    -- pkt.GC_INFO.GC_Command : GC_Command_2_Type; -- 52
    -- type GC_Command_2_Type is record -- 52
    bitvector(416) := pkt.GC_INFO.GC_Command.PLC; -- : std_logic;
    bitvector(417) := pkt.GC_INFO.GC_Command.AD_On; -- : std_logic;
    bitvector(418) := pkt.GC_INFO.GC_Command.ReservedBit02; -- : std_logic;
    bitvector(419) := pkt.GC_INFO.GC_Command.ReservedBit03; -- : std_logic;
    bitvector(420) := pkt.GC_INFO.GC_Command.Pre_Enable; -- : std_logic;
    bitvector(421) := pkt.GC_INFO.GC_Command.Enable; -- : std_logic;
    bitvector(422) := pkt.GC_INFO.GC_Command.ReservedBit06; -- : std_logic;
    bitvector(423) := pkt.GC_INFO.GC_Command.ReservedBit07; -- : std_logic;
    -- pkt.GC_INFO.GC_Command.-- 53
    bitvector(424) := pkt.GC_INFO.GC_Command.Salvo_On; -- : std_logic;
    bitvector(425) := pkt.GC_INFO.GC_Command.Band_Sel; -- : std_logic;
    bitvector(426) := pkt.GC_INFO.GC_Command.Mode_Set; -- : std_logic;
    bitvector(427) := pkt.GC_INFO.GC_Command.PRI_Start; -- : std_logic;
    bitvector(428) := pkt.GC_INFO.GC_Command.Test_Mode_Set; -- : std_logic;
    bitvector(429) := pkt.GC_INFO.GC_Command.REC_Disable_Set; -- : std_logic;
    bitvector(430) := pkt.GC_INFO.GC_Command.Test_Trig; -- : std_logic;
    bitvector(431) := pkt.GC_INFO.GC_Command.ReservedBit15; -- : std_logic;
    -- end record; -- GC_Command_2_Type
    bitvector(447 downto 432) := pkt.GC_INFO.Reserved_1; -- : BS_2_BYTE_Type; -- 54
    -- pkt.GC_INFO.GC_Event_1 : GC_Event_1_2_Type; -- 56
    -- type GC_Event_1_2_Type is record -- 56
    bitvector(448) := pkt.GC_INFO.GC_Event_1.ReservedBit00; -- : std_logic;
    bitvector(449) := pkt.GC_INFO.GC_Event_1.HILS_Mode; -- : std_logic;
    bitvector(450) := pkt.GC_INFO.GC_Event_1.EXHD_Mode; -- : std_logic;
    bitvector(451) := pkt.GC_INFO.GC_Event_1.C_Range; -- : std_logic;
    bitvector(452) := pkt.GC_INFO.GC_Event_1.E_Range; -- : std_logic;
    bitvector(453) := pkt.GC_INFO.GC_Event_1.ReservedBit05; -- : std_logic;
    bitvector(454) := pkt.GC_INFO.GC_Event_1.Close_In; -- : std_logic;
    bitvector(455) := pkt.GC_INFO.GC_Event_1.Terminal_Homing; -- : std_logic;
    -- pkt.GC_INFO.GC_Event_1.-- 57
    bitvector(456) := pkt.GC_INFO.GC_Event_1.Fire; -- : std_logic;
    bitvector(457) := pkt.GC_INFO.GC_Event_1.EOM; -- : std_logic;
    bitvector(458) := pkt.GC_INFO.GC_Event_1.Motor_Start; -- : std_logic;
    bitvector(459) := pkt.GC_INFO.GC_Event_1.Motor_Stop; -- : std_logic;
    bitvector(460) := pkt.GC_INFO.GC_Event_1.Ceiling_Det; -- : std_logic;
    bitvector(461) := pkt.GC_INFO.GC_Event_1.Floor_Det; -- : std_logic;
    bitvector(462) := pkt.GC_INFO.GC_Event_1.Surface_Det; -- : std_logic;
    bitvector(463) := pkt.GC_INFO.GC_Event_1.EOR; -- : std_logic;
    -- end record; -- GC_Event_1_2_Type
    -- pkt.GC_INFO.GC_Event_2 : GC_Event_2_2_Type; -- 58
    -- type GC_Event_2_2_Type is record
    bitvector(464) := pkt.GC_INFO.GC_Event_2.Pre_Enable; -- : std_logic;
    bitvector(465) := pkt.GC_INFO.GC_Event_2.Enable; -- : std_logic;
    bitvector(466) := pkt.GC_INFO.GC_Event_2.V_Target; -- : std_logic;
    bitvector(467) := pkt.GC_INFO.GC_Event_2.Speed_Mode1; -- : std_logic;
    bitvector(468) := pkt.GC_INFO.GC_Event_2.Speed_Mode2; -- : std_logic;
    bitvector(469) := pkt.GC_INFO.GC_Event_2.Homming_Enable; -- : std_logic;
    bitvector(470) := pkt.GC_INFO.GC_Event_2.Homming_Mode; -- : std_logic;
    bitvector(471) := pkt.GC_INFO.GC_Event_2.Inhibit; -- : std_logic;
    -- pkt.GC_INFO.GC_Event_2.-- 59
    bitvector(472) := pkt.GC_INFO.GC_Event_2.Hold_In; -- : std_logic;
    bitvector(473) := pkt.GC_INFO.GC_Event_2.Target_Det; -- : std_logic;
    bitvector(474) := pkt.GC_INFO.GC_Event_2.Target_Loss; -- : std_logic;
    bitvector(475) := pkt.GC_INFO.GC_Event_2.ACM_Det; -- : std_logic;
    bitvector(476) := pkt.GC_INFO.GC_Event_2.Pre_ACO_Chk; -- : std_logic;
    bitvector(477) := pkt.GC_INFO.GC_Event_2.ACO_Det; -- : std_logic;
    bitvector(478) := pkt.GC_INFO.GC_Event_2.ReservedBit14; -- : std_logic;
    bitvector(479) := pkt.GC_INFO.GC_Event_2.ReservedBit15; -- : std_logic;
    -- end record; -- GC_Event_2_2_Type
    -- pkt.GC_INFO.GC_Event_3 : GC_Event_3_2_Type; -- 60
    -- type GC_Event_3_2_Type is record
    bitvector(483 downto 480) := pkt.GC_INFO.GC_Event_3.Beam_Steering; -- : std_logic_vector(3 downto 0)           ;
    bitvector(484) := pkt.GC_INFO.GC_Event_3.ReservedBit04; -- : std_logic;
    bitvector(485) := pkt.GC_INFO.GC_Event_3.ReservedBit05; -- : std_logic;
    bitvector(486) := pkt.GC_INFO.GC_Event_3.ReservedBit06; -- : std_logic;
    bitvector(487) := pkt.GC_INFO.GC_Event_3.ReservedBit07; -- : std_logic;
    -- pkt.GC_INFO.GC_Event_3.-- 61
    bitvector(488) := pkt.GC_INFO.GC_Event_3.ReservedBit08; -- : std_logic;
    bitvector(489) := pkt.GC_INFO.GC_Event_3.ReservedBit09; -- : std_logic;
    bitvector(490) := pkt.GC_INFO.GC_Event_3.ReservedBit10; -- : std_logic;
    bitvector(491) := pkt.GC_INFO.GC_Event_3.ReservedBit11; -- : std_logic;
    bitvector(492) := pkt.GC_INFO.GC_Event_3.ReservedBit12; -- : std_logic;
    bitvector(493) := pkt.GC_INFO.GC_Event_3.ReservedBit13; -- : std_logic;
    bitvector(494) := pkt.GC_INFO.GC_Event_3.ReservedBit14; -- : std_logic;
    bitvector(495) := pkt.GC_INFO.GC_Event_3.ReservedBit15; -- : std_logic;
    -- end record; -- GC_Event_3_2_Type
    -- pkt.GC_INFO.GC_Event_4 : GC_Event_4_2_Type; -- 62
    -- type GC_Event_4_2_Type is record -- 62
    bitvector(496) := pkt.GC_INFO.GC_Event_4.Enable; -- : std_logic;
    bitvector(497) := pkt.GC_INFO.GC_Event_4.Detect; -- : std_logic;
    bitvector(498) := pkt.GC_INFO.GC_Event_4.Closein; -- : std_logic;
    bitvector(499) := pkt.GC_INFO.GC_Event_4.Fail; -- : std_logic;
    bitvector(500) := pkt.GC_INFO.GC_Event_4.ESAD_Chk; -- : std_logic;
    bitvector(501) := pkt.GC_INFO.GC_Event_4.ESAD_HV; -- : std_logic;
    bitvector(502) := pkt.GC_INFO.GC_Event_4.ESAD_Power; -- : std_logic;
    bitvector(503) := pkt.GC_INFO.GC_Event_4.ReservedBit07; -- : std_logic;
    -- pkt.GC_INFO.GC_Event_4.-- 63
    bitvector(504) := pkt.GC_INFO.GC_Event_4.ReservedBit08; -- : std_logic;
    bitvector(505) := pkt.GC_INFO.GC_Event_4.ReservedBit09; -- : std_logic;
    bitvector(506) := pkt.GC_INFO.GC_Event_4.ReservedBit10; -- : std_logic;
    bitvector(507) := pkt.GC_INFO.GC_Event_4.ReservedBit11; -- : std_logic;
    bitvector(508) := pkt.GC_INFO.GC_Event_4.Leakage_Det; -- : std_logic;
    bitvector(509) := pkt.GC_INFO.GC_Event_4.ReservedBit13; -- : std_logic;
    bitvector(510) := pkt.GC_INFO.GC_Event_4.ReservedBit14; -- : std_logic;
    bitvector(511) := pkt.GC_INFO.GC_Event_4.M_Stop; -- : std_logic;
    -- end record; -- GC_Event_4_2_Type
    bitvector(519 downto 512) := pkt.GC_INFO.Speed_Mode; -- : BS_1_BYTE_Type; -- 64
    bitvector(527 downto 520) := pkt.GC_INFO.Search_Pattern; -- : BS_1_BYTE_Type; -- 65
    bitvector(535 downto 528) := pkt.GC_INFO.Pulse_Freq; -- : BS_1_BYTE_Type; -- 66
    bitvector(543 downto 536) := pkt.GC_INFO.Pulse_Type; -- : BS_1_BYTE_Type; -- 67
    bitvector(551 downto 544) := pkt.GC_INFO.Pulse_Length; -- : BS_1_BYTE_Type; -- 68
    bitvector(559 downto 552) := pkt.GC_INFO.PRE_Pulse; -- : BS_1_BYTE_Type; -- 69
    bitvector(567 downto 560) := pkt.GC_INFO.PRI; -- : BS_1_BYTE_Type; -- 70
    bitvector(575 downto 568) := pkt.GC_INFO.Beam_Steering; -- : BS_1_BYTE_Type; -- 71
    bitvector(591 downto 576) := pkt.GC_INFO.BAT_VOLT; -- : BS_2_BYTE_Type; -- 72
    bitvector(607 downto 592) := pkt.GC_INFO.Reserved_2; -- : BS_2_BYTE_Type; -- 74
    bitvector(623 downto 608) := pkt.GC_INFO.Reserved_3; -- : BS_2_BYTE_Type; -- 76
    bitvector(639 downto 624) := pkt.GC_INFO.Reserved_4; -- : BS_2_BYTE_Type; -- 78
    bitvector(671 downto 640) := pkt.GC_INFO.TORP_N; -- : BS_4_BYTE_Type; -- 80
    bitvector(703 downto 672) := pkt.GC_INFO.TORP_E; -- : BS_4_BYTE_Type; -- 84
    bitvector(719 downto 704) := pkt.GC_INFO.TORP_D; -- : BS_2_BYTE_Type; -- 88
    bitvector(735 downto 720) := pkt.GC_INFO.TORP_Roll; -- : BS_2_BYTE_Type; -- 90
    bitvector(751 downto 736) := pkt.GC_INFO.TORP_Pitch; -- : BS_2_BYTE_Type; -- 92
    bitvector(767 downto 752) := pkt.GC_INFO.TORP_Yaw; -- : BS_2_BYTE_Type; -- 94
    bitvector(775 downto 768) := pkt.GC_INFO.ACT_On_Off; -- : BS_1_BYTE_Type; -- 96
    bitvector(783 downto 776) := pkt.GC_INFO.Reserved_5; -- : BS_1_BYTE_Type; -- 97
    bitvector(799 downto 784) := pkt.GC_INFO.Reserved_6; -- : BS_2_BYTE_Type; -- 98
    bitvector(815 downto 800) := pkt.GC_INFO.Reserved_7; -- : BS_2_BYTE_Type; -- 100
    bitvector(831 downto 816) := pkt.GC_INFO.Reserved_8; -- : BS_2_BYTE_Type; -- 102
    -- end record; -- GC_INFO_56_Type
    -- FPGA_State : FPGA_State_40_Type; -- 104
    -- type FPGA_State_40_Type is record -- 104
    bitvector(863 downto 832) := pkt.FPGA_State.DAQCounter; -- : BS_4_BYTE_Type; -- 104
    bitvector(871 downto 864) := pkt.FPGA_State.SC_GainValue; -- : BS_1_BYTE_Type; -- 108
    -- pkt.FPGA_State.FPGA_Zynq_Control : FPGA_Zynq_Control_1_Type; -- 109
    -- type FPGA_Zynq_Control_1_Type is record -- 109
    bitvector(872) := pkt.FPGA_State.FPGA_Zynq_Control.PLC_State; -- : std_logic;
    bitvector(873) := pkt.FPGA_State.FPGA_Zynq_Control.DAQ_Count_Reset; -- : std_logic;
    bitvector(874) := pkt.FPGA_State.FPGA_Zynq_Control.AD_On_Result; -- : std_logic;
    bitvector(875) := pkt.FPGA_State.FPGA_Zynq_Control.ReservedBit03; -- : std_logic;
    bitvector(876) := pkt.FPGA_State.FPGA_Zynq_Control.ReservedBit04; -- : std_logic;
    bitvector(877) := pkt.FPGA_State.FPGA_Zynq_Control.SC_FPGA_Reset; -- : std_logic;
    bitvector(878) := pkt.FPGA_State.FPGA_Zynq_Control.PA_FPGA_Reset; -- : std_logic;
    bitvector(879) := pkt.FPGA_State.FPGA_Zynq_Control.Ping_On_Off; -- : std_logic;
    -- end record; -- FPGA_Zynq_Control_1_Type
    bitvector(887 downto 880) := pkt.FPGA_State.PA_FPGA_Temperature; -- : BS_1_BYTE_Type; -- 110
    bitvector(895 downto 888) := pkt.FPGA_State.SC_FPGA_Temperature; -- : BS_1_BYTE_Type; -- 111
    bitvector(911 downto 896) := pkt.FPGA_State.Reserved_1; -- : BS_2_BYTE_Type; -- 112
    bitvector(927 downto 912) := pkt.FPGA_State.Reserved_2; -- : BS_2_BYTE_Type; -- 114
    bitvector(943 downto 928) := pkt.FPGA_State.Reserved_3; -- : BS_2_BYTE_Type; -- 116
    bitvector(959 downto 944) := pkt.FPGA_State.Reserved_4; -- : BS_2_BYTE_Type; -- 118
    -- pkt.FPGA_State.SC_FPGA_SelfTest_Result : SC_FPGA_SelfTest_Result_2_Type; -- 120
    -- type SC_FPGA_SelfTest_Result_2_Type is record -- 120
    bitvector(960) := pkt.FPGA_State.SC_FPGA_SelfTest_Result.SC_GTP; -- : std_logic;
    bitvector(961) := pkt.FPGA_State.SC_FPGA_SelfTest_Result.SC_LVDS; -- : std_logic;
    bitvector(962) := pkt.FPGA_State.SC_FPGA_SelfTest_Result.SC_UART; -- : std_logic;
    bitvector(963) := pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit03; -- : std_logic;
    bitvector(964) := pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit04; -- : std_logic;
    bitvector(965) := pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit05; -- : std_logic;
    bitvector(966) := pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit06; -- : std_logic;
    bitvector(967) := pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit07; -- : std_logic;
    -- pkt.FPGA_State.SC_FPGA_SelfTest_Result.-- 121
    bitvector(968) := pkt.FPGA_State.SC_FPGA_SelfTest_Result.SC_MEM; -- : std_logic;
    bitvector(969) := pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit09; -- : std_logic;
    bitvector(970) := pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit10; -- : std_logic;
    bitvector(971) := pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit11; -- : std_logic;
    bitvector(972) := pkt.FPGA_State.SC_FPGA_SelfTest_Result.SC_FPGA; -- : std_logic;
    bitvector(973) := pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit13; -- : std_logic;
    bitvector(974) := pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit14; -- : std_logic;
    bitvector(975) := pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit15; -- : std_logic;
    -- end record; -- SC_FPGA_SelfTest_Result_2_Type
    -- pkt.FPGA_State.PA_FPGA_SelfTest_Result : PA_FPGA_SelfTest_Result_2_Type; -- 122
    -- type PA_FPGA_SelfTest_Result_2_Type is record -- 122
    bitvector(976) := pkt.FPGA_State.PA_FPGA_SelfTest_Result.CMD_DATA_ERR; -- : std_logic;
    bitvector(977) := pkt.FPGA_State.PA_FPGA_SelfTest_Result.Temp_warn; -- : std_logic;
    bitvector(978) := pkt.FPGA_State.PA_FPGA_SelfTest_Result.ReservedBit02; -- : std_logic;
    bitvector(979) := pkt.FPGA_State.PA_FPGA_SelfTest_Result.ReservedBit03; -- : std_logic;
    bitvector(980) := pkt.FPGA_State.PA_FPGA_SelfTest_Result.PAB_ST_RESULT; -- : std_logic;
    bitvector(981) := pkt.FPGA_State.PA_FPGA_SelfTest_Result.ReservedBit05; -- : std_logic;
    bitvector(982) := pkt.FPGA_State.PA_FPGA_SelfTest_Result.ReservedBit06; -- : std_logic;
    bitvector(983) := pkt.FPGA_State.PA_FPGA_SelfTest_Result.ReservedBit07; -- : std_logic;
    -- pkt.FPGA_State.PA_FPGA_SelfTest_Result.-- 123
    bitvector(984) := pkt.FPGA_State.PA_FPGA_SelfTest_Result.PCM_Boot; -- : std_logic;
    bitvector(985) := pkt.FPGA_State.PA_FPGA_SelfTest_Result.PAM1_Boot; -- : std_logic;
    bitvector(986) := pkt.FPGA_State.PA_FPGA_SelfTest_Result.PAM2_Boot; -- : std_logic;
    bitvector(987) := pkt.FPGA_State.PA_FPGA_SelfTest_Result.PAM3_Boot; -- : std_logic;
    bitvector(988) := pkt.FPGA_State.PA_FPGA_SelfTest_Result.PAM4_Boot; -- : std_logic;
    bitvector(989) := pkt.FPGA_State.PA_FPGA_SelfTest_Result.PAM5_Boot; -- : std_logic;
    bitvector(990) := pkt.FPGA_State.PA_FPGA_SelfTest_Result.PAM6_Boot; -- : std_logic;
    bitvector(991) := pkt.FPGA_State.PA_FPGA_SelfTest_Result.PAM7_Boot; -- : std_logic;
    -- end record; -- PA_FPGA_SelfTest_Result_2_Type
    -- pkt.FPGA_State.Reserved_SP_Zynq_SelfTest_Result : Reserved_SP_Zynq_SelfTest_Result_2_Type; -- 124
    -- type Reserved_SP_Zynq_SelfTest_Result_2_Type is record -- 124
    bitvector(992) := pkt.FPGA_State.Reserved_SP_Zynq_SelfTest_Result.ReservedBit00; -- : std_logic;
    bitvector(993) := pkt.FPGA_State.Reserved_SP_Zynq_SelfTest_Result.ReservedBit01; -- : std_logic;
    bitvector(994) := pkt.FPGA_State.Reserved_SP_Zynq_SelfTest_Result.ReservedBit02; -- : std_logic;
    bitvector(995) := pkt.FPGA_State.Reserved_SP_Zynq_SelfTest_Result.ReservedBit03; -- : std_logic;
    bitvector(996) := pkt.FPGA_State.Reserved_SP_Zynq_SelfTest_Result.ReservedBit04; -- : std_logic;
    bitvector(997) := pkt.FPGA_State.Reserved_SP_Zynq_SelfTest_Result.ReservedBit05; -- : std_logic;
    bitvector(998) := pkt.FPGA_State.Reserved_SP_Zynq_SelfTest_Result.ReservedBit06; -- : std_logic;
    bitvector(999) := pkt.FPGA_State.Reserved_SP_Zynq_SelfTest_Result.ReservedBit07; -- : std_logic;
    -- pkt.FPGA_State.Reserved_SP_Zynq_SelfTest_Result.-- 125
    bitvector(1000) := pkt.FPGA_State.Reserved_SP_Zynq_SelfTest_Result.ReservedBit08; -- : std_logic;
    bitvector(1001) := pkt.FPGA_State.Reserved_SP_Zynq_SelfTest_Result.ReservedBit09; -- : std_logic;
    bitvector(1002) := pkt.FPGA_State.Reserved_SP_Zynq_SelfTest_Result.ReservedBit10; -- : std_logic;
    bitvector(1003) := pkt.FPGA_State.Reserved_SP_Zynq_SelfTest_Result.ReservedBit11; -- : std_logic;
    bitvector(1004) := pkt.FPGA_State.Reserved_SP_Zynq_SelfTest_Result.ReservedBit12; -- : std_logic;
    bitvector(1005) := pkt.FPGA_State.Reserved_SP_Zynq_SelfTest_Result.ReservedBit13; -- : std_logic;
    bitvector(1006) := pkt.FPGA_State.Reserved_SP_Zynq_SelfTest_Result.ReservedBit14; -- : std_logic;
    bitvector(1007) := pkt.FPGA_State.Reserved_SP_Zynq_SelfTest_Result.ReservedBit15; -- : std_logic;
    -- end record; -- Reserved_SP_Zynq_SelfTest_Result_2_Type
    bitvector(1023 downto 1008) := pkt.FPGA_State.TX_Voltage_Sample1; -- : BS_2_BYTE_Type; -- 126
    bitvector(1039 downto 1024) := pkt.FPGA_State.TX_Voltage_Sample2; -- : BS_2_BYTE_Type; -- 128
    bitvector(1055 downto 1040) := pkt.FPGA_State.TX_DC_Voltage_Sample1; -- : BS_2_BYTE_Type; -- 130
    bitvector(1071 downto 1056) := pkt.FPGA_State.TX_DC_Voltage_Sample2; -- : BS_2_BYTE_Type; --132
    bitvector(1087 downto 1072) := pkt.FPGA_State.TX_DC_Current_Sample1; -- : BS_2_BYTE_Type; -- 134
    bitvector(1103 downto 1088) := pkt.FPGA_State.TX_DC_Current_Sample2; -- : BS_2_BYTE_Type; -- 136
    -- pkt.FPGA_State.Trigger_State : Trigger_State_1_Type; -- 138
    -- type Trigger_State_1_Type is record -- 138
    bitvector(1104) := pkt.FPGA_State.Trigger_State.TE_TX_TRIG; -- : std_logic;
    bitvector(1105) := pkt.FPGA_State.Trigger_State.TE_RX_TRIG; -- : std_logic;
    bitvector(1106) := pkt.FPGA_State.Trigger_State.TX_TRIG; -- : std_logic;
    bitvector(1107) := pkt.FPGA_State.Trigger_State.TX_P_GATE; -- : std_logic;
    bitvector(1108) := pkt.FPGA_State.Trigger_State.ReservedBit04; -- : std_logic;
    bitvector(1109) := pkt.FPGA_State.Trigger_State.ReservedBit05; -- : std_logic;
    bitvector(1110) := pkt.FPGA_State.Trigger_State.ReservedBit06; -- : std_logic;
    bitvector(1111) := pkt.FPGA_State.Trigger_State.ReservedBit07; -- : std_logic;
    -- end record; -- Trigger_State_1_Type
    bitvector(1119 downto 1112) := pkt.FPGA_State.Reserved_5; -- : BS_1_BYTE_Type; -- 139
    bitvector(1135 downto 1120) := pkt.FPGA_State.Reserved_6; -- : BS_2_BYTE_Type; -- 140
    bitvector(1151 downto 1136) := pkt.FPGA_State.Reserved_7; -- : BS_2_BYTE_Type; -- 142
    -- end record; -- FPGA_State_40_Type
    -- BS_DATA : BS_DATA_152_Type; -- 144 : 1152
    -- type BS_DATA_152_Type is record -- 144  : 1152
    -- pkt.BS_DATA.CH_Data : CH_Data_Type; -- 144 : 1152
    for ch in 1 to 37 loop
      bitvector(ch * 32 - 1 + 1152 downto ch * 32 - 32 + 1152) := pkt.BS_DATA.CH_Data(ch);
    end loop;
    bitvector(2367 downto 2336) := pkt.BS_DATA.Reserved; -- : BS_4_BYTE_Type; -- 292
    -- end record; -- BS_DATA_152_Type
    -- Checksum : BS_2_BYTE_Type; -- 296
    bitvector(2383 downto 2368) := pkt.Checksum; -- : BS_2_BYTE_Type; -- 296
    -- Stop_Bytes : BS_2_BYTE_Type; -- 298
    bitvector(2399 downto 2384) := pkt.Stop_Bytes; -- : BS_2_BYTE_Type; -- 298
    -- end record; -- SC2SP_Pkt_300_Type
    return bitvector;
  end conv_ch_bitvector;
  --
  --
  --
  -- //=============================================================================
  -- //=============================================================================
  -- //=============================================================================
end package body SC2SP_Type;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================