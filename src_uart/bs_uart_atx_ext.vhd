-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use ieee.std_logic_unsigned.all;
--
entity bs_uart_atx_ext is
  generic (
    ADDRESS_MAX : natural := 100; -- 25
    ADDRESS_WIDTH : natural := 7; -- 512 : 9, 256 : 8, 128 : 7
    DATA_WIDTH : natural := 8 -- 32
  );
  port (
    --    
    m_axis_bs_uart_atx_tvalid : out std_logic;
    m_axis_bs_uart_atx_tready : in std_logic;
    m_axis_bs_uart_atx_tlast : out std_logic;
    m_axis_bs_uart_atx_tkeep : out std_logic_vector(DATA_WIDTH / 8 - 1 downto 0);
    m_axis_bs_uart_atx_tdata : out std_logic_vector(DATA_WIDTH - 1 downto 0);
    -- 
    s_rd_bs_uart_atx_tstart : in std_logic;
    m_rd_bs_uart_atx_taddr : out std_logic_vector(ADDRESS_WIDTH - 1 downto 0);
    m_rd_bs_uart_atx_tdata : in std_logic_vector(DATA_WIDTH - 1 downto 0);
    --
    reset_n : in std_logic;
    Clk : in std_logic
    --    
  );
end entity;
--
architecture rtl of bs_uart_atx_ext is
  --   
  signal rd_tstart : std_logic;
  signal rd_tstart_i : std_logic;
  signal rd_tstart_i_i : std_logic;
  signal rd_tenable : std_logic := '0';
  signal rd_tvalid : std_logic;
  signal rd_tready : std_logic;
  signal rd_tlast : std_logic;
  signal rd_taddr : std_logic_vector(ADDRESS_WIDTH - 1 downto 0);
  signal rd_tdata_o : std_logic_vector(DATA_WIDTH - 1 downto 0);
  signal rd_tdata_i : std_logic_vector(DATA_WIDTH - 1 downto 0);
  signal rd_tdata_i_i : std_logic_vector(DATA_WIDTH - 1 downto 0);
  signal q_sel_pre : std_logic := '0';
  signal q_latch : std_logic := '0';
  --  
  signal tstart_i : std_logic := '0';
  --
begin
  --
  rd_tstart <= s_rd_bs_uart_atx_tstart;
  --
  m_axis_bs_uart_atx_tvalid <= rd_tvalid;
  rd_tready <= m_axis_bs_uart_atx_tready;
  m_axis_bs_uart_atx_tlast <= rd_tlast;
  m_axis_bs_uart_atx_tkeep <= (others => '1');
  m_axis_bs_uart_atx_tdata <= rd_tdata_o;
  --
  m_rd_bs_uart_atx_taddr <= rd_taddr;
  rd_tdata_i <= m_rd_bs_uart_atx_tdata;
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
      if (rd_taddr = ADDRESS_MAX - 1) then
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