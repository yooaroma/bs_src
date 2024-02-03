-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use ieee.std_logic_unsigned.all;
--
entity bs_uart_ram_rx_apb is
  generic (
    ADDRESS_MAX : natural := 100;
    ADDRESS_WIDTH : natural := 7; -- 512 : 9, 256 : 8, 128 : 7
    DATA_WIDTH : natural := 32
  );
  port (
    --    
    s_apb_paddr : in std_logic_vector(31 downto 0);
    s_apb_psel : in std_logic;
    s_apb_penable : in std_logic;
    s_apb_pwrite : in std_logic;
    s_apb_pwdata : in std_logic_vector(31 downto 0);
    s_apb_pready : out std_logic;
    s_apb_prdata : out std_logic_vector(31 downto 0);
    s_apb_pslverr : out std_logic;
    s_axi_aresetn : in std_logic;
    s_axi_aclk : in std_logic;
    --
    m_bs_usrt_ram_rx_apb_tstart_n : out std_logic;
    s_axis_bs_uart_ram_rx_apb_tvalid : in std_logic;
    s_axis_bs_uart_ram_rx_apb_tready : out std_logic;
    s_axis_bs_uart_ram_rx_apb_tlast : in std_logic;
    s_axis_bs_uart_ram_rx_apb_tkeep : in std_logic_vector((DATA_WIDTH / 32) - 1 downto 0);
    s_axis_bs_uart_ram_rx_apb_tdata : in std_logic_vector((DATA_WIDTH / 4) - 1 downto 0);
    -- 
    reset_n : in std_logic;
    Clk : in std_logic
    --    
  );
end entity;
--
architecture rtl of bs_uart_ram_rx_apb is
  --	
  ATTRIBUTE X_INTERFACE_INFO : STRING;
	ATTRIBUTE X_INTERFACE_INFO of s_axi_aclk      : SIGNAL is "xilinx.com:signal:clock:1.0 PCLK CLK";
	ATTRIBUTE X_INTERFACE_INFO of s_axi_aresetn   : SIGNAL is "xilinx.com:signal:reset:1.0 PRESETn RST";
	ATTRIBUTE X_INTERFACE_INFO of s_apb_paddr   : SIGNAL is "xilinx.com:interface:apb:1.0 S_APB PADDR";
--	ATTRIBUTE X_INTERFACE_INFO of S_PProt   : SIGNAL is "xilinx.com:interface:apb:1.0 S_APB PPROT";
	ATTRIBUTE X_INTERFACE_INFO of s_apb_psel    : SIGNAL is "xilinx.com:interface:apb:1.0 S_APB PSEL";
	ATTRIBUTE X_INTERFACE_INFO of s_apb_penable : SIGNAL is "xilinx.com:interface:apb:1.0 S_APB PENABLE";
	ATTRIBUTE X_INTERFACE_INFO of s_apb_pwrite  : SIGNAL is "xilinx.com:interface:apb:1.0 S_APB PWRITE";
	ATTRIBUTE X_INTERFACE_INFO of s_apb_pwdata  : SIGNAL is "xilinx.com:interface:apb:1.0 S_APB PWDATA";
--	ATTRIBUTE X_INTERFACE_INFO of S_PStrb   : SIGNAL is "xilinx.com:interface:apb:1.0 S_APB PSTRB";
	ATTRIBUTE X_INTERFACE_INFO of s_apb_pready  : SIGNAL is "xilinx.com:interface:apb:1.0 S_APB PREADY";
	ATTRIBUTE X_INTERFACE_INFO of s_apb_prdata  : SIGNAL is "xilinx.com:interface:apb:1.0 S_APB PRDATA";
	ATTRIBUTE X_INTERFACE_INFO of s_apb_pslverr : SIGNAL is "xilinx.com:interface:apb:1.0 S_APB PSLVERR";
	ATTRIBUTE X_INTERFACE_INFO of m_bs_usrt_ram_rx_apb_tstart_n     : SIGNAL is "xilinx.com:signal:interrupt:1.0 PIRQn INTERRUPT";

	ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
	ATTRIBUTE X_INTERFACE_PARAMETER of s_axi_aclk    : SIGNAL is "ASSOCIATED_BUSIF S_APB, ASSOCIATED_RESET PRESETn";
	ATTRIBUTE X_INTERFACE_PARAMETER of s_axi_aresetn : SIGNAL is "POLARITY ACTIVE_LOW";
	ATTRIBUTE X_INTERFACE_PARAMETER of m_bs_usrt_ram_rx_apb_tstart_n   : SIGNAL is "SENSITIVITY EDGE_FALLING";
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
  signal s_apb_pready_i : std_logic := '0';
  signal s_axis_bs_uart_ram_rx_apb_tlast_i : std_logic := '0';
  signal s_axis_bs_uart_ram_rx_apb_tlast_i_i : std_logic := '0';
  -- signal
  signal s_rd_bs_uart_ram_rx_apb_taddr : std_logic_vector(ADDRESS_WIDTH - 3 downto 0);
  --  
  --
