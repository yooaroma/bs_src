


pkt_FPGA_State_FPGA_Zynq_Control_PLC_State : out std_logic;    --               order( 0 ) bit( 1 )
pkt_FPGA_State_FPGA_Zynq_Control_DAQ_Count_Reset : out std_logic;    --               order( 1 ) bit( 1 )
pkt_FPGA_State_FPGA_Zynq_Control_AD_On_Result : out std_logic;    --               order( 2 ) bit( 1 )
  -- not used 
  -- not used 
pkt_FPGA_State_FPGA_Zynq_Control_SC_FPGA_Reset : out std_logic;    --               order( 3 ) bit( 1 )
pkt_FPGA_State_FPGA_Zynq_Control_PA_FPGA_Reset : out std_logic;    --               order( 4 ) bit( 1 )
pkt_FPGA_State_FPGA_Zynq_Control_Ping_On_Off : out std_logic;    --               order( 5 ) bit( 1 )
  -- not used 
  -- not used 
  -- not used 
  -- not used 
pkt_FPGA_State_DAQCounter : out std_logic_vector(31 downto 0);    --               order( 6 ) bit( 32 )
pkt_FPGA_State_SC_GainValue : out std_logic_vector(7 downto 0);    --               order( 7 ) bit( 8 )
pkt_GC_INFO_GC_Count : out std_logic_vector(31 downto 0);    --               order( 8 ) bit( 32 )
pkt_FPGA_CMD_Save_Beam_INFO_Save_R3 : out std_logic;    --               order( 9 ) bit( 1 )
pkt_FPGA_CMD_Save_Beam_INFO_Save_R2 : out std_logic;    --               order( 10 ) bit( 1 )
pkt_FPGA_CMD_Save_Beam_INFO_Save_R1 : out std_logic;    --               order( 11 ) bit( 1 )
pkt_FPGA_CMD_Save_Beam_INFO_Save_R0 : out std_logic;    --               order( 12 ) bit( 1 )
pkt_FPGA_CMD_Save_Beam_INFO_Save_C : out std_logic;    --               order( 13 ) bit( 1 )
pkt_FPGA_CMD_Save_Beam_INFO_Save_L0 : out std_logic;    --               order( 14 ) bit( 1 )
pkt_FPGA_CMD_Save_Beam_INFO_Save_L1 : out std_logic;    --               order( 15 ) bit( 1 )
pkt_FPGA_CMD_Save_Beam_INFO_Save_L2 : out std_logic;    --               order( 16 ) bit( 1 )
pkt_FPGA_CMD_Save_Beam_INFO_Optic_On : out std_logic;    --               order( 17 ) bit( 1 )
pkt_FPGA_CMD_Save_Beam_INFO_Ethernet_On : out std_logic;    --               order( 18 ) bit( 1 )
pkt_FPGA_CMD_Save_Beam_INFO_TE_Data_Input : out std_logic_vector(1 downto 0);    --               order( 19 ) bit( 2 )
  -- not used 
  -- not used 
  -- not used 
pkt_FPGA_CMD_Save_Beam_INFO_Save_L3 : out std_logic;    --               order( 20 ) bit( 1 )
  -- not used 
  -- not used 
  -- not used 
  -- not used 
pkt_FPGA_CMD_PA_Tx_FPGA_CMD_PRI : out std_logic_vector(5 downto 0);    --               order( 21 ) bit( 6 )
pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx_Reset : out std_logic;    --               order( 22 ) bit( 1 )
pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx_Trigger : out std_logic;    --               order( 23 ) bit( 1 )
pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx_Pulse_Interval : out std_logic_vector(6 downto 0);    --               order( 24 ) bit( 7 )
pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Number_of_Tx : out std_logic;    --               order( 25 ) bit( 1 )
pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Beam_Steering_Angle : out std_logic_vector(7 downto 0);    --               order( 26 ) bit( 8 )
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
pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Stave_Tx_Mode : out std_logic;    --               order( 27 ) bit( 1 )
pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Stave_Weight : out std_logic_vector(7 downto 0);    --               order( 28 ) bit( 8 )
  -- not used 
  -- not used 
  -- not used 
  -- not used 
