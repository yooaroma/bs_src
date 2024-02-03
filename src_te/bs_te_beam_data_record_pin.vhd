-- //=============================================================================
-- //=============================================================================
-- //=============================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
--
-- use work.SP2TE_BEAM_Type.all; -- BS2_protocol_V0.56_20231121
-- signal Chan_Pkt : SP2TE_BEAM_Pkt_300_Type;
-- signal Chan_Str : std_logic_vector(2399 downto 0) := (others => '0');
--
--
-- Chan_Str <= conv_ch_bitvector(Chan_Pkt);
-- Chan_Pkt <= conv_ch_packet(Chan_Str);
--
--
entity bs_sp2te_beam_data_record_pin is
  port (
    --
    -- not used 
    --  bitvector(2303 downto 1408)
    pkt_SUM_Beam_Data_Reserved : out std_logic_vector(63 downto 0); --               order( 1 ) bit( 64 )
    -- not used 
    -- not used 
    --
    -- not used 
    --  bitvector(1375 downto 1152)
    pkt_SUM_Beam_Data_Reserved : out std_logic_vector(31 downto 0); --               order( 2 ) bit( 32 )
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    pkt_FPGA_State_Trigger_State_TX_TRIG : out std_logic; --               order( 3 ) bit( 1 )
    pkt_FPGA_State_Trigger_State_RX_TRIG : out std_logic; --               order( 4 ) bit( 1 )
    pkt_FPGA_State_Trigger_State_TX_P_GATE : out std_logic; --               order( 5 ) bit( 1 )
    pkt_FPGA_State_Trigger_State_ReservedBit03 : out std_logic; --               order( 6 ) bit( 1 )
    pkt_FPGA_State_Trigger_State_ReservedBit04 : out std_logic; --               order( 7 ) bit( 1 )
    pkt_FPGA_State_Trigger_State_ReservedBit05 : out std_logic; --               order( 8 ) bit( 1 )
    pkt_FPGA_State_Trigger_State_ReservedBit06 : out std_logic; --               order( 9 ) bit( 1 )
    pkt_FPGA_State_Trigger_State_ReservedBit07 : out std_logic; --               order( 10 ) bit( 1 )
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    pkt_FPGA_State_SP_Zynq_SelfTest_Result_SP_P2_MEM : out std_logic; --               order( 11 ) bit( 1 )
    pkt_FPGA_State_SP_Zynq_SelfTest_Result_SP_P1_MEM : out std_logic; --               order( 12 ) bit( 1 )
    pkt_FPGA_State_SP_Zynq_SelfTest_Result_SP_AH_MEM : out std_logic; --               order( 13 ) bit( 1 )
    pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit03 : out std_logic; --               order( 14 ) bit( 1 )
    pkt_FPGA_State_SP_Zynq_SelfTest_Result_SP_P2_Zynq : out std_logic; --               order( 15 ) bit( 1 )
    pkt_FPGA_State_SP_Zynq_SelfTest_Result_SP_P1_Zynq : out std_logic; --               order( 16 ) bit( 1 )
    pkt_FPGA_State_SP_Zynq_SelfTest_Result_SP_AH_Zynq : out std_logic; --               order( 17 ) bit( 1 )
    pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit07 : out std_logic; --               order( 18 ) bit( 1 )
    pkt_FPGA_State_SP_Zynq_SelfTest_Result_SPC_GTP : out std_logic; --               order( 19 ) bit( 1 )
    pkt_FPGA_State_SP_Zynq_SelfTest_Result_SP_UART : out std_logic; --               order( 20 ) bit( 1 )
    pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit10 : out std_logic; --               order( 21 ) bit( 1 )
    pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit11 : out std_logic; --               order( 22 ) bit( 1 )
    pkt_FPGA_State_SP_Zynq_SelfTest_Result_PA_CMD_ACK : out std_logic; --               order( 23 ) bit( 1 )
    pkt_FPGA_State_SP_Zynq_SelfTest_Result_SC_CMD_ACK : out std_logic; --               order( 24 ) bit( 1 )
    pkt_FPGA_State_SP_Zynq_SelfTest_Result_PA_CHK_ACK : out std_logic; --               order( 25 ) bit( 1 )
    pkt_FPGA_State_SP_Zynq_SelfTest_Result_SC_CHK_ACK : out std_logic; --               order( 26 ) bit( 1 )
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    pkt_FPGA_State_PA_FPGA_SelfTest_Result_PCM_Boot : out std_logic; --               order( 27 ) bit( 1 )
    pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM1_Boot : out std_logic; --               order( 28 ) bit( 1 )
    pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM2_Boot : out std_logic; --               order( 29 ) bit( 1 )
    pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM3_Boot : out std_logic; --               order( 30 ) bit( 1 )
    pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM4_Boot : out std_logic; --               order( 31 ) bit( 1 )
    pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM5_Boot : out std_logic; --               order( 32 ) bit( 1 )
    pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM6_Boot : out std_logic; --               order( 33 ) bit( 1 )
    pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAM7_Boot : out std_logic; --               order( 34 ) bit( 1 )
    pkt_FPGA_State_PA_FPGA_SelfTest_Result_CMD_DATA_ERR : out std_logic; --               order( 35 ) bit( 1 )
    pkt_FPGA_State_PA_FPGA_SelfTest_Result_Temp_warn : out std_logic; --               order( 36 ) bit( 1 )
    pkt_FPGA_State_PA_FPGA_SelfTest_Result_ReservedBit02 : out std_logic; --               order( 37 ) bit( 1 )
    pkt_FPGA_State_PA_FPGA_SelfTest_Result_ReservedBit03 : out std_logic; --               order( 38 ) bit( 1 )
    pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAB_ST_RESULT : out std_logic; --               order( 39 ) bit( 1 )
    pkt_FPGA_State_PA_FPGA_SelfTest_Result_ReservedBit05 : out std_logic; --               order( 40 ) bit( 1 )
    pkt_FPGA_State_PA_FPGA_SelfTest_Result_ReservedBit06 : out std_logic; --               order( 41 ) bit( 1 )
    pkt_FPGA_State_PA_FPGA_SelfTest_Result_ReservedBit07 : out std_logic; --               order( 42 ) bit( 1 )
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_MEM : out std_logic; --               order( 43 ) bit( 1 )
    pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit01 : out std_logic; --               order( 44 ) bit( 1 )
    pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit02 : out std_logic; --               order( 45 ) bit( 1 )
    pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit03 : out std_logic; --               order( 46 ) bit( 1 )
    pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_FPGA : out std_logic; --               order( 47 ) bit( 1 )
    pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit05 : out std_logic; --               order( 48 ) bit( 1 )
    pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit06 : out std_logic; --               order( 49 ) bit( 1 )
    pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit07 : out std_logic; --               order( 50 ) bit( 1 )
    pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_GTP : out std_logic; --               order( 51 ) bit( 1 )
    pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_LVDS : out std_logic; --               order( 52 ) bit( 1 )
    pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_UART : out std_logic; --               order( 53 ) bit( 1 )
    pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit13 : out std_logic; --               order( 54 ) bit( 1 )
    pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit14 : out std_logic; --               order( 55 ) bit( 1 )
    pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit15 : out std_logic; --               order( 56 ) bit( 1 )
    pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit16 : out std_logic; --               order( 57 ) bit( 1 )
    pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit17 : out std_logic; --               order( 58 ) bit( 1 )
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    pkt_FPGA_State_FPGA_Zynq_Control_PLC_State : out std_logic; --               order( 59 ) bit( 1 )
    pkt_FPGA_State_FPGA_Zynq_Control_DAQ_Count_Reset : out std_logic; --               order( 60 ) bit( 1 )
    pkt_FPGA_State_FPGA_Zynq_Control_ReservedBit02 : out std_logic; --               order( 61 ) bit( 1 )
    pkt_FPGA_State_FPGA_Zynq_Control_ReservedBit03 : out std_logic; --               order( 62 ) bit( 1 )
    pkt_FPGA_State_FPGA_Zynq_Control_ReservedBit04 : out std_logic; --               order( 63 ) bit( 1 )
    pkt_FPGA_State_FPGA_Zynq_Control_SC_FPGA_Reset : out std_logic; --               order( 64 ) bit( 1 )
    pkt_FPGA_State_FPGA_Zynq_Control_PA_FPGA_Reset : out std_logic; --               order( 65 ) bit( 1 )
    pkt_FPGA_State_FPGA_Zynq_Control_Ping_On_Off : out std_logic; --               order( 66 ) bit( 1 )
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    pkt_FPGA_State_DAQCounter : out std_logic_vector(31 downto 0); --               order( 67 ) bit( 32 )
    pkt_FPGA_State_SC_GainValue : out std_logic_vector(7 downto 0); --               order( 68 ) bit( 8 )
    --  bitvector(879 downto 872)
    pkt_FPGA_State_PA_FPGA_Temperature : out std_logic_vector(7 downto 0); --               order( 69 ) bit( 8 )
    pkt_FPGA_State_SC_FPGA_Temperature : out std_logic_vector(7 downto 0); --               order( 70 ) bit( 8 )
    pkt_FPGA_State_SP_AH_Zynq_Temperature : out std_logic_vector(7 downto 0); --               order( 71 ) bit( 8 )
    pkt_FPGA_State_SP_P1_Zynq_Temperature : out std_logic_vector(7 downto 0); --               order( 72 ) bit( 8 )
    pkt_FPGA_State_SP_P2_Zynq_Temperature : out std_logic_vector(7 downto 0); --               order( 73 ) bit( 8 )
    pkt_FPGA_State_SC2SP_Zynq_GTP_ERR : out std_logic_vector(7 downto 0); --               order( 74 ) bit( 8 )
    pkt_FPGA_State_AH2P1_Zynq_GTP_ERR : out std_logic_vector(7 downto 0); --               order( 75 ) bit( 8 )
    pkt_FPGA_State_AH2P2_Zynq_GTP_ERR : out std_logic_vector(7 downto 0); --               order( 76 ) bit( 8 )
    pkt_FPGA_State_P12AH_Zynq_GTP_ERR : out std_logic_vector(7 downto 0); --               order( 77 ) bit( 8 )
    pkt_FPGA_State_P22AH_Zynq_GTP_ERR : out std_logic_vector(7 downto 0); --               order( 78 ) bit( 8 )
    --  bitvector(975 downto 960)
    --  bitvector(991 downto 976)
    --  bitvector(1007 downto 992)
    pkt_FPGA_State_TX_Voltage_Sample1 : out std_logic_vector(15 downto 0); --               order( 79 ) bit( 16 )
    pkt_FPGA_State_TX_Voltage_Sample2 : out std_logic_vector(15 downto 0); --               order( 80 ) bit( 16 )
    pkt_FPGA_State_TX_DC_Voltage_Sample1 : out std_logic_vector(15 downto 0); --               order( 81 ) bit( 16 )
    pkt_FPGA_State_TX_DC_Voltage_Sample2 : out std_logic_vector(15 downto 0); --               order( 82 ) bit( 16 )
    pkt_FPGA_State_TX_DC_Current_Sample1 : out std_logic_vector(15 downto 0); --               order( 83 ) bit( 16 )
    pkt_FPGA_State_TX_DC_Current_Sample2 : out std_logic_vector(15 downto 0); --               order( 84 ) bit( 16 )
    --  bitvector(1111 downto 1104)
    pkt_FPGA_State_Reserved_9 : out std_logic_vector(39 downto 0); --               order( 85 ) bit( 40 )
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    pkt_GC_INFO_GC_Event_4_Enable : out std_logic; --               order( 86 ) bit( 1 )
    pkt_GC_INFO_GC_Event_4_Detect : out std_logic; --               order( 87 ) bit( 1 )
    pkt_GC_INFO_GC_Event_4_Closein : out std_logic; --               order( 88 ) bit( 1 )
    pkt_GC_INFO_GC_Event_4_Fail : out std_logic; --               order( 89 ) bit( 1 )
    pkt_GC_INFO_GC_Event_4_ESAD_Chk : out std_logic; --               order( 90 ) bit( 1 )
    pkt_GC_INFO_GC_Event_4_ESAD_HV : out std_logic; --               order( 91 ) bit( 1 )
    pkt_GC_INFO_GC_Event_4_ESAD_Power : out std_logic; --               order( 92 ) bit( 1 )
    pkt_GC_INFO_GC_Event_4_ReservedBit07 : out std_logic; --               order( 93 ) bit( 1 )
    pkt_GC_INFO_GC_Event_4_ReservedBit08 : out std_logic; --               order( 94 ) bit( 1 )
    pkt_GC_INFO_GC_Event_4_ReservedBit09 : out std_logic; --               order( 95 ) bit( 1 )
    pkt_GC_INFO_GC_Event_4_ReservedBit10 : out std_logic; --               order( 96 ) bit( 1 )
    pkt_GC_INFO_GC_Event_4_ReservedBit11 : out std_logic; --               order( 97 ) bit( 1 )
    pkt_GC_INFO_GC_Event_4_Leakage_Det : out std_logic; --               order( 98 ) bit( 1 )
    pkt_GC_INFO_GC_Event_4_ReservedBit13 : out std_logic; --               order( 99 ) bit( 1 )
    pkt_GC_INFO_GC_Event_4_ReservedBit14 : out std_logic; --               order( 100 ) bit( 1 )
    pkt_GC_INFO_GC_Event_4_M_Stop : out std_logic; --               order( 101 ) bit( 1 )
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    pkt_GC_INFO_GC_Event_3_Beam_Steering : out std_logic_vector(3 downto 0); --               order( 102 ) bit( 4 )
    pkt_GC_INFO_GC_Event_3_ReservedBit04 : out std_logic; --               order( 103 ) bit( 1 )
    pkt_GC_INFO_GC_Event_3_ReservedBit05 : out std_logic; --               order( 104 ) bit( 1 )
    pkt_GC_INFO_GC_Event_3_ReservedBit06 : out std_logic; --               order( 105 ) bit( 1 )
    pkt_GC_INFO_GC_Event_3_ReservedBit07 : out std_logic; --               order( 106 ) bit( 1 )
    pkt_GC_INFO_GC_Event_3_ReservedBit08 : out std_logic; --               order( 107 ) bit( 1 )
    pkt_GC_INFO_GC_Event_3_ReservedBit09 : out std_logic; --               order( 108 ) bit( 1 )
    pkt_GC_INFO_GC_Event_3_ReservedBit10 : out std_logic; --               order( 109 ) bit( 1 )
    pkt_GC_INFO_GC_Event_3_ReservedBit11 : out std_logic; --               order( 110 ) bit( 1 )
    pkt_GC_INFO_GC_Event_3_ReservedBit12 : out std_logic; --               order( 111 ) bit( 1 )
    pkt_GC_INFO_GC_Event_3_ReservedBit13 : out std_logic; --               order( 112 ) bit( 1 )
    pkt_GC_INFO_GC_Event_3_ReservedBit14 : out std_logic; --               order( 113 ) bit( 1 )
    pkt_GC_INFO_GC_Event_3_ReservedBit15 : out std_logic; --               order( 114 ) bit( 1 )
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    pkt_GC_INFO_GC_Event_2_Pre_Enable : out std_logic; --               order( 115 ) bit( 1 )
    pkt_GC_INFO_GC_Event_2_Enable : out std_logic; --               order( 116 ) bit( 1 )
    pkt_GC_INFO_GC_Event_2_V_Target : out std_logic; --               order( 117 ) bit( 1 )
    pkt_GC_INFO_GC_Event_2_Speed_Mode1 : out std_logic; --               order( 118 ) bit( 1 )
    pkt_GC_INFO_GC_Event_2_Speed_Mode2 : out std_logic; --               order( 119 ) bit( 1 )
    pkt_GC_INFO_GC_Event_2_Homming_Enable : out std_logic; --               order( 120 ) bit( 1 )
    pkt_GC_INFO_GC_Event_2_Homming_Mode : out std_logic; --               order( 121 ) bit( 1 )
    pkt_GC_INFO_GC_Event_2_Inhibit : out std_logic; --               order( 122 ) bit( 1 )
    pkt_GC_INFO_GC_Event_2_Hold_In : out std_logic; --               order( 123 ) bit( 1 )
    pkt_GC_INFO_GC_Event_2_Target_Det : out std_logic; --               order( 124 ) bit( 1 )
    pkt_GC_INFO_GC_Event_2_Target_Loss : out std_logic; --               order( 125 ) bit( 1 )
    pkt_GC_INFO_GC_Event_2_ACM_Det : out std_logic; --               order( 126 ) bit( 1 )
    pkt_GC_INFO_GC_Event_2_Pre_ACO_Chk : out std_logic; --               order( 127 ) bit( 1 )
    pkt_GC_INFO_GC_Event_2_ACO_Det : out std_logic; --               order( 128 ) bit( 1 )
    pkt_GC_INFO_GC_Event_2_ReservedBit14 : out std_logic; --               order( 129 ) bit( 1 )
    pkt_GC_INFO_GC_Event_2_ReservedBit15 : out std_logic; --               order( 130 ) bit( 1 )
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    pkt_GC_INFO_GC_Event_1_ReservedBit00 : out std_logic; --               order( 131 ) bit( 1 )
    pkt_GC_INFO_GC_Event_1_HILS_Mode : out std_logic; --               order( 132 ) bit( 1 )
    pkt_GC_INFO_GC_Event_1_EXHD_Mode : out std_logic; --               order( 133 ) bit( 1 )
    pkt_GC_INFO_GC_Event_1_C_Range : out std_logic; --               order( 134 ) bit( 1 )
    pkt_GC_INFO_GC_Event_1_E_Range : out std_logic; --               order( 135 ) bit( 1 )
    pkt_GC_INFO_GC_Event_1_ReservedBit05 : out std_logic; --               order( 136 ) bit( 1 )
    pkt_GC_INFO_GC_Event_1_Close_In : out std_logic; --               order( 137 ) bit( 1 )
    pkt_GC_INFO_GC_Event_1_Terminal_Homing : out std_logic; --               order( 138 ) bit( 1 )
    pkt_GC_INFO_GC_Event_1_Fire : out std_logic; --               order( 139 ) bit( 1 )
    pkt_GC_INFO_GC_Event_1_EOM : out std_logic; --               order( 140 ) bit( 1 )
    pkt_GC_INFO_GC_Event_1_Motor_Start : out std_logic; --               order( 141 ) bit( 1 )
    pkt_GC_INFO_GC_Event_1_Motor_Stop : out std_logic; --               order( 142 ) bit( 1 )
    pkt_GC_INFO_GC_Event_1_Ceiling_Det : out std_logic; --               order( 143 ) bit( 1 )
    pkt_GC_INFO_GC_Event_1_Floor_Det : out std_logic; --               order( 144 ) bit( 1 )
    pkt_GC_INFO_GC_Event_1_Surface_Det : out std_logic; --               order( 145 ) bit( 1 )
    pkt_GC_INFO_GC_Event_1_EOR : out std_logic; --               order( 146 ) bit( 1 )
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    pkt_GC_INFO_GC_Command_PLC : out std_logic; --               order( 147 ) bit( 1 )
    pkt_GC_INFO_GC_Command_AD_On : out std_logic; --               order( 148 ) bit( 1 )
    pkt_GC_INFO_GC_Command_ReservedBit02 : out std_logic; --               order( 149 ) bit( 1 )
    pkt_GC_INFO_GC_Command_ReservedBit03 : out std_logic; --               order( 150 ) bit( 1 )
    pkt_GC_INFO_GC_Command_Pre_Enable : out std_logic; --               order( 151 ) bit( 1 )
    pkt_GC_INFO_GC_Command_Enable : out std_logic; --               order( 152 ) bit( 1 )
    pkt_GC_INFO_GC_Command_ReservedBit06 : out std_logic; --               order( 153 ) bit( 1 )
    pkt_GC_INFO_GC_Command_ReservedBit07 : out std_logic; --               order( 154 ) bit( 1 )
    pkt_GC_INFO_GC_Command_Salvo_On : out std_logic; --               order( 155 ) bit( 1 )
    pkt_GC_INFO_GC_Command_Band_Sel : out std_logic; --               order( 156 ) bit( 1 )
    pkt_GC_INFO_GC_Command_Mode_Set : out std_logic; --               order( 157 ) bit( 1 )
    pkt_GC_INFO_GC_Command_PRI_Start : out std_logic; --               order( 158 ) bit( 1 )
    pkt_GC_INFO_GC_Command_Test_Mode_Set : out std_logic; --               order( 159 ) bit( 1 )
    pkt_GC_INFO_GC_Command_REC_Disable_Set : out std_logic; --               order( 160 ) bit( 1 )
    pkt_GC_INFO_GC_Command_Test_Trig : out std_logic; --               order( 161 ) bit( 1 )
    pkt_GC_INFO_GC_Command_ReservedBit15 : out std_logic; --               order( 162 ) bit( 1 )
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    pkt_GC_INFO_GC_Count : out std_logic_vector(31 downto 0); --               order( 163 ) bit( 32 )
    --  bitvector(431 downto 416)
    pkt_GC_INFO_Reserved_0 : out std_logic_vector(15 downto 0); --               order( 164 ) bit( 16 )
    --  bitvector(463 downto 448)
    --  bitvector(479 downto 464)
    --  bitvector(495 downto 480)
    --  bitvector(511 downto 496)
    pkt_GC_INFO_Speed_Mode : out std_logic_vector(7 downto 0); --               order( 165 ) bit( 8 )
    pkt_GC_INFO_Search_Pattern : out std_logic_vector(7 downto 0); --               order( 166 ) bit( 8 )
    pkt_GC_INFO_Pulse_Freq : out std_logic_vector(7 downto 0); --               order( 167 ) bit( 8 )
    pkt_GC_INFO_Pulse_Type : out std_logic_vector(7 downto 0); --               order( 168 ) bit( 8 )
    pkt_GC_INFO_Pulse_Length : out std_logic_vector(7 downto 0); --               order( 169 ) bit( 8 )
    pkt_GC_INFO_PRE_Pulse : out std_logic_vector(7 downto 0); --               order( 170 ) bit( 8 )
    pkt_GC_INFO_PRI : out std_logic_vector(7 downto 0); --               order( 171 ) bit( 8 )
    pkt_GC_INFO_Beam_Steering : out std_logic_vector(7 downto 0); --               order( 172 ) bit( 8 )
    pkt_GC_INFO_BAT_VOLT : out std_logic_vector(15 downto 0); --               order( 173 ) bit( 16 )
    pkt_GC_INFO_Reserved_1 : out std_logic_vector(47 downto 0); --               order( 174 ) bit( 48 )
    pkt_GC_INFO_TORP_N : out std_logic_vector(31 downto 0); --               order( 175 ) bit( 32 )
    pkt_GC_INFO_TORP_E : out std_logic_vector(31 downto 0); --               order( 176 ) bit( 32 )
    pkt_GC_INFO_TORP_D : out std_logic_vector(15 downto 0); --               order( 177 ) bit( 16 )
    pkt_GC_INFO_TORP_Roll : out std_logic_vector(15 downto 0); --               order( 178 ) bit( 16 )
    pkt_GC_INFO_TORP_Pitch : out std_logic_vector(15 downto 0); --               order( 179 ) bit( 16 )
    pkt_GC_INFO_TORP_Yaw : out std_logic_vector(15 downto 0); --               order( 180 ) bit( 16 )
    pkt_GC_INFO_ACT_On_Off : out std_logic_vector(7 downto 0); --               order( 181 ) bit( 8 )
    pkt_GC_INFO_Reserved_2 : out std_logic_vector(55 downto 0); --               order( 182 ) bit( 56 )
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    pkt_FPGA_CMD_Save_Beam_INFO_Save_R3 : out std_logic; --               order( 183 ) bit( 1 )
    pkt_FPGA_CMD_Save_Beam_INFO_Save_R2 : out std_logic; --               order( 184 ) bit( 1 )
    pkt_FPGA_CMD_Save_Beam_INFO_Save_R1 : out std_logic; --               order( 185 ) bit( 1 )
    pkt_FPGA_CMD_Save_Beam_INFO_Save_R0 : out std_logic; --               order( 186 ) bit( 1 )
    pkt_FPGA_CMD_Save_Beam_INFO_Save_C : out std_logic; --               order( 187 ) bit( 1 )
    pkt_FPGA_CMD_Save_Beam_INFO_Save_L0 : out std_logic; --               order( 188 ) bit( 1 )
    pkt_FPGA_CMD_Save_Beam_INFO_Save_L1 : out std_logic; --               order( 189 ) bit( 1 )
    pkt_FPGA_CMD_Save_Beam_INFO_Save_L2 : out std_logic; --               order( 190 ) bit( 1 )
    pkt_FPGA_CMD_Save_Beam_INFO_Optic_On : out std_logic; --               order( 191 ) bit( 1 )
    pkt_FPGA_CMD_Save_Beam_INFO_Ethernet_On : out std_logic; --               order( 192 ) bit( 1 )
    pkt_FPGA_CMD_Save_Beam_INFO_TE_Data_Input : out std_logic_vector(1 downto 0); --               order( 193 ) bit( 2 )
    pkt_FPGA_CMD_Save_Beam_INFO_ReservedBit04 : out std_logic; --               order( 194 ) bit( 1 )
    pkt_FPGA_CMD_Save_Beam_INFO_ReservedBit05 : out std_logic; --               order( 195 ) bit( 1 )
    pkt_FPGA_CMD_Save_Beam_INFO_ReservedBit06 : out std_logic; --               order( 196 ) bit( 1 )
    pkt_FPGA_CMD_Save_Beam_INFO_Save_L3 : out std_logic; --               order( 197 ) bit( 1 )
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_PRI : out std_logic_vector(5 downto 0); --               order( 198 ) bit( 6 )
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx_Reset : out std_logic; --               order( 199 ) bit( 1 )
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx_Trigger : out std_logic; --               order( 200 ) bit( 1 )
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx_Pulse_Interval : out std_logic_vector(6 downto 0); --               order( 201 ) bit( 7 )
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Number_of_Tx : out std_logic; --               order( 202 ) bit( 1 )
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Beam_Steering_Angle : out std_logic_vector(7 downto 0); --               order( 203 ) bit( 8 )
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx1_Pulse_Length : out std_logic_vector(6 downto 0); --               order( 204 ) bit( 7 )
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx1_Type : out std_logic; --               order( 205 ) bit( 1 )
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx1_Start_Frequency : out std_logic_vector(14 downto 0); --               order( 206 ) bit( 15 )
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_ReservedBit07_1 : out std_logic; --               order( 207 ) bit( 1 )
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx1_Sweep_Frequency : out std_logic_vector(7 downto 0); --               order( 208 ) bit( 8 )
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx2_Pulse_Length : out std_logic_vector(6 downto 0); --               order( 209 ) bit( 7 )
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx2_Type : out std_logic; --               order( 210 ) bit( 1 )
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx2_Start_Frequency : out std_logic_vector(14 downto 0); --               order( 211 ) bit( 15 )
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_ReservedBit07_2 : out std_logic; --               order( 212 ) bit( 1 )
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx2_Sweep_Frequency : out std_logic_vector(7 downto 0); --               order( 213 ) bit( 8 )
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Beam_Weighting_Select : out std_logic_vector(3 downto 0); --               order( 214 ) bit( 4 )
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Ramping_Time : out std_logic_vector(3 downto 0); --               order( 215 ) bit( 4 )
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Battery_Voltage : out std_logic_vector(15 downto 0); --               order( 216 ) bit( 16 )
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Stave_Selection_Number : out std_logic_vector(3 downto 0); --               order( 217 ) bit( 4 )
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Reserved_1 : out std_logic; --               order( 218 ) bit( 1 )
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Reserved_2 : out std_logic; --               order( 219 ) bit( 1 )
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Test_Mode : out std_logic; --               order( 220 ) bit( 1 )
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Stave_Tx_Mode : out std_logic; --               order( 221 ) bit( 1 )
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Stave_Weight : out std_logic_vector(7 downto 0); --               order( 222 ) bit( 8 )
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_TVG : out std_logic_vector(3 downto 0); --               order( 223 ) bit( 4 )
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_REC_Mode : out std_logic_vector(1 downto 0); --               order( 224 ) bit( 2 )
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_ReservedBit06_0 : out std_logic; --               order( 225 ) bit( 1 )
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_ReservedBit07_0 : out std_logic; --               order( 226 ) bit( 1 )
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_PLC : out std_logic; --               order( 227 ) bit( 1 )
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_DAQ_Count_Reset : out std_logic; --               order( 228 ) bit( 1 )
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_AD_On : out std_logic; --               order( 229 ) bit( 1 )
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Gain_Mode : out std_logic; --               order( 230 ) bit( 1 )
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_BPF_On_Off : out std_logic; --               order( 231 ) bit( 1 )
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Pass_Active : out std_logic; --               order( 232 ) bit( 1 )
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Reset : out std_logic; --               order( 233 ) bit( 1 )
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Stop_Run : out std_logic; --               order( 234 ) bit( 1 )
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_REC_On_Off : out std_logic; --               order( 235 ) bit( 1 )
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_PLC_Mode : out std_logic_vector(1 downto 0); --               order( 236 ) bit( 2 )
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Data_Path : out std_logic; --               order( 237 ) bit( 1 )
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_ReservedBit04 : out std_logic; --               order( 238 ) bit( 1 )
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_ReservedBit05 : out std_logic; --               order( 239 ) bit( 1 )
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_ReservedBit06 : out std_logic; --               order( 240 ) bit( 1 )
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_ReservedBit07 : out std_logic; --               order( 241 ) bit( 1 )
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Gain : out std_logic_vector(7 downto 0); --               order( 242 ) bit( 8 )
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Reserved : out std_logic_vector(31 downto 0); --               order( 243 ) bit( 32 )
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    pkt_FPGA_CMD_Reserved_0 : out std_logic_vector(31 downto 0); --               order( 244 ) bit( 32 )
    --  bitvector(191 downto 128)
    --  bitvector(319 downto 192)
    --  bitvector(335 downto 320)
    pkt_FPGA_CMD_Reserved_1 : out std_logic_vector(47 downto 0); --               order( 245 ) bit( 48 )
    -- not used 
    -- not used 
    -- not used 
    -- not used 
    pkt_Start_Bytes : out std_logic_vector(31 downto 0); --               order( 246 ) bit( 32 )
    pkt_Count : out std_logic_vector(31 downto 0); --               order( 247 ) bit( 32 )
    pkt_Command : out std_logic_vector(15 downto 0); --               order( 248 ) bit( 16 )
    pkt_ACK : out std_logic_vector(15 downto 0); --               order( 249 ) bit( 16 )
    --  bitvector(383 downto 96)
    --  bitvector(831 downto 384)
    --  bitvector(1151 downto 832)
    --  bitvector(1407 downto 1152)
    --  bitvector(2367 downto 1408)
    pkt_Checksum : out std_logic_vector(15 downto 0); --               order( 250 ) bit( 16 )
    pkt_Stop_Bytes : out std_logic_vector(15 downto 0); --               order( 251 ) bit( 16 )
    -- not used 
    -- not used 
    -- not used 

    pkt_SUM_Beam_Data_0 : out std_logic_vector(31 downto 0); --   order( 252 ) (32)   (1151 downto 1120);
    pkt_SUM_Beam_Data_1 : out std_logic_vector(31 downto 0); --   order( 253 ) (32)   (1183 downto 1152);
    pkt_SUM_Beam_Data_2 : out std_logic_vector(31 downto 0); --   order( 254 ) (32)   (1215 downto 1184);
    pkt_SUM_Beam_Data_3 : out std_logic_vector(31 downto 0); --   order( 255 ) (32)   (1247 downto 1216);
    pkt_SUM_Beam_Data_4 : out std_logic_vector(31 downto 0); --   order( 256 ) (32)   (1279 downto 1248);
    pkt_SUM_Beam_Data_5 : out std_logic_vector(31 downto 0); --   order( 257 ) (32)   (1311 downto 1280);
    pkt_SUM_Beam_Data_6 : out std_logic_vector(31 downto 0); --   order( 258 ) (32)   (1343 downto 1312);
    pkt_UDRL_Beam_Data_L3_0 : out std_logic_vector(31 downto 0); --   order( 259 ) (32)   (1407 downto 1376);
    pkt_UDRL_Beam_Data_L3_1 : out std_logic_vector(31 downto 0); --   order( 260 ) (32)   (1439 downto 1408);
    pkt_UDRL_Beam_Data_L3_2 : out std_logic_vector(31 downto 0); --   order( 261 ) (32)   (1471 downto 1440);
    pkt_UDRL_Beam_Data_L3_3 : out std_logic_vector(31 downto 0); --   order( 262 ) (32)   (1503 downto 1472);
    pkt_UDRL_Beam_Data_L2_0 : out std_logic_vector(31 downto 0); --   order( 263 ) (32)   (1535 downto 1504);
    pkt_UDRL_Beam_Data_L2_1 : out std_logic_vector(31 downto 0); --   order( 264 ) (32)   (1567 downto 1536);
    pkt_UDRL_Beam_Data_L2_2 : out std_logic_vector(31 downto 0); --   order( 265 ) (32)   (1599 downto 1568);
    pkt_UDRL_Beam_Data_L2_3 : out std_logic_vector(31 downto 0); --   order( 266 ) (32)   (1631 downto 1600);
    pkt_UDRL_Beam_Data_L1_0 : out std_logic_vector(31 downto 0); --   order( 267 ) (32)   (1663 downto 1632);
    pkt_UDRL_Beam_Data_L1_1 : out std_logic_vector(31 downto 0); --   order( 268 ) (32)   (1695 downto 1664);
    pkt_UDRL_Beam_Data_L1_2 : out std_logic_vector(31 downto 0); --   order( 269 ) (32)   (1727 downto 1696);
    pkt_UDRL_Beam_Data_L1_3 : out std_logic_vector(31 downto 0); --   order( 270 ) (32)   (1759 downto 1728);
    pkt_UDRL_Beam_Data_C0_0 : out std_logic_vector(31 downto 0); --   order( 271 ) (32)   (1791 downto 1760);
    pkt_UDRL_Beam_Data_C0_1 : out std_logic_vector(31 downto 0); --   order( 272 ) (32)   (1823 downto 1792);
    pkt_UDRL_Beam_Data_C0_2 : out std_logic_vector(31 downto 0); --   order( 273 ) (32)   (1855 downto 1824);
    pkt_UDRL_Beam_Data_C0_3 : out std_logic_vector(31 downto 0); --   order( 274 ) (32)   (1887 downto 1856);
    pkt_UDRL_Beam_Data_R1_0 : out std_logic_vector(31 downto 0); --   order( 275 ) (32)   (1919 downto 1888);
    pkt_UDRL_Beam_Data_R1_1 : out std_logic_vector(31 downto 0); --   order( 276 ) (32)   (1951 downto 1920);
    pkt_UDRL_Beam_Data_R1_2 : out std_logic_vector(31 downto 0); --   order( 277 ) (32)   (1983 downto 1952);
    pkt_UDRL_Beam_Data_R1_3 : out std_logic_vector(31 downto 0); --   order( 278 ) (32)   (2015 downto 1984);
    pkt_UDRL_Beam_Data_R2_0 : out std_logic_vector(31 downto 0); --   order( 279 ) (32)   (2047 downto 2016);
    pkt_UDRL_Beam_Data_R2_1 : out std_logic_vector(31 downto 0); --   order( 280 ) (32)   (2079 downto 2048);
    pkt_UDRL_Beam_Data_R2_2 : out std_logic_vector(31 downto 0); --   order( 281 ) (32)   (2111 downto 2080);
    pkt_UDRL_Beam_Data_R2_3 : out std_logic_vector(31 downto 0); --   order( 282 ) (32)   (2143 downto 2112);
    pkt_UDRL_Beam_Data_R3_0 : out std_logic_vector(31 downto 0); --   order( 283 ) (32)   (2175 downto 2144);
    pkt_UDRL_Beam_Data_R3_1 : out std_logic_vector(31 downto 0); --   order( 284 ) (32)   (2207 downto 2176);
    pkt_UDRL_Beam_Data_R3_2 : out std_logic_vector(31 downto 0); --   order( 285 ) (32)   (2239 downto 2208);
    pkt_UDRL_Beam_Data_R3_3 : out std_logic_vector(31 downto 0); --   order( 286 ) (32)   (2271 downto 2240);
    --
    bitvector : in std_logic_vector(2399 downto 0)
  );
