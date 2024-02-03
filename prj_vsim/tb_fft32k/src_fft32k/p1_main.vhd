-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
--
entity p1_main is
  generic (
    ADDRESS_MAX : natural := 75;
    ADDRESS_WIDTH : natural := 7;
    DATA_WIDTH : natural := 32
  );
  port (
    --    
    m_axis_cmd_tvalid : out std_logic;
    m_axis_cmd_tlast : out std_logic;
    m_axis_cmd_tdata : out std_logic_vector(31 downto 0);
    -- 
    m_axis_bit_00_tvalid : out std_logic;
    m_axis_bit_00_tdata : out std_logic_vector(31 downto 0);
    -- 
    m_axis_bit_01_tvalid : out std_logic;
    m_axis_bit_01_tdata : out std_logic_vector(31 downto 0);
    -- 
    m_axis_bit_02_tvalid : out std_logic;
    m_axis_bit_02_tdata : out std_logic_vector(31 downto 0);
    -- 
    m_axis_bit_03_tvalid : out std_logic;
    m_axis_bit_03_tdata : out std_logic_vector(31 downto 0);
    -- 
    m_axis_bit_04_tvalid : out std_logic;
    m_axis_bit_04_tdata : out std_logic_vector(31 downto 0);
    -- 
    m_axis_bit_05_tvalid : out std_logic;
    m_axis_bit_05_tdata : out std_logic_vector(31 downto 0);
    -- 
    m_axis_bit_06_tvalid : out std_logic;
    m_axis_bit_06_tdata : out std_logic_vector(31 downto 0);
    -- 
    m_axis_bit_07_tvalid : out std_logic;
    m_axis_bit_07_tdata : out std_logic_vector(31 downto 0);
    -- 
    m_axis_bit_08_tvalid : out std_logic;
    m_axis_bit_08_tdata : out std_logic_vector(31 downto 0);
    -- 
    m_axis_bit_09_tvalid : out std_logic;
    m_axis_bit_09_tdata : out std_logic_vector(31 downto 0);
    -- 
    m_axis_bit_10_tvalid : out std_logic;
    m_axis_bit_10_tdata : out std_logic_vector(31 downto 0);
    -- 
    m_axis_bit_11_tvalid : out std_logic;
    m_axis_bit_11_tdata : out std_logic_vector(31 downto 0);
    -- 
    m_axis_bit_12_tvalid : out std_logic;
    m_axis_bit_12_tdata : out std_logic_vector(31 downto 0);
    -- 
    m_axis_bit_13_tvalid : out std_logic;
    m_axis_bit_13_tdata : out std_logic_vector(31 downto 0);
    -- 
    m_axis_bit_14_tvalid : out std_logic;
    m_axis_bit_14_tdata : out std_logic_vector(31 downto 0);
    -- 
    m_axis_bit_15_tvalid : out std_logic;
    m_axis_bit_15_tdata : out std_logic_vector(31 downto 0);
    -- 
    m_axis_bit_16_tvalid : out std_logic;
    m_axis_bit_16_tdata : out std_logic_vector(31 downto 0);
    -- 
    m_axis_bit_17_tvalid : out std_logic;
    m_axis_bit_17_tdata : out std_logic_vector(31 downto 0);
    -- 
    m_axis_bit_18_tvalid : out std_logic;
    m_axis_bit_18_tdata : out std_logic_vector(31 downto 0);
    -- 
    m_rd_p1_main_taddr : out std_logic_vector(6 downto 0);
    m_rd_p1_main_tdata : in std_logic_vector(31 downto 0);
    -- 
    s_p1_main_tstart : in std_logic;
    -- 
    reset_n : in std_logic;
    Clk : in std_logic
    --    
  );
end entity;

