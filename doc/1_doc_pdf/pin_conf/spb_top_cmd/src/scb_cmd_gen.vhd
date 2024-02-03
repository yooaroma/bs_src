-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
--   0 is start from 0
--  36 is ch 1 from 0
--  72 is ch 37 from 0 
--  74 is end from 0
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use ieee.math_real.all;
use work.SCB_2_SPB_Type.all;

entity scb_cmd_gen is
  generic (
    Ampl : real := 2.0 ** 23 - 1.0; -- max
    Freq : real := 27000.0; -- Hz 10 KHz
    Azim : real := 45.0; -- deg  30
    Elev : real := 85.0; -- deg 15
    USE_DEBUG_CMD : integer := 0;
    ADDRESS_MAX : natural := 75; -- 300 / 4 = 75
    ADDRESS_WIDTH : natural := 7;
    DATA_WIDTH : natural := 32
  );
  port (
    --
    -- user defined port
    --
    -- axi bus defined
    -- port
    m_axi_scb_to_spb_clk : out std_logic;
    m_axi_scb_to_spb_tvalid : out std_logic;
    m_axi_scb_to_spb_tlast : out std_logic;
    m_axi_scb_to_spb_tdata : out std_logic_vector(DATA_WIDTH - 1 downto 0);
    --
    s_scb_cmd_clock_i : in std_logic;
    s_scb_cmd_reset_n_i : in std_logic;
    s_scb_cmd_tnext_i : in std_logic
    --     
  );
end entity;
--
architecture rtl of scb_cmd_gen is
  --
  -- componet
  --  
  --
  -- signal
  --
  --  
  signal Chan_Pkt : SCB2SPB_Pkt_300_Type;
  signal Chan_Str : std_logic_vector(2399 downto 0) := (others => '0');
  --
  signal Clk : std_logic; -- := '0';
  signal reset_n : std_logic; -- := '0';
  signal tdata : std_logic_vector(31 downto 0);
  signal tenable : std_logic := '0';
  signal tvalid : std_logic := '0';
  signal tlast : std_logic := '0';
  signal tstart : std_logic := '0';
  signal tstart_i : std_logic := '0';
  signal tstart_i_i : std_logic := '0';
  signal tcnt : std_logic_vector(31 downto 0) := (others => '0');
  --
  --
  --
  -- m_axi_scb_to_spb_clk : out std_logic;
  -- m_axi_scb_to_spb_tvalid : out std_logic;
  -- m_axi_scb_to_spb_tlast : out std_logic;
  -- m_axi_scb_to_spb_tdata : out std_logic_vector(DATA_WIDTH - 1 downto 0);

