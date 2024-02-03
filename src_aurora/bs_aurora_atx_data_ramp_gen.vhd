-- //=============================================================================
-- //=============================================================================
-- //=============================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
--
entity bs_aurora_atx_data_ramp_gen is
  generic (
    ADDRESS_MAX : natural := 300;
    ADDRESS_WIDTH : natural := 9; -- 512 : 9 
    DATA_WIDTH : natural := 32
  );
  port (
    --    
    m_axis_bs_aurora_atx_tvalid : out std_logic;
    m_axis_bs_aurora_atx_tready : in std_logic;
    m_axis_bs_aurora_atx_tlast : out std_logic;
    m_axis_bs_aurora_atx_tkeep : out std_logic_vector(3 downto 0);
    m_axis_bs_aurora_atx_tdata : out std_logic_vector(DATA_WIDTH - 1 downto 0);
    -- 
    s_rd_bs_aurora_atx_tstart : in std_logic;
    -- 
    reset_n : in std_logic;
    Clk : in std_logic
    --    
  );
end entity;
--
architecture rtl of bs_aurora_atx_data_ramp_gen is
  --
  constant ADDRESS_MAX_WORD_CNT : natural := (DATA_WIDTH / 8); -- 75
  constant ADDRESS_MAX_WORD : natural := (ADDRESS_MAX / ADDRESS_MAX_WORD_CNT); -- 75
  constant C_DATA_ZERO : std_logic_vector(DATA_WIDTH - 1 downto 0) := (others => '0');
  --
  signal rd_tstart : std_logic;
  signal rd_tstart_i : std_logic;
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
  constant a_length : natural := 12;
  signal tch_data_enable : std_logic := '0';
  signal idx_n_sincos : std_logic_vector(a_length - 1 downto 0);
  --
begin
  --      
  rd_tstart <= s_rd_bs_aurora_atx_tstart;
  --
  m_axis_bs_aurora_atx_tvalid <= rd_tvalid;
  rd_tready <= m_axis_bs_aurora_atx_tready;
  m_axis_bs_aurora_atx_tlast <= rd_tlast;
  m_axis_bs_aurora_atx_tkeep <= (others => '1');
  m_axis_bs_aurora_atx_tdata <= rd_tdata_o;
  --
  -- m_rd_bs_aurora_atx_taddr <= rd_taddr;
  -- rd_tdata_i <= m_rd_bs_aurora_atx_tdata;

  p_rd : process (Clk, reset_n)
  begin
    if (reset_n = '0') then
      tProgramCount <= (others => '0');
      rd_tdata_i <= (others => '0');
      idx_n_sincos <= (others => '0');
    elsif (rising_edge(Clk)) then
      if (rd_taddr = 0) then
        rd_tdata_i <= X"7F7F7F7F";
        idx_n_sincos <= tProgramCount(a_length - 1 downto 0);
      elsif (rd_taddr = 1) then
        rd_tdata_i <= tProgramCount(31 downto 0);
      elsif (rd_taddr = ADDRESS_MAX_WORD - 1) then
        rd_tdata_i <= X"8181CCCC";
        tProgramCount <= tProgramCount + '1';
      elsif (tch_data_enable = '1') then
        rd_tdata_i <= X"000" & idx_n_sincos & '0' & rd_taddr(6 downto 0);
      else
        rd_tdata_i <= C_DATA_ZERO(DATA_WIDTH - 1 downto ADDRESS_WIDTH - 2) & rd_taddr;
      end if;
      --
      if (tch_data_enable = '0') and (rd_taddr = 35) then -- 35 : 36 from 0 to 36 is ch1
        tch_data_enable <= '1';
      end if;
      if (tch_data_enable = '1') and (rd_taddr = 72) then -- 72 : ch37 from 0 to 72 is ch37
        tch_data_enable <= '0';
      end if;
      --
    end if;
  end process;
  --
  p_wr : process (Clk,reset_n)
  begin
    --
    if (q_sel_pre = '1') and (rd_tready = '1') then
      rd_tdata_o <= rd_tdata_i_i;
    else
      rd_tdata_o <= rd_tdata_i;
    end if;
    --
    if (reset_n = '0') then
      rd_tenable <= '0';
      rd_tvalid <= '0';
      rd_tlast <= '0';
      rd_taddr <= (others => '0');
    elsif (rising_edge(Clk)) then
      rd_tstart_i <= rd_tstart;
      if (rd_tstart = '0') and (rd_tstart_i = '1') and (rd_tenable = '0') then
        rd_tenable <= '1';
        rd_taddr <= (others => '0');
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