-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
--
entity bs_fir_wrapper is
  generic (
    ADDRESS_BEAM_MAX : natural := 35;
    DIR_BEAM_MAX : natural := 10;
    ADDRESS_BEAM_WIDTH : natural := 15;
    DATA_WIDTH : natural := 64
  );
  port (
    --    
    m_axis_reload_tvalid : out std_logic;
    m_axis_reload_tready : in std_logic;
    m_axis_reload_tlast : out std_logic;
    m_axis_reload_tdata : out std_logic_vector(15 downto 0);
    --
    s_axis_data_tvalid : in std_logic;
--    s_axis_data_tready : out std_logic;
    s_axis_data_tlast : in std_logic;
    s_axis_data_tdata : in std_logic_vector(55 downto 0);
    --
    m_axis_config_tvalid : out std_logic;
    m_axis_config_tready : in std_logic;
    m_axis_config_tdata : out std_logic_vector(7 downto 0);
    --
    m_axis_data_tvalid : out std_logic;
    m_axis_data_tready : in std_logic;
    m_axis_data_tlast : out std_logic;
    m_axis_data_tdata : out std_logic_vector(31 downto 0);
    --
    -- aresetn : out std_logic;
    --
    -- event_s_data_tlast_missing : in std_logic;
    -- event_s_data_tlast_unexpected : in std_logic;
    -- event_s_reload_tlast_missing : in std_logic;
    -- event_s_reload_tlast_unexpected : in std_logic;
    --    
    m_axis_bs_fir_p1_tvalid : out std_logic;
    m_axis_bs_fir_p1_tlast : out std_logic;
    m_axis_bs_fir_p1_tdata : out std_logic_vector(31 downto 0);
    --
    m_axis_bs_fir_p2_tvalid : out std_logic;
    m_axis_bs_fir_p2_tlast : out std_logic;
    m_axis_bs_fir_p2_tdata : out std_logic_vector(31 downto 0);
    --
    s_bs_fir_config_filter_coe : in std_logic_vector(1 downto 0);
    --
    s_axis_bs_fir_tvalid : in std_logic;
    s_axis_bs_fir_tready : out std_logic;
    s_axis_bs_fir_tlast : in std_logic;
    s_axis_bs_fir_tdata : in std_logic_vector(31 downto 0);
    -- 
    reset_n : in std_logic;
    Clk : in std_logic
    --    
  );
end entity;

architecture rtl of bs_fir_wrapper is
  signal bs_fir_status : std_logic := '0';
  signal s_bs_fir_config_filter_coe_i : std_logic_vector(1 downto 0) := (others => '0');
  signal tstart_i : std_logic := '0';
  signal tvalid_config : std_logic := '0';
  signal tready_config : std_logic := '0';
  signal tdata_config : std_logic_vector(7 downto 0) := (others => '0');
begin
  --
  m_axis_reload_tvalid <= '0';
  m_axis_reload_tlast <= '0';
  m_axis_reload_tdata <= (others => '0');
  --
  -- bs_fir_status <= event_s_data_tlast_missing or event_s_data_tlast_unexpected or event_s_reload_tlast_missing or event_s_reload_tlast_unexpected;
  --
  -- aresetn <= reset_n;
  --  
--  s_axis_data_tready <= '1';
  m_axis_bs_fir_p1_tvalid <= s_axis_data_tvalid;
  m_axis_bs_fir_p1_tlast <= s_axis_data_tlast;
  m_axis_bs_fir_p1_tdata <= s_axis_data_tdata(55 downto 24);
  --
  m_axis_bs_fir_p2_tvalid <= s_axis_data_tvalid;
  m_axis_bs_fir_p2_tlast <= s_axis_data_tlast;
  m_axis_bs_fir_p2_tdata <= s_axis_data_tdata(55 downto 24);
  --
  m_axis_data_tvalid <= s_axis_bs_fir_tvalid;
  s_axis_bs_fir_tready <= m_axis_data_tready;
  m_axis_data_tlast <= s_axis_bs_fir_tlast;
  m_axis_data_tdata <= s_axis_bs_fir_tdata;
  --
  m_axis_config_tvalid <= tvalid_config;
  tready_config <= m_axis_config_tready;
  m_axis_config_tdata <= tdata_config;
  --
  p_fir_config : process (Clk)
  begin
    if (reset_n = '0') then
      s_bs_fir_config_filter_coe_i <= (others => '0');
      tvalid_config <= '0';
      tstart_i <= '0';
      tdata_config <= "00000000";
    elsif (rising_edge(Clk)) then
      if (s_bs_fir_config_filter_coe_i /= s_bs_fir_config_filter_coe) or (tstart_i = '0') then
        tstart_i <= '1';
        tvalid_config <= '1';
        s_bs_fir_config_filter_coe_i <= s_bs_fir_config_filter_coe;
        if (s_bs_fir_config_filter_coe = "00") then
          tdata_config <= "00000000"; -- BFP1
        elsif (s_bs_fir_config_filter_coe = "01") then
          tdata_config <= "00000001";  -- BFP2
        elsif (s_bs_fir_config_filter_coe = "10") then
          tdata_config <= "00000010";  -- LPF
        elsif (s_bs_fir_config_filter_coe = "11") then
          tdata_config <= "00000000"; -- BFP1
        end if;
      end if;
      if (tvalid_config = '1') and (tready_config = '1') then
        tvalid_config <= '0';
      end if;
    end if;
  end process;
  --
end architecture;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================