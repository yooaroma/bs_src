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
        pkt_FPGA_State_Trigger_State_TE_TX_TRIG : out std_logic; --                     (1)
        pkt_FPGA_State_Trigger_State_TE_RX_TRIG : out std_logic; --                     (1)
        pkt_FPGA_State_Trigger_State_TX_TRIG : out std_logic; --                     (1)
        pkt_FPGA_State_Trigger_State_TX_P_GATE : out std_logic; --                     (1)
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
        -- not used 
        -- not used 
        pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAB_ST_RESULT : out std_logic; --                     (1)
        -- not used 
        -- not used 
        -- not used 
        -- not used 
        -- not used 
        -- not used 
        -- not used 
        pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_MEM : out std_logic; --                     (1)
        -- not used 
        -- not used 
        -- not used 
        pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_FPGA : out std_logic; --                     (1)
        -- not used 
        -- not used 
        -- not used 
        pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_GTP : out std_logic; --                     (1)
        pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_LVDS : out std_logic; --                     (1)
        pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_UART : out std_logic; --                     (1)
        -- not used 
        -- not used 
        -- not used 
        -- not used 
        -- not used 
        -- not used 
        -- not used 
        -- not used 
        -- not used 
        pkt_FPGA_State_FPGA_Zynq_Control_PLC_State : out std_logic; --                     (1)
        pkt_FPGA_State_FPGA_Zynq_Control_DAQ_Count_Reset : out std_logic; --                     (1)
        pkt_FPGA_State_FPGA_Zynq_Control_AD_On_Result : out std_logic; --                     (1)
        -- not used 
        -- not used 
        pkt_FPGA_State_FPGA_Zynq_Control_SC_FPGA_Reset : out std_logic; --                     (1)
        pkt_FPGA_State_FPGA_Zynq_Control_PA_FPGA_Reset : out std_logic; --                     (1)
        pkt_FPGA_State_FPGA_Zynq_Control_Ping_On_Off : out std_logic; --                     (1)
        -- not used 
        -- not used 
        -- not used 
        -- not used 
        pkt_FPGA_State_DAQCounter : out std_logic_vector(31 downto 0); --                     (32)
        pkt_FPGA_State_SC_GainValue : out std_logic_vector(7 downto 0); --                     (8)
        -- not used 
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
        -- not used 
        -- not used 
        -- not used 
        pkt_FPGA_State_TX_Voltage_Sample1 : out std_logic_vector(15 downto 0); --                     (16)
        pkt_FPGA_State_TX_Voltage_Sample2 : out std_logic_vector(15 downto 0); --                     (16)
        pkt_FPGA_State_TX_DC_Voltage_Sample1 : out std_logic_vector(15 downto 0); --                     (16)
        pkt_FPGA_State_TX_DC_Voltage_Sample2 : out std_logic_vector(15 downto 0); --                     (16)
        pkt_FPGA_State_TX_DC_Current_Sample1 : out std_logic_vector(15 downto 0); --                     (16)
        pkt_FPGA_State_TX_DC_Current_Sample2 : out std_logic_vector(15 downto 0); --                     (16)
        -- not used 
        -- not used 
        -- not used 
        -- not used 
        -- not used 
        -- not used 
        pkt_GC_INFO_GC_Event_4_Enable : out std_logic; --                     (1)
        pkt_GC_INFO_GC_Event_4_Detect : out std_logic; --                     (1)
        pkt_GC_INFO_GC_Event_4_Closein : out std_logic; --                     (1)
        pkt_GC_INFO_GC_Event_4_Fail : out std_logic; --                     (1)
        pkt_GC_INFO_GC_Event_4_ESAD_Chk : out std_logic; --                     (1)
        pkt_GC_INFO_GC_Event_4_ESAD_HV : out std_logic; --                     (1)
        pkt_GC_INFO_GC_Event_4_ESAD_Power : out std_logic; --                     (1)
        -- not used 
        -- not used 
        -- not used 
        -- not used 
        -- not used 
        pkt_GC_INFO_GC_Event_4_Leakage_Det : out std_logic; --                     (1)
        -- not used 
        -- not used 
        pkt_GC_INFO_GC_Event_4_M_Stop : out std_logic; --                     (1)
        -- not used 
        -- not used 
        -- not used 
        -- not used 
        pkt_GC_INFO_GC_Event_3_Beam_Steering : out std_logic_vector(3 downto 0); --                     (4)
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
        -- not used 
        -- not used 
        -- not used 
        -- not used 
        -- not used 
        -- not used 
        -- not used 
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
        -- not used 
        -- not used 
        -- not used 
        -- not used 
        pkt_GC_INFO_GC_Command_PLC : out std_logic; --                     (1)
        pkt_GC_INFO_GC_Command_AD_On : out std_logic; --                     (1)
        -- not used 
        -- not used 
        pkt_GC_INFO_GC_Command_Pre_Enable : out std_logic; --                     (1)
        pkt_GC_INFO_GC_Command_Enable : out std_logic; --                     (1)
        -- not used 
        -- not used 
        pkt_GC_INFO_GC_Command_Salvo_On : out std_logic; --                     (1)
        pkt_GC_INFO_GC_Command_Band_Sel : out std_logic; --                     (1)
        pkt_GC_INFO_GC_Command_Mode_Set : out std_logic; --                     (1)
        pkt_GC_INFO_GC_Command_PRI_Start : out std_logic; --                     (1)
        pkt_GC_INFO_GC_Command_Test_Mode_Set : out std_logic; --                     (1)
        pkt_GC_INFO_GC_Command_REC_Disable_Set : out std_logic; --                     (1)
        pkt_GC_INFO_GC_Command_Test_Trig : out std_logic; --                     (1)
        -- not used 
        -- not used 
        -- not used 
        -- not used 
        -- not used 
        pkt_GC_INFO_GC_Count : out std_logic_vector(31 downto 0); --                     (32)
        -- not used 
        -- not used 
        -- not used 
        -- not used 
        -- not used 
        -- not used 
        pkt_GC_INFO_Speed_Mode : out std_logic_vector(7 downto 0); --                     (8)
        pkt_GC_INFO_Search_Pattern : out std_logic_vector(7 downto 0); --                     (8)
        pkt_GC_INFO_Pulse_Freq : out std_logic_vector(7 downto 0); --                     (8)
        pkt_GC_INFO_Pulse_Type : out std_logic_vector(7 downto 0); --                     (8)
        pkt_GC_INFO_Pulse_Length : out std_logic_vector(7 downto 0); --                     (8)
        pkt_GC_INFO_PRE_Pulse : out std_logic_vector(7 downto 0); --                     (8)
        pkt_GC_INFO_PRI : out std_logic_vector(7 downto 0); --                     (8)
        pkt_GC_INFO_Beam_Steering : out std_logic_vector(7 downto 0); --                     (8)
        pkt_GC_INFO_BAT_VOLT : out std_logic_vector(15 downto 0); --                     (16)
        -- not used 
        pkt_GC_INFO_TORP_N : out std_logic_vector(31 downto 0); --                     (32)
        pkt_GC_INFO_TORP_E : out std_logic_vector(31 downto 0); --                     (32)
        pkt_GC_INFO_TORP_D : out std_logic_vector(15 downto 0); --                     (16)
        pkt_GC_INFO_TORP_Roll : out std_logic_vector(15 downto 0); --                     (16)
        pkt_GC_INFO_TORP_Pitch : out std_logic_vector(15 downto 0); --                     (16)
        pkt_GC_INFO_TORP_Yaw : out std_logic_vector(15 downto 0); --                     (16)
        pkt_GC_INFO_ACT_On_Off : out std_logic_vector(7 downto 0); --                     (8)
        -- not used 
        -- not used 
        -- not used 
        -- not used 
        -- not used 
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
        -- not used 
        -- not used 
        -- not used 
        pkt_FPGA_CMD_Save_Beam_INFO_Save_L3 : out std_logic; --                     (1)
        -- not used 
        -- not used 
        -- not used 
        -- not used 
        pkt_FPGA_CMD_PA_Tx_FPGA_CMD_PRI : out std_logic_vector(5 downto 0); --                     (6)
        pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx_Reset : out std_logic; --                     (1)
        pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx_Trigger : out std_logic; --                     (1)
        pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx_Pulse_Interval : out std_logic_vector(6 downto 0); --                     (7)
        pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Number_of_Tx : out std_logic; --                     (1)
        pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Beam_Steering_Angle : out std_logic_vector(7 downto 0); --                     (8)
        pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx1_Pulse_Length : out std_logic_vector(6 downto 0); --                     (7)
        pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx1_Type : out std_logic; --                     (1)
        pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx1_Start_Frequency : out std_logic_vector(14 downto 0); --                     (15)
        -- not used 
        pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx1_Sweep_Frequency : out std_logic_vector(7 downto 0); --                     (8)
        pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx2_Pulse_Length : out std_logic_vector(6 downto 0); --                     (7)
        pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx2_Type : out std_logic; --                     (1)
        pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx2_Start_Frequency : out std_logic_vector(14 downto 0); --                     (15)
        -- not used 
        pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx2_Sweep_Frequency : out std_logic_vector(7 downto 0); --                     (8)
        pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Beam_Weighting_Select : out std_logic_vector(3 downto 0); --                     (4)
        pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Ramping_Time : out std_logic_vector(3 downto 0); --                     (4)
        pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Battery_Voltage : out std_logic_vector(15 downto 0); --                     (16)
        pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Stave_Selection_Number : out std_logic_vector(3 downto 0); --                     (4)
        -- not used 
        -- not used 
        pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Test_Mode : out std_logic; --                     (1)
        pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Stave_Tx_Mode : out std_logic; --                     (1)
        pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Stave_Weight : out std_logic_vector(7 downto 0); --                     (8)
        -- not used 
        -- not used 
        -- not used 
        -- not used 
        pkt_FPGA_CMD_SC_Rx_FPGA_CMD_TVG : out std_logic_vector(3 downto 0); --                     (4)
        pkt_FPGA_CMD_SC_Rx_FPGA_CMD_REC_Mode : out std_logic_vector(1 downto 0); --                     (2)
        -- not used 
        -- not used 
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
        -- not used 
        -- not used 
        -- not used 
        -- not used 
        pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Gain : out std_logic_vector(7 downto 0); --                     (8)
        pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Reserved : out std_logic_vector(31 downto 0); --                     (32)
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
        pkt_Start_Bytes : out std_logic_vector(31 downto 0); --                     (32)
        pkt_Count : out std_logic_vector(31 downto 0); --                     (32)
        pkt_Command : out std_logic_vector(15 downto 0); --                     (16)
        pkt_ACK : out std_logic_vector(15 downto 0); --                     (16)
        -- not used 
        -- not used 
        -- not used 
        -- not used 
        pkt_Checksum : out std_logic_vector(15 downto 0); --                     (16)
        pkt_Stop_Bytes : out std_logic_vector(15 downto 0); --                     (16)
        -- not used 
        -- not used 
        -- not used 

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
end entity;