pkt_FPGA_CMD_SC_Rx_FPGA_CMD_TVG : out std_logic_vector(3 downto 0);    --               order( 29 ) bit( 4 )
pkt_FPGA_CMD_SC_Rx_FPGA_CMD_REC_Mode : out std_logic_vector(1 downto 0);    --               order( 30 ) bit( 2 )
  -- not used 
  -- not used 
pkt_FPGA_CMD_SC_Rx_FPGA_CMD_PLC : out std_logic;    --               order( 31 ) bit( 1 )
pkt_FPGA_CMD_SC_Rx_FPGA_CMD_DAQ_Count_Reset : out std_logic;    --               order( 32 ) bit( 1 )
pkt_FPGA_CMD_SC_Rx_FPGA_CMD_AD_On : out std_logic;    --               order( 33 ) bit( 1 )
pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Gain_Mode : out std_logic;    --               order( 34 ) bit( 1 )
pkt_FPGA_CMD_SC_Rx_FPGA_CMD_BPF_On_Off : out std_logic;    --               order( 35 ) bit( 1 )
pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Pass_Active : out std_logic;    --               order( 36 ) bit( 1 )
pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Reset : out std_logic;    --               order( 37 ) bit( 1 )
pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Stop_Run : out std_logic;    --               order( 38 ) bit( 1 )
pkt_FPGA_CMD_SC_Rx_FPGA_CMD_REC_On_Off : out std_logic;    --               order( 39 ) bit( 1 )
pkt_FPGA_CMD_SC_Rx_FPGA_CMD_PLC_Mode : out std_logic_vector(1 downto 0);    --               order( 40 ) bit( 2 )
pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Data_Path : out std_logic;    --               order( 41 ) bit( 1 )
  -- not used 
  -- not used 
  -- not used 
  -- not used 
pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Gain : out std_logic_vector(7 downto 0);    --               order( 42 ) bit( 8 )
pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Reserved : out std_logic_vector(31 downto 0);    --               order( 43 ) bit( 32 )
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
pkt_Start_Bytes : out std_logic_vector(31 downto 0);    --               order( 44 ) bit( 32 )
pkt_Count : out std_logic_vector(31 downto 0);    --               order( 45 ) bit( 32 )
pkt_Command : out std_logic_vector(15 downto 0);    --               order( 46 ) bit( 16 )
pkt_ACK : out std_logic_vector(15 downto 0);    --               order( 47 ) bit( 16 )
  -- not used 
  -- not used 
  -- not used 
  -- not used 
pkt_Checksum : out std_logic_vector(15 downto 0);    --               order( 48 ) bit( 16 )
pkt_Stop_Bytes : out std_logic_vector(15 downto 0);    --               order( 49 ) bit( 16 )
  -- not used 
  -- not used 
  -- not used 