begin
  --
  --
  Clk <= s_scb_cmd_clock_i;
  reset_n <= s_scb_cmd_reset_n_i;
  --
  m_axi_scb_to_spb_clk <= s_scb_cmd_clock_i;
  m_axi_scb_to_spb_tvalid <= tvalid;
  m_axi_scb_to_spb_tlast <= tlast;
  m_axi_scb_to_spb_tdata <= tdata;
  tstart <= s_scb_cmd_tnext_i;
  --
  Chan_Str <= conv_ch_bitvector(Chan_Pkt);
  -- Chan_Pkt <= conv_ch_packet(Chan_Str);
  --
  --
  p_Recv : process (Clk, reset_n)
    variable Clk_Cnt, Word_Cnt, PRT_Cnt : natural := 0;
    variable tProgramCount : natural := 0;
    variable dtH, dtV : real := 0.0;
    variable vKaSub, vKa : real := 0.0;
    variable mVoiceSpeedWithWater : real := 1500.0; -- m/sec
    variable vAngularFreq : real := 0.0;
    variable vSampleFreq : real := 200000.0;
    variable vIndexTime : real := 0.0;
    variable vAzim : real := 45.0;
    variable vElev : real := 85.0;
    variable vFreq : real := 27000.0;
  begin
    --
    if reset_n = '0' then
      vIndexTime := 0.0;
      Word_Cnt := 0;
      tcnt <= (others => '0');
      tProgramCount := 0;
      tvalid <= '0';
      tlast <= '0';
      tstart_i <= '0';
      tstart_i_i <= '0';
      Chan_Pkt <= scb_2_spb_300_i;
    elsif (rising_edge(Clk)) then
      tstart_i <= tstart;
      tstart_i_i <= tstart_i;
      -- if (tstart = '1') and (tstart_i = '0') then
      -- end if;
      if (tstart_i = '1') and (tstart_i_i = '0') then
        tenable <= '1';
        Word_Cnt := 0;
      end if;
      if (tenable = '1') and (tvalid = '0') then
        tvalid <= '1';
      end if;
      if (tenable = '1') then
        -- tdata <= tcnt;
        tdata <= Chan_Str(Word_Cnt * 32 + 31 downto Word_Cnt * 32) after 2 ns;
        tcnt <= tcnt + '1';
        if (Word_Cnt = C_CMD_END) then -- index 0 to 74 : 75 * 32 bit = 300 bytes
          Word_Cnt := Word_Cnt;
        else
          Word_Cnt := Word_Cnt + 1;
        end if;
      end if;
      if (tcnt = C_CMD_END) then
        tlast <= '1';
      end if;
      if (tlast = '1') then
        Word_Cnt := 0;
        tcnt <= (others => '0');
        tenable <= '0';
        tvalid <= '0';
        tlast <= '0';
        tProgramCount := tProgramCount + 1;
        Chan_Pkt.Count <= std_logic_vector(to_unsigned(tProgramCount, 32));
      end if;
      if (tstart = '1') and (tstart_i = '0') then
        --
        --
        --
        --
        --
        dtH := 0.02344 * cos(MATH_PI/180.0 * vAzim); -- x 0.016574583 if 85 deg
        dtV := 0.02578 * sin(MATH_PI/180.0 * vAzim); -- y  Elev 0.018229213
        vKaSub := (2.0 * MATH_PI * vFreq); -- 169,646.0032938
        vKa := (vKaSub / 1500.0) * cos(MATH_PI/180.0 * vElev);
        vAngularFreq := (vKaSub / vSampleFreq) * vIndexTime;
        vIndexTime := vIndexTime + 1.0;
        Chan_Pkt.BS_DATA.CH_Data(1) <= std_logic_vector(to_signed(integer(Ampl * sin(vKa * (0.0 - 3.0 * dtH - 1.5 * dtV) - vAngularFreq)), 32));
        Chan_Pkt.BS_DATA.CH_Data(2) <= std_logic_vector(to_signed(integer(Ampl * sin(vKa * (0.0 - 3.0 * dtH - 0.5 * dtV) - vAngularFreq)), 32));
        Chan_Pkt.BS_DATA.CH_Data(3) <= std_logic_vector(to_signed(integer(Ampl * sin(vKa * (0.0 - 3.0 * dtH + 0.5 * dtV) - vAngularFreq)), 32));
        Chan_Pkt.BS_DATA.CH_Data(4) <= std_logic_vector(to_signed(integer(Ampl * sin(vKa * (0.0 - 3.0 * dtH + 1.5 * dtV) - vAngularFreq)), 32));
        Chan_Pkt.BS_DATA.CH_Data(5) <= std_logic_vector(to_signed(integer(Ampl * sin(vKa * (0.0 - 2.0 * dtH - 2.0 * dtV) - vAngularFreq)), 32));
        Chan_Pkt.BS_DATA.CH_Data(6) <= std_logic_vector(to_signed(integer(Ampl * sin(vKa * (0.0 - 2.0 * dtH - 1.0 * dtV) - vAngularFreq)), 32));
        Chan_Pkt.BS_DATA.CH_Data(7) <= std_logic_vector(to_signed(integer(Ampl * sin(vKa * (0.0 - 2.0 * dtH + 0.0 * dtV) - vAngularFreq)), 32));
        Chan_Pkt.BS_DATA.CH_Data(8) <= std_logic_vector(to_signed(integer(Ampl * sin(vKa * (0.0 - 2.0 * dtH + 1.0 * dtV) - vAngularFreq)), 32));
        Chan_Pkt.BS_DATA.CH_Data(9) <= std_logic_vector(to_signed(integer(Ampl * sin(vKa * (0.0 - 2.0 * dtH + 2.0 * dtV) - vAngularFreq)), 32));
        Chan_Pkt.BS_DATA.CH_Data(10) <= std_logic_vector(to_signed(integer(Ampl * sin(vKa * (0.0 - 1.0 * dtH - 2.5 * dtV) - vAngularFreq)), 32));
        Chan_Pkt.BS_DATA.CH_Data(11) <= std_logic_vector(to_signed(integer(Ampl * sin(vKa * (0.0 - 1.0 * dtH - 1.5 * dtV) - vAngularFreq)), 32));
        Chan_Pkt.BS_DATA.CH_Data(12) <= std_logic_vector(to_signed(integer(Ampl * sin(vKa * (0.0 - 1.0 * dtH - 0.5 * dtV) - vAngularFreq)), 32));
        Chan_Pkt.BS_DATA.CH_Data(13) <= std_logic_vector(to_signed(integer(Ampl * sin(vKa * (0.0 - 1.0 * dtH + 0.5 * dtV) - vAngularFreq)), 32));
        Chan_Pkt.BS_DATA.CH_Data(14) <= std_logic_vector(to_signed(integer(Ampl * sin(vKa * (0.0 - 1.0 * dtH + 1.5 * dtV) - vAngularFreq)), 32));
        Chan_Pkt.BS_DATA.CH_Data(15) <= std_logic_vector(to_signed(integer(Ampl * sin(vKa * (0.0 - 1.0 * dtH + 2.5 * dtV) - vAngularFreq)), 32));
        Chan_Pkt.BS_DATA.CH_Data(16) <= std_logic_vector(to_signed(integer(Ampl * sin(vKa * (0.0 + 0.0 * dtH - 3.0 * dtV) - vAngularFreq)), 32));
        Chan_Pkt.BS_DATA.CH_Data(17) <= std_logic_vector(to_signed(integer(Ampl * sin(vKa * (0.0 + 0.0 * dtH - 2.0 * dtV) - vAngularFreq)), 32));
        Chan_Pkt.BS_DATA.CH_Data(18) <= std_logic_vector(to_signed(integer(Ampl * sin(vKa * (0.0 + 0.0 * dtH - 1.0 * dtV) - vAngularFreq)), 32));
        Chan_Pkt.BS_DATA.CH_Data(19) <= std_logic_vector(to_signed(integer(Ampl * sin(vKa * (0.0 + 0.0 * dtH + 0.0 * dtV) - vAngularFreq)), 32));
        Chan_Pkt.BS_DATA.CH_Data(20) <= std_logic_vector(to_signed(integer(Ampl * sin(vKa * (0.0 + 0.0 * dtH + 1.0 * dtV) - vAngularFreq)), 32));
        Chan_Pkt.BS_DATA.CH_Data(21) <= std_logic_vector(to_signed(integer(Ampl * sin(vKa * (0.0 + 0.0 * dtH + 2.0 * dtV) - vAngularFreq)), 32));
        Chan_Pkt.BS_DATA.CH_Data(22) <= std_logic_vector(to_signed(integer(Ampl * sin(vKa * (0.0 + 0.0 * dtH + 3.0 * dtV) - vAngularFreq)), 32));
        Chan_Pkt.BS_DATA.CH_Data(23) <= std_logic_vector(to_signed(integer(Ampl * sin(vKa * (0.0 + 1.0 * dtH - 2.5 * dtV) - vAngularFreq)), 32));
        Chan_Pkt.BS_DATA.CH_Data(24) <= std_logic_vector(to_signed(integer(Ampl * sin(vKa * (0.0 + 1.0 * dtH - 1.5 * dtV) - vAngularFreq)), 32));
        Chan_Pkt.BS_DATA.CH_Data(25) <= std_logic_vector(to_signed(integer(Ampl * sin(vKa * (0.0 + 1.0 * dtH - 0.5 * dtV) - vAngularFreq)), 32));
        Chan_Pkt.BS_DATA.CH_Data(26) <= std_logic_vector(to_signed(integer(Ampl * sin(vKa * (0.0 + 1.0 * dtH + 0.5 * dtV) - vAngularFreq)), 32));
        Chan_Pkt.BS_DATA.CH_Data(27) <= std_logic_vector(to_signed(integer(Ampl * sin(vKa * (0.0 + 1.0 * dtH + 1.5 * dtV) - vAngularFreq)), 32));
        Chan_Pkt.BS_DATA.CH_Data(28) <= std_logic_vector(to_signed(integer(Ampl * sin(vKa * (0.0 + 1.0 * dtH + 2.5 * dtV) - vAngularFreq)), 32));
        Chan_Pkt.BS_DATA.CH_Data(29) <= std_logic_vector(to_signed(integer(Ampl * sin(vKa * (0.0 + 2.0 * dtH - 2.0 * dtV) - vAngularFreq)), 32));
        Chan_Pkt.BS_DATA.CH_Data(30) <= std_logic_vector(to_signed(integer(Ampl * sin(vKa * (0.0 + 2.0 * dtH - 1.0 * dtV) - vAngularFreq)), 32));
        Chan_Pkt.BS_DATA.CH_Data(31) <= std_logic_vector(to_signed(integer(Ampl * sin(vKa * (0.0 + 2.0 * dtH + 0.0 * dtV) - vAngularFreq)), 32));
        Chan_Pkt.BS_DATA.CH_Data(32) <= std_logic_vector(to_signed(integer(Ampl * sin(vKa * (0.0 + 2.0 * dtH + 1.0 * dtV) - vAngularFreq)), 32));
        Chan_Pkt.BS_DATA.CH_Data(33) <= std_logic_vector(to_signed(integer(Ampl * sin(vKa * (0.0 + 2.0 * dtH + 2.0 * dtV) - vAngularFreq)), 32));
        Chan_Pkt.BS_DATA.CH_Data(34) <= std_logic_vector(to_signed(integer(Ampl * sin(vKa * (0.0 + 3.0 * dtH - 1.5 * dtV) - vAngularFreq)), 32));
        Chan_Pkt.BS_DATA.CH_Data(35) <= std_logic_vector(to_signed(integer(Ampl * sin(vKa * (0.0 + 3.0 * dtH - 0.5 * dtV) - vAngularFreq)), 32));
        Chan_Pkt.BS_DATA.CH_Data(36) <= std_logic_vector(to_signed(integer(Ampl * sin(vKa * (0.0 + 3.0 * dtH + 0.5 * dtV) - vAngularFreq)), 32));
        Chan_Pkt.BS_DATA.CH_Data(37) <= std_logic_vector(to_signed(integer(Ampl * sin(vKa * (0.0 + 3.0 * dtH + 1.5 * dtV) - vAngularFreq)), 32));
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
      end if;
    end if;
  end process;
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
  -- cmd_test : if USE_DEBUG_CMD = 1 generate
  -- end generate cmd_test;
