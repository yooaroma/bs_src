-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use ieee.std_logic_unsigned.all;
--
entity bs_uart_apb_rw is
  generic (
    APB_SLAVE : natural := 2;
    ADDRESS_MAX : natural := 100;
    ADDRESS_WIDTH : natural := 7; -- 512 : 9, 256 : 8, 128 : 7
    DATA_WIDTH : natural := 32
  );
  port (
    --    
    s_apb_pstart_n : in std_logic;
    --    
    m_apb_paddr : out std_logic_vector(DATA_WIDTH - 1 downto 0);
    m_apb_psel : out std_logic_vector(APB_SLAVE - 1 downto 0);
    m_apb_penable : out std_logic;
    m_apb_pwrite : out std_logic;
    m_apb_pwdata : out std_logic_vector(DATA_WIDTH - 1 downto 0);
    m_apb_pready : in std_logic_vector(APB_SLAVE - 1 downto 0);
    m_apb_prdata : in std_logic_vector(DATA_WIDTH - 1 downto 0);
    m_apb_pslverr : in std_logic_vector(APB_SLAVE - 1 downto 0);
    s_axi_aresetn : in std_logic;
    s_axi_aclk : in std_logic
    --    
  );
end entity;
--
--
architecture rtl of bs_uart_apb_rw is
  --	
  -- ATTRIBUTE X_INTERFACE_INFO : STRING;
  -- 	ATTRIBUTE X_INTERFACE_INFO of s_axi_aclk      : SIGNAL is "xilinx.com:signal:clock:1.0 PCLK CLK";
  -- 	ATTRIBUTE X_INTERFACE_INFO of s_axi_aresetn   : SIGNAL is "xilinx.com:signal:reset:1.0 PRESETn RST";
  -- 	ATTRIBUTE X_INTERFACE_INFO of m_apb_paddr   : SIGNAL is "xilinx.com:interface:apb:1.0 M_APB PADDR";
  -- --	ATTRIBUTE X_INTERFACE_INFO of S_PProt   : SIGNAL is "xilinx.com:interface:apb:1.0 M_APB PPROT";
  -- 	ATTRIBUTE X_INTERFACE_INFO of m_apb_psel    : SIGNAL is "xilinx.com:interface:apb:1.0 M_APB PSEL";
  -- 	ATTRIBUTE X_INTERFACE_INFO of m_apb_penable : SIGNAL is "xilinx.com:interface:apb:1.0 M_APB PENABLE";
  -- 	ATTRIBUTE X_INTERFACE_INFO of m_apb_pwrite  : SIGNAL is "xilinx.com:interface:apb:1.0 M_APB PWRITE";
  -- 	ATTRIBUTE X_INTERFACE_INFO of m_apb_pwdata  : SIGNAL is "xilinx.com:interface:apb:1.0 M_APB PWDATA";
  -- --	ATTRIBUTE X_INTERFACE_INFO of S_PStrb   : SIGNAL is "xilinx.com:interface:apb:1.0 M_APB PSTRB";
  -- 	ATTRIBUTE X_INTERFACE_INFO of m_apb_pready  : SIGNAL is "xilinx.com:interface:apb:1.0 M_APB PREADY";
  -- 	ATTRIBUTE X_INTERFACE_INFO of m_apb_prdata  : SIGNAL is "xilinx.com:interface:apb:1.0 M_APB PRDATA";
  -- 	ATTRIBUTE X_INTERFACE_INFO of m_apb_pslverr : SIGNAL is "xilinx.com:interface:apb:1.0 M_APB PSLVERR";
  -- 	-- ATTRIBUTE X_INTERFACE_INFO of m_bs_usrt_ram_rx_apb_tstart     : SIGNAL is "xilinx.com:signal:interrupt:1.0 PIRQn INTERRUPT";

  -- 	ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  -- 	ATTRIBUTE X_INTERFACE_PARAMETER of s_axi_aclk    : SIGNAL is "ASSOCIATED_BUSIF M_APB, ASSOCIATED_RESET PRESETn";
  -- 	ATTRIBUTE X_INTERFACE_PARAMETER of s_axi_aresetn : SIGNAL is "POLARITY ACTIVE_LOW";
  -- 	-- ATTRIBUTE X_INTERFACE_PARAMETER of m_bs_usrt_ram_rx_apb_tstart   : SIGNAL is "SENSITIVITY EDGE_FALLING";
  --
  --   
  constant ADDRESS_MAX_WORD_CNT : natural := (DATA_WIDTH / 8); -- 75
  constant ADDRESS_MAX_WORD : natural := (ADDRESS_MAX / ADDRESS_MAX_WORD_CNT); -- 75
  constant C_DATA_ZERO : std_logic_vector(DATA_WIDTH - 1 downto 0) := (others => '0');
  --
  signal s_apb_pstart : std_logic := '0';
  signal s_apb_pstart_i : std_logic := '0';
  signal s_apb_pstart_i_i : std_logic := '0';
  signal tread : std_logic := '0';
  signal t_psel : std_logic_vector(APB_SLAVE - 1 downto 0) := (others => '0');
  signal t_penable : std_logic := '0';
  signal t_pwrite : std_logic := '0';
  signal t_pready : std_logic_vector(APB_SLAVE - 1 downto 0) := (others => '0');
  signal t_paddr : std_logic_vector(ADDRESS_WIDTH - 3 downto 0) := (others => '0');
  signal t_pwdata : std_logic_vector(DATA_WIDTH - 1 downto 0) := (others => '0');
  signal t_prdata : std_logic_vector(DATA_WIDTH - 1 downto 0) := (others => '0');
  --