pkt_Data_CH_Data_1 : out  std_logic_vector(31 downto 0); --   order( 50 ) (32)   (1183 downto 1152);
pkt_Data_CH_Data_2 : out  std_logic_vector(31 downto 0); --   order( 51 ) (32)   (1215 downto 1184);
pkt_Data_CH_Data_3 : out  std_logic_vector(31 downto 0); --   order( 52 ) (32)   (1247 downto 1216);
pkt_Data_CH_Data_4 : out  std_logic_vector(31 downto 0); --   order( 53 ) (32)   (1279 downto 1248);
pkt_Data_CH_Data_5 : out  std_logic_vector(31 downto 0); --   order( 54 ) (32)   (1311 downto 1280);
pkt_Data_CH_Data_6 : out  std_logic_vector(31 downto 0); --   order( 55 ) (32)   (1343 downto 1312);
pkt_Data_CH_Data_7 : out  std_logic_vector(31 downto 0); --   order( 56 ) (32)   (1375 downto 1344);
pkt_Data_CH_Data_8 : out  std_logic_vector(31 downto 0); --   order( 57 ) (32)   (1407 downto 1376);
pkt_Data_CH_Data_9 : out  std_logic_vector(31 downto 0); --   order( 57 ) (32)   (1439 downto 1408);
pkt_Data_CH_Data_10 : out  std_logic_vector(31 downto 0); --   order( 57 ) (32)   (1471 downto 1440);
pkt_Data_CH_Data_11 : out  std_logic_vector(31 downto 0); --   order( 57 ) (32)   (1503 downto 1472);
pkt_Data_CH_Data_12 : out  std_logic_vector(31 downto 0); --   order( 57 ) (32)   (1535 downto 1504);
pkt_Data_CH_Data_13 : out  std_logic_vector(31 downto 0); --   order( 57 ) (32)   (1567 downto 1536);
pkt_Data_CH_Data_14 : out  std_logic_vector(31 downto 0); --   order( 57 ) (32)   (1599 downto 1568);
pkt_Data_CH_Data_15 : out  std_logic_vector(31 downto 0); --   order( 57 ) (32)   (1631 downto 1600);
pkt_Data_CH_Data_16 : out  std_logic_vector(31 downto 0); --   order( 57 ) (32)   (1663 downto 1632);
pkt_Data_CH_Data_17 : out  std_logic_vector(31 downto 0); --   order( 57 ) (32)   (1695 downto 1664);
pkt_Data_CH_Data_18 : out  std_logic_vector(31 downto 0); --   order( 57 ) (32)   (1727 downto 1696);
pkt_Data_CH_Data_19 : out  std_logic_vector(31 downto 0); --   order( 57 ) (32)   (1759 downto 1728);
pkt_Data_CH_Data_20 : out  std_logic_vector(31 downto 0); --   order( 57 ) (32)   (1791 downto 1760);
pkt_Data_CH_Data_21 : out  std_logic_vector(31 downto 0); --   order( 57 ) (32)   (1823 downto 1792);
pkt_Data_CH_Data_22 : out  std_logic_vector(31 downto 0); --   order( 57 ) (32)   (1855 downto 1824);
pkt_Data_CH_Data_23 : out  std_logic_vector(31 downto 0); --   order( 57 ) (32)   (1887 downto 1856);
pkt_Data_CH_Data_24 : out  std_logic_vector(31 downto 0); --   order( 57 ) (32)   (1919 downto 1888);
pkt_Data_CH_Data_25 : out  std_logic_vector(31 downto 0); --   order( 57 ) (32)   (1951 downto 1920);
pkt_Data_CH_Data_26 : out  std_logic_vector(31 downto 0); --   order( 57 ) (32)   (1983 downto 1952);
pkt_Data_CH_Data_27 : out  std_logic_vector(31 downto 0); --   order( 57 ) (32)   (2015 downto 1984);
pkt_Data_CH_Data_28 : out  std_logic_vector(31 downto 0); --   order( 57 ) (32)   (2047 downto 2016);
pkt_Data_CH_Data_29 : out  std_logic_vector(31 downto 0); --   order( 57 ) (32)   (2079 downto 2048);
pkt_Data_CH_Data_30 : out  std_logic_vector(31 downto 0); --   order( 57 ) (32)   (2111 downto 2080);
pkt_Data_CH_Data_31 : out  std_logic_vector(31 downto 0); --   order( 57 ) (32)   (2143 downto 2112);
pkt_Data_CH_Data_32 : out  std_logic_vector(31 downto 0); --   order( 58 ) (32)   (2175 downto 2144);
pkt_Data_CH_Data_33 : out  std_logic_vector(31 downto 0); --   order( 59 ) (32)   (2207 downto 2176);
pkt_Data_CH_Data_34 : out  std_logic_vector(31 downto 0); --   order( 60 ) (32)   (2239 downto 2208);
pkt_Data_CH_Data_35 : out  std_logic_vector(31 downto 0); --   order( 61 ) (32)   (2271 downto 2240);
pkt_Data_CH_Data_36 : out  std_logic_vector(31 downto 0); --   order( 62 ) (32)   (2303 downto 2272);
pkt_Data_CH_Data_37 : out  std_logic_vector(31 downto 0); --   order( 63 ) (32)   (2335 downto 2304);




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
    -- --  end record;  --  Trigger_State_1_Type
    -- --
    -- --
    -- --  type PA_FPGA_SelfTest_Result_2_Type is record
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
    pkt_FPGA_State_PA_FPGA_SelfTest_Result_PAB_ST_RESULT : out std_logic; --                     (1)
    -- --  end record;  --  PA_FPGA_SelfTest_Result_2_Type
    -- --
    -- --
    -- --  type SC_FPGA_SelfTest_Result_2_Type is record
    pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_MEM : out std_logic; --                     (1)
    pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_FPGA : out std_logic; --                     (1)
    pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_GTP : out std_logic; --                     (1)
    pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_LVDS : out std_logic; --                     (1)
    pkt_FPGA_State_SC_FPGA_SelfTest_Result_SC_UART : out std_logic; --                     (1)
    -- --  end record;  --  SC_FPGA_SelfTest_Result_2_Type
    -- --
    -- --
    -- --  type FPGA_Zynq_Control_1_Type is record
    pkt_FPGA_State_FPGA_Zynq_Control_PLC_State : out std_logic; --                     (1)
    pkt_FPGA_State_FPGA_Zynq_Control_DAQ_Count_Reset : out std_logic; --                     (1)
    pkt_FPGA_State_FPGA_Zynq_Control_AD_On_Result : out std_logic; --                     (1)
    pkt_FPGA_State_FPGA_Zynq_Control_SC_FPGA_Reset : out std_logic; --                     (1)
    pkt_FPGA_State_FPGA_Zynq_Control_PA_FPGA_Reset : out std_logic; --                     (1)
    pkt_FPGA_State_FPGA_Zynq_Control_Ping_On_Off : out std_logic; --                     (1)
    -- --  end record;  --  FPGA_Zynq_Control_1_Type
    -- --
    -- --
    -- --  type FPGA_State_40_Type is record
    pkt_FPGA_State_DAQCounter : out std_logic_vector(31 downto 0); --                     (32)
    pkt_FPGA_State_SC_GainValue : out std_logic_vector(7 downto 0); --                     (8)
    -- --  bitvector(879 downto 872)
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
    -- --  bitvector(975 downto 960)
    -- --  bitvector(991 downto 976)
    -- --  bitvector(1007 downto 992)
    pkt_FPGA_State_TX_Voltage_Sample1 : out std_logic_vector(15 downto 0); --                     (16)
    pkt_FPGA_State_TX_Voltage_Sample2 : out std_logic_vector(15 downto 0); --                     (16)
    pkt_FPGA_State_TX_DC_Voltage_Sample1 : out std_logic_vector(15 downto 0); --                     (16)
    pkt_FPGA_State_TX_DC_Voltage_Sample2 : out std_logic_vector(15 downto 0); --                     (16)
    pkt_FPGA_State_TX_DC_Current_Sample1 : out std_logic_vector(15 downto 0); --                     (16)
    pkt_FPGA_State_TX_DC_Current_Sample2 : out std_logic_vector(15 downto 0); --                     (16)
    -- --  bitvector(1111 downto 1104)
    -- --  end record;  --  FPGA_State_40_Type
    -- --
    -- --
    -- --  type GC_Event_4_2_Type is record
    pkt_GC_INFO_GC_Event_4_Enable : out std_logic; --                     (1)
    pkt_GC_INFO_GC_Event_4_Detect : out std_logic; --                     (1)
    pkt_GC_INFO_GC_Event_4_Closein : out std_logic; --                     (1)
    pkt_GC_INFO_GC_Event_4_Fail : out std_logic; --                     (1)
    pkt_GC_INFO_GC_Event_4_ESAD_Chk : out std_logic; --                     (1)
    pkt_GC_INFO_GC_Event_4_ESAD_HV : out std_logic; --                     (1)
    pkt_GC_INFO_GC_Event_4_ESAD_Power : out std_logic; --                     (1)
    pkt_GC_INFO_GC_Event_4_Leakage_Det : out std_logic; --                     (1)
    pkt_GC_INFO_GC_Event_4_M_Stop : out std_logic; --                     (1)
    -- --  end record;  --  GC_Event_4_2_Type
    -- --
    -- --
    -- --  type GC_Event_3_2_Type is record
    pkt_GC_INFO_GC_Event_3_Beam_Steering : out std_logic_vector(3 downto 0); --                     (4)
    -- --  end record;  --  GC_Event_3_2_Type
    -- --
    -- --
    -- --  type GC_Event_2_2_Type is record
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
    -- --  end record;  --  GC_Event_2_2_Type
    -- --
    -- --
    -- --  type GC_Event_1_2_Type is record
    pkt_GC_INFO_GC_Event_1_HILS_Mode : out std_logic; --                     (1)
    pkt_GC_INFO_GC_Event_1_EXHD_Mode : out std_logic; --                     (1)
    pkt_GC_INFO_GC_Event_1_C_Range : out std_logic; --                     (1)
    pkt_GC_INFO_GC_Event_1_E_Range : out std_logic; --                     (1)
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
    -- --  end record;  --  GC_Event_1_2_Type
    -- --
    -- --
    -- --  type GC_Command_2_Type is record
    pkt_GC_INFO_GC_Command_PLC : out std_logic; --                     (1)
    pkt_GC_INFO_GC_Command_AD_On : out std_logic; --                     (1)
    pkt_GC_INFO_GC_Command_Pre_Enable : out std_logic; --                     (1)
    pkt_GC_INFO_GC_Command_Enable : out std_logic; --                     (1)
    pkt_GC_INFO_GC_Command_Salvo_On : out std_logic; --                     (1)
    pkt_GC_INFO_GC_Command_Band_Sel : out std_logic; --                     (1)
    pkt_GC_INFO_GC_Command_Mode_Set : out std_logic; --                     (1)
    pkt_GC_INFO_GC_Command_PRI_Start : out std_logic; --                     (1)
    pkt_GC_INFO_GC_Command_Test_Mode_Set : out std_logic; --                     (1)
    pkt_GC_INFO_GC_Command_REC_Disable_Set : out std_logic; --                     (1)
    pkt_GC_INFO_GC_Command_Test_Trig : out std_logic; --                     (1)
    -- --  end record;  --  GC_Command_2_Type
    -- --
    -- --
    -- --  type GC_INFO_56_Type is record
    pkt_GC_INFO_GC_Count : out std_logic_vector(31 downto 0); --                     (32)
    -- --  bitvector(431 downto 416)
    -- --  bitvector(463 downto 448)
    -- --  bitvector(479 downto 464)
    -- --  bitvector(495 downto 480)
    -- --  bitvector(511 downto 496)
    pkt_GC_INFO_Speed_Mode : out std_logic_vector(7 downto 0); --                     (8)
    pkt_GC_INFO_Search_Pattern : out std_logic_vector(7 downto 0); --                     (8)
    pkt_GC_INFO_Pulse_Freq : out std_logic_vector(7 downto 0); --                     (8)
    pkt_GC_INFO_Pulse_Type : out std_logic_vector(7 downto 0); --                     (8)
    pkt_GC_INFO_Pulse_Length : out std_logic_vector(7 downto 0); --                     (8)
    pkt_GC_INFO_PRE_Pulse : out std_logic_vector(7 downto 0); --                     (8)
    pkt_GC_INFO_PRI : out std_logic_vector(7 downto 0); --                     (8)
    pkt_GC_INFO_Beam_Steering : out std_logic_vector(7 downto 0); --                     (8)
    pkt_GC_INFO_BAT_VOLT : out std_logic_vector(15 downto 0); --                     (16)
    pkt_GC_INFO_TORP_N : out std_logic_vector(31 downto 0); --                     (32)
    pkt_GC_INFO_TORP_E : out std_logic_vector(31 downto 0); --                     (32)
    pkt_GC_INFO_TORP_D : out std_logic_vector(15 downto 0); --                     (16)
    pkt_GC_INFO_TORP_Roll : out std_logic_vector(15 downto 0); --                     (16)
    pkt_GC_INFO_TORP_Pitch : out std_logic_vector(15 downto 0); --                     (16)
    pkt_GC_INFO_TORP_Yaw : out std_logic_vector(15 downto 0); --                     (16)
    pkt_GC_INFO_ACT_On_Off : out std_logic_vector(7 downto 0); --                     (8)
    -- --  end record;  --  GC_INFO_56_Type
    -- --
    -- --
    -- --  type Save_Beam_INFO_2_Type is record
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
    pkt_FPGA_CMD_Save_Beam_INFO_Save_L3 : out std_logic; --                     (1)
    -- --  end record;  --  Save_Beam_INFO_2_Type
    -- --
    -- --
    -- --  type PA_Tx_FPGA_CMD_16_Type is record
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_PRI : out std_logic_vector(5 downto 0); --                     (6)
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx_Reset : out std_logic; --                     (1)
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx_Trigger : out std_logic; --                     (1)
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx_Pulse_Interval : out std_logic_vector(6 downto 0); --                     (7)
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Number_of_Tx : out std_logic; --                     (1)
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Beam_Steering_Angle : out std_logic_vector(7 downto 0); --                     (8)
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx1_Pulse_Length : out std_logic_vector(6 downto 0); --                     (7)
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx1_Type : out std_logic; --                     (1)
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx1_Start_Frequency : out std_logic_vector(14 downto 0); --                     (15)
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx1_Sweep_Frequency : out std_logic_vector(7 downto 0); --                     (8)
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx2_Pulse_Length : out std_logic_vector(6 downto 0); --                     (7)
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx2_Type : out std_logic; --                     (1)
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx2_Start_Frequency : out std_logic_vector(14 downto 0); --                     (15)
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx2_Sweep_Frequency : out std_logic_vector(7 downto 0); --                     (8)
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Beam_Weighting_Select : out std_logic_vector(3 downto 0); --                     (4)
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Ramping_Time : out std_logic_vector(3 downto 0); --                     (4)
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Battery_Voltage : out std_logic_vector(15 downto 0); --                     (16)
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Stave_Selection_Number : out std_logic_vector(3 downto 0); --                     (4)
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Test_Mode : out std_logic; --                     (1)
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Stave_Tx_Mode : out std_logic; --                     (1)
    pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Stave_Weight : out std_logic_vector(7 downto 0); --                     (8)
    -- --  end record;  --  PA_Tx_FPGA_CMD_16_Type
    -- --
    -- --
    -- --  type SC_Rx_FPGA_CMD_8_Type is record
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_TVG : out std_logic_vector(3 downto 0); --                     (4)
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_REC_Mode : out std_logic_vector(1 downto 0); --                     (2)
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
    pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Gain : out std_logic_vector(7 downto 0); --                     (8)
    -- --  end record;  --  SC_Rx_FPGA_CMD_8_Type
    -- --
    -- --
    -- --
    -- --
    -- --  type SCB2SPB_Pkt_300_Type is record
    pkt_Start_Bytes : out std_logic_vector(31 downto 0); --                     (32)
    pkt_Count : out std_logic_vector(31 downto 0); --                     (32)
    pkt_Command : out std_logic_vector(15 downto 0); --                     (16)
    pkt_ACK : out std_logic_vector(15 downto 0); --                     (16)
    -- --  bitvector(383 downto 96)
    -- --  bitvector(831 downto 384)
    -- --  bitvector(1151 downto 832)
    -- --  bitvector(2367 downto 1152)
    pkt_Checksum : out std_logic_vector(15 downto 0); --                     (16)
    pkt_Stop_Bytes : out std_logic_vector(15 downto 0); --                     (16)
    -- --  end record;  --  SCB2SPB_Pkt_300_Type
    -- --
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

    You can try exporting the hierarchical block of the BD into a tcl file in following way:-
