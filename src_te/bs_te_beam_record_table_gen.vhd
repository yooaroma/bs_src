-- //=============================================================================
-- //=============================================================================
-- //=============================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use ieee.math_real.all;
--
use work.SP2TE_BEAM_Type.all; -- BS2_protocol_V0.56_20231121

entity bs_te_beam_record_table_gen is
  generic (
    ADDRESS_MAX : natural := 300;
    ADDRESS_WIDTH : natural := 9;
    RECORD_ID : std_logic_vector(15 downto 0) := X"3161";
    TABLE_DELTA_X : natural := 1; -- x = x + 8
    DATA_WIDTH : natural := 32
  );
  port (
    --    
    m_axis_tvalid : out std_logic;
    m_axis_tready : in std_logic;
    m_axis_tlast : out std_logic;
    m_axis_tkeep : out std_logic_vector(3 downto 0);
    m_axis_tdata : out std_logic_vector(DATA_WIDTH - 1 downto 0);
    -- 
    m_record_data : out std_logic_vector(ADDRESS_MAX * 8 - 1 downto 0);
    -- 
    s_tstart : in std_logic;
    -- 
    reset_2_n : in std_logic;
    reset_1_n : in std_logic;
    Clk : in std_logic
    --    
  );
end entity;
--
architecture rtl of bs_te_beam_record_table_gen is
  --
  constant ADDRESS_MAX_WORD_CNT : natural := (DATA_WIDTH / 8); -- 75
  constant ADDRESS_MAX_WORD : natural := (ADDRESS_MAX / ADDRESS_MAX_WORD_CNT); -- 75
  constant C_DATA_ZERO : std_logic_vector(DATA_WIDTH - 1 downto 0) := (others => '0');
  --
  --
  --
  --  sin table start
  --
  constant a_length : natural := 12;
  constant d_length : natural := 24;
  constant SIN_ADDR_MAX : natural := 2 ** (a_length - 1) - 1;
  constant SIN_DATA_MAX : integer := 2 ** (d_length - 1) - 1;
  subtype SIN_DATA_VALUE is integer range -SIN_DATA_MAX to SIN_DATA_MAX;
  type SIN_TABLE is array (natural range <>) of SIN_DATA_VALUE;
  --
  signal t_sin : SIN_TABLE(0 to SIN_ADDR_MAX);
  --
  signal idx_n_sincos : std_logic_vector(a_length - 1 downto 0);
  --
  --  sin table end
  --
  --
  --
  signal rd_start_enable : std_logic := '0';
  signal rd_tstart : std_logic;
  signal rd_tstart_i : std_logic;
  signal rd_tstart_i_i : std_logic;
  signal rd_tstart_i_i_i : std_logic;
  signal rd_tenable : std_logic := '0';
  signal rd_tvalid : std_logic;
  signal rd_tready : std_logic;
  signal rd_tlast : std_logic;
  signal rd_taddr : std_logic_vector(ADDRESS_WIDTH - 3 downto 0);
  signal rd_tdata_o : std_logic_vector(DATA_WIDTH - 1 downto 0);
  signal rd_tdata_i : std_logic_vector(DATA_WIDTH - 1 downto 0);
  signal rd_tdata_i_i : std_logic_vector(DATA_WIDTH - 1 downto 0);
  signal q_sel_pre : std_logic := '0';
  signal q_latch : std_logic := '0';
  --
  signal tProgramCount : std_logic_vector(31 downto 0);
  --
  signal tch_data_enable : std_logic := '0';
  --
  signal reset_n : std_logic := '0';
  signal m_record_data_r : std_logic_vector(ADDRESS_MAX * 8 - 1 downto 0) := (others => '0');
  --

  signal pkt : SCB2SPB_Pkt_300_Type;
  -- signal Chan_Str : std_logic_vector(2399 downto 0) := (others => '0');
  --
  --
  -- Chan_Str <= conv_ch_bitvector(Chan_Pkt);
  -- Chan_Pkt <= conv_ch_packet(Chan_Str);
  --
