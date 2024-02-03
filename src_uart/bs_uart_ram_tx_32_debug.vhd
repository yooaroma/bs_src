-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use ieee.std_logic_unsigned.all;
--
entity bs_uart_ram_tx_32_debug is
  generic (
    ADDRESS_MAX : natural := 100;
    ADDRESS_WIDTH : natural := 7; -- 512 : 9, 256 : 8, 128 : 7
    DATA_WIDTH : natural := 32
  );
  port (
    --    
    s_axis_bs_uart_ram_tx_32_tvalid : in std_logic;
    s_axis_bs_uart_ram_tx_32_tready : out std_logic;
    s_axis_bs_uart_ram_tx_32_tlast : in std_logic;
    s_axis_bs_uart_ram_tx_32_tkeep : in std_logic_vector((DATA_WIDTH / 8) - 1 downto 0);
    s_axis_bs_uart_ram_tx_32_tdata : in std_logic_vector(DATA_WIDTH - 1 downto 0);
    -- 
    m_rd_bs_uart_ram_tx_32_tnext : out std_logic;
    s_rd_bs_uart_ram_tx_32_taddr : in std_logic_vector(ADDRESS_WIDTH - 1 downto 0);
    s_rd_bs_uart_ram_tx_32_tdata : out std_logic_vector((DATA_WIDTH/4) - 1 downto 0);
    --
    reset_n : in std_logic;
    Clk_rd : in std_logic;
    Clk : in std_logic
    --    
  );
end entity;
--
architecture rtl of bs_uart_ram_tx_32_debug is
  --
  -- ram or rom  
  type ram_type is array (0 to (2 ** (ADDRESS_WIDTH - 2) - 1)) of std_logic_vector(DATA_WIDTH - 1 downto 0); -- 512 bytes
  signal RAM : ram_type := (others => (others => '0'));
  attribute ram_style : string;
  attribute ram_style of RAM : signal is "block";
  signal wr_taddr_i : std_logic_vector(ADDRESS_WIDTH - 3 downto 0);
  signal rd_taddr_bank_i : std_logic_vector(1 downto 0);
  signal rd_taddr_i : std_logic_vector(ADDRESS_WIDTH - 3 downto 0);
  signal rd_tdata_i : std_logic_vector((DATA_WIDTH/4) - 1 downto 0);
  signal rd_tdata_all_i : std_logic_vector(DATA_WIDTH - 1 downto 0);
  -- signal
begin
  --
  m_rd_bs_uart_ram_tx_32_tnext <= s_axis_bs_uart_ram_tx_32_tlast;
  s_axis_bs_uart_ram_tx_32_tready <= '1';

  p_wr : process (Clk, reset_n)
  begin
    if (reset_n = '0') then
      wr_taddr_i <= (others => '0');
    elsif (rising_edge(Clk)) then
      if (s_axis_bs_uart_ram_tx_32_tvalid = '1') then
        RAM(conv_integer(wr_taddr_i(ADDRESS_WIDTH - 3 downto 0))) <= s_axis_bs_uart_ram_tx_32_tdata;
        if (s_axis_bs_uart_ram_tx_32_tlast = '1') then
          wr_taddr_i <= (others => '0');
        else
          wr_taddr_i <= wr_taddr_i + '1';
        end if;
      end if;
    end if;
  end process;
  --
  s_rd_bs_uart_ram_tx_32_tdata <= rd_tdata_i;
  rd_taddr_i <= s_rd_bs_uart_ram_tx_32_taddr(ADDRESS_WIDTH - 1 downto 2);

  rd_tdata_i <= rd_tdata_all_i(7 downto 0) when rd_taddr_bank_i = "00" else
    rd_tdata_all_i(15 downto 8) when rd_taddr_bank_i = "01" else
    rd_tdata_all_i(23 downto 16) when rd_taddr_bank_i = "10" else
    rd_tdata_all_i(31 downto 24);
  --
  p_rd : process (Clk_rd)
  begin
    if (rising_edge(Clk_rd)) then
      rd_taddr_bank_i <= s_rd_bs_uart_ram_tx_32_taddr(1 downto 0);
      rd_tdata_all_i <= RAM(conv_integer(rd_taddr_i));
    end if;
  end process;
  --
end architecture;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================