
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity m_axi_rd_n_wr is
  generic (
    ADDRESS_MAX : natural := 75; -- 300 / 4 = 75
    ADDRESS_WIDTH : natural := 7;
    DATA_WIDTH : natural := 32
  );
  port (
    m_axi_rw_bus_tstart : in std_logic;
    --
    m_axi_rw_bus_clk : in std_logic;
    m_axi_rw_bus_reset_n : in std_logic;
    m_axi_rw_bus_tvalid : out std_logic;
    m_axi_rw_bus_tready : in std_logic;
    m_axi_rw_bus_tlast : out std_logic;
    m_axi_rw_bus_tdata : out std_logic_vector(DATA_WIDTH - 1 downto 0);
    --
    m_rd_tenable_o : out std_logic;
    m_rd_taddr : out std_logic_vector(ADDRESS_WIDTH - 1 downto 0);
    m_rd_tdata : in std_logic_vector(DATA_WIDTH - 1 downto 0)
  );
end m_axi_rd_n_wr;
--
architecture rtl of m_axi_rd_n_wr is
  signal tvalid : std_logic := '0';
  signal tlast : std_logic := '0';
  signal m_rd_taddr_s : std_logic_vector(ADDRESS_WIDTH - 1 downto 0) := (others => '0');
  signal m_rd_tdata_latch : std_logic_vector(DATA_WIDTH - 1 downto 0) := (others => '0');
  constant C_DATA_ZERO : std_logic_vector(DATA_WIDTH - 1 downto 0) := (others => '0');
  signal m_rd_tenable_o_s : std_logic := '0';
  signal q_sel_pre : std_logic := '0';
  signal q_latch : std_logic := '0';
begin
  --
  m_axi_rw_bus_tvalid <= tvalid;
  m_axi_rw_bus_tlast <= tlast;
  m_rd_tenable_o <= m_rd_tenable_o_s;
  m_rd_taddr <= m_rd_taddr_s;
  --
  p_axi_rd_wr : process (m_axi_rw_bus_clk)
    --
  begin
    --
    --
    --
    if (q_sel_pre = '1') and (m_axi_rw_bus_tready = '1') then
      m_axi_rw_bus_tdata <= m_rd_tdata_latch;
    else
      m_axi_rw_bus_tdata <= m_rd_tdata;
    end if;

    if (rising_edge(m_axi_rw_bus_clk)) then
      --
      if (m_axi_rw_bus_tstart = '1') and (m_rd_tenable_o_s = '0') then
        m_rd_taddr_s <= (others => '0');
        tvalid <= '0';
        m_rd_tenable_o_s <= '1';
      end if;
      --
      if (m_rd_tenable_o_s = '1') and (tvalid = '0') then
        tvalid <= '1';
      end if;
      --
      if (m_rd_tenable_o_s = '1') and (tvalid = '0') and (m_axi_rw_bus_tready = '1') then
        q_sel_pre <= '1';
      elsif (tvalid = '1') and (m_axi_rw_bus_tready = '0') then
        q_sel_pre <= '1';
      else
        q_sel_pre <= '0';
      end if;
      --
      --
      if (tvalid = '0') then
        q_latch <= '1';
      elsif (tvalid = '1') and (m_axi_rw_bus_tready = '1') then
        q_latch <= '1';
      else
        q_latch <= '0';
      end if;
      --
      if (m_rd_tenable_o_s = '1') and (tvalid = '0') then
        m_rd_taddr_s <= m_rd_taddr_s + '1';
      elsif (tvalid = '1') and (m_axi_rw_bus_tready = '1') then
        m_rd_taddr_s <= m_rd_taddr_s + '1';
      end if;
      --
      if (q_latch = '1') then
        m_rd_tdata_latch <= m_rd_tdata;
      end if;
      --      
      if (m_rd_taddr_s = ADDRESS_MAX - 1) then
        tlast <= '1';
      elsif (m_rd_taddr_s = ADDRESS_MAX) then
        m_rd_taddr_s <= (others => '0');
        tvalid <= '0';
        tlast <= '0';
        m_rd_tenable_o_s <= '0';
      end if;
      --
      --
    end if;
  end process;
  --
end rtl;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================