end architecture;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
--   0 is start from 0
--  36 is ch 1 from 0
--  72 is ch 37 from 0 
--  74 is end from 0
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use ieee.math_real.all;
use work.SCB_2_SPB_Type.all;

entity scb_cmd_gen_table is
  generic (
    ADDRESS_MAX : natural := 75; -- 300 / 4 = 75
    ADDRESS_WIDTH : natural := 7;
    DATA_WIDTH : natural := 32
  );
  port (
    --
    -- user defined port
    --
    -- axi bus defined
    -- port
    m_axi_scb_to_spb_clk : out std_logic;
    m_axi_scb_to_spb_tvalid : out std_logic;
    m_axi_scb_to_spb_tlast : out std_logic;
    m_axi_scb_to_spb_tdata : out std_logic_vector(DATA_WIDTH - 1 downto 0);
    --
    s_scb_cmd_clock_i : in std_logic;
    s_scb_cmd_reset_n_i : in std_logic;
    s_scb_cmd_tnext_i : in std_logic
    --     
  );
end entity;
--
architecture rtl of scb_cmd_gen_table is
  --
  -- componet
  --  

  --
  -- signal
  --
  --  
  --
  signal Clk : std_logic; -- := '0';
  signal reset_n : std_logic; -- := '0';
  signal tdata : std_logic_vector(31 downto 0);
  signal tenable : std_logic := '0';
  signal tvalid : std_logic := '0';
  signal tlast : std_logic := '0';
  signal tstart : std_logic := '0';
  signal tstart_i : std_logic := '0';
  signal tcnt : std_logic_vector(31 downto 0) := (others => '0');
  --
  --
  -- #########################################################################
  -- #########################################################################
  -- #########################################################################
  constant a_length : natural := 12;
  constant d_length : natural := 24;
  constant SIN_ADDR_MAX : natural := 2 ** (a_length - 1) - 1;
  constant SIN_DATA_MAX : integer := 2 ** (d_length - 1) - 1;
  subtype SIN_DATA_VALUE is integer range -SIN_DATA_MAX to SIN_DATA_MAX;
  type SIN_TABLE is array (natural range <>) of SIN_DATA_VALUE;
  --
  signal t_sin : SIN_TABLE(0 to SIN_ADDR_MAX);
  -- #########################################################################
  -- #########################################################################
  -- #########################################################################
  --
  signal tch_data_enable : std_logic := '0';
  signal tProgramCount : std_logic_vector(31 downto 0);
  signal idx_n_sincos : std_logic_vector(a_length - 1 downto 0);
  --

