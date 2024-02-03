-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
----------------------------------------------------------------------
-- File Downloaded from http://www.nandland.com
----------------------------------------------------------------------
-- This file contains the UART Receiver.  This receiver is able to
-- receive 8 bits of serial data, one start bit, one stop bit,
-- and no parity bit.  When receive is complete m_axis_bs_uart_rx_tvalid will be
-- driven high for one clock cycle.
-- 
-- Set Generic g_CLKS_PER_BIT as follows:
-- g_CLKS_PER_BIT = (Frequency of Clk)/(Frequency of UART)
-- Example: 10 MHz Clock, 115200 baud UART
-- (10000000)/(115200) = 87
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
entity bs_uart_rx is
  generic (
    BS_MCLK : natural := 200;
    BS_BAUDRATE : natural := 921600;
    BS_UART_MAX : natural := 100
  );
  port (
    --    
    m_axis_bs_uart_rx_tvalid : out std_logic;
    m_axis_bs_uart_rx_tlast : out std_logic;
    m_axis_bs_uart_rx_tkeep : out std_logic_vector(0 downto 0);
    m_axis_bs_uart_rx_tdata : out std_logic_vector(7 downto 0);
    -- 
    s_bs_uart_rxd : in std_logic;
    -- 
    reset_n : in std_logic;
    Clk : in std_logic
    --    
  );
end entity;
--
architecture rtl of bs_uart_rx is
  --
  constant g_CLKS_PER_BIT : integer := ((BS_MCLK * 1000000)/BS_BAUDRATE); -- 217
  constant g_CLKS_PER_BIT_20 : integer := (g_CLKS_PER_BIT * 20); -- 217
  constant g_CLKS_PER_BIT_20_WIDTH : integer := integer(log2(real(g_CLKS_PER_BIT_20))) + 1;

  type t_SM_Main is (s_Idle, s_RX_Start_Bit, s_RX_Data_Bits, s_RX_Stop_Bit, s_Cleanup);
  signal r_SM_Main : t_SM_Main := s_Idle;

  signal r_RX_Data_R : std_logic := '0';
  signal r_RX_Data_R_R : std_logic := '0';
  signal r_RX_Data : std_logic := '0';

  signal r_Clk_Count : integer range 0 to g_CLKS_PER_BIT - 1 := 0;
  signal r_Bit_Index : integer range 0 to 7 := 0; -- 8 Bits Total
  signal r_RX_Byte : std_logic_vector(7 downto 0) := (others => '0');
  signal r_RX_DV : std_logic := '0';
  signal r_RX_LAST : std_logic := '0';
  --
  signal rx_tlast : std_logic := '0';
  signal rx_tready_n : std_logic := '0';
  signal rx_tready_n_i : std_logic := '0';
  signal rx_cnt : std_logic_vector(g_CLKS_PER_BIT_20_WIDTH downto 0) := (others => '0');
  -- signal r_char_bit : std_logic := '0';
  --
  -- signal uart_rx_filter : std_logic_vector(3 downto 0) := (others => '0');
  signal uart_rx_filter : unsigned(3 downto 0) := (others => '0');

