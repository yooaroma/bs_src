-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use ieee.std_logic_unsigned.all;
--
entity bs_uart_ram is
  generic (
    ADDRESS_MAX : natural := 100;
    ADDRESS_WIDTH : natural := 7; -- 512 : 9, 256 : 8, 128 : 7
    DATA_WIDTH : natural := 8
  );
  port (
    --    
    s_axis_bs_uart_ram_tvalid : in std_logic;
    s_axis_bs_uart_ram_tlast : in std_logic;
    s_axis_bs_uart_ram_tkeep : in std_logic_vector(DATA_WIDTH/8 - 1 downto 0);
    s_axis_bs_uart_ram_tdata : in std_logic_vector(DATA_WIDTH - 1 downto 0);
    -- 
    m_rd_bs_uart_ram_tnext : out std_logic;
    s_rd_bs_uart_ram_taddr : in std_logic_vector(ADDRESS_WIDTH - 1 downto 0);
    s_rd_bs_uart_ram_tdata : out std_logic_vector(DATA_WIDTH - 1 downto 0);
    --
    reset_n : in std_logic;
    Clk : in std_logic 
    --    
  );
end entity;
--
architecture rtl of bs_uart_ram is  
  -- ram or rom  
  constant DPRAM_ADDRESS_WIDTH : natural := ADDRESS_WIDTH + 1; -- 256 * 2 = double buffer
  type ram_type is array (0 to (2 ** DPRAM_ADDRESS_WIDTH) - 1) of std_logic_vector(7 downto 0);
  signal RAM : ram_type := (others => (others => '0'));
  attribute ram_style : string;
  attribute ram_style of RAM : signal is "block";
  signal wr_taddr_i : std_logic_vector(DPRAM_ADDRESS_WIDTH - 2 downto 0);
  signal wr_taddr_high : std_logic;
  signal rd_taddr_high : std_logic;
  -- signal
begin

  m_rd_bs_uart_ram_tnext <= s_axis_bs_uart_ram_tlast;
  
  p_wr : process (Clk, reset_n)
  begin
    if (reset_n = '0') then
      wr_taddr_i <= (others => '0');
      wr_taddr_high <= '0';
    elsif (rising_edge(Clk)) then
      if (s_axis_bs_uart_ram_tvalid = '1') then
        RAM(conv_integer(wr_taddr_high & wr_taddr_i)) <= s_axis_bs_uart_ram_tdata;
        wr_taddr_i <= wr_taddr_i + '1';
      elsif (s_axis_bs_uart_ram_tlast = '1') then
        wr_taddr_i <= (others => '0');
        wr_taddr_high <= not wr_taddr_high;
      end if;
    end if;
  end process;

  p_rd : process (Clk)
  begin
    rd_taddr_high <= not wr_taddr_high;
    if (rising_edge(Clk)) then
      s_rd_bs_uart_ram_tdata <= RAM(conv_integer(rd_taddr_high & s_rd_bs_uart_ram_taddr)) after 1 ns;
    end if;
  end process;

end architecture;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================