architecture rtl of p1_main is
  --
  signal rd_taddr : std_logic_vector(6 downto 0) := (others => '0');
  --
  signal rd_tenable : std_logic := '0';
  signal rd_tstart : std_logic := '0';
  signal rd_tstart_i : std_logic := '0';
  signal rd_tvalid : std_logic := '0';
  signal rd_tvalid_i : std_logic := '0';
  signal rd_tlast : std_logic := '0';
  signal rd_tlast_i : std_logic := '0';
  signal rd_tnext : std_logic := '0';
  signal rd_tdata : std_logic_vector(31 downto 0) := (others => '0');
  signal rd_tdata_i : std_logic_vector(31 downto 0) := (others => '0');
  signal sel_beam_reg : std_logic_vector(31 downto 0) := (others => '0');
  signal sel_beam_reg_i : std_logic_vector(31 downto 0) := (others => '0');
  signal sel_beam_bit_reg : std_logic_vector(35 downto 0) := (others => '0');
  signal sel_beam_bit_reg_i : std_logic_vector(35 downto 0) := (others => '0');
  signal sel_beam_tvalid : std_logic_vector(31 downto 0) := (others => '0');
  --  
  signal beam_start : std_logic := '0';
  --
  --
begin
  --
  rd_tstart <= s_p1_main_tstart;
  --
  m_rd_p1_main_taddr <= rd_taddr;
  rd_tdata <= m_rd_p1_main_tdata;
  --
  m_axis_cmd_tvalid <= rd_tvalid_i;
  m_axis_cmd_tlast <= rd_tlast_i;
  m_axis_cmd_tdata <= rd_tdata_i;
  --  
  m_axis_bit_00_tvalid <= sel_beam_tvalid(0);
  m_axis_bit_00_tdata <= rd_tdata_i;
  --  
  m_axis_bit_01_tvalid <= sel_beam_tvalid(1);
  m_axis_bit_01_tdata <= rd_tdata_i;
  --  
  m_axis_bit_02_tvalid <= sel_beam_tvalid(2);
  m_axis_bit_02_tdata <= rd_tdata_i;
  --  
  m_axis_bit_03_tvalid <= sel_beam_tvalid(3);
  m_axis_bit_03_tdata <= rd_tdata_i;
  --  
  m_axis_bit_04_tvalid <= sel_beam_tvalid(4);
  m_axis_bit_04_tdata <= rd_tdata_i;
  --  
  m_axis_bit_05_tvalid <= sel_beam_tvalid(5);
  m_axis_bit_05_tdata <= rd_tdata_i;
  --  
  m_axis_bit_06_tvalid <= sel_beam_tvalid(6);
  m_axis_bit_06_tdata <= rd_tdata_i;
  --  
  m_axis_bit_07_tvalid <= sel_beam_tvalid(7);
  m_axis_bit_07_tdata <= rd_tdata_i;
  --  
  m_axis_bit_08_tvalid <= sel_beam_tvalid(8);
  m_axis_bit_08_tdata <= rd_tdata_i;
  --  
  m_axis_bit_09_tvalid <= sel_beam_tvalid(9);
  m_axis_bit_09_tdata <= rd_tdata_i;
  --  
  m_axis_bit_10_tvalid <= sel_beam_tvalid(10);
  m_axis_bit_10_tdata <= rd_tdata_i;
  --  
  m_axis_bit_11_tvalid <= sel_beam_tvalid(11);
  m_axis_bit_11_tdata <= rd_tdata_i;
  --  
  m_axis_bit_12_tvalid <= sel_beam_tvalid(12);
  m_axis_bit_12_tdata <= rd_tdata_i;
  --  
  m_axis_bit_13_tvalid <= sel_beam_tvalid(13);
  m_axis_bit_13_tdata <= rd_tdata_i;
  --  
  m_axis_bit_14_tvalid <= sel_beam_tvalid(14);
  m_axis_bit_14_tdata <= rd_tdata_i;
  --  
  m_axis_bit_15_tvalid <= sel_beam_tvalid(15);
  m_axis_bit_15_tdata <= rd_tdata_i;
  --  
  m_axis_bit_16_tvalid <= sel_beam_tvalid(16);
  m_axis_bit_16_tdata <= rd_tdata_i;
  --  
  m_axis_bit_17_tvalid <= sel_beam_tvalid(17);
  m_axis_bit_17_tdata <= rd_tdata_i;
  --  
  m_axis_bit_18_tvalid <= sel_beam_tvalid(18);
  m_axis_bit_18_tdata <= rd_tdata_i;
  --
  p_rd : process (Clk)
    variable idx_v : natural := 0;
  begin
    if (reset_n = '0') then
      rd_tenable <= '0';
      rd_tstart_i <= '0';
    elsif (rising_edge(Clk)) then
      rd_tvalid <= rd_tenable;
      rd_tstart_i <= rd_tstart;
      rd_tvalid_i <= rd_tvalid;
      rd_tlast_i <= rd_tlast;
      rd_tdata_i <= rd_tdata;
      if (rd_tstart = '1') and (rd_tstart_i = '0') then
        rd_tenable <= '1';
        rd_taddr <= (others => '0');
        sel_beam_tvalid <= (others => '0');
        sel_beam_reg_i <= sel_beam_reg;
        idx_v := 0;
      end if;
      if (rd_tenable = '1') then
        rd_taddr <= rd_taddr + '1';
      end if;
      if (rd_taddr = 11) then
        sel_beam_reg <= rd_tdata;
        sel_beam_bit_reg <= (others => '0');
      end if;
      if (rd_taddr = 74) then
        rd_tlast <= '1';
        rd_tenable <= '0';
      end if;
      if (rd_tlast = '1') then
        rd_tlast <= '0';
      end if;
      if (rd_taddr = 12) then
        sel_beam_bit_reg(6 downto 0) <= (others => '1');
        if (sel_beam_reg(15) = '1') then -- Save_L3
          sel_beam_bit_reg(11 downto 8) <= (others => '1');
        end if;
        if (sel_beam_reg(7) = '1') then -- Save_L2
          sel_beam_bit_reg(15 downto 12) <= (others => '1');
        end if;
        if (sel_beam_reg(6) = '1') then -- Save_L1
          sel_beam_bit_reg(19 downto 16) <= (others => '1');
        end if;
        if (sel_beam_reg(4) = '1') then -- Save_C
          sel_beam_bit_reg(23 downto 20) <= (others => '1');
        end if;
        if (sel_beam_reg(2) = '1') then -- Save_R1
          sel_beam_bit_reg(27 downto 24) <= (others => '1');
        end if;
        if (sel_beam_reg(1) = '1') then -- Save_R2
          sel_beam_bit_reg(31 downto 28) <= (others => '1');
        end if;
        if (sel_beam_reg(0) = '1') then -- Save_R3
          sel_beam_bit_reg(35 downto 32) <= (others => '1');
        end if;
      end if;
      if (rd_taddr = 13) then
        sel_beam_bit_reg_i <= sel_beam_bit_reg;
      end if;
      --
      --
      if (rd_taddr = 36) then -- 36 sum_L3/L2/L1/C0/R1/R2/R3
        beam_start <= '1';
      end if;
      if (rd_taddr = 71) then -- 36 sum_L3/L2/L1/C0/R1/R2/R3
        beam_start <= '0';
      end if;
      if (beam_start = '1') then
        sel_beam_bit_reg_i <= '0' & sel_beam_bit_reg_i(35 downto 1);
        if (sel_beam_bit_reg_i(0) = '1') then
          sel_beam_tvalid(idx_v) <= '1';
          idx_v := idx_v + 1;
        end if;
      end if;

      for i in 0 to 18 loop -- don't have to declare i
        if (sel_beam_tvalid(i) = '1') then
          sel_beam_tvalid(i) <= '0';
        end if;
      end loop;
      --
      --
    end if;
  end process;
  --
end architecture;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================