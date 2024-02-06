-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tb_clock is
end entity;

architecture MAPPED of tb_clock is

  --*************************Parameter Declarations**************************
  -- 125.0MHz GT Reference clock
  constant CLOCKPERIOD_1 : time := 5.0 ns; -- 200M
  constant CLOCKPERIOD_2 : time := 8.0 ns; -- 125M
  constant CLOCKPERIOD_3 : time := 20.0 ns; -- 50M
  constant DLY : time := 1 ns;
  --********************************Signal Declarations**********************************

  --Freerunning Clock
  signal clk_200M_i : std_logic := '0';
  signal clk_125M_i : std_logic := '0';
  signal clk_50M_i : std_logic := '0';
  signal bs_pl_dip_sw : std_logic_vector(3 downto 0) := (others => '0');
  signal bs_pl_led_out : std_logic_vector(3 downto 0) := (others => '0');
  -- Component Declarations --
  component top_p1 is
    port (
      clk_200M : in std_logic;
      clk_125M : in std_logic;
      clk_50M : in std_logic;
      bs_pl_dip_sw_0 : in std_logic_vector (3 downto 0);
      bs_pl_led_out_0 : out std_logic_vector (3 downto 0)
    );
  end component;
  --
begin
  --____________________________Clocks____________________________
  process
  begin
    clk_200M_i <= '0';
    wait for CLOCKPERIOD_1 / 2;
    clk_200M_i <= '1';
    wait for CLOCKPERIOD_1 / 2;
  end process;
  --____________________________Clocks____________________________
  process
  begin
    clk_125M_i <= '0';
    wait for CLOCKPERIOD_2 / 2;
    clk_125M_i <= '1';
    wait for CLOCKPERIOD_2 / 2;
  end process;
  --____________________________Clocks____________________________
  process
  begin
    clk_50M_i <= '0';
    wait for CLOCKPERIOD_3 / 2;
    clk_50M_i <= '1';
    wait for CLOCKPERIOD_3 / 2;
  end process;
  --____________________________Clocks____________________________
  bs_pl_dip_sw <= "0000";
  --
  top_p1_i : top_p1
  port map
  (
    clk_200M => clk_200M_i,
    clk_125M => clk_125M_i,
    clk_50M => clk_50M_i,
    bs_pl_dip_sw_0(3 downto 0) => bs_pl_dip_sw(3 downto 0),
    bs_pl_led_out_0(3 downto 0) => bs_pl_led_out(3 downto 0)
  );
  --
end architecture;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================