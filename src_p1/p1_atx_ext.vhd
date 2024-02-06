
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity p1_atx_ext is
  generic (
    ADDRESS_WIDTH : natural := 15;
    DATA_WIDTH : natural := 32
  );
  port (
    --    
    m_axis_data_tvalid : out std_logic;
    m_axis_data_tready : in std_logic;
    m_axis_data_tlast : out std_logic;
    m_axis_data_tdata : out std_logic_vector(255 downto 0);
    --
    m_axis_config_tvalid : out std_logic;
    m_axis_config_tready : in std_logic;
    m_axis_config_tdata : out std_logic_vector(79 downto 0);
    -- 
    s_rd_tstart : in std_logic;
    m_rd_taddr : out std_logic_vector(14 downto 0);
    m_rd_tdata_a : in std_logic_vector(31 downto 0);
    m_rd_tdata_b : in std_logic_vector(31 downto 0);
    m_rd_tdata_c : in std_logic_vector(31 downto 0);
    m_rd_tdata_d : in std_logic_vector(31 downto 0);
    --
    reset_n : in std_logic;
    Clk : in std_logic
    --    
  );
end entity;
--
architecture rtl of p1_atx_ext is
  --   
  constant C_DATA_ZERO : std_logic_vector(255 downto 0) := (others => '0');
  --
  signal rd_tstart : std_logic;
  signal rd_tstart_i : std_logic;
  signal rd_tenable : std_logic := '0';
  signal rd_tvalid : std_logic;
  signal rd_tready : std_logic;
  signal rd_tlast : std_logic;
  signal rd_tstart_addr : std_logic_vector(14 downto 0);
  signal rd_tend_addr : std_logic_vector(14 downto 0);
  signal rd_taddr : std_logic_vector(14 downto 0);
  signal rd_tdata_o : std_logic_vector(127 downto 0);
  signal rd_tdata_i : std_logic_vector(127 downto 0);
  signal rd_tdata_i_i : std_logic_vector(127 downto 0);
  signal q_sel_pre : std_logic := '0';
  signal q_latch : std_logic := '0';
  --  
  signal tstart_i : std_logic := '0';
  signal tvalid_config : std_logic := '0';
  signal tready_config : std_logic := '0';
  signal tdata_config : std_logic_vector(3 downto 0) := (others => '0');
  --
begin
  --  
  --
  m_axis_config_tvalid <= tvalid_config;
  tready_config <= m_axis_config_tready;
  m_axis_config_tdata <= C_DATA_ZERO(79 downto 4) & tdata_config;
  --
  rd_tstart <= s_rd_tstart;
  --
  m_axis_data_tvalid <= rd_tvalid;
  rd_tready <= m_axis_data_tready;
  m_axis_data_tlast <= rd_tlast;
  -- m_axis_data_tdata <= X"00000000" & rd_tdata_o;
  m_axis_data_tdata <= C_DATA_ZERO(255 downto 224) & rd_tdata_o(127 downto 96) & C_DATA_ZERO(191 downto 160) & rd_tdata_o(95 downto 64)  & C_DATA_ZERO(127 downto 96) & rd_tdata_o(63 downto 32) & C_DATA_ZERO(63 downto 32) & rd_tdata_o(31 downto 0);
  --
  m_rd_taddr <= rd_taddr;
  rd_tdata_i <= m_rd_tdata_d & m_rd_tdata_c & m_rd_tdata_b & m_rd_tdata_a;
  --
  p_wr : process (Clk)
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
      rd_tstart_addr <= (others => '0'); 
    elsif (rising_edge(Clk)) then
      rd_tstart_i <= rd_tstart;
      if (rd_tstart_i = '1') and (rd_tenable = '0') then
        rd_tenable <= '1';
        rd_tend_addr <= rd_tstart_addr + X"7FFE"; -- (-2)
        rd_taddr <= rd_tstart_addr;
        rd_tstart_addr <= rd_tstart_addr + 100;
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
      if (rd_taddr = rd_tend_addr) then
        rd_tlast <= '1';
        rd_tenable <= '0';
      end if;
      --
      if (rd_tlast = '1') and (rd_tready = '1') then
        rd_tlast <= '0';
        rd_tvalid <= '0';
      end if;
      --
    end if;
  end process;
  --
  p_fft_config : process (Clk)
  begin
    if (reset_n = '0') then
      tvalid_config <= '0';
      tstart_i <= '0';
      tdata_config <= "0000";
    elsif (rising_edge(Clk)) then
      if (tstart_i = '0') then
        tstart_i <= '1';
        tvalid_config <= '1';
        tdata_config <= "1111"; -- FWD_INV:CP_LEN:NFFF
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