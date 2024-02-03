-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use ieee.std_logic_unsigned.all;
--
entity bs_ram_saxis_2_maxis is
  generic (
    ADDRESS_MAX : natural := 300;
    ADDRESS_WIDTH : natural := 9;
    DATA_WIDTH : natural := 32
  );
  port (
    --    
    s_axis_tvalid : in std_logic;
    s_axis_tlast : in std_logic;
    s_axis_tkeep : in std_logic_vector((DATA_WIDTH/8) - 1 downto 0);
    s_axis_tdata : in std_logic_vector(DATA_WIDTH - 1 downto 0);
    -- 
    m_axis_tvalid : out std_logic;
    m_axis_tready : in std_logic;
    m_axis_tlast : out std_logic;
    m_axis_tkeep : out std_logic_vector((DATA_WIDTH/8) - 1 downto 0);
    m_axis_tdata : out std_logic_vector(DATA_WIDTH - 1 downto 0);
    --
    s_axi_aresetn : in std_logic;
    s_axi_aclk : in std_logic;
    --
    m_axi_aresetn : in std_logic;
    m_axi_aclk : in std_logic
    --    
  );
end entity;
--
architecture rtl of bs_ram_saxis_2_maxis is
  --
  constant ADDRESS_MAX_WORD_CNT : natural := (DATA_WIDTH / 8); -- 75
  constant ADDRESS_MAX_WORD : natural := (ADDRESS_MAX / ADDRESS_MAX_WORD_CNT); -- 75
  constant C_DATA_ZERO : std_logic_vector(DATA_WIDTH - 1 downto 0) := (others => '0');
  --
  -- ram or rom  
  constant DPRAM_ADDRESS_WIDTH : natural := ADDRESS_WIDTH - 1; -- 256 * 2 = double buffer
  type ram_type is array (0 to (2 ** DPRAM_ADDRESS_WIDTH) - 1) of std_logic_vector(DATA_WIDTH - 1 downto 0);
  signal RAM : ram_type := (others => (others => '0'));
  attribute ram_style : string;
  attribute ram_style of RAM : signal is "block";
  signal wr_taddr_i : std_logic_vector(DPRAM_ADDRESS_WIDTH - 2 downto 0);
  signal wr_taddr_high : std_logic;
  signal wr_taddr_high_i : std_logic;
  signal wr_taddr_high_i_i : std_logic;
  signal rd_taddr_high : std_logic;
  signal s_axis_tlast_i : std_logic := '0';
  signal s_axis_tlast_i_i : std_logic := '0';
  signal s_axis_tlast_i_i_i : std_logic := '0';
  -- signal
  --
  signal rd_tstart : std_logic;
  signal rd_tstart_i : std_logic;
  signal rd_tstart_i_i : std_logic;
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
  signal tstart_i : std_logic := '0';
  --  
  signal m_rd_taddr : std_logic_vector(ADDRESS_WIDTH - 3 downto 0);
  signal m_rd_tdata : std_logic_vector(DATA_WIDTH-1 downto 0);
  --
begin
  --
  --
  --
  --
  --
  p_wr : process (s_axi_aclk, s_axi_aresetn)
  begin
    if (s_axi_aresetn = '0') then
      wr_taddr_i <= (others => '0');
      wr_taddr_high <= '0';
    elsif (rising_edge(s_axi_aclk)) then
      if (s_axis_tvalid = '1') then
        RAM(conv_integer(wr_taddr_high & wr_taddr_i)) <= s_axis_tdata;
        if (s_axis_tlast = '1') then
          wr_taddr_i <= (others => '0');
          wr_taddr_high <= not wr_taddr_high;
        else
          wr_taddr_i <= wr_taddr_i + '1';
        end if;
      end if;
    end if;
  end process;
  --
  p_last_expansion : process (s_axi_aclk)
    variable bit_idx_n : std_logic_vector(8 downto 0) := (others => '0');
  begin
    if (rising_edge(s_axi_aclk)) then
      if (s_axis_tlast = '1') then
        bit_idx_n := (others => '1');
      else
        bit_idx_n := bit_idx_n(7 downto 0) & '0';
      end if;
    end if;
    s_axis_tlast_i <= bit_idx_n(8);
  end process;
  --
  --
  --
  --
  --
  p_rd : process (m_axi_aclk)
  begin
    s_axis_tlast_i_i <= s_axis_tlast_i;
    s_axis_tlast_i_i_i <= s_axis_tlast_i_i;
    wr_taddr_high_i <= wr_taddr_high;
    wr_taddr_high_i_i <= wr_taddr_high_i;
    rd_taddr_high <= not wr_taddr_high_i_i;
    if (rising_edge(m_axi_aclk)) then
      m_rd_tdata <= RAM(conv_integer(rd_taddr_high & m_rd_taddr)) after 1 ns;
    end if;
  end process;
  --
  --
  --
  --
  --
  rd_tstart <= s_axis_tlast_i_i_i;
  --
  m_axis_tvalid <= rd_tvalid;
  rd_tready <= m_axis_tready;
  m_axis_tkeep <= (others => '1');
  m_axis_tlast <= rd_tlast;
  m_axis_tdata <= rd_tdata_o;
  --
  m_rd_taddr <= rd_taddr;
  rd_tdata_i <= m_rd_tdata;
  --
  p_wr_atx : process (m_axi_aclk)
  begin
    --
    if (q_sel_pre = '1') and (rd_tready = '1') then
      rd_tdata_o <= rd_tdata_i_i;
    else
      rd_tdata_o <= rd_tdata_i;
    end if;
    --
    if (m_axi_aresetn = '0') then
      rd_tenable <= '0';
      rd_tvalid <= '0';
      rd_tlast <= '0';
      rd_taddr <= (others => '0');
    elsif (rising_edge(m_axi_aclk)) then
      rd_tstart_i <= rd_tstart;
      rd_tstart_i_i <= rd_tstart_i;
      if (rd_tstart = '1') and (rd_tstart_i = '0') then
        rd_tenable <= '0';
        rd_taddr <= (others => '0');
      end if;
      if (rd_tstart_i = '1') and (rd_tstart_i_i = '0') then
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
      if (rd_taddr = ADDRESS_MAX_WORD - 1) then
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
end architecture;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================