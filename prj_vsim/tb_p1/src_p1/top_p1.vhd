-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
--
entity top_p1 is
  port (
    clk_200M : in std_logic;
    clk_125M : in std_logic;
    clk_50M : in std_logic;
    bs_pl_dip_sw_0 : in std_logic_vector (3 downto 0);
    bs_pl_led_out_0 : out std_logic_vector (3 downto 0)
  );
end entity;
--
architecture rtl of top_p1 is
begin
end architecture;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================