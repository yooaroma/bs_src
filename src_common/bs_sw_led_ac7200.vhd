-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
--
entity bs_sw_led_ac7200 is
  port (
    --    
    tx_disable_out_pin : out std_logic_vector(3 downto 0);
    tx_disable_in : in std_logic_vector(3 downto 0);
    rx_loss_in_pin : in std_logic_vector(3 downto 0);
    rx_loss_out : out std_logic_vector(3 downto 0);
    --
    vcc_out : out std_logic;
    gnd_out : out std_logic;
    --
    m_dip_0 : out std_logic;
    m_dip_1 : out std_logic;
    s_dip_in_pin : in std_logic_vector(1 downto 0);
    --
    s_led_0 : in std_logic;
    s_led_1 : in std_logic;
    s_led_2 : in std_logic;
    m_led_out_pin : out std_logic_vector(2 downto 0) 
    --    
  );
end entity;
--
architecture rtl of bs_sw_led_ac7200 is
  --
begin
  --
  tx_disable_out_pin <= tx_disable_in;
  rx_loss_out <= rx_loss_in_pin;
  --
  vcc_out <= '1';
  gnd_out <= '0';
  --
  m_dip_0 <= s_dip_in_pin(0);
  m_dip_1 <= s_dip_in_pin(1);
  --
  m_led_out_pin(0) <= s_led_0;
  m_led_out_pin(1) <= s_led_1;
  m_led_out_pin(2) <= s_led_2;
  --
end architecture;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================