1) Run "write_bd_tcl -hier_blks [get_bd_cells hier_0] hier_0.tcl" (hier_0 is the name of hierarchical block)
2) Open a BD in the new project and source hier_0.tcl 
3) run "create_hier_cell_hier_0 ./ new_hier" (command to recreate the hierarchical block can be found at the end of the tcl file) 
~Chinmay

write_bd_tcl -hier_blks [get_bd_cells gen_ila_0] gen_ila_bd_tcl.tcl
source gen_ila_bd_tcl.tcl

create_hier_cell_gen_ila_0 ./ gen_ila_1

create_hier_cell_gen_ila_0 ./ gen_ila_1
C:/Users/yooaroma/AppData/Roaming/Xilinx/Vivado/gen_ila_0.tcl

connect_bd_net -net bs_scb_data_record_p_0_pkt_Count [get_bd_pins bs_scb_data_record_p_0/pkt_Count] [get_bd_pins ila_0/probe7]


connect_bd_net [get_bd_pins gen_ila_0/ila_0/probe6] [get_bd_pins gen_ila_0/bs_scb_data_record_p_0/pkt_Start_Bytes]

open block design
tcl console
write_bd_tcl path/file_name.tcl

pd path
source file_name.tcl

regenerate layout

cd C:/mymedia/vivado/zsrc/src_scb
source test_pin.tcl
source test_pin2.tcl