begin
  --
  --
  -- #########################################################################
  -- #########################################################################
  -- #########################################################################
  sin_gen : for t in t_sin'range generate
  begin
    t_sin(t) <= SIN_DATA_VALUE(real(SIN_DATA_MAX) * sin(2.0 * MATH_PI/real(t_sin'length) * real(t)));
  end generate sin_gen;
  -- #########################################################################
  -- #########################################################################
  -- #########################################################################
  --
  Clk <= s_scb_cmd_clock_i;
  reset_n <= s_scb_cmd_reset_n_i;
  --
  m_axi_scb_to_spb_clk <= s_scb_cmd_clock_i;
  m_axi_scb_to_spb_tvalid <= tvalid;
  m_axi_scb_to_spb_tlast <= tlast;
  m_axi_scb_to_spb_tdata <= tdata;
  tstart <= s_scb_cmd_tnext_i;
  --  
  --
  p_Recv : process (Clk, reset_n)
    variable Word_Cnt : natural := 0;
  begin
    --
    if reset_n = '0' then
      Word_Cnt := 0;
      tvalid <= '0';
      tlast <= '0';
      tch_data_enable <= '0';
      tcnt <= (others => '0');
      tProgramCount <= (others => '0');
      idx_n_sincos <= (others => '0');
    elsif (rising_edge(Clk)) then
      tstart_i <= tstart;
      if (tstart = '1') and (tstart_i = '0') then
        tenable <= '1';
        Word_Cnt := 0;
      end if;
      if (tenable = '1') and (tvalid = '0') then
        tvalid <= '1';
        idx_n_sincos <= tProgramCount(a_length - 1 downto 0);
      end if;
      if (tenable = '1') then
        -- tdata <= tcnt;
        if (tch_data_enable = '1') then
          tdata <= X"00" & std_logic_vector(to_signed(t_sin(conv_integer(idx_n_sincos)), 24)) after 2 ns;
          idx_n_sincos <= idx_n_sincos + std_logic_vector(to_unsigned(16, a_length)); -- "0000001000";
        else
          if (tcnt = 0) then
            tdata <= X"7F7F7F7F";
          elsif (tcnt = 1) then
            tdata <= tProgramCount;
          elsif (tcnt = C_CMD_END) then
            tdata <= X"8181CCCC";
          else
            tdata <= tcnt;
          end if;
        end if;
        tcnt <= tcnt + '1';
        if (Word_Cnt = C_CMD_END) then -- index 0 to 74 : 75 * 32 bit = 300 bytes
          Word_Cnt := Word_Cnt;
        else
          Word_Cnt := Word_Cnt + 1;
        end if;
      end if;
      if (tcnt = C_CMD_END) then
        tlast <= '1';
      end if;
      if (tch_data_enable = '0') and (tcnt = C_CH_START - 1) then -- 35 : 36 from 0 to 36 is ch1
        tch_data_enable <= '1';
      end if;
      if (tch_data_enable = '1') and (tcnt = C_CH_END) then -- 72 : ch37 from 0 to 72 is ch37
        tch_data_enable <= '0';
      end if;
      if (tlast = '1') then
        Word_Cnt := 0;
        tcnt <= (others => '0');
        tenable <= '0';
        tvalid <= '0';
        tlast <= '0';
        --
        --
        tProgramCount <= tProgramCount + '1';
        --
        --
      end if;
    end if;
  end process;
  --
  --
  --
  -- cmd_test : if USE_DEBUG_CMD = 1 generate
  -- end generate cmd_test;
end architecture;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
--   0 is start from 0
--  36 is ch 1 from 0
--  72 is ch 37 from 0 
--  74 is end from 0
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use ieee.math_real.all;
use work.SCB_2_SPB_Type.all;

entity scb_cmd_gen_ramp is
  generic (
    ADDRESS_MAX : natural := 75; -- 300 / 4 = 75
    ADDRESS_WIDTH : natural := 7;
    DATA_WIDTH : natural := 32
  );
  port (
    --
    -- user defined port
    --
    -- axi bus defined
    -- port
    m_axi_scb_to_spb_clk : out std_logic;
    m_axi_scb_to_spb_tvalid : out std_logic;
    m_axi_scb_to_spb_tlast : out std_logic;
    m_axi_scb_to_spb_tdata : out std_logic_vector(DATA_WIDTH - 1 downto 0);
    --
    s_scb_cmd_clock_i : in std_logic;
    s_scb_cmd_reset_n_i : in std_logic;
    s_scb_cmd_tnext_i : in std_logic
    --     
  );
end entity;
--
architecture rtl of scb_cmd_gen_ramp is
  --
  -- componet
  --  

  --
  -- signal
  --
  --  
  --
  signal Clk : std_logic; -- := '0';
  signal reset_n : std_logic; -- := '0';
  signal tdata : std_logic_vector(31 downto 0);
  signal tenable : std_logic := '0';
  signal tvalid : std_logic := '0';
  signal tlast : std_logic := '0';
  signal tstart : std_logic := '0';
  signal tstart_i : std_logic := '0';
  signal tcnt : std_logic_vector(31 downto 0) := (others => '0');
  --
  --
  -- #########################################################################
  -- #########################################################################
  -- #########################################################################
  --
  constant a_length : natural := 12;
  signal tch_data_enable : std_logic := '0';
  signal tProgramCount : std_logic_vector(31 downto 0);
  signal idx_n_sincos : std_logic_vector(a_length - 1 downto 0);
  --

begin
  --
  --
  -- #########################################################################
  -- #########################################################################
  -- #########################################################################
  --
  Clk <= s_scb_cmd_clock_i;
  reset_n <= s_scb_cmd_reset_n_i;
  --
  m_axi_scb_to_spb_clk <= s_scb_cmd_clock_i;
  m_axi_scb_to_spb_tvalid <= tvalid;
  m_axi_scb_to_spb_tlast <= tlast;
  m_axi_scb_to_spb_tdata <= tdata;
  tstart <= s_scb_cmd_tnext_i;
  --  
  --
  p_Recv : process (Clk, reset_n)
    variable Word_Cnt : natural := 0;
  begin
    --
    if reset_n = '0' then
      Word_Cnt := 0;
      tvalid <= '0';
      tlast <= '0';
      tch_data_enable <= '0';
      tcnt <= (others => '0');
      tProgramCount <= (others => '0');
      idx_n_sincos <= (others => '0');
    elsif (rising_edge(Clk)) then
      tstart_i <= tstart;
      if (tstart = '1') and (tstart_i = '0') then
        tenable <= '1';
        Word_Cnt := 0;
      end if;
      if (tenable = '1') and (tvalid = '0') then
        tvalid <= '1';
        idx_n_sincos <= tProgramCount(a_length - 1 downto 0);
      end if;
      if (tenable = '1') then
        -- tdata <= tcnt;
        if (tch_data_enable = '1') then
          tdata <= X"000" & idx_n_sincos & tcnt(7 downto 0);
        else
          if (tcnt = 0) then
            tdata <= X"7F7F7F7F";
          elsif (tcnt = 1) then
            tdata <= tProgramCount;
          elsif (tcnt = C_CMD_END) then
            tdata <= X"8181CCCC";
          else
            tdata <= tcnt;
          end if;
        end if;
        tcnt <= tcnt + '1';
        if (Word_Cnt = C_CMD_END) then -- index 0 to 74 : 75 * 32 bit = 300 bytes
          Word_Cnt := Word_Cnt;
        else
          Word_Cnt := Word_Cnt + 1;
        end if;
      end if;
      if (tcnt = C_CMD_END) then
        tlast <= '1';
      end if;
      if (tch_data_enable = '0') and (tcnt = C_CH_START - 1) then -- 35 : 36 from 0 to 36 is ch1
        tch_data_enable <= '1';
      end if;
      if (tch_data_enable = '1') and (tcnt = C_CH_END) then -- 72 : ch37 from 0 to 72 is ch37
        tch_data_enable <= '0';
      end if;
      if (tlast = '1') then
        Word_Cnt := 0;
        tcnt <= (others => '0');
        tenable <= '0';
        tvalid <= '0';
        tlast <= '0';
        --
        --
        tProgramCount <= tProgramCount + '1';
        --
        --
      end if;
    end if;
  end process;
  --
  --
  --
  -- cmd_test : if USE_DEBUG_CMD = 1 generate
  -- end generate cmd_test;
end architecture;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================