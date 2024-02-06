-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
--
entity bs_fir_gen is
  generic (
    ADDRESS_BEAM_MAX : natural := 35;
    DIR_BEAM_MAX : natural := 7;
    DATA_WIDTH : natural := 32
  );
  port (
    --    
    m_bs_fir_config_filter_coe : out std_logic_vector(1 downto 0);
    --
    m_axis_bs_fir_gen_tvalid : out std_logic;
    m_axis_bs_fir_gen_tready : in std_logic;
    m_axis_bs_fir_gen_tlast : out std_logic;
    m_axis_bs_fir_gen_tdata : out std_logic_vector(31 downto 0);
    -- 
    s_bs_fir_gen_start : in std_logic;
    s_bs_fir_gen_filter_mode : in std_logic_vector(1 downto 0);
    s_bs_fir_gen_mode : in std_logic_vector(1 downto 0);
    -- 
    reset_n : in std_logic;
    Clk : in std_logic
    --    
  );
end entity;

architecture rtl of bs_fir_gen is
  signal s_bs_fir_gen_start_i : std_logic := '0';
  signal s_bs_fir_gen_start_i_i : std_logic := '0';
  signal tenable : std_logic := '0';
  signal tvalid : std_logic := '0';
  signal tready : std_logic;
  signal tlast : std_logic := '0';
  signal tdata : std_logic_vector(31 downto 0) := (others => '0');
  signal idx_n : natural := 0;
  signal tcnt_n : natural := 0;
begin
  --
  m_bs_fir_config_filter_coe <= s_bs_fir_gen_filter_mode;
  s_bs_fir_gen_start_i <= s_bs_fir_gen_start;
  --
  m_axis_bs_fir_gen_tvalid <= tvalid;
  tready <= m_axis_bs_fir_gen_tready;
  m_axis_bs_fir_gen_tlast <= tlast;
  m_axis_bs_fir_gen_tdata <= tdata;
  --
  p_axi_timing : process (Clk)
  begin
    if (reset_n = '0') then
      idx_n <= 0;
      tcnt_n <= 0;
      tenable <= '0';
      tvalid <= '0';
      tlast <= '0';
      tdata <= X"00000000";
    elsif (rising_edge(Clk)) then
      s_bs_fir_gen_start_i_i <= s_bs_fir_gen_start_i;
      tvalid <= tenable;
      if (s_bs_fir_gen_start_i_i = '0') and (s_bs_fir_gen_start_i = '1') then
        tenable <= '1';
      end if;
      if (tenable = '1') and (tready = '1') then
        idx_n <= idx_n + 1;
      end if;
      if (idx_n = 34) then
        tlast <= '1';
        tenable <= '0';
      end if;
      if (tlast = '1') then
        tlast <= '0';
        idx_n <= 0;
        if (tcnt_n = 126) then
          tcnt_n <= 0;
          tdata(0) <= '1';
        else
          tcnt_n <= tcnt_n + 1;
          tdata(0) <= '0';
        end if;
      end if;
    end if;
  end process;
  --
end architecture;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================