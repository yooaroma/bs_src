-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use work.SCB2SPB_Type.all; -- BS2_protocol_V0.56_20231121

-- signal Chan_Pkt : SCB2SPB_Pkt_300_Type;
-- signal Chan_Str : std_logic_vector(2399 downto 0) := (others => '0');
--
--
-- Chan_Str <= conv_ch_Chan_Str_r(Chan_Pkt);
-- Chan_Pkt <= conv_ch_packet(Chan_Str);
--
entity bs_scb_data_record_pin is
  port (

    --
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    pkt_FPGA_State_Trigger_State_TE_TX_TRIG : out std_logic; --               order( 0 ) bit( 1 )
    pkt_FPGA_State_Trigger_State_TE_RX_TRIG : out std_logic; --               order( 1 ) bit( 1 )
    pkt_FPGA_State_Trigger_State_TX_TRIG : out std_logic; --               order( 2 ) bit( 1 )
    pkt_FPGA_State_Trigger_State_TX_P_GATE : out std_logic; --               order( 3 ) bit( 1 )
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    pkt_FPGA_State_PA_FPGA_SelfTest_Result_PCM_Boot : out std_logic; --               order( 4 ) bit( 1 )
    pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM1_Boot : out std_logic; --               order( 5 ) bit( 1 )
    pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM2_Boot : out std_logic; --               order( 6 ) bit( 1 )
    pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM3_Boot : out std_logic; --               order( 7 ) bit( 1 )
    pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM4_Boot : out std_logic; --               order( 8 ) bit( 1 )
    pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM5_Boot : out std_logic; --               order( 9 ) bit( 1 )
    pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM6_Boot : out std_logic; --               order( 10 ) bit( 1 )
    pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM7_Boot : out std_logic; --               order( 11 ) bit( 1 )
    pkt_FPGA_State_PA_FPGA_SelfTest_Result_CMD_DATA_ERR : out std_logic; --               order( 12 ) bit( 1 )
    pkt_FPGA_State_PA_FPGA_SelfTest_Result_Temp_warn : out std_logic; --               order( 13 ) bit( 1 )
    -- not used 
    -- not used 
    pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAB_ST_RESULT : out std_logic; --               order( 14 ) bit( 1 )
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_MEM : out std_logic; --               order( 15 ) bit( 1 )
    -- not used 
    -- not used 
    -- not used 
    pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_FPGA : out std_logic; --               order( 16 ) bit( 1 )
    -- not used 
    -- not used 
    -- not used 
    pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_GTP : out std_logic; --               order( 17 ) bit( 1 )
    pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_LVDS : out std_logic; --               order( 18 ) bit( 1 )
    pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_UART : out std_logic; --               order( 19 ) bit( 1 )
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    pkt_FPGA_State_FPGA_Zynq_Control_PLC_State : out std_logic; --               order( 20 ) bit( 1 )
    pkt_FPGA_State_FPGA_Zynq_Control_DAQ_Count_Reset : out std_logic; --               order( 21 ) bit( 1 )
    pkt_FPGA_State_FPGA_Zynq_Control_AD_On_Result : out std_logic; --               order( 22 ) bit( 1 )
    -- not used 
    -- not used 
    pkt_FPGA_State_FPGA_Zynq_Control_SC_FPGA_Reset : out std_logic; --               order( 23 ) bit( 1 )
    pkt_FPGA_State_FPGA_Zynq_Control_PA_FPGA_Reset : out std_logic; --               order( 24 ) bit( 1 )
    pkt_FPGA_State_FPGA_Zynq_Control_Ping_On_Off : out std_logic; --               order( 25 ) bit( 1 )
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    pkt_FPGA_State_DAQCounter : out std_logic_vector(31 downto 0); --               order( 26 ) bit( 32 )
    pkt_FPGA_State_SC_GainValue : out std_logic_vector(7 downto 0); --               order( 27 ) bit( 8 )
    -- not used 
    pkt_FPGA_State_PA_FPGA_Temperature : out std_logic_vector(7 downto 0); --               order( 28 ) bit( 8 )
    pkt_FPGA_State_SC_FPGA_Temperature : out std_logic_vector(7 downto 0); --               order( 29 ) bit( 8 )
    pkt_FPGA_State_SP_AH_Zynq_Temperature : out std_logic_vector(7 downto 0); --               order( 30 ) bit( 8 )
    pkt_FPGA_State_SP_P1_Zynq_Temperature : out std_logic_vector(7 downto 0); --               order( 31 ) bit( 8 )
    pkt_FPGA_State_SP_P2_Zynq_Temperature : out std_logic_vector(7 downto 0); --               order( 32 ) bit( 8 )
    pkt_FPGA_State_SC2SP_GTP_ERR : out std_logic_vector(7 downto 0); --               order( 33 ) bit( 8 )
    pkt_FPGA_State_AH2P1_GTP_ERR : out std_logic_vector(7 downto 0); --               order( 34 ) bit( 8 )
    pkt_FPGA_State_AH2P2_GTP_ERR : out std_logic_vector(7 downto 0); --               order( 35 ) bit( 8 )
    pkt_FPGA_State_P12AH_GTP_ERR : out std_logic_vector(7 downto 0); --               order( 36 ) bit( 8 )
    pkt_FPGA_State_P22AH_GTP_ERR : out std_logic_vector(7 downto 0); --               order( 37 ) bit( 8 )
    -- not used 
    -- not used 
    -- not used 
    pkt_FPGA_State_TX_Voltage_Sample1 : out std_logic_vector(15 downto 0); --               order( 38 ) bit( 16 )
    pkt_FPGA_State_TX_Voltage_Sample2 : out std_logic_vector(15 downto 0); --               order( 39 ) bit( 16 )
    pkt_FPGA_State_TX_DC_Voltage_Sample1 : out std_logic_vector(15 downto 0); --               order( 40 ) bit( 16 )
    pkt_FPGA_State_TX_DC_Voltage_Sample2 : out std_logic_vector(15 downto 0); --               order( 41 ) bit( 16 )
    pkt_FPGA_State_TX_DC_Current_Sample1 : out std_logic_vector(15 downto 0); --               order( 42 ) bit( 16 )
    pkt_FPGA_State_TX_DC_Current_Sample2 : out std_logic_vector(15 downto 0); --               order( 43 ) bit( 16 )
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    pkt_GC_INFO_GC_Event_4_Enable : out std_logic; --               order( 44 ) bit( 1 )
    pkt_GC_INFO_GC_Event_4_Detect : out std_logic; --               order( 45 ) bit( 1 )
    pkt_GC_INFO_GC_Event_4_Closein : out std_logic; --               order( 46 ) bit( 1 )
    pkt_GC_INFO_GC_Event_4_Fail : out std_logic; --               order( 47 ) bit( 1 )
    pkt_GC_INFO_GC_Event_4_ESAD_Chk : out std_logic; --               order( 48 ) bit( 1 )
    pkt_GC_INFO_GC_Event_4_ESAD_HV : out std_logic; --               order( 49 ) bit( 1 )
    pkt_GC_INFO_GC_Event_4_ESAD_Power : out std_logic; --               order( 50 ) bit( 1 )
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    pkt_GC_INFO_GC_Event_4_Leakage_Det : out std_logic; --               order( 51 ) bit( 1 )
    -- not used 
    -- not used 
    pkt_GC_INFO_GC_Event_4_M_Stop : out std_logic; --               order( 52 ) bit( 1 )
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    pkt_GC_INFO_GC_Event_3_Beam_Steering : out std_logic_vector(3 downto 0); --               order( 53 ) bit( 4 )
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    pkt_GC_INFO_GC_Event_2_Pre_Enable : out std_logic; --               order( 54 ) bit( 1 )
    pkt_GC_INFO_GC_Event_2_Enable : out std_logic; --               order( 55 ) bit( 1 )
    pkt_GC_INFO_GC_Event_2_V_Target : out std_logic; --               order( 56 ) bit( 1 )
    pkt_GC_INFO_GC_Event_2_Speed_Mode1 : out std_logic; --               order( 57 ) bit( 1 )
    pkt_GC_INFO_GC_Event_2_Speed_Mode2 : out std_logic; --               order( 58 ) bit( 1 )
    pkt_GC_INFO_GC_Event_2_Homming_Enable : out std_logic; --               order( 59 ) bit( 1 )
    pkt_GC_INFO_GC_Event_2_Homming_Mode : out std_logic; --               order( 60 ) bit( 1 )
    pkt_GC_INFO_GC_Event_2_Inhibit : out std_logic; --               order( 61 ) bit( 1 )
    pkt_GC_INFO_GC_Event_2_Hold_In : out std_logic; --               order( 62 ) bit( 1 )
    pkt_GC_INFO_GC_Event_2_Target_Det : out std_logic; --               order( 63 ) bit( 1 )
    pkt_GC_INFO_GC_Event_2_Target_Loss : out std_logic; --               order( 64 ) bit( 1 )
    pkt_GC_INFO_GC_Event_2_ACM_Det : out std_logic; --               order( 65 ) bit( 1 )
    pkt_GC_INFO_GC_Event_2_Pre_ACO_Chk : out std_logic; --               order( 66 ) bit( 1 )
    pkt_GC_INFO_GC_Event_2_ACO_Det : out std_logic; --               order( 67 ) bit( 1 )
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    pkt_GC_INFO_GC_Event_1_HILS_Mode : out std_logic; --               order( 68 ) bit( 1 )
    pkt_GC_INFO_GC_Event_1_EXHD_Mode : out std_logic; --               order( 69 ) bit( 1 )
    pkt_GC_INFO_GC_Event_1_C_Range : out std_logic; --               order( 70 ) bit( 1 )
    pkt_GC_INFO_GC_Event_1_E_Range : out std_logic; --               order( 71 ) bit( 1 )
    pkt_GC_INFO_GC_Event_1_ReservedBit05 : out std_logic; --               order( 72 ) bit( 1 )
    pkt_GC_INFO_GC_Event_1_Close_In : out std_logic; --               order( 73 ) bit( 1 )
    pkt_GC_INFO_GC_Event_1_Terminal_Homing : out std_logic; --               order( 74 ) bit( 1 )
    pkt_GC_INFO_GC_Event_1_Fire : out std_logic; --               order( 75 ) bit( 1 )
    pkt_GC_INFO_GC_Event_1_EOM : out std_logic; --               order( 76 ) bit( 1 )
    pkt_GC_INFO_GC_Event_1_Motor_Start : out std_logic; --               order( 77 ) bit( 1 )
    pkt_GC_INFO_GC_Event_1_Motor_Stop : out std_logic; --               order( 78 ) bit( 1 )
    pkt_GC_INFO_GC_Event_1_Ceiling_Det : out std_logic; --               order( 79 ) bit( 1 )
    pkt_GC_INFO_GC_Event_1_Floor_Det : out std_logic; --               order( 80 ) bit( 1 )
    pkt_GC_INFO_GC_Event_1_Surface_Det : out std_logic; --               order( 81 ) bit( 1 )
    pkt_GC_INFO_GC_Event_1_EOR : out std_logic; --               order( 82 ) bit( 1 )
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    pkt_GC_INFO_GC_Command_PLC : out std_logic; --               order( 83 ) bit( 1 )
    pkt_GC_INFO_GC_Command_AD_On : out std_logic; --               order( 84 ) bit( 1 )
    -- not used 
    -- not used 
    pkt_GC_INFO_GC_Command_Pre_Enable : out std_logic; --               order( 85 ) bit( 1 )
    pkt_GC_INFO_GC_Command_Enable : out std_logic; --               order( 86 ) bit( 1 )
    -- not used 
    -- not used 
    pkt_GC_INFO_GC_Command_Salvo_On : out std_logic; --               order( 87 ) bit( 1 )
    pkt_GC_INFO_GC_Command_Band_Sel : out std_logic; --               order( 88 ) bit( 1 )
    pkt_GC_INFO_GC_Command_Mode_Set : out std_logic; --               order( 89 ) bit( 1 )
    pkt_GC_INFO_GC_Command_PRI_Start : out std_logic; --               order( 90 ) bit( 1 )
    pkt_GC_INFO_GC_Command_Test_Mode_Set : out std_logic; --               order( 91 ) bit( 1 )
    pkt_GC_INFO_GC_Command_REC_Disable_Set : out std_logic; --               order( 92 ) bit( 1 )
    pkt_GC_INFO_GC_Command_Test_Trig : out std_logic; --               order( 93 ) bit( 1 )
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    pkt_GC_INFO_GC_Count : out std_logic_vector(31 downto 0); --               order( 94 ) bit( 32 )
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    pkt_GC_INFO_Speed_Mode : out std_logic_vector(7 downto 0); --               order( 95 ) bit( 8 )
    pkt_GC_INFO_Search_Pattern : out std_logic_vector(7 downto 0); --               order( 96 ) bit( 8 )
    pkt_GC_INFO_Pulse_Freq : out std_logic_vector(7 downto 0); --               order( 97 ) bit( 8 )
    pkt_GC_INFO_Pulse_Type : out std_logic_vector(7 downto 0); --               order( 98 ) bit( 8 )
    pkt_GC_INFO_Pulse_Length : out std_logic_vector(7 downto 0); --               order( 99 ) bit( 8 )
    pkt_GC_INFO_PRE_Pulse : out std_logic_vector(7 downto 0); --               order( 100 ) bit( 8 )
    pkt_GC_INFO_PRI : out std_logic_vector(7 downto 0); --               order( 101 ) bit( 8 )
    pkt_GC_INFO_Beam_Steering : out std_logic_vector(7 downto 0); --               order( 102 ) bit( 8 )
    pkt_GC_INFO_BAT_VOLT : out std_logic_vector(15 downto 0); --               order( 103 ) bit( 16 )
    -- not used 
    pkt_GC_INFO_TORP_N : out std_logic_vector(31 downto 0); --               order( 104 ) bit( 32 )
    pkt_GC_INFO_TORP_E : out std_logic_vector(31 downto 0); --               order( 105 ) bit( 32 )
    pkt_GC_INFO_TORP_D : out std_logic_vector(15 downto 0); --               order( 106 ) bit( 16 )
    pkt_GC_INFO_TORP_Roll : out std_logic_vector(15 downto 0); --               order( 107 ) bit( 16 )
    pkt_GC_INFO_TORP_Pitch : out std_logic_vector(15 downto 0); --               order( 108 ) bit( 16 )
    pkt_GC_INFO_TORP_Yaw : out std_logic_vector(15 downto 0); --               order( 109 ) bit( 16 )
    pkt_GC_INFO_ACT_On_Off : out std_logic_vector(7 downto 0); --               order( 110 ) bit( 8 )
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    pkt_FPGA_CMD_Save_Beam_INFO_Save_R3 : out std_logic; --               order( 111 ) bit( 1 )
    pkt_FPGA_CMD_Save_Beam_INFO_Save_R2 : out std_logic; --               order( 112 ) bit( 1 )
    pkt_FPGA_CMD_Save_Beam_INFO_Save_R1 : out std_logic; --               order( 113 ) bit( 1 )
    pkt_FPGA_CMD_Save_Beam_INFO_Save_R0 : out std_logic; --               order( 114 ) bit( 1 )
    pkt_FPGA_CMD_Save_Beam_INFO_Save_C : out std_logic; --               order( 115 ) bit( 1 )
    pkt_FPGA_CMD_Save_Beam_INFO_Save_L0 : out std_logic; --               order( 116 ) bit( 1 )
    pkt_FPGA_CMD_Save_Beam_INFO_Save_L1 : out std_logic; --               order( 117 ) bit( 1 )
    pkt_FPGA_CMD_Save_Beam_INFO_Save_L2 : out std_logic; --               order( 118 ) bit( 1 )
    pkt_FPGA_CMD_Save_Beam_INFO_Optic_On : out std_logic; --               order( 119 ) bit( 1 )
    pkt_FPGA_CMD_Save_Beam_INFO_Ethernet_On : out std_logic; --               order( 120 ) bit( 1 )
    pkt_FPGA_CMD_Save_Beam_INFO_TE_Data_Input : out std_logic_vector(1 downto 0); --               order( 121 ) bit( 2 )
    -- not used 
    -- not used 
    -- not used 
    pkt_FPGA_CMD_Save_Beam_INFO_Save_L3 : out std_logic; --               order( 122 ) bit( 1 )
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_PRI : out std_logic_vector(5 downto 0); --               order( 123 ) bit( 6 )
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx_Reset : out std_logic; --               order( 124 ) bit( 1 )
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx_Trigger : out std_logic; --               order( 125 ) bit( 1 )
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx_Pulse_Interval : out std_logic_vector(6 downto 0); --               order( 126 ) bit( 7 )
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Number_of_Tx : out std_logic; --               order( 127 ) bit( 1 )
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Beam_Steering_Angle : out std_logic_vector(7 downto 0); --               order( 128 ) bit( 8 )
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx1_Pulse_Length : out std_logic_vector(6 downto 0); --               order( 129 ) bit( 7 )
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx1_Type : out std_logic; --               order( 130 ) bit( 1 )
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx1_Start_Frequency : out std_logic_vector(14 downto 0); --               order( 131 ) bit( 15 )
    -- not used 
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx1_Sweep_Frequency : out std_logic_vector(7 downto 0); --               order( 132 ) bit( 8 )
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx2_Pulse_Length : out std_logic_vector(6 downto 0); --               order( 133 ) bit( 7 )
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx2_Type : out std_logic; --               order( 134 ) bit( 1 )
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx2_Start_Frequency : out std_logic_vector(14 downto 0); --               order( 135 ) bit( 15 )
    -- not used 
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx2_Sweep_Frequency : out std_logic_vector(7 downto 0); --               order( 136 ) bit( 8 )
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Beam_Weighting_Select : out std_logic_vector(3 downto 0); --               order( 137 ) bit( 4 )
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Ramping_Time : out std_logic_vector(3 downto 0); --               order( 138 ) bit( 4 )
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Battery_Voltage : out std_logic_vector(15 downto 0); --               order( 139 ) bit( 16 )
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Stave_Selection_Number : out std_logic_vector(3 downto 0); --               order( 140 ) bit( 4 )
    -- not used 
    -- not used 
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Test_Mode : out std_logic; --               order( 141 ) bit( 1 )
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Stave_Tx_Mode : out std_logic; --               order( 142 ) bit( 1 )
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Stave_Weight : out std_logic_vector(7 downto 0); --               order( 143 ) bit( 8 )
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_TVG : out std_logic_vector(3 downto 0); --               order( 144 ) bit( 4 )
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_REC_Mode : out std_logic_vector(1 downto 0); --               order( 145 ) bit( 2 )
    -- not used 
    -- not used 
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_PLC : out std_logic; --               order( 146 ) bit( 1 )
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_DAQ_Count_Reset : out std_logic; --               order( 147 ) bit( 1 )
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_AD_On : out std_logic; --               order( 148 ) bit( 1 )
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Gain_Mode : out std_logic; --               order( 149 ) bit( 1 )
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_BPF_On_Off : out std_logic; --               order( 150 ) bit( 1 )
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Pass_Active : out std_logic; --               order( 151 ) bit( 1 )
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Reset : out std_logic; --               order( 152 ) bit( 1 )
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Stop_Run : out std_logic; --               order( 153 ) bit( 1 )
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_REC_On_Off : out std_logic; --               order( 154 ) bit( 1 )
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_PLC_Mode : out std_logic_vector(1 downto 0); --               order( 155 ) bit( 2 )
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Data_Path : out std_logic; --               order( 156 ) bit( 1 )
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Gain : out std_logic_vector(7 downto 0); --               order( 157 ) bit( 8 )
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Reserved : out std_logic_vector(31 downto 0); --               order( 158 ) bit( 32 )
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    pkt_Start_Bytes : out std_logic_vector(31 downto 0); --               order( 159 ) bit( 32 )
    pkt_Count : out std_logic_vector(31 downto 0); --               order( 160 ) bit( 32 )
    pkt_Command : out std_logic_vector(15 downto 0); --               order( 161 ) bit( 16 )
    pkt_ACK : out std_logic_vector(15 downto 0); --               order( 162 ) bit( 16 )
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    pkt_Checksum : out std_logic_vector(15 downto 0); --               order( 163 ) bit( 16 )
    pkt_Stop_Bytes : out std_logic_vector(15 downto 0); --               order( 164 ) bit( 16 )
    -- not used 
    -- not used 
    -- not used 

    pkt_Data_CH_Data_1 : out std_logic_vector(31 downto 0); --   order( 165 ) (32)   (1183 downto 1152);
    pkt_Data_CH_Data_2 : out std_logic_vector(31 downto 0); --   order( 166 ) (32)   (1215 downto 1184);
    pkt_Data_CH_Data_3 : out std_logic_vector(31 downto 0); --   order( 167 ) (32)   (1247 downto 1216);
    pkt_Data_CH_Data_4 : out std_logic_vector(31 downto 0); --   order( 168 ) (32)   (1279 downto 1248);
    pkt_Data_CH_Data_5 : out std_logic_vector(31 downto 0); --   order( 169 ) (32)   (1311 downto 1280);
    pkt_Data_CH_Data_6 : out std_logic_vector(31 downto 0); --   order( 170 ) (32)   (1343 downto 1312);
    pkt_Data_CH_Data_7 : out std_logic_vector(31 downto 0); --   order( 171 ) (32)   (1375 downto 1344);
    pkt_Data_CH_Data_8 : out std_logic_vector(31 downto 0); --   order( 172 ) (32)   (1407 downto 1376);
    pkt_Data_CH_Data_9 : out std_logic_vector(31 downto 0); --   order( 173 ) (32)   (1439 downto 1408);
    pkt_Data_CH_Data_10 : out std_logic_vector(31 downto 0); --   order( 174 ) (32)   (1471 downto 1440);
    pkt_Data_CH_Data_11 : out std_logic_vector(31 downto 0); --   order( 175 ) (32)   (1503 downto 1472);
    pkt_Data_CH_Data_12 : out std_logic_vector(31 downto 0); --   order( 176 ) (32)   (1535 downto 1504);
    pkt_Data_CH_Data_13 : out std_logic_vector(31 downto 0); --   order( 177 ) (32)   (1567 downto 1536);
    pkt_Data_CH_Data_14 : out std_logic_vector(31 downto 0); --   order( 178 ) (32)   (1599 downto 1568);
    pkt_Data_CH_Data_15 : out std_logic_vector(31 downto 0); --   order( 179 ) (32)   (1631 downto 1600);
    pkt_Data_CH_Data_16 : out std_logic_vector(31 downto 0); --   order( 180 ) (32)   (1663 downto 1632);
    pkt_Data_CH_Data_17 : out std_logic_vector(31 downto 0); --   order( 181 ) (32)   (1695 downto 1664);
    pkt_Data_CH_Data_18 : out std_logic_vector(31 downto 0); --   order( 182 ) (32)   (1727 downto 1696);
    pkt_Data_CH_Data_19 : out std_logic_vector(31 downto 0); --   order( 183 ) (32)   (1759 downto 1728);
    pkt_Data_CH_Data_20 : out std_logic_vector(31 downto 0); --   order( 184 ) (32)   (1791 downto 1760);
    pkt_Data_CH_Data_21 : out std_logic_vector(31 downto 0); --   order( 185 ) (32)   (1823 downto 1792);
    pkt_Data_CH_Data_22 : out std_logic_vector(31 downto 0); --   order( 186 ) (32)   (1855 downto 1824);
    pkt_Data_CH_Data_23 : out std_logic_vector(31 downto 0); --   order( 187 ) (32)   (1887 downto 1856);
    pkt_Data_CH_Data_24 : out std_logic_vector(31 downto 0); --   order( 188 ) (32)   (1919 downto 1888);
    pkt_Data_CH_Data_25 : out std_logic_vector(31 downto 0); --   order( 189 ) (32)   (1951 downto 1920);
    pkt_Data_CH_Data_26 : out std_logic_vector(31 downto 0); --   order( 190 ) (32)   (1983 downto 1952);
    pkt_Data_CH_Data_27 : out std_logic_vector(31 downto 0); --   order( 191 ) (32)   (2015 downto 1984);
    pkt_Data_CH_Data_28 : out std_logic_vector(31 downto 0); --   order( 192 ) (32)   (2047 downto 2016);
    pkt_Data_CH_Data_29 : out std_logic_vector(31 downto 0); --   order( 193 ) (32)   (2079 downto 2048);
    pkt_Data_CH_Data_30 : out std_logic_vector(31 downto 0); --   order( 194 ) (32)   (2111 downto 2080);
    pkt_Data_CH_Data_31 : out std_logic_vector(31 downto 0); --   order( 195 ) (32)   (2143 downto 2112);
    pkt_Data_CH_Data_32 : out std_logic_vector(31 downto 0); --   order( 196 ) (32)   (2175 downto 2144);
    pkt_Data_CH_Data_33 : out std_logic_vector(31 downto 0); --   order( 197 ) (32)   (2207 downto 2176);
    pkt_Data_CH_Data_34 : out std_logic_vector(31 downto 0); --   order( 198 ) (32)   (2239 downto 2208);
    pkt_Data_CH_Data_35 : out std_logic_vector(31 downto 0); --   order( 199 ) (32)   (2271 downto 2240);
    pkt_Data_CH_Data_36 : out std_logic_vector(31 downto 0); --   order( 200 ) (32)   (2303 downto 2272);
    pkt_Data_CH_Data_37 : out std_logic_vector(31 downto 0); --   order( 201 ) (32)   (2335 downto 2304);
    --
    bitvector : in std_logic_vector(2399 downto 0)
  );