begin
  --
  s_apb_pstart <= not s_apb_pstart_n;
  m_apb_psel <= t_psel;
  m_apb_penable <= t_penable;
  m_apb_pwrite <= t_pwrite;
  m_apb_paddr <= C_DATA_ZERO(DATA_WIDTH - 1 downto ADDRESS_WIDTH - 2) & t_paddr(ADDRESS_WIDTH - 3 downto 0);
  m_apb_pwdata <= t_pwdata;
  t_prdata <= m_apb_prdata;
  t_pready <= m_apb_pready;
  --
  process (s_axi_aclk)
  begin
    if (s_axi_aresetn = '0') then
      tread <= '0';
      t_psel <= (others => '0');
      t_penable <= '0';
      t_pwrite <= '0';
      t_paddr <= (others => '0');
    elsif rising_edge(s_axi_aclk) then
      s_apb_pstart_i <= s_apb_pstart;
      s_apb_pstart_i_i <= s_apb_pstart_i;
      if (s_apb_pstart_i_i = '1') and (s_apb_pstart_i = '0') then
        t_paddr <= (others => '0');
        t_psel <= "11";
        t_penable <= '0';
        t_pwrite <= '0';
      end if;

      if (t_psel = "11") and (t_pready(0) = '0') and (tread = '0') then
        t_penable <= '1';
        t_pwrite <= '0';
        tread <= '1';
      end if;

      if (t_psel = "11") and (t_pready(0) = '1') and (t_penable = '1') and (t_pwrite = '0') and (tread = '1') then
        t_pwdata <= t_prdata;
        t_penable <= '0';
      end if;

      if (t_psel = "11") and (t_pready(1) = '0') and (t_penable = '0') and (tread = '1') then
        t_penable <= '1';
        t_pwrite <= '1';
      end if;

      if (t_psel = "11") and (t_pready(1) = '1') and (t_penable = '1') and (t_pwrite = '1') and (tread = '1') then
        t_penable <= '0';
        t_pwrite <= '0';
        tread <= '0';
        if (t_paddr = (ADDRESS_MAX / 4) - 1) then
          t_psel <= "00";
        end if;
        t_paddr <= t_paddr + 1;
      end if;

    end if;
  end process;
  --
end architecture;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================