begin
  --     
  --     
  --     
  --     
  --  sin table start
  --     
  sin_gen : for t in t_sin'range generate
  begin
    t_sin(t) <= SIN_DATA_VALUE(real(SIN_DATA_MAX) * sin(2.0 * MATH_PI/real(t_sin'length) * real(t)));
  end generate sin_gen;
  --
  --  sin table end
  --
  --
  --
  --
  --      
  reset_n <= reset_1_n and reset_2_n;
  rd_tstart <= s_tstart;
  m_record_data <= m_record_data_r;
  --
  -- m_record_data <= (others => '0');
  --
  m_axis_tvalid <= rd_tvalid;
  rd_tready <= m_axis_tready;
  m_axis_tlast <= rd_tlast;
  m_axis_tkeep <= (others => '1');
  m_axis_tdata <= rd_tdata_o;
  --
  -- m_rd_taddr <= rd_taddr;
  -- rd_tdata_i <= m_rd_tdata;

  p_rd : process (Clk, reset_n)
    variable idx_v : natural := 0;
    variable idx_table_v : natural := 0;
  begin
    if (reset_n = '0') then
      tProgramCount <= (others => '0');
      rd_tdata_i <= (others => '0');
      idx_n_sincos <= (others => '0');
      idx_table_v := 0;
    elsif (rising_edge(Clk)) then
      --      
      m_record_data_r <= conv_ch_bitvector(pkt);
      --
      if (rd_start_enable = '1') then
        idx_v := conv_integer(rd_taddr);
        if (idx_v > 74) then
          rd_tdata_i <= (others => '0');
        else
          rd_tdata_i <= m_record_data_r(idx_v * 32 + 31 downto idx_v * 32);
        end if;
      end if;
      if (rd_tstart = '1') and (rd_tstart_i = '0') then
        -- m_record_data_r(31 downto 0) <= tProgramCount;
        -- m_record_data_r(ADDRESS_MAX * 8 - 1 downto 32) <= (others => '1');
        --
        for ch_x in 0 to 6 loop
          for ch_y in 0 to 3 loop
            -- pkt.UDRL_Beam_Data.UDRL_Data(ch_x)(ch_y) := bitvector(ch_y * 32 - 1 + ch_x * 32 * 7 + 1408 downto ch_y * 32 - 32 + ch_x * 32 * 7 + 1408);
            pkt.UDRL_Beam_Data.UDRL_Data(ch_x)(ch_y) <= RECORD_ID & tProgramCount(7 downto 0) & std_logic_vector(to_unsigned(ch_x, 4)) & std_logic_vector(to_unsigned(ch_y, 4)) after 1 ns;
          end loop;
        end loop;
        --
        --
        for ch in 0 to 6 loop
          pkt.SUM_Beam_Data.SUM_Data(ch) <= RECORD_ID & tProgramCount(7 downto 0) & std_logic_vector(to_unsigned(ch, 8)) after 1 ns;
          -- pkt.Data.CH_Data(ch) <= RECORD_ID & tProgramCount(7 downto 0) & std_logic_vector(to_unsigned(ch, 8));
          -- rd_tdata_i <= X"000" & idx_n_sincos & '0' & rd_taddr(6 downto 0);
          -- rd_tdata_i <= X"00" & std_logic_vector(to_signed(t_sin(conv_integer(idx_n_sincos)), 24)) after 2 ns;
          -- idx_n_sincos <= idx_n_sincos + std_logic_vector(to_unsigned(16, a_length)); -- "0000001000";
          -- idx_table_v := conv_integer(std_logic_vector(to_unsigned((conv_integer(idx_n_sincos) * ch), a_length)));
          -- pkt.SUM_Beam_Data.SUM_Data(ch) <= X"00" & std_logic_vector(to_signed(t_sin(idx_table_v), d_length)) after 1 ns;
        end loop;
        --
        --
        --
        --
        --
        --
        --
        --
        --
        idx_n_sincos <= idx_n_sincos + TABLE_DELTA_X;
        --
        --  type UDRL_Beam_Data_120_Type is record
        --  bitvector(2303 downto 1408)
        pkt.SUM_Beam_Data.Reserved <= (others => '0');
        --  end record;  --  UDRL_Beam_Data_120_Type

        --
        --  type SUM_Beam_Data_32_Type is record
        --  bitvector(1375 downto 1152)
        pkt.SUM_Beam_Data.Reserved <= X"00000000";
        --  end record;  --  SUM_Beam_Data_32_Type

        --
        --  type Trigger_State_1_Type is record
        pkt.FPGA_State.Trigger_State.TX_TRIG <= '0';
        pkt.FPGA_State.Trigger_State.RX_TRIG <= '0';
        pkt.FPGA_State.Trigger_State.TX_P_GATE <= '0';
        pkt.FPGA_State.Trigger_State.ReservedBit03 <= '0';
        pkt.FPGA_State.Trigger_State.ReservedBit04 <= '0';
        pkt.FPGA_State.Trigger_State.ReservedBit05 <= '0';
        pkt.FPGA_State.Trigger_State.ReservedBit06 <= '0';
        pkt.FPGA_State.Trigger_State.ReservedBit07 <= '0';
        --  end record;  --  Trigger_State_1_Type
        --
        --
        --  type SP_Zynq_SelfTest_Result_2_Type is record
        pkt.FPGA_State.SP_Zynq_SelfTest_Result.SP_P2_MEM <= '0';
        pkt.FPGA_State.SP_Zynq_SelfTest_Result.SP_P1_MEM <= '0';
        pkt.FPGA_State.SP_Zynq_SelfTest_Result.SP_AH_MEM <= '0';
        pkt.FPGA_State.SP_Zynq_SelfTest_Result.ReservedBit03 <= '0';
        pkt.FPGA_State.SP_Zynq_SelfTest_Result.SP_P2_Zynq <= '0';
        pkt.FPGA_State.SP_Zynq_SelfTest_Result.SP_P1_Zynq <= '0';
        pkt.FPGA_State.SP_Zynq_SelfTest_Result.SP_AH_Zynq <= '0';
        pkt.FPGA_State.SP_Zynq_SelfTest_Result.ReservedBit07 <= '0';
        pkt.FPGA_State.SP_Zynq_SelfTest_Result.SPC_GTP <= '0';
        pkt.FPGA_State.SP_Zynq_SelfTest_Result.SP_UART <= '0';
        pkt.FPGA_State.SP_Zynq_SelfTest_Result.ReservedBit10 <= '0';
        pkt.FPGA_State.SP_Zynq_SelfTest_Result.ReservedBit11 <= '0';
        pkt.FPGA_State.SP_Zynq_SelfTest_Result.PA_CMD_ACK <= '0';
        pkt.FPGA_State.SP_Zynq_SelfTest_Result.SC_CMD_ACK <= '0';
        pkt.FPGA_State.SP_Zynq_SelfTest_Result.PA_CHK_ACK <= '0';
        pkt.FPGA_State.SP_Zynq_SelfTest_Result.SC_CHK_ACK <= '0';
        --  end record;  --  SP_Zynq_SelfTest_Result_2_Type
        --
        --
        --  type PA_FPGA_SelfTest_Result_2_Type is record
        pkt.FPGA_State.PA_FPGA_SelfTest_Result.PCM_Boot <= '0';
        pkt.FPGA_State.PA_FPGA_SelfTest_Result.PAM1_Boot <= '0';
        pkt.FPGA_State.PA_FPGA_SelfTest_Result.PAM2_Boot <= '0';
        pkt.FPGA_State.PA_FPGA_SelfTest_Result.PAM3_Boot <= '0';
        pkt.FPGA_State.PA_FPGA_SelfTest_Result.PAM4_Boot <= '0';
        pkt.FPGA_State.PA_FPGA_SelfTest_Result.PAM5_Boot <= '0';
        pkt.FPGA_State.PA_FPGA_SelfTest_Result.PAM6_Boot <= '0';
        pkt.FPGA_State.PA_FPGA_SelfTest_Result.PAM7_Boot <= '0';
        pkt.FPGA_State.PA_FPGA_SelfTest_Result.CMD_DATA_ERR <= '0';
        pkt.FPGA_State.PA_FPGA_SelfTest_Result.Temp_warn <= '0';
        pkt.FPGA_State.PA_FPGA_SelfTest_Result.ReservedBit02 <= '0';
        pkt.FPGA_State.PA_FPGA_SelfTest_Result.ReservedBit03 <= '0';
        pkt.FPGA_State.PA_FPGA_SelfTest_Result.PAB_ST_RESULT <= '0';
        pkt.FPGA_State.PA_FPGA_SelfTest_Result.ReservedBit05 <= '0';
        pkt.FPGA_State.PA_FPGA_SelfTest_Result.ReservedBit06 <= '0';
        pkt.FPGA_State.PA_FPGA_SelfTest_Result.ReservedBit07 <= '0';
        --  end record;  --  PA_FPGA_SelfTest_Result_2_Type
        --
        --
        --  type SC_FPGA_SelfTest_Result_2_Type is record
        pkt.FPGA_State.SC_FPGA_SelfTest_Result.SC_MEM <= '0';
        pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit01 <= '0';
        pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit02 <= '0';
        pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit03 <= '0';
        pkt.FPGA_State.SC_FPGA_SelfTest_Result.SC_FPGA <= '0';
        pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit05 <= '0';
        pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit06 <= '0';
        pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit07 <= '0';
        pkt.FPGA_State.SC_FPGA_SelfTest_Result.SC_GTP <= '0';
        pkt.FPGA_State.SC_FPGA_SelfTest_Result.SC_LVDS <= '0';
        pkt.FPGA_State.SC_FPGA_SelfTest_Result.SC_UART <= '0';
        pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit13 <= '0';
        pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit14 <= '0';
        pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit15 <= '0';
        pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit16 <= '0';
        pkt.FPGA_State.SC_FPGA_SelfTest_Result.ReservedBit17 <= '0';
        --  end record;  --  SC_FPGA_SelfTest_Result_2_Type
        --
        --
        --  type FPGA_Zynq_Control_1_Type is record
        pkt.FPGA_State.FPGA_Zynq_Control.PLC_State <= '0';
        pkt.FPGA_State.FPGA_Zynq_Control.DAQ_Count_Reset <= '0';
        pkt.FPGA_State.FPGA_Zynq_Control.ReservedBit02 <= '0';
        pkt.FPGA_State.FPGA_Zynq_Control.ReservedBit03 <= '0';
        pkt.FPGA_State.FPGA_Zynq_Control.ReservedBit04 <= '0';
        pkt.FPGA_State.FPGA_Zynq_Control.SC_FPGA_Reset <= '0';
        pkt.FPGA_State.FPGA_Zynq_Control.PA_FPGA_Reset <= '0';
        pkt.FPGA_State.FPGA_Zynq_Control.Ping_On_Off <= '0';
        --  end record;  --  FPGA_Zynq_Control_1_Type
        --
        --
        --  type FPGA_State_40_Type is record
        pkt.FPGA_State.DAQCounter <= X"00000000";
        pkt.FPGA_State.SC_GainValue <= X"00";
        --  bitvector(879 downto 872)
        pkt.FPGA_State.PA_FPGA_Temperature <= X"00";
        pkt.FPGA_State.SC_FPGA_Temperature <= X"00";
        pkt.FPGA_State.SP_AH_Zynq_Temperature <= X"00";
        pkt.FPGA_State.SP_P1_Zynq_Temperature <= X"00";
        pkt.FPGA_State.SP_P2_Zynq_Temperature <= X"00";
        pkt.FPGA_State.SC2SP_Zynq_GTP_ERR <= X"00";
        pkt.FPGA_State.AH2P1_Zynq_GTP_ERR <= X"00";
        pkt.FPGA_State.AH2P2_Zynq_GTP_ERR <= X"00";
        pkt.FPGA_State.P12AH_Zynq_GTP_ERR <= X"00";
        pkt.FPGA_State.P22AH_Zynq_GTP_ERR <= X"00";
        --  bitvector(975 downto 960)
        --  bitvector(991 downto 976)
        --  bitvector(1007 downto 992)
        pkt.FPGA_State.TX_Voltage_Sample1 <= X"0000";
        pkt.FPGA_State.TX_Voltage_Sample2 <= X"0000";
        pkt.FPGA_State.TX_DC_Voltage_Sample1 <= X"0000";
        pkt.FPGA_State.TX_DC_Voltage_Sample2 <= X"0000";
        pkt.FPGA_State.TX_DC_Current_Sample1 <= X"0000";
        pkt.FPGA_State.TX_DC_Current_Sample2 <= X"0000";
        --  bitvector(1111 downto 1104)
        pkt.FPGA_State.Reserved_9 <= (others => '0');
        --  end record;  --  FPGA_State_40_Type
        --
        --
        --  type GC_Event_4_2_Type is record
        pkt.GC_INFO.GC_Event_4.Enable <= '0';
        pkt.GC_INFO.GC_Event_4.Detect <= '0';
        pkt.GC_INFO.GC_Event_4.Closein <= '0';
        pkt.GC_INFO.GC_Event_4.Fail <= '0';
        pkt.GC_INFO.GC_Event_4.ESAD_Chk <= '0';
        pkt.GC_INFO.GC_Event_4.ESAD_HV <= '0';
        pkt.GC_INFO.GC_Event_4.ESAD_Power <= '0';
        pkt.GC_INFO.GC_Event_4.ReservedBit07 <= '0';
        pkt.GC_INFO.GC_Event_4.ReservedBit08 <= '0';
        pkt.GC_INFO.GC_Event_4.ReservedBit09 <= '0';
        pkt.GC_INFO.GC_Event_4.ReservedBit10 <= '0';
        pkt.GC_INFO.GC_Event_4.ReservedBit11 <= '0';
        pkt.GC_INFO.GC_Event_4.Leakage_Det <= '0';
        pkt.GC_INFO.GC_Event_4.ReservedBit13 <= '0';
        pkt.GC_INFO.GC_Event_4.ReservedBit14 <= '0';
        pkt.GC_INFO.GC_Event_4.M_Stop <= '0';
        --  end record;  --  GC_Event_4_2_Type
        --
        --
        --  type GC_Event_3_2_Type is record
        pkt.GC_INFO.GC_Event_3.Beam_Steering <= (others => '0');
        pkt.GC_INFO.GC_Event_3.ReservedBit04 <= '0';
        pkt.GC_INFO.GC_Event_3.ReservedBit05 <= '0';
        pkt.GC_INFO.GC_Event_3.ReservedBit06 <= '0';
        pkt.GC_INFO.GC_Event_3.ReservedBit07 <= '0';
        pkt.GC_INFO.GC_Event_3.ReservedBit08 <= '0';
        pkt.GC_INFO.GC_Event_3.ReservedBit09 <= '0';
        pkt.GC_INFO.GC_Event_3.ReservedBit10 <= '0';
        pkt.GC_INFO.GC_Event_3.ReservedBit11 <= '0';
        pkt.GC_INFO.GC_Event_3.ReservedBit12 <= '0';
        pkt.GC_INFO.GC_Event_3.ReservedBit13 <= '0';
        pkt.GC_INFO.GC_Event_3.ReservedBit14 <= '0';
        pkt.GC_INFO.GC_Event_3.ReservedBit15 <= '0';
        --  end record;  --  GC_Event_3_2_Type
        --
        --
        --  type GC_Event_2_2_Type is record
        pkt.GC_INFO.GC_Event_2.Pre_Enable <= '0';
        pkt.GC_INFO.GC_Event_2.Enable <= '0';
        pkt.GC_INFO.GC_Event_2.V_Target <= '0';
        pkt.GC_INFO.GC_Event_2.Speed_Mode1 <= '0';
        pkt.GC_INFO.GC_Event_2.Speed_Mode2 <= '0';
        pkt.GC_INFO.GC_Event_2.Homming_Enable <= '0';
        pkt.GC_INFO.GC_Event_2.Homming_Mode <= '0';
        pkt.GC_INFO.GC_Event_2.Inhibit <= '0';
        pkt.GC_INFO.GC_Event_2.Hold_In <= '0';
        pkt.GC_INFO.GC_Event_2.Target_Det <= '0';
        pkt.GC_INFO.GC_Event_2.Target_Loss <= '0';
        pkt.GC_INFO.GC_Event_2.ACM_Det <= '0';
        pkt.GC_INFO.GC_Event_2.Pre_ACO_Chk <= '0';
        pkt.GC_INFO.GC_Event_2.ACO_Det <= '0';
        pkt.GC_INFO.GC_Event_2.ReservedBit14 <= '0';
        pkt.GC_INFO.GC_Event_2.ReservedBit15 <= '0';
        --  end record;  --  GC_Event_2_2_Type
        --
        --
        --  type GC_Event_1_2_Type is record
        pkt.GC_INFO.GC_Event_1.ReservedBit00 <= '0';
        pkt.GC_INFO.GC_Event_1.HILS_Mode <= '0';
        pkt.GC_INFO.GC_Event_1.EXHD_Mode <= '0';
        pkt.GC_INFO.GC_Event_1.C_Range <= '0';
        pkt.GC_INFO.GC_Event_1.E_Range <= '0';
        pkt.GC_INFO.GC_Event_1.ReservedBit05 <= '0';
        pkt.GC_INFO.GC_Event_1.Close_In <= '0';
        pkt.GC_INFO.GC_Event_1.Terminal_Homing <= '0';
        pkt.GC_INFO.GC_Event_1.Fire <= '0';
        pkt.GC_INFO.GC_Event_1.EOM <= '0';
        pkt.GC_INFO.GC_Event_1.Motor_Start <= '0';
        pkt.GC_INFO.GC_Event_1.Motor_Stop <= '0';
        pkt.GC_INFO.GC_Event_1.Ceiling_Det <= '0';
        pkt.GC_INFO.GC_Event_1.Floor_Det <= '0';
        pkt.GC_INFO.GC_Event_1.Surface_Det <= '0';
        pkt.GC_INFO.GC_Event_1.EOR <= '0';
        --  end record;  --  GC_Event_1_2_Type
        --
        --
        --  type GC_Command_2_Type is record
        pkt.GC_INFO.GC_Command.PLC <= '0';
        pkt.GC_INFO.GC_Command.AD_On <= '0';
        pkt.GC_INFO.GC_Command.ReservedBit02 <= '0';
        pkt.GC_INFO.GC_Command.ReservedBit03 <= '0';
        pkt.GC_INFO.GC_Command.Pre_Enable <= '0';
        pkt.GC_INFO.GC_Command.Enable <= '0';
        pkt.GC_INFO.GC_Command.ReservedBit06 <= '0';
        pkt.GC_INFO.GC_Command.ReservedBit07 <= '0';
        pkt.GC_INFO.GC_Command.Salvo_On <= '0';
        pkt.GC_INFO.GC_Command.Band_Sel <= '0';
        pkt.GC_INFO.GC_Command.Mode_Set <= '0';
        pkt.GC_INFO.GC_Command.PRI_Start <= '0';
        pkt.GC_INFO.GC_Command.Test_Mode_Set <= '0';
        pkt.GC_INFO.GC_Command.REC_Disable_Set <= '0';
        pkt.GC_INFO.GC_Command.Test_Trig <= '0';
        pkt.GC_INFO.GC_Command.ReservedBit15 <= '0';
        --  end record;  --  GC_Command_2_Type
        --
        --
        --  type GC_INFO_56_Type is record
        pkt.GC_INFO.GC_Count <= X"00000000";
        --  bitvector(431 downto 416)
        pkt.GC_INFO.Reserved_0 <= X"0000";
        --  bitvector(463 downto 448)
        --  bitvector(479 downto 464)
        --  bitvector(495 downto 480)
        --  bitvector(511 downto 496)
        pkt.GC_INFO.Speed_Mode <= X"00";
        pkt.GC_INFO.Search_Pattern <= X"00";
        pkt.GC_INFO.Pulse_Freq <= X"00";
        pkt.GC_INFO.Pulse_Type <= X"00";
        pkt.GC_INFO.Pulse_Length <= X"00";
        pkt.GC_INFO.PRE_Pulse <= X"00";
        pkt.GC_INFO.PRI <= X"00";
        pkt.GC_INFO.Beam_Steering <= X"00";
        pkt.GC_INFO.BAT_VOLT <= X"0000";
        pkt.GC_INFO.Reserved_1 <= (others => '0');
        pkt.GC_INFO.TORP_N <= X"00000000";
        pkt.GC_INFO.TORP_E <= X"00000000";
        pkt.GC_INFO.TORP_D <= X"0000";
        pkt.GC_INFO.TORP_Roll <= X"0000";
        pkt.GC_INFO.TORP_Pitch <= X"0000";
        pkt.GC_INFO.TORP_Yaw <= X"0000";
        pkt.GC_INFO.ACT_On_Off <= X"00";
        pkt.GC_INFO.Reserved_2 <= (others => '0');
        --  end record;  --  GC_INFO_56_Type
        --
        --
        --  type Save_Beam_INFO_2_Type is record
        pkt.FPGA_CMD.Save_Beam_INFO.Save_R3 <= '0';
        pkt.FPGA_CMD.Save_Beam_INFO.Save_R2 <= '0';
        pkt.FPGA_CMD.Save_Beam_INFO.Save_R1 <= '0';
        pkt.FPGA_CMD.Save_Beam_INFO.Save_R0 <= '0';
        pkt.FPGA_CMD.Save_Beam_INFO.Save_C <= '0';
        pkt.FPGA_CMD.Save_Beam_INFO.Save_L0 <= '0';
        pkt.FPGA_CMD.Save_Beam_INFO.Save_L1 <= '0';
        pkt.FPGA_CMD.Save_Beam_INFO.Save_L2 <= '0';
        pkt.FPGA_CMD.Save_Beam_INFO.Optic_On <= '0';
        pkt.FPGA_CMD.Save_Beam_INFO.Ethernet_On <= '0';
        pkt.FPGA_CMD.Save_Beam_INFO.TE_Data_Input <= (others => '0');
        pkt.FPGA_CMD.Save_Beam_INFO.ReservedBit04 <= '0';
        pkt.FPGA_CMD.Save_Beam_INFO.ReservedBit05 <= '0';
        pkt.FPGA_CMD.Save_Beam_INFO.ReservedBit06 <= '0';
        pkt.FPGA_CMD.Save_Beam_INFO.Save_L3 <= '0';
        --  end record;  --  Save_Beam_INFO_2_Type
        --
        --
        --  type PA_Tx_FPGA_CMD_16_Type is record
        pkt.FPGA_CMD.PA_Tx_FPGA_CMD.PRI <= (others => '0');
        pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx_Reset <= '0';
        pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx_Trigger <= '0';
        pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx_Pulse_Interval <= (others => '0');
        pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Number_of_Tx <= '0';
        pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Beam_Steering_Angle <= X"00";
        pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx1_Pulse_Length <= (others => '0');
        pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx1_Type <= '0';
        pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx1_Start_Frequency <= (others => '0');
        pkt.FPGA_CMD.PA_Tx_FPGA_CMD.ReservedBit07_1 <= '0';
        pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx1_Sweep_Frequency <= X"00";
        pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx2_Pulse_Length <= (others => '0');
        pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx2_Type <= '0';
        pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx2_Start_Frequency <= (others => '0');
        pkt.FPGA_CMD.PA_Tx_FPGA_CMD.ReservedBit07_2 <= '0';
        pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Tx2_Sweep_Frequency <= X"00";
        pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Beam_Weighting_Select <= (others => '0');
        pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Ramping_Time <= (others => '0');
        pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Battery_Voltage <= X"0000";
        pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Stave_Selection_Number <= (others => '0');
        pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Reserved_1 <= '0';
        pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Reserved_2 <= '0';
        pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Test_Mode <= '0';
        pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Stave_Tx_Mode <= '0';
        pkt.FPGA_CMD.PA_Tx_FPGA_CMD.Stave_Weight <= X"00";
        --  end record;  --  PA_Tx_FPGA_CMD_16_Type
        --
        --
        --  type SC_Rx_FPGA_CMD_8_Type is record
        pkt.FPGA_CMD.SC_Rx_FPGA_CMD.TVG <= (others => '0');
        pkt.FPGA_CMD.SC_Rx_FPGA_CMD.REC_Mode <= (others => '0');
        pkt.FPGA_CMD.SC_Rx_FPGA_CMD.ReservedBit06_0 <= '0';
        pkt.FPGA_CMD.SC_Rx_FPGA_CMD.ReservedBit07_0 <= '0';
        pkt.FPGA_CMD.SC_Rx_FPGA_CMD.PLC <= '0';
        pkt.FPGA_CMD.SC_Rx_FPGA_CMD.DAQ_Count_Reset <= '0';
        pkt.FPGA_CMD.SC_Rx_FPGA_CMD.AD_On <= '0';
        pkt.FPGA_CMD.SC_Rx_FPGA_CMD.Gain_Mode <= '0';
        pkt.FPGA_CMD.SC_Rx_FPGA_CMD.BPF_On_Off <= '0';
        pkt.FPGA_CMD.SC_Rx_FPGA_CMD.Pass_Active <= '0';
        pkt.FPGA_CMD.SC_Rx_FPGA_CMD.Reset <= '0';
        pkt.FPGA_CMD.SC_Rx_FPGA_CMD.Stop_Run <= '0';
        pkt.FPGA_CMD.SC_Rx_FPGA_CMD.REC_On_Off <= '0';
        pkt.FPGA_CMD.SC_Rx_FPGA_CMD.PLC_Mode <= (others => '0');
        pkt.FPGA_CMD.SC_Rx_FPGA_CMD.Data_Path <= '0';
        pkt.FPGA_CMD.SC_Rx_FPGA_CMD.ReservedBit04 <= '0';
        pkt.FPGA_CMD.SC_Rx_FPGA_CMD.ReservedBit05 <= '0';
        pkt.FPGA_CMD.SC_Rx_FPGA_CMD.ReservedBit06 <= '0';
        pkt.FPGA_CMD.SC_Rx_FPGA_CMD.ReservedBit07 <= '0';
        pkt.FPGA_CMD.SC_Rx_FPGA_CMD.Gain <= X"00";
        pkt.FPGA_CMD.SC_Rx_FPGA_CMD.Reserved <= X"00000000";
        --  end record;  --  SC_Rx_FPGA_CMD_8_Type
        --
        --
        --  type FPGA_CMD_36_Type is record
        pkt.FPGA_CMD.Reserved_0 <= X"00000000";
        --  bitvector(191 downto 128)
        --  bitvector(319 downto 192)
        --  bitvector(335 downto 320)
        pkt.FPGA_CMD.Reserved_1 <= (others => '0');
        --  end record;  --  FPGA_CMD_36_Type
        --

        --  type SP2TE_BEAM_Pkt_300_Type is record
        pkt.Start_Bytes <= X"7E7E7E7E";
        pkt.Count <= X"00000000";
        pkt.Command <= X"0000";
        pkt.ACK <= X"0000";
        --  bitvector(383 downto 96)
        --  bitvector(831 downto 384)
        --  bitvector(1151 downto 832)
        --  bitvector(1407 downto 1152)
        --  bitvector(2367 downto 1408)
        pkt.Checksum <= X"CCCC";
        pkt.Stop_Bytes <= X"8181";
        --  end record;  --  SP2TE_BEAM_Pkt_300_Type
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
        tProgramCount <= tProgramCount + 1;
      end if;
    end if;
  end process;
  --
  p_wr : process (Clk, reset_n)
  begin
    --
    if (q_sel_pre = '1') and (rd_tready = '1') then
      rd_tdata_o <= rd_tdata_i_i;
    else
      rd_tdata_o <= rd_tdata_i;
    end if;
    --
    if (reset_n = '0') then
      rd_start_enable <= '0';
      rd_tenable <= '0';
      rd_tvalid <= '0';
      rd_tlast <= '0';
      rd_taddr <= (others => '0');
    elsif (rising_edge(Clk)) then
      rd_tstart_i <= rd_tstart;
      rd_tstart_i_i <= rd_tstart_i;
      rd_tstart_i_i_i <= rd_tstart_i_i;
      if (rd_tstart_i_i = '1') and (rd_tstart_i_i_i = '0') and (rd_tenable = '0') then
        rd_start_enable <= '1';
        rd_taddr <= (others => '0');
      end if;
      --
      if (rd_start_enable = '1') then
        rd_tenable <= '1';
      end if;
      --      
      if (rd_tenable = '1') and (rd_tvalid = '0') then
        rd_tvalid <= '1';
      end if;
      --
      if (rd_tenable = '1') and (rd_tvalid = '0') and (rd_tready = '1') then
        q_sel_pre <= '1';
      elsif (rd_tvalid = '1') and (rd_tready = '0') then
        q_sel_pre <= '1';
      else
        q_sel_pre <= '0';
      end if;
      --
      if (rd_tvalid = '0') then
        q_latch <= '1';
      elsif (rd_tvalid = '1') and (rd_tready = '1') then
        q_latch <= '1';
      else
        q_latch <= '0';
      end if;
      --
      if (rd_tenable = '1') and (rd_tvalid = '0') then
        rd_taddr <= rd_taddr + '1';
      elsif (rd_tvalid = '1') and (rd_tready = '1') then
        rd_taddr <= rd_taddr + '1';
      end if;
      --
      if (q_latch = '1') then
        rd_tdata_i_i <= rd_tdata_i;
      end if;
      --      
      if (rd_taddr = ADDRESS_MAX_WORD - 1) then -- 71, 72 : rvd, 73 : rvd, 74 : checksum + stop bytes
        rd_tlast <= '1';
        rd_tenable <= '0';
        rd_start_enable <= '0';
      end if;
      --
      if (rd_tlast = '1') and (rd_tready = '1') then
        rd_taddr <= (others => '0');
        rd_tlast <= '0';
        rd_tvalid <= '0';
        --
        --
      end if;
      --
    end if;
  end process;
  --
  --
end architecture;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================