end entity;

--
architecture rtl of bs_scb_data_record_pin is
  --
  --
  signal Chan_Pkt : SCB2SPB_Pkt_300_Type;
  -- signal Chan_Str : std_logic_vector(2399 downto 0) := (others => '0');
  --
  --
begin
  --
  -- Chan_Str <= conv_ch_Chan_Str_r(Chan_Pkt);
  Chan_Pkt <= conv_ch_packet(bitvector);
  --

  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  pkt_FPGA_State_Trigger_State_TE_TX_TRIG <= bitvector(1104);
  pkt_FPGA_State_Trigger_State_TE_RX_TRIG <= bitvector(1105);
  pkt_FPGA_State_Trigger_State_TX_TRIG <= bitvector(1106);
  pkt_FPGA_State_Trigger_State_TX_P_GATE <= bitvector(1107);
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  pkt_FPGA_State_PA_FPGA_SelfTest_Result_PCM_Boot <= bitvector(976);
  pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM1_Boot <= bitvector(977);
  pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM2_Boot <= bitvector(978);
  pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM3_Boot <= bitvector(979);
  pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM4_Boot <= bitvector(980);
  pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM5_Boot <= bitvector(981);
  pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM6_Boot <= bitvector(982);
  pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM7_Boot <= bitvector(983);
  pkt_FPGA_State_PA_FPGA_SelfTest_Result_CMD_DATA_ERR <= bitvector(984);
  pkt_FPGA_State_PA_FPGA_SelfTest_Result_Temp_warn <= bitvector(985);
  -- not used
  -- not used
  pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAB_ST_RESULT <= bitvector(988);
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_MEM <= bitvector(960);
  -- not used
  -- not used
  -- not used
  pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_FPGA <= bitvector(964);
  -- not used
  -- not used
  -- not used
  pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_GTP <= bitvector(968);
  pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_LVDS <= bitvector(969);
  pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_UART <= bitvector(970);
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  pkt_FPGA_State_FPGA_Zynq_Control_PLC_State <= bitvector(872);
  pkt_FPGA_State_FPGA_Zynq_Control_DAQ_Count_Reset <= bitvector(873);
  pkt_FPGA_State_FPGA_Zynq_Control_AD_On_Result <= bitvector(874);
  -- not used
  -- not used
  pkt_FPGA_State_FPGA_Zynq_Control_SC_FPGA_Reset <= bitvector(877);
  pkt_FPGA_State_FPGA_Zynq_Control_PA_FPGA_Reset <= bitvector(878);
  pkt_FPGA_State_FPGA_Zynq_Control_Ping_On_Off <= bitvector(879);
  -- not used
  -- not used
  -- not used
  -- not used
  pkt_FPGA_State_DAQCounter <= bitvector(863 downto 832);
  pkt_FPGA_State_SC_GainValue <= bitvector(871 downto 864);
  -- not used
  pkt_FPGA_State_PA_FPGA_Temperature <= bitvector(887 downto 880);
  pkt_FPGA_State_SC_FPGA_Temperature <= bitvector(895 downto 888);
  pkt_FPGA_State_SP_AH_Zynq_Temperature <= bitvector(903 downto 896);
  pkt_FPGA_State_SP_P1_Zynq_Temperature <= bitvector(911 downto 904);
  pkt_FPGA_State_SP_P2_Zynq_Temperature <= bitvector(919 downto 912);
  pkt_FPGA_State_SC2SP_GTP_ERR <= bitvector(927 downto 920);
  pkt_FPGA_State_AH2P1_GTP_ERR <= bitvector(935 downto 928);
  pkt_FPGA_State_AH2P2_GTP_ERR <= bitvector(943 downto 936);
  pkt_FPGA_State_P12AH_GTP_ERR <= bitvector(951 downto 944);
  pkt_FPGA_State_P22AH_GTP_ERR <= bitvector(959 downto 952);
  -- not used
  -- not used
  -- not used
  pkt_FPGA_State_TX_Voltage_Sample1 <= bitvector(1023 downto 1008);
  pkt_FPGA_State_TX_Voltage_Sample2 <= bitvector(1039 downto 1024);
  pkt_FPGA_State_TX_DC_Voltage_Sample1 <= bitvector(1055 downto 1040);
  pkt_FPGA_State_TX_DC_Voltage_Sample2 <= bitvector(1071 downto 1056);
  pkt_FPGA_State_TX_DC_Current_Sample1 <= bitvector(1087 downto 1072);
  pkt_FPGA_State_TX_DC_Current_Sample2 <= bitvector(1103 downto 1088);
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  pkt_GC_INFO_GC_Event_4_Enable <= bitvector(496);
  pkt_GC_INFO_GC_Event_4_Detect <= bitvector(497);
  pkt_GC_INFO_GC_Event_4_Closein <= bitvector(498);
  pkt_GC_INFO_GC_Event_4_Fail <= bitvector(499);
  pkt_GC_INFO_GC_Event_4_ESAD_Chk <= bitvector(500);
  pkt_GC_INFO_GC_Event_4_ESAD_HV <= bitvector(501);
  pkt_GC_INFO_GC_Event_4_ESAD_Power <= bitvector(502);
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  pkt_GC_INFO_GC_Event_4_Leakage_Det <= bitvector(508);
  -- not used
  -- not used
  pkt_GC_INFO_GC_Event_4_M_Stop <= bitvector(511);
  -- not used
  -- not used
  -- not used
  -- not used
  pkt_GC_INFO_GC_Event_3_Beam_Steering <= bitvector(483 downto 480);
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  pkt_GC_INFO_GC_Event_2_Pre_Enable <= bitvector(464);
  pkt_GC_INFO_GC_Event_2_Enable <= bitvector(465);
  pkt_GC_INFO_GC_Event_2_V_Target <= bitvector(466);
  pkt_GC_INFO_GC_Event_2_Speed_Mode1 <= bitvector(467);
  pkt_GC_INFO_GC_Event_2_Speed_Mode2 <= bitvector(468);
  pkt_GC_INFO_GC_Event_2_Homming_Enable <= bitvector(469);
  pkt_GC_INFO_GC_Event_2_Homming_Mode <= bitvector(470);
  pkt_GC_INFO_GC_Event_2_Inhibit <= bitvector(471);
  pkt_GC_INFO_GC_Event_2_Hold_In <= bitvector(472);
  pkt_GC_INFO_GC_Event_2_Target_Det <= bitvector(473);
  pkt_GC_INFO_GC_Event_2_Target_Loss <= bitvector(474);
  pkt_GC_INFO_GC_Event_2_ACM_Det <= bitvector(475);
  pkt_GC_INFO_GC_Event_2_Pre_ACO_Chk <= bitvector(476);
  pkt_GC_INFO_GC_Event_2_ACO_Det <= bitvector(477);
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  pkt_GC_INFO_GC_Event_1_HILS_Mode <= bitvector(449);
  pkt_GC_INFO_GC_Event_1_EXHD_Mode <= bitvector(450);
  pkt_GC_INFO_GC_Event_1_C_Range <= bitvector(451);
  pkt_GC_INFO_GC_Event_1_E_Range <= bitvector(452);
  pkt_GC_INFO_GC_Event_1_ReservedBit05 <= bitvector(453);
  pkt_GC_INFO_GC_Event_1_Close_In <= bitvector(454);
  pkt_GC_INFO_GC_Event_1_Terminal_Homing <= bitvector(455);
  pkt_GC_INFO_GC_Event_1_Fire <= bitvector(456);
  pkt_GC_INFO_GC_Event_1_EOM <= bitvector(457);
  pkt_GC_INFO_GC_Event_1_Motor_Start <= bitvector(458);
  pkt_GC_INFO_GC_Event_1_Motor_Stop <= bitvector(459);
  pkt_GC_INFO_GC_Event_1_Ceiling_Det <= bitvector(460);
  pkt_GC_INFO_GC_Event_1_Floor_Det <= bitvector(461);
  pkt_GC_INFO_GC_Event_1_Surface_Det <= bitvector(462);
  pkt_GC_INFO_GC_Event_1_EOR <= bitvector(463);
  -- not used
  -- not used
  -- not used
  -- not used
  pkt_GC_INFO_GC_Command_PLC <= bitvector(416);
  pkt_GC_INFO_GC_Command_AD_On <= bitvector(417);
  -- not used
  -- not used
  pkt_GC_INFO_GC_Command_Pre_Enable <= bitvector(420);
  pkt_GC_INFO_GC_Command_Enable <= bitvector(421);
  -- not used
  -- not used
  pkt_GC_INFO_GC_Command_Salvo_On <= bitvector(424);
  pkt_GC_INFO_GC_Command_Band_Sel <= bitvector(425);
  pkt_GC_INFO_GC_Command_Mode_Set <= bitvector(426);
  pkt_GC_INFO_GC_Command_PRI_Start <= bitvector(427);
  pkt_GC_INFO_GC_Command_Test_Mode_Set <= bitvector(428);
  pkt_GC_INFO_GC_Command_REC_Disable_Set <= bitvector(429);
  pkt_GC_INFO_GC_Command_Test_Trig <= bitvector(430);
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  pkt_GC_INFO_GC_Count <= bitvector(415 downto 384);
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  pkt_GC_INFO_Speed_Mode <= bitvector(519 downto 512);
  pkt_GC_INFO_Search_Pattern <= bitvector(527 downto 520);
  pkt_GC_INFO_Pulse_Freq <= bitvector(535 downto 528);
  pkt_GC_INFO_Pulse_Type <= bitvector(543 downto 536);
  pkt_GC_INFO_Pulse_Length <= bitvector(551 downto 544);
  pkt_GC_INFO_PRE_Pulse <= bitvector(559 downto 552);
  pkt_GC_INFO_PRI <= bitvector(567 downto 560);
  pkt_GC_INFO_Beam_Steering <= bitvector(575 downto 568);
  pkt_GC_INFO_BAT_VOLT <= bitvector(591 downto 576);
  -- not used
  pkt_GC_INFO_TORP_N <= bitvector(671 downto 640);
  pkt_GC_INFO_TORP_E <= bitvector(703 downto 672);
  pkt_GC_INFO_TORP_D <= bitvector(719 downto 704);
  pkt_GC_INFO_TORP_Roll <= bitvector(735 downto 720);
  pkt_GC_INFO_TORP_Pitch <= bitvector(751 downto 736);
  pkt_GC_INFO_TORP_Yaw <= bitvector(767 downto 752);
  pkt_GC_INFO_ACT_On_Off <= bitvector(775 downto 768);
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  pkt_FPGA_CMD_Save_Beam_INFO_Save_R3 <= bitvector(320);
  pkt_FPGA_CMD_Save_Beam_INFO_Save_R2 <= bitvector(321);
  pkt_FPGA_CMD_Save_Beam_INFO_Save_R1 <= bitvector(322);
  pkt_FPGA_CMD_Save_Beam_INFO_Save_R0 <= bitvector(323);
  pkt_FPGA_CMD_Save_Beam_INFO_Save_C <= bitvector(324);
  pkt_FPGA_CMD_Save_Beam_INFO_Save_L0 <= bitvector(325);
  pkt_FPGA_CMD_Save_Beam_INFO_Save_L1 <= bitvector(326);
  pkt_FPGA_CMD_Save_Beam_INFO_Save_L2 <= bitvector(327);
  pkt_FPGA_CMD_Save_Beam_INFO_Optic_On <= bitvector(328);
  pkt_FPGA_CMD_Save_Beam_INFO_Ethernet_On <= bitvector(329);
  pkt_FPGA_CMD_Save_Beam_INFO_TE_Data_Input <= bitvector(331 downto 330);
  -- not used
  -- not used
  -- not used
  pkt_FPGA_CMD_Save_Beam_INFO_Save_L3 <= bitvector(335);
  -- not used
  -- not used
  -- not used
  -- not used
  pkt_FPGA_CMD_PA_Tx_FPGA_CMD_PRI <= bitvector(197 downto 192);
  pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx_Reset <= bitvector(198);
  pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx_Trigger <= bitvector(199);
  pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx_Pulse_Interval <= bitvector(206 downto 200);
  pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Number_of_Tx <= bitvector(207);
  pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Beam_Steering_Angle <= bitvector(215 downto 208);
  pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx1_Pulse_Length <= bitvector(222 downto 216);
  pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx1_Type <= bitvector(223);
  pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx1_Start_Frequency <= bitvector(238 downto 224);
  -- not used
  pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx1_Sweep_Frequency <= bitvector(247 downto 240);
  pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx2_Pulse_Length <= bitvector(254 downto 248);
  pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx2_Type <= bitvector(255);
  pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx2_Start_Frequency <= bitvector(270 downto 256);
  -- not used
  pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx2_Sweep_Frequency <= bitvector(279 downto 272);
  pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Beam_Weighting_Select <= bitvector(283 downto 280);
  pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Ramping_Time <= bitvector(287 downto 284);
  pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Battery_Voltage <= bitvector(303 downto 288);
  pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Stave_Selection_Number <= bitvector(307 downto 304);
  -- not used
  -- not used
  pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Test_Mode <= bitvector(310);
  pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Stave_Tx_Mode <= bitvector(311);
  pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Stave_Weight <= bitvector(319 downto 312);
  -- not used
  -- not used
  -- not used
  -- not used
  pkt_FPGA_CMD_SC_Rx_FPGA_CMD_TVG <= bitvector(131 downto 128);
  pkt_FPGA_CMD_SC_Rx_FPGA_CMD_REC_Mode <= bitvector(133 downto 132);
  -- not used
  -- not used
  pkt_FPGA_CMD_SC_Rx_FPGA_CMD_PLC <= bitvector(136);
  pkt_FPGA_CMD_SC_Rx_FPGA_CMD_DAQ_Count_Reset <= bitvector(137);
  pkt_FPGA_CMD_SC_Rx_FPGA_CMD_AD_On <= bitvector(138);
  pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Gain_Mode <= bitvector(139);
  pkt_FPGA_CMD_SC_Rx_FPGA_CMD_BPF_On_Off <= bitvector(140);
  pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Pass_Active <= bitvector(141);
  pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Reset <= bitvector(142);
  pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Stop_Run <= bitvector(143);
  pkt_FPGA_CMD_SC_Rx_FPGA_CMD_REC_On_Off <= bitvector(144);
  pkt_FPGA_CMD_SC_Rx_FPGA_CMD_PLC_Mode <= bitvector(146 downto 145);
  pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Data_Path <= bitvector(147);
  -- not used
  -- not used
  -- not used
  -- not used
  pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Gain <= bitvector(159 downto 152);
  pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Reserved <= bitvector(191 downto 160);
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  -- not used
  pkt_Start_Bytes <= bitvector(31 downto 0);
  pkt_Count <= bitvector(63 downto 32);
  pkt_Command <= bitvector(79 downto 64);
  pkt_ACK <= bitvector(95 downto 80);
  -- not used
  -- not used
  -- not used
  -- not used
  pkt_Checksum <= bitvector(2383 downto 2368);
  pkt_Stop_Bytes <= bitvector(2399 downto 2384);
  -- not used
  -- not used
  --
  pkt_Data_CH_Data_1 <= bitvector(1183 downto 1152);
  pkt_Data_CH_Data_2 <= bitvector(1215 downto 1184);
  pkt_Data_CH_Data_3 <= bitvector(1247 downto 1216);
  pkt_Data_CH_Data_4 <= bitvector(1279 downto 1248);
  pkt_Data_CH_Data_5 <= bitvector(1311 downto 1280);
  pkt_Data_CH_Data_6 <= bitvector(1343 downto 1312);
  pkt_Data_CH_Data_7 <= bitvector(1375 downto 1344);
  pkt_Data_CH_Data_8 <= bitvector(1407 downto 1376);
  pkt_Data_CH_Data_9 <= bitvector(1439 downto 1408);
  pkt_Data_CH_Data_10 <= bitvector(1471 downto 1440);
  pkt_Data_CH_Data_11 <= bitvector(1503 downto 1472);
  pkt_Data_CH_Data_12 <= bitvector(1535 downto 1504);
  pkt_Data_CH_Data_13 <= bitvector(1567 downto 1536);
  pkt_Data_CH_Data_14 <= bitvector(1599 downto 1568);
  pkt_Data_CH_Data_15 <= bitvector(1631 downto 1600);
  pkt_Data_CH_Data_16 <= bitvector(1663 downto 1632);
  pkt_Data_CH_Data_17 <= bitvector(1695 downto 1664);
  pkt_Data_CH_Data_18 <= bitvector(1727 downto 1696);
  pkt_Data_CH_Data_19 <= bitvector(1759 downto 1728);
  pkt_Data_CH_Data_20 <= bitvector(1791 downto 1760);
  pkt_Data_CH_Data_21 <= bitvector(1823 downto 1792);
  pkt_Data_CH_Data_22 <= bitvector(1855 downto 1824);
  pkt_Data_CH_Data_23 <= bitvector(1887 downto 1856);
  pkt_Data_CH_Data_24 <= bitvector(1919 downto 1888);
  pkt_Data_CH_Data_25 <= bitvector(1951 downto 1920);
  pkt_Data_CH_Data_26 <= bitvector(1983 downto 1952);
  pkt_Data_CH_Data_27 <= bitvector(2015 downto 1984);
  pkt_Data_CH_Data_28 <= bitvector(2047 downto 2016);
  pkt_Data_CH_Data_29 <= bitvector(2079 downto 2048);
  pkt_Data_CH_Data_30 <= bitvector(2111 downto 2080);
  pkt_Data_CH_Data_31 <= bitvector(2143 downto 2112);
  pkt_Data_CH_Data_32 <= bitvector(2175 downto 2144);
  pkt_Data_CH_Data_33 <= bitvector(2207 downto 2176);
  pkt_Data_CH_Data_34 <= bitvector(2239 downto 2208);
  pkt_Data_CH_Data_35 <= bitvector(2271 downto 2240);
  pkt_Data_CH_Data_36 <= bitvector(2303 downto 2272);
  pkt_Data_CH_Data_37 <= bitvector(2335 downto 2304);

  --
  --
end architecture;
--
--
--
--
--
-- --
-- --
-- --
-- --
-- --
-- --
-- --
-- --
-- --
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================