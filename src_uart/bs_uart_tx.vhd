-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
----------------------------------------------------------------------
-- File Downloaded from http://www.nandland.com
----------------------------------------------------------------------
-- This file contains the UART Transmitter.  This transmitter is able
-- to transmit 8 bits of serial data, one start bit, one stop bit,
-- and no parity bit.  When transmit is complete o_TX_Done will be
-- driven high for one clock cycle.
--
-- Set Generic g_CLKS_PER_BIT as follows:
-- g_CLKS_PER_BIT = (Frequency of Clk)/(Frequency of UART)
-- Example: 10 MHz Clock, 115200 baud UART
-- (10000000)/(115200) = 87
--
--
-- Test Bench uses a 200 MHz Clock
-- Want to interface to 921600 baud UART
-- 20 bit
-- 20 Hz
-- N81
-- 200000000 / 921600 = 217 Clocks Per Bit.
-- constant c_CLKS_PER_BIT : integer := 87;
-- constant c_BIT_PERIOD : time := 8680 ns;
-- constant c_CLKS_PER_BIT : integer := 217;
-- constant c_BIT_PERIOD : time := 1085 ns; -- 217 * 5 ns
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use ieee.std_logic_unsigned.all;
--
entity bs_uart_tx is
  generic (
    BS_MCLK : natural := 200;
    BS_BAUDRATE : natural := 921600;
    ADDRESS_MAX : natural := 100;
    ADDRESS_WIDTH : natural := 7; -- 512 : 9, 256 : 8, 128 : 7
    DATA_WIDTH : natural := 8
  );
  port (
    --    
    s_axis_bs_uart_tx_tvalid : in std_logic;
    s_axis_bs_uart_tx_tready : out std_logic;
    s_axis_bs_uart_tx_tlast : in std_logic;
    s_axis_bs_uart_tx_tkeep : in std_logic_vector(0 downto 0);
    s_axis_bs_uart_tx_tdata : in std_logic_vector(7 downto 0);
    -- 
    m_bs_uart_tx_done : out std_logic;
    --
    m_bs_uart_txd : out std_logic;
    -- 
    reset_n : in std_logic;
    Clk : in std_logic
    --    
  );
end entity;
--
architecture RTL of bs_uart_tx is
  --
  constant g_CLKS_PER_BIT : integer := ((BS_MCLK * 1000000)/BS_BAUDRATE); -- 217
  constant g_CLKS_PER_BIT_20 : integer := (g_CLKS_PER_BIT * 20); -- 217
  constant g_CLKS_PER_BIT_20_WIDTH : integer := integer(log2(real(g_CLKS_PER_BIT_20))) + 1;
  type t_SM_Main is (s_Idle, s_TX_Start_Bit, s_TX_Data_Bits, s_TX_Stop_Bit, s_Cleanup);
  signal r_SM_Main : t_SM_Main := s_Idle;

  signal r_Clk_Count : integer range 0 to g_CLKS_PER_BIT - 1 := 0;
  signal r_Bit_Index : integer range 0 to 7 := 0; -- 8 Bits Total
  signal r_TX_Data : std_logic_vector(7 downto 0) := (others => '0');
  signal r_TX_Done : std_logic := '0';
  signal o_TX_Active : std_logic := '0';
  signal o_TX_Done : std_logic := '0';
  signal i_TX_DV : std_logic := '0';
  --
  signal rd_taddr : std_logic_vector(ADDRESS_WIDTH - 1 downto 0);
  --
  signal rd_tstart : std_logic;
  signal rd_tstart_i : std_logic;
  signal rd_tenable : std_logic := '0';
  signal rd_tvalid : std_logic;
  signal rd_tready_n : std_logic;
  signal rd_tlast : std_logic;
  signal rd_tlast_i : std_logic;
  signal m_bs_uart_tx_done_i : std_logic;
  -- signal rd_tdata : std_logic_vector(7 downto 0);
  signal rd_cnt : std_logic_vector(g_CLKS_PER_BIT_20_WIDTH downto 0) := (others => '0');
  --  
  signal s_rd_bs_uart_tx_tstart : std_logic;
  signal s_rd_bs_uart_tx_tready : std_logic;
  signal s_rd_bs_uart_tx_taddr : std_logic_vector(7 downto 0);
  signal s_rd_bs_uart_tx_tdata : std_logic_vector(7 downto 0);
  --
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
  --  