cd C:/mymedia/vivado/zsrc/src_scb
cd C:/mymedia/vivado/zsrc/src_test

  write_bd_tcl a_p1_tcl.tcl

module을 모두 삽입후 실행을 해야 함. 


cd C:/mymedia/vivado/zsrc/src_test
source a_p1_tcl.tcl 


bs_gt_reset 
bs_ila_debug 
bs_scb_data_record
bs_scb_data_record_pin 
bs_scb_record_gen 
bs_sw_led_axu15egb 
bs_usec_reset_n 



cd C:/mymedia/vivado/zsrc/src_scb
cd C:/mymedia/vivado/zsrc/src_test
source gen_ila_bd_tcl.tcl
create_hier_cell_gen_ila_0 ./ gen_ila_x



cd C:/mymedia/vivado/zsrc/src_scb
cd C:/mymedia/vivado/zsrc/src_test
write_bd_tcl -hier_blks [get_bd_cells maurora_0] bd_maurora_0_tcl.tcl

source bd_maurora_0_tcl.tcl

create_hier_cell_gen_ila_0 ./ maurora_1

create_hier_cell_maurora_0 ./ maurora_1
create_hier_cell_rx_ila_0 ./ rx_ila_1
create_hier_cell_gen_ila_0 ./ gen_ila_1