begin
  --
  m_bs_usrt_ram_rx_apb_tstart_n <= not s_axis_bs_uart_ram_rx_apb_tlast_i_i;
  s_axis_bs_uart_ram_rx_apb_tready <= '1';

  p_wr : process (Clk, reset_n)
  begin
    if (reset_n = '0') then
      wr_taddr_i <= (others => '0');
      wr_taddr_high <= '0';
    elsif (rising_edge(Clk)) then
      if (s_axis_bs_uart_ram_rx_apb_tvalid = '1') then
        if (wr_taddr_i(1 downto 0) = "00") then
          RAM(conv_integer(wr_taddr_high & wr_taddr_i(ADDRESS_WIDTH - 1 downto 2)))(7 downto 0) <= s_axis_bs_uart_ram_rx_apb_tdata;
        end if;
        if (wr_taddr_i(1 downto 0) = "01") then
          RAM(conv_integer(wr_taddr_high & wr_taddr_i(ADDRESS_WIDTH - 1 downto 2)))(15 downto 8) <= s_axis_bs_uart_ram_rx_apb_tdata;
        end if;
        if (wr_taddr_i(1 downto 0) = "10") then
          RAM(conv_integer(wr_taddr_high & wr_taddr_i(ADDRESS_WIDTH - 1 downto 2)))(23 downto 16) <= s_axis_bs_uart_ram_rx_apb_tdata;
        end if;
        if (wr_taddr_i(1 downto 0) = "11") then
          RAM(conv_integer(wr_taddr_high & wr_taddr_i(ADDRESS_WIDTH - 1 downto 2)))(31 downto 24) <= s_axis_bs_uart_ram_rx_apb_tdata;
        end if;
        wr_taddr_i <= wr_taddr_i + '1';
      elsif (s_axis_bs_uart_ram_rx_apb_tlast = '1') then
        wr_taddr_i <= (others => '0');
        wr_taddr_high <= not wr_taddr_high;
      end if;
    end if;
  end process;
  --
  --
  --
  s_apb_pslverr <= '0';
  s_rd_bs_uart_ram_rx_apb_taddr <= s_apb_paddr(ADDRESS_WIDTH - 3 downto 0);
  s_apb_pready <= s_apb_pready_i;
  --
  p_rd : process (s_axi_aclk)
  begin
    rd_taddr_high <= not wr_taddr_high_i;
    if (s_axi_aresetn = '0') then
      s_apb_pready_i <= '0';
    elsif (rising_edge(s_axi_aclk)) then
      if (s_apb_psel = '1') then
        if (s_apb_penable = '1') and (s_apb_pwrite = '0') then
          s_apb_pready_i <= '1';
          s_apb_prdata <= RAM(conv_integer(rd_taddr_high & s_rd_bs_uart_ram_rx_apb_taddr)) after 1 ns;
        else
          s_apb_pready_i <= '0';
        end if;
      else
        s_apb_pready_i <= '0';
      end if;
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
    tpulse_out => s_axis_bs_uart_ram_rx_apb_tlast_i,
    tpulse_in => s_axis_bs_uart_ram_rx_apb_tlast,
    Clk => Clk
    --    
  );
  --
  bs_sync_gen_0 : bs_sync_gen
  port map
  (
    --    
    Clk => Clk,
    Clk_sync => s_axi_aclk,
    user_in => s_axis_bs_uart_ram_rx_apb_tlast_i,
    user_sync_out => s_axis_bs_uart_ram_rx_apb_tlast_i_i
    --    
  );
  --
  bs_sync_gen_1 : bs_sync_gen
  port map
  (
    --    
    Clk => Clk,
    Clk_sync => s_axi_aclk,
    user_in => wr_taddr_high,
    user_sync_out => wr_taddr_high_i
    --    
  );
end architecture;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================