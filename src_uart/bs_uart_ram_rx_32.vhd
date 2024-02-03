-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use ieee.std_logic_unsigned.all;
--
entity bs_uart_ram_rx_32 is
  generic (
    ADDRESS_MAX : natural := 100;
    ADDRESS_WIDTH : natural := 7; -- 512 : 9, 256 : 8, 128 : 7
    DATA_WIDTH : natural := 32
  );
  port (
    --    
    s_axis_bs_uart_ram_rx_32_tvalid : in std_logic;
    s_axis_bs_uart_ram_rx_32_tready : out std_logic;
    s_axis_bs_uart_ram_rx_32_tlast : in std_logic;
    s_axis_bs_uart_ram_rx_32_tkeep : in std_logic_vector(0 downto 0);
    s_axis_bs_uart_ram_rx_32_tdata : in std_logic_vector((DATA_WIDTH / 4 - 1) downto 0);
    -- 
    m_rd_bs_uart_ram_rx_32_tnext : out std_logic;
    s_rd_bs_uart_ram_rx_32_taddr : in std_logic_vector(ADDRESS_WIDTH - 3 downto 0);
    s_rd_bs_uart_ram_rx_32_tdata : out std_logic_vector(DATA_WIDTH - 1 downto 0);
    --
    reset_n : in std_logic;
    Clk_rd : in std_logic;
    Clk : in std_logic
    --    
  );
end entity;
--
architecture rtl of bs_uart_ram_rx_32 is
  --
  component bs_sync_gen is
    port (
      --    
      Clk : in std_logic;
      Clk_sync : in std_logic;
      user_in : in std_logic;
      user_sync_out : out std_logic
      --    
    );
  end component;
  --
  component bs_expansion is
    generic (
      BS_PULSE_MAX : natural := 2
    );
    port (
      --    
      tpulse_out : out std_logic;
      tpulse_in : in std_logic;
      Clk : in std_logic
      --    
    );
  end component;
  --
  -- ram or rom  
  type ram_type is array (0 to (2 ** (ADDRESS_WIDTH - 1)) - 1) of std_logic_vector(DATA_WIDTH - 1 downto 0); -- 512 bytes
  signal RAM : ram_type := (others => (others => '0'));
  attribute ram_style : string;
  attribute ram_style of RAM : signal is "block";
  signal wr_taddr_i : std_logic_vector(ADDRESS_WIDTH - 1 downto 0);
  signal wr_taddr_high : std_logic;
  signal wr_taddr_high_i : std_logic;
  signal rd_taddr_high : std_logic;
  signal s_axis_bs_uart_ram_rx_32_tlast_i : std_logic := '0';
  signal s_axis_bs_uart_ram_rx_32_tlast_i_i : std_logic := '0';
  -- signal
begin
  --
  m_rd_bs_uart_ram_rx_32_tnext <= s_axis_bs_uart_ram_rx_32_tlast_i_i;
  s_axis_bs_uart_ram_rx_32_tready <= '1';

  p_wr : process (Clk, reset_n)
  begin
    if (reset_n = '0') then
      wr_taddr_i <= (others => '0');
      wr_taddr_high <= '0';
    elsif (rising_edge(Clk)) then
      if (s_axis_bs_uart_ram_rx_32_tvalid = '1') then
        if (wr_taddr_i(1 downto 0) = "00") then
          RAM(conv_integer(wr_taddr_high & wr_taddr_i(ADDRESS_WIDTH - 1 downto 2)))(7 downto 0) <= s_axis_bs_uart_ram_rx_32_tdata;
        end if;
        if (wr_taddr_i(1 downto 0) = "01") then
          RAM(conv_integer(wr_taddr_high & wr_taddr_i(ADDRESS_WIDTH - 1 downto 2)))(15 downto 8) <= s_axis_bs_uart_ram_rx_32_tdata;
        end if;
        if (wr_taddr_i(1 downto 0) = "10") then
          RAM(conv_integer(wr_taddr_high & wr_taddr_i(ADDRESS_WIDTH - 1 downto 2)))(23 downto 16) <= s_axis_bs_uart_ram_rx_32_tdata;
        end if;
        if (wr_taddr_i(1 downto 0) = "11") then
          RAM(conv_integer(wr_taddr_high & wr_taddr_i(ADDRESS_WIDTH - 1 downto 2)))(31 downto 24) <= s_axis_bs_uart_ram_rx_32_tdata;
        end if;
        wr_taddr_i <= wr_taddr_i + '1';
      elsif (s_axis_bs_uart_ram_rx_32_tlast = '1') then
        wr_taddr_i <= (others => '0');
        wr_taddr_high <= not wr_taddr_high;
      end if;
    end if;
  end process;

  p_rd : process (Clk_rd)
  begin
    rd_taddr_high <= not wr_taddr_high_i;
    if (rising_edge(Clk_rd)) then
      s_rd_bs_uart_ram_rx_32_tdata <= RAM(conv_integer(rd_taddr_high & s_rd_bs_uart_ram_rx_32_taddr(ADDRESS_WIDTH - 3 downto 0))) after 1 ns;
    end if;
  end process;
  --
  bs_expansion_i : bs_expansion
  generic map
  (
    BS_PULSE_MAX => 2
  )
  port map
  (
    --    
    tpulse_out => s_axis_bs_uart_ram_rx_32_tlast_i,
    tpulse_in => s_axis_bs_uart_ram_rx_32_tlast,
    Clk => Clk
    --    
  );
  --
  bs_sync_gen_0 : bs_sync_gen
  port map
  (
    --    
    Clk => Clk,
    Clk_sync => Clk_rd,
    user_in => s_axis_bs_uart_ram_rx_32_tlast_i,
    user_sync_out => s_axis_bs_uart_ram_rx_32_tlast_i_i
    --    
  );
  --
  bs_sync_gen_1 : bs_sync_gen
  port map
  (
    --    
    Clk => Clk,
    Clk_sync => Clk_rd,
    user_in => wr_taddr_high,
    user_sync_out => wr_taddr_high_i
    --    
  );
end architecture;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================