end entity;
--
architecture rtl of bs_sp2te_beam_data_record_pin is
  --
begin
  --
  -- Chan_Str <= conv_ch_Chan_Str_r(Chan_Pkt);
  Chan_Pkt <= conv_ch_packet(bitvector);



  --
  -- not used
  --  bitvector(2303 downto 1408)
  pkt_SUM_Beam_Data_Reserved <= bitvector(2367 downto 2304);
  -- not used
  -- not used
  --
  -- not used
  --  bitvector(1375 downto 1152)
  pkt_SUM_Beam_Data_Reserved <= bitvector(1407 downto 1376);
  -- not used
  -- not used
  -- not used
  -- not used
  pkt_FPGA_State_Trigger_State_TX_TRIG <= bitvector(1104);
  pkt_FPGA_State_Trigger_State_RX_TRIG <= bitvector(1105);
  pkt_FPGA_State_Trigger_State_TX_P_GATE <= bitvector(1106);
  pkt_FPGA_State_Trigger_State_ReservedBit03 <= bitvector(1107);
  pkt_FPGA_State_Trigger_State_ReservedBit04 <= bitvector(1108);
  pkt_FPGA_State_Trigger_State_ReservedBit05 <= bitvector(1109);
  pkt_FPGA_State_Trigger_State_ReservedBit06 <= bitvector(1110);
  pkt_FPGA_State_Trigger_State_ReservedBit07 <= bitvector(1111);
  -- not used
  -- not used
  -- not used
  -- not used
  pkt_FPGA_State_SP_Zynq_SelfTest_Result_SP_P2_MEM <= bitvector(992);
  pkt_FPGA_State_SP_Zynq_SelfTest_Result_SP_P1_MEM <= bitvector(993);
  pkt_FPGA_State_SP_Zynq_SelfTest_Result_SP_AH_MEM <= bitvector(994);
  pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit03 <= bitvector(995);
  pkt_FPGA_State_SP_Zynq_SelfTest_Result_SP_P2_Zynq <= bitvector(996);
  pkt_FPGA_State_SP_Zynq_SelfTest_Result_SP_P1_Zynq <= bitvector(997);
  pkt_FPGA_State_SP_Zynq_SelfTest_Result_SP_AH_Zynq <= bitvector(998);
  pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit07 <= bitvector(999);
  pkt_FPGA_State_SP_Zynq_SelfTest_Result_SPC_GTP <= bitvector(1000);
  pkt_FPGA_State_SP_Zynq_SelfTest_Result_SP_UART <= bitvector(1001);
  pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit10 <= bitvector(1002);
  pkt_FPGA_State_SP_Zynq_SelfTest_Result_ReservedBit11 <= bitvector(1003);
  pkt_FPGA_State_SP_Zynq_SelfTest_Result_PA_CMD_ACK <= bitvector(1004);
  pkt_FPGA_State_SP_Zynq_SelfTest_Result_SC_CMD_ACK <= bitvector(1005);
  pkt_FPGA_State_SP_Zynq_SelfTest_Result_PA_CHK_ACK <= bitvector(1006);
  pkt_FPGA_State_SP_Zynq_SelfTest_Result_SC_CHK_ACK <= bitvector(1007);
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
  pkt_FPGA_State_PA_FPGA_SelfTest_Result_ReservedBit02 <= bitvector(986);
  pkt_FPGA_State_PA_FPGA_SelfTest_Result_ReservedBit03 <= bitvector(987);
  pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAB_ST_RESULT <= bitvector(988);
  pkt_FPGA_State_PA_FPGA_SelfTest_Result_ReservedBit05 <= bitvector(989);
  pkt_FPGA_State_PA_FPGA_SelfTest_Result_ReservedBit06 <= bitvector(990);
  pkt_FPGA_State_PA_FPGA_SelfTest_Result_ReservedBit07 <= bitvector(991);
  -- not used
  -- not used
  -- not used
  -- not used
  pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_MEM <= bitvector(960);
  pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit01 <= bitvector(961);
  pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit02 <= bitvector(962);
  pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit03 <= bitvector(963);
  pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_FPGA <= bitvector(964);
  pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit05 <= bitvector(965);
  pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit06 <= bitvector(966);
  pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit07 <= bitvector(967);
  pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_GTP <= bitvector(968);
  pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_LVDS <= bitvector(969);
  pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_UART <= bitvector(970);
  pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit13 <= bitvector(971);
  pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit14 <= bitvector(972);
  pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit15 <= bitvector(973);
  pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit16 <= bitvector(974);
  pkt_FPGA_State_SC_FPGA_SelfTest_Result_ReservedBit17 <= bitvector(975);
  -- not used
  -- not used
  -- not used
  -- not used
  pkt_FPGA_State_FPGA_Zynq_Control_PLC_State <= bitvector(872);
  pkt_FPGA_State_FPGA_Zynq_Control_DAQ_Count_Reset <= bitvector(873);
  pkt_FPGA_State_FPGA_Zynq_Control_ReservedBit02 <= bitvector(874);
  pkt_FPGA_State_FPGA_Zynq_Control_ReservedBit03 <= bitvector(875);
  pkt_FPGA_State_FPGA_Zynq_Control_ReservedBit04 <= bitvector(876);
  pkt_FPGA_State_FPGA_Zynq_Control_SC_FPGA_Reset <= bitvector(877);
  pkt_FPGA_State_FPGA_Zynq_Control_PA_FPGA_Reset <= bitvector(878);
  pkt_FPGA_State_FPGA_Zynq_Control_Ping_On_Off <= bitvector(879);
  -- not used
  -- not used
  -- not used
  -- not used
  pkt_FPGA_State_DAQCounter <= bitvector(863 downto 832);
  pkt_FPGA_State_SC_GainValue <= bitvector(871 downto 864);
  --  bitvector(879 downto 872)
  pkt_FPGA_State_PA_FPGA_Temperature <= bitvector(887 downto 880);
  pkt_FPGA_State_SC_FPGA_Temperature <= bitvector(895 downto 888);
  pkt_FPGA_State_SP_AH_Zynq_Temperature <= bitvector(903 downto 896);
  pkt_FPGA_State_SP_P1_Zynq_Temperature <= bitvector(911 downto 904);
  pkt_FPGA_State_SP_P2_Zynq_Temperature <= bitvector(919 downto 912);
  pkt_FPGA_State_SC2SP_Zynq_GTP_ERR <= bitvector(927 downto 920);
  pkt_FPGA_State_AH2P1_Zynq_GTP_ERR <= bitvector(935 downto 928);
  pkt_FPGA_State_AH2P2_Zynq_GTP_ERR <= bitvector(943 downto 936);
  pkt_FPGA_State_P12AH_Zynq_GTP_ERR <= bitvector(951 downto 944);
  pkt_FPGA_State_P22AH_Zynq_GTP_ERR <= bitvector(959 downto 952);
  --  bitvector(975 downto 960)
  --  bitvector(991 downto 976)
  --  bitvector(1007 downto 992)
  pkt_FPGA_State_TX_Voltage_Sample1 <= bitvector(1023 downto 1008);
  pkt_FPGA_State_TX_Voltage_Sample2 <= bitvector(1039 downto 1024);
  pkt_FPGA_State_TX_DC_Voltage_Sample1 <= bitvector(1055 downto 1040);
  pkt_FPGA_State_TX_DC_Voltage_Sample2 <= bitvector(1071 downto 1056);
  pkt_FPGA_State_TX_DC_Current_Sample1 <= bitvector(1087 downto 1072);
  pkt_FPGA_State_TX_DC_Current_Sample2 <= bitvector(1103 downto 1088);
  --  bitvector(1111 downto 1104)
  pkt_FPGA_State_Reserved_9 <= bitvector(1151 downto 1112);
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
  pkt_GC_INFO_GC_Event_4_ReservedBit07 <= bitvector(503);
  pkt_GC_INFO_GC_Event_4_ReservedBit08 <= bitvector(504);
  pkt_GC_INFO_GC_Event_4_ReservedBit09 <= bitvector(505);
  pkt_GC_INFO_GC_Event_4_ReservedBit10 <= bitvector(506);
  pkt_GC_INFO_GC_Event_4_ReservedBit11 <= bitvector(507);
  pkt_GC_INFO_GC_Event_4_Leakage_Det <= bitvector(508);
  pkt_GC_INFO_GC_Event_4_ReservedBit13 <= bitvector(509);
  pkt_GC_INFO_GC_Event_4_ReservedBit14 <= bitvector(510);
  pkt_GC_INFO_GC_Event_4_M_Stop <= bitvector(511);
  -- not used
  -- not used
  -- not used
  -- not used
  pkt_GC_INFO_GC_Event_3_Beam_Steering <= bitvector(483 downto 480);
  pkt_GC_INFO_GC_Event_3_ReservedBit04 <= bitvector(484);
  pkt_GC_INFO_GC_Event_3_ReservedBit05 <= bitvector(485);
  pkt_GC_INFO_GC_Event_3_ReservedBit06 <= bitvector(486);
  pkt_GC_INFO_GC_Event_3_ReservedBit07 <= bitvector(487);
  pkt_GC_INFO_GC_Event_3_ReservedBit08 <= bitvector(488);
  pkt_GC_INFO_GC_Event_3_ReservedBit09 <= bitvector(489);
  pkt_GC_INFO_GC_Event_3_ReservedBit10 <= bitvector(490);
  pkt_GC_INFO_GC_Event_3_ReservedBit11 <= bitvector(491);
  pkt_GC_INFO_GC_Event_3_ReservedBit12 <= bitvector(492);
  pkt_GC_INFO_GC_Event_3_ReservedBit13 <= bitvector(493);
  pkt_GC_INFO_GC_Event_3_ReservedBit14 <= bitvector(494);
  pkt_GC_INFO_GC_Event_3_ReservedBit15 <= bitvector(495);
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
  pkt_GC_INFO_GC_Event_2_ReservedBit14 <= bitvector(478);
  pkt_GC_INFO_GC_Event_2_ReservedBit15 <= bitvector(479);
  -- not used
  -- not used
  -- not used
  -- not used
  pkt_GC_INFO_GC_Event_1_ReservedBit00 <= bitvector(448);
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
  pkt_GC_INFO_GC_Command_ReservedBit02 <= bitvector(418);
  pkt_GC_INFO_GC_Command_ReservedBit03 <= bitvector(419);
  pkt_GC_INFO_GC_Command_Pre_Enable <= bitvector(420);
  pkt_GC_INFO_GC_Command_Enable <= bitvector(421);
  pkt_GC_INFO_GC_Command_ReservedBit06 <= bitvector(422);
  pkt_GC_INFO_GC_Command_ReservedBit07 <= bitvector(423);
  pkt_GC_INFO_GC_Command_Salvo_On <= bitvector(424);
  pkt_GC_INFO_GC_Command_Band_Sel <= bitvector(425);
  pkt_GC_INFO_GC_Command_Mode_Set <= bitvector(426);
  pkt_GC_INFO_GC_Command_PRI_Start <= bitvector(427);
  pkt_GC_INFO_GC_Command_Test_Mode_Set <= bitvector(428);
  pkt_GC_INFO_GC_Command_REC_Disable_Set <= bitvector(429);
  pkt_GC_INFO_GC_Command_Test_Trig <= bitvector(430);
  pkt_GC_INFO_GC_Command_ReservedBit15 <= bitvector(431);
  -- not used
  -- not used
  -- not used
  -- not used
  pkt_GC_INFO_GC_Count <= bitvector(415 downto 384);
  --  bitvector(431 downto 416)
  pkt_GC_INFO_Reserved_0 <= bitvector(447 downto 432);
  --  bitvector(463 downto 448)
  --  bitvector(479 downto 464)
  --  bitvector(495 downto 480)
  --  bitvector(511 downto 496)
  pkt_GC_INFO_Speed_Mode <= bitvector(519 downto 512);
  pkt_GC_INFO_Search_Pattern <= bitvector(527 downto 520);
  pkt_GC_INFO_Pulse_Freq <= bitvector(535 downto 528);
  pkt_GC_INFO_Pulse_Type <= bitvector(543 downto 536);
  pkt_GC_INFO_Pulse_Length <= bitvector(551 downto 544);
  pkt_GC_INFO_PRE_Pulse <= bitvector(559 downto 552);
  pkt_GC_INFO_PRI <= bitvector(567 downto 560);
  pkt_GC_INFO_Beam_Steering <= bitvector(575 downto 568);
  pkt_GC_INFO_BAT_VOLT <= bitvector(591 downto 576);
  pkt_GC_INFO_Reserved_1 <= bitvector(639 downto 592);
  pkt_GC_INFO_TORP_N <= bitvector(671 downto 640);
  pkt_GC_INFO_TORP_E <= bitvector(703 downto 672);
  pkt_GC_INFO_TORP_D <= bitvector(719 downto 704);
  pkt_GC_INFO_TORP_Roll <= bitvector(735 downto 720);
  pkt_GC_INFO_TORP_Pitch <= bitvector(751 downto 736);
  pkt_GC_INFO_TORP_Yaw <= bitvector(767 downto 752);
  pkt_GC_INFO_ACT_On_Off <= bitvector(775 downto 768);
  pkt_GC_INFO_Reserved_2 <= bitvector(831 downto 776);
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
  pkt_FPGA_CMD_Save_Beam_INFO_ReservedBit04 <= bitvector(332);
  pkt_FPGA_CMD_Save_Beam_INFO_ReservedBit05 <= bitvector(333);
  pkt_FPGA_CMD_Save_Beam_INFO_ReservedBit06 <= bitvector(334);
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
  pkt_FPGA_CMD_PA_Tx_FPGA_CMD_ReservedBit07_1 <= bitvector(239);
  pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx1_Sweep_Frequency <= bitvector(247 downto 240);
  pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx2_Pulse_Length <= bitvector(254 downto 248);
  pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx2_Type <= bitvector(255);
  pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx2_Start_Frequency <= bitvector(270 downto 256);
  pkt_FPGA_CMD_PA_Tx_FPGA_CMD_ReservedBit07_2 <= bitvector(271);
  pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx2_Sweep_Frequency <= bitvector(279 downto 272);
  pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Beam_Weighting_Select <= bitvector(283 downto 280);
  pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Ramping_Time <= bitvector(287 downto 284);
  pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Battery_Voltage <= bitvector(303 downto 288);
  pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Stave_Selection_Number <= bitvector(307 downto 304);
  pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Reserved_1 <= bitvector(308);
  pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Reserved_2 <= bitvector(309);
  pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Test_Mode <= bitvector(310);
  pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Stave_Tx_Mode <= bitvector(311);
  pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Stave_Weight <= bitvector(319 downto 312);
  -- not used
  -- not used
  -- not used
  -- not used
  pkt_FPGA_CMD_SC_Rx_FPGA_CMD_TVG <= bitvector(131 downto 128);
  pkt_FPGA_CMD_SC_Rx_FPGA_CMD_REC_Mode <= bitvector(133 downto 132);
  pkt_FPGA_CMD_SC_Rx_FPGA_CMD_ReservedBit06_0 <= bitvector(134);
  pkt_FPGA_CMD_SC_Rx_FPGA_CMD_ReservedBit07_0 <= bitvector(135);
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
  pkt_FPGA_CMD_SC_Rx_FPGA_CMD_ReservedBit04 <= bitvector(148);
  pkt_FPGA_CMD_SC_Rx_FPGA_CMD_ReservedBit05 <= bitvector(149);
  pkt_FPGA_CMD_SC_Rx_FPGA_CMD_ReservedBit06 <= bitvector(150);
  pkt_FPGA_CMD_SC_Rx_FPGA_CMD_ReservedBit07 <= bitvector(151);
  pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Gain <= bitvector(159 downto 152);
  pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Reserved <= bitvector(191 downto 160);
  -- not used
  -- not used
  -- not used
  -- not used
  pkt_FPGA_CMD_Reserved_0 <= bitvector(127 downto 96);
  --  bitvector(191 downto 128)
  --  bitvector(319 downto 192)
  --  bitvector(335 downto 320)
  pkt_FPGA_CMD_Reserved_1 <= bitvector(383 downto 336);
  -- not used
  -- not used
  -- not used
  -- not used
  pkt_Start_Bytes <= bitvector(31 downto 0);
  pkt_Count <= bitvector(63 downto 32);
  pkt_Command <= bitvector(79 downto 64);
  pkt_ACK <= bitvector(95 downto 80);
  --  bitvector(383 downto 96)
  --  bitvector(831 downto 384)
  --  bitvector(1151 downto 832)
  --  bitvector(1407 downto 1152)
  --  bitvector(2367 downto 1408)
  pkt_Checksum <= bitvector(2383 downto 2368);
  pkt_Stop_Bytes <= bitvector(2399 downto 2384);
  -- not used
  -- not used
  pkt_SUM_Beam_Data_0 <= bitvector(1151 downto 1120);
  pkt_SUM_Beam_Data_1 <= bitvector(1183 downto 1152);
  pkt_SUM_Beam_Data_2 <= bitvector(1215 downto 1184);
  pkt_SUM_Beam_Data_3 <= bitvector(1247 downto 1216);
  pkt_SUM_Beam_Data_4 <= bitvector(1279 downto 1248);
  pkt_SUM_Beam_Data_5 <= bitvector(1311 downto 1280);
  pkt_SUM_Beam_Data_6 <= bitvector(1343 downto 1312);
  pkt_UDRL_Beam_Data_L3_0 <= bitvector(1407 downto 1376);
  pkt_UDRL_Beam_Data_L3_1 <= bitvector(1439 downto 1408);
  pkt_UDRL_Beam_Data_L3_2 <= bitvector(1471 downto 1440);
  pkt_UDRL_Beam_Data_L3_3 <= bitvector(1503 downto 1472);
  pkt_UDRL_Beam_Data_L2_0 <= bitvector(1535 downto 1504);
  pkt_UDRL_Beam_Data_L2_1 <= bitvector(1567 downto 1536);
  pkt_UDRL_Beam_Data_L2_2 <= bitvector(1599 downto 1568);
  pkt_UDRL_Beam_Data_L2_3 <= bitvector(1631 downto 1600);
  pkt_UDRL_Beam_Data_L1_0 <= bitvector(1663 downto 1632);
  pkt_UDRL_Beam_Data_L1_1 <= bitvector(1695 downto 1664);
  pkt_UDRL_Beam_Data_L1_2 <= bitvector(1727 downto 1696);
  pkt_UDRL_Beam_Data_L1_3 <= bitvector(1759 downto 1728);
  pkt_UDRL_Beam_Data_C0_0 <= bitvector(1791 downto 1760);
  pkt_UDRL_Beam_Data_C0_1 <= bitvector(1823 downto 1792);
  pkt_UDRL_Beam_Data_C0_2 <= bitvector(1855 downto 1824);
  pkt_UDRL_Beam_Data_C0_3 <= bitvector(1887 downto 1856);
  pkt_UDRL_Beam_Data_R1_0 <= bitvector(1919 downto 1888);
  pkt_UDRL_Beam_Data_R1_1 <= bitvector(1951 downto 1920);
  pkt_UDRL_Beam_Data_R1_2 <= bitvector(1983 downto 1952);
  pkt_UDRL_Beam_Data_R1_3 <= bitvector(2015 downto 1984);
  pkt_UDRL_Beam_Data_R2_0 <= bitvector(2047 downto 2016);
  pkt_UDRL_Beam_Data_R2_1 <= bitvector(2079 downto 2048);
  pkt_UDRL_Beam_Data_R2_2 <= bitvector(2111 downto 2080);
  pkt_UDRL_Beam_Data_R2_3 <= bitvector(2143 downto 2112);
  pkt_UDRL_Beam_Data_R3_0 <= bitvector(2175 downto 2144);
  pkt_UDRL_Beam_Data_R3_1 <= bitvector(2207 downto 2176);
  pkt_UDRL_Beam_Data_R3_2 <= bitvector(2239 downto 2208);
  pkt_UDRL_Beam_Data_R3_3 <= bitvector(2271 downto 2240);

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