set_clock_groups -name sys_clk -asynchronous -group [get_clocks -of_objects [get_pins bd_alinx_i/clk_wiz/inst/mmcme4_adv_inst/CLKOUT1]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk]



cd C:/mymedia/vivado/zsrc/src_test

  write_bd_tcl a_p1_new_tcl.tcl

module을 모두 삽입후 실행을 해야 함. 


cd C:/mymedia/vivado/zsrc/src_test
source a_p1_new_tcl.tcl


startgroup
set_property -dict [list \
  CONFIG.C_ADV_TRIGGER {true} \
  CONFIG.C_EN_STRG_QUAL {1} \
] [get_bd_cells gen_ila_2/ila_0]
endgroup

startgroup
set_property -dict [list \
  CONFIG.C_ADV_TRIGGER {true} \
  CONFIG.C_EN_STRG_QUAL {1} \
] [get_bd_cells rx_ila_3/ila_3]
endgroup


WARNING: [IP_Flow 19-4067] Ignoring invalid widget type specified checkbox.Providing a default widget


WARNING: [IP_Flow 19-4067] Ignoring invalid widget type specified checkbox.Providing a default widget
startgroup
set_property -dict [list \
  CONFIG.C_ADV_TRIGGER {true} \
  CONFIG.C_EN_STRG_QUAL {1} \
] [get_bd_cells gen_ila_0/ila_0]
endgroup
WARNING: [IP_Flow 19-4067] Ignoring invalid widget type specified checkbox.Providing a default widget
startgroup
set_property -dict [list \
  CONFIG.C_ADV_TRIGGER {true} \
  CONFIG.C_EN_STRG_QUAL {1} \
] [get_bd_cells rx_ila_2/ila_0]
endgroup