begin
  p_UART_TX : process (Clk)
  begin
    if rising_edge(Clk) then

      case r_SM_Main is

        when s_Idle =>
          o_TX_Active <= '0';
          m_bs_uart_txd <= '1'; -- Drive Line High for Idle
          r_TX_Done <= '0';
          r_Clk_Count <= 0;
          r_Bit_Index <= 0;

          if i_TX_DV = '1' then
            r_TX_Data <= s_rd_bs_uart_tx_tdata;
            r_SM_Main <= s_TX_Start_Bit;
          else
            r_SM_Main <= s_Idle;
          end if;

          -- Send out Start Bit. Start bit = 0
        when s_TX_Start_Bit =>
          o_TX_Active <= '1';
          m_bs_uart_txd <= '0';

          -- Wait g_CLKS_PER_BIT-1 clock cycles for start bit to finish
          if r_Clk_Count < g_CLKS_PER_BIT - 1 then
            r_Clk_Count <= r_Clk_Count + 1;
            r_SM_Main <= s_TX_Start_Bit;
          else
            r_Clk_Count <= 0;
            r_SM_Main <= s_TX_Data_Bits;
          end if;

          -- Wait g_CLKS_PER_BIT-1 clock cycles for data bits to finish
        when s_TX_Data_Bits =>
          m_bs_uart_txd <= r_TX_Data(r_Bit_Index);

          if r_Clk_Count < g_CLKS_PER_BIT - 1 then
            r_Clk_Count <= r_Clk_Count + 1;
            r_SM_Main <= s_TX_Data_Bits;
          else
            r_Clk_Count <= 0;

            -- Check if we have sent out all bits
            if r_Bit_Index < 7 then
              r_Bit_Index <= r_Bit_Index + 1;
              r_SM_Main <= s_TX_Data_Bits;
            else
              r_Bit_Index <= 0;
              r_SM_Main <= s_TX_Stop_Bit;
            end if;
          end if;

          -- Send out Stop bit. Stop bit = 1 
        when s_TX_Stop_Bit =>
          m_bs_uart_txd <= '1';

          -- Wait g_CLKS_PER_BIT-1 clock cycles for Stop bit to finish
          if r_Clk_Count < g_CLKS_PER_BIT - 1 then
            r_Clk_Count <= r_Clk_Count + 1;
            r_SM_Main <= s_TX_Stop_Bit;
          else
            r_TX_Done <= '1';
            r_Clk_Count <= 0;
            r_SM_Main <= s_Cleanup;
          end if;

          -- Stay here 1 clock 
        when s_Cleanup =>
          o_TX_Active <= '0';
          r_TX_Done <= '0';
          r_SM_Main <= s_Idle;

        when others =>
          r_SM_Main <= s_Idle;

      end case;
    end if;
  end process p_UART_TX;

  o_TX_Done <= r_TX_Done;
  -- 
  s_rd_bs_uart_tx_tready <= not rd_tready_n;
  s_rd_bs_uart_tx_taddr <= rd_taddr;
  rd_tstart <= s_rd_bs_uart_tx_tstart;
  i_TX_DV <= rd_tvalid;
  --
  p_rd_tx_data : process (Clk,reset_n)
  begin
    if (reset_n = '0') then
      m_bs_uart_tx_done_i <= '0';
      rd_tenable <= '0';
      rd_tvalid <= '0';
      rd_tlast <= '0';
      rd_tready_n <= '0';
      rd_taddr <= (others => '0');
    elsif (rising_edge(Clk)) then
      rd_tstart_i <= rd_tstart;
      if (rd_tstart = '1') and (rd_tstart_i = '0') then
        rd_tenable <= '1';
        rd_tready_n <= '1';
        rd_taddr <= (others => '0');
      end if;
      --
      if (rd_tenable = '1') and (rd_tvalid = '1') then
        rd_taddr <= rd_taddr + '1';
      end if;
      --
      if (rd_tenable = '1') and (rd_tvalid = '0') and (r_SM_Main = s_Idle) then
        rd_tvalid <= '1';
      end if;
      --
      if (rd_tvalid = '1') then
        rd_tvalid <= '0';
      end if;
      --
      if (rd_taddr = ADDRESS_MAX) and (rd_tready_n = '1') then
        rd_tenable <= '0';
        rd_tlast <= '1';
      end if;
      --
      if (rd_tlast = '1') then
        if (r_SM_Main = s_Idle) then
          rd_cnt <= rd_cnt + 1;
        else
          rd_cnt <= (others => '0');
        end if;
        if (rd_cnt(g_CLKS_PER_BIT_20_WIDTH) = '1') then
          rd_cnt <= (others => '0');
          rd_tready_n <= '0';
          rd_tlast <= '0';
        end if;
      end if;
      --
      rd_tlast_i <= rd_tlast;
      --
      if (rd_tlast = '0') and (rd_tlast_i = '1') then
        m_bs_uart_tx_done_i <= '1';
      end if;
      if (m_bs_uart_tx_done_i = '1') then
        m_bs_uart_tx_done_i <= '0';
      end if;

      --
    end if;
  end process;
  --
  m_bs_uart_tx_done <= m_bs_uart_tx_done_i;
  --
  s_rd_bs_uart_tx_tstart <= s_axis_bs_uart_tx_tlast;
  --
  s_axis_bs_uart_tx_tready <= '1';
  --
  p_wr : process (Clk, reset_n)
  begin
    if (reset_n = '0') then
      wr_taddr_i <= (others => '0');
      wr_taddr_high <= '0';
    elsif (rising_edge(Clk)) then
      if (s_axis_bs_uart_tx_tvalid = '1') then
        RAM(conv_integer(wr_taddr_high & wr_taddr_i)) <= s_axis_bs_uart_tx_tdata;
        if (s_axis_bs_uart_tx_tlast = '1') then
          wr_taddr_i <= (others => '0');
          wr_taddr_high <= not wr_taddr_high;
        else
          wr_taddr_i <= wr_taddr_i + '1';
        end if;
      end if;
    end if;
  end process;

  p_rd : process (Clk)
  begin
    rd_taddr_high <= not wr_taddr_high;
    if (rising_edge(Clk)) then
      s_rd_bs_uart_tx_tdata <= RAM(conv_integer(rd_taddr_high & s_rd_bs_uart_tx_taddr)) after 1 ns;
    end if;
  end process;

end architecture;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================