begin

  ---------------------------------------------------------------------------
  -- RXD_FILTER
  -- Filter rxd with a 2 bit counter.
  ---------------------------------------------------------------------------
  rxd_filter : process (Clk,reset_n)
  begin
    if(reset_n = '0')then
      rx_tlast <= '0';
      rx_tready_n <= '0';
      uart_rx_filter <= (others => '1');
      r_RX_Data <= '1';
    elsif rising_edge(Clk) then
      if r_RX_Data_R_R = '1' and uart_rx_filter < 15 then
        uart_rx_filter <= uart_rx_filter + 1;
      elsif r_RX_Data_R_R = '0' and uart_rx_filter > 0 then
        uart_rx_filter <= uart_rx_filter - 1;
      end if;
      -- set the rx bit.
      if uart_rx_filter = 15 then
        r_RX_Data <= '1';
      elsif uart_rx_filter = 0 then
        r_RX_Data <= '0';
      end if;
      if (r_RX_data = '0') then
        rx_tready_n <= '1';
      end if;
      --      
      if (rx_tready_n = '1') then
        if (r_SM_Main = s_Idle) then
          rx_cnt <= rx_cnt + 1;
        else
          rx_cnt <= (others => '0');
        end if;
        if (rx_cnt(g_CLKS_PER_BIT_20_WIDTH) = '1') then
          rx_cnt <= (others => '0');
          rx_tready_n <= '0';
        end if;
      end if;
      --
      rx_tready_n_i <= rx_tready_n;
      --
      if (rx_tready_n = '0') and (rx_tready_n_i = '1') then
        rx_tlast <= '1';
      end if;
      if (rx_tlast = '1') then
        rx_tlast <= '0';
      end if;
    end if;
  end process rxd_filter;
  ---------------------------------------------------------------------------
  -- Purpose: Double-register the incoming data.
  -- This allows it to be used in the UART RX Clock Domain.
  -- (It removes problems caused by metastabiliy)
  p_SAMPLE : process (Clk)
  begin
    if rising_edge(Clk) then
      r_RX_Data_R <= s_bs_uart_rxd;
      r_RX_Data_R_R <= r_RX_Data_R;
      -- r_RX_Data <= r_RX_Data_R;
    end if;
  end process p_SAMPLE;

  -- Purpose: Control RX state machine
  p_UART_RX : process (Clk)
  begin
    if rising_edge(Clk) then
      case r_SM_Main is
        when s_Idle =>
          -- r_char_bit <= '0';
          r_RX_DV <= '0';
          r_Clk_Count <= 0;
          r_Bit_Index <= 0;

          if r_RX_Data = '0' then -- Start bit detected
            r_SM_Main <= s_RX_Start_Bit;
            -- r_char_bit <= not r_char_bit;
          else
            r_SM_Main <= s_Idle;
          end if;
          -- Check middle of start bit to make sure it's still low
        when s_RX_Start_Bit =>
          if r_Clk_Count = (g_CLKS_PER_BIT - 1)/2 then
            if r_RX_Data = '0' then
              -- r_char_bit <= not r_char_bit;
              r_Clk_Count <= 0; -- reset counter since we found the middle
              r_SM_Main <= s_RX_Data_Bits;
            else
              r_SM_Main <= s_Idle;
            end if;
          else
            r_Clk_Count <= r_Clk_Count + 1;
            r_SM_Main <= s_RX_Start_Bit;
          end if;

          -- Wait g_CLKS_PER_BIT-1 clock cycles to sample serial data
        when s_RX_Data_Bits =>
          if r_Clk_Count < g_CLKS_PER_BIT - 1 then
            r_Clk_Count <= r_Clk_Count + 1;
            r_SM_Main <= s_RX_Data_Bits;
          else
            -- r_char_bit <= not r_char_bit;
            r_Clk_Count <= 0;
            r_RX_Byte(r_Bit_Index) <= r_RX_Data;

            -- Check if we have sent out all bits
            if r_Bit_Index < 7 then
              r_Bit_Index <= r_Bit_Index + 1;
              r_SM_Main <= s_RX_Data_Bits;
            else
              -- r_char_bit <= not r_char_bit;
              r_Bit_Index <= 0;
              r_SM_Main <= s_RX_Stop_Bit;
            end if;
          end if;

          -- Receive Stop bit. Stop bit = 1
        when s_RX_Stop_Bit =>
          -- Wait g_CLKS_PER_BIT-1 clock cycles for Stop bit to finish
          if r_Clk_Count < g_CLKS_PER_BIT - 1 then
            r_Clk_Count <= r_Clk_Count + 1;
            r_SM_Main <= s_RX_Stop_Bit;
          else
            -- r_char_bit <= not r_char_bit;
            r_RX_DV <= '1';
            r_Clk_Count <= 0;
            r_SM_Main <= s_Cleanup;
          end if;

          -- Stay here 1 clock
        when s_Cleanup =>
          -- r_char_bit <= not r_char_bit;
          r_SM_Main <= s_Idle;
          r_RX_DV <= '0';
        when others =>
          r_SM_Main <= s_Idle;

      end case;
    end if;
  end process p_UART_RX;

  m_axis_bs_uart_rx_tvalid <= r_RX_DV;
  m_axis_bs_uart_rx_tdata <= r_RX_Byte;
  m_axis_bs_uart_rx_tkeep <= (others => '1');
  m_axis_bs_uart_rx_tlast <= rx_tlast;

end architecture;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================