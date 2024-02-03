-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use ieee.std_logic_unsigned.all;
--
entity bs_reset is
  generic (
    BS_MCLK : natural := 50;
    RESET_NS_MAX : natural := 500
  );
  port (
    --    
    reset : out std_logic;
    Clk : in std_logic
    --    
  );
end entity;
--
architecture rtl of bs_reset is
  --
	ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
	ATTRIBUTE X_INTERFACE_PARAMETER of reset : SIGNAL is "POLARITY ACTIVE_HIGH";
  --
  constant P_CNT_MAX : integer := ((RESET_NS_MAX * BS_MCLK) / 1000);
  constant P_CNT_WIDTH : integer := integer(log2(real(P_CNT_MAX))) + 1;
  signal reset_n_i : std_logic := '0';
  signal bit_idx_i : std_logic_vector(P_CNT_WIDTH downto 0) := (others => '0');
  --
begin
  --
  reset <= not reset_n_i;
  --
  p_reset_n : process (Clk)
  begin
    if (rising_edge(Clk)) then
      if (bit_idx_i(P_CNT_WIDTH) = '1') then
        bit_idx_i <= bit_idx_i;
      else
        bit_idx_i <= bit_idx_i + 1;
      end if;
      if (reset_n_i = '0') and (bit_idx_i = P_CNT_MAX) then
        reset_n_i <= '1';
      end if;
    end if;
  end process;
  --
end architecture;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================