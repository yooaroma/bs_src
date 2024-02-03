-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
--
entity bs_expansion is
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
end entity;
--
architecture rtl of bs_expansion is
  signal bit_idx_n : std_logic_vector(BS_PULSE_MAX downto 0) := (others => '0');
begin
  --    
  p_last_expansion : process (Clk)
  begin
    if (rising_edge(Clk)) then
      if (tpulse_in = '1') then
        bit_idx_n <= (others => '1');
      else
        bit_idx_n <= bit_idx_n(BS_PULSE_MAX - 1 downto 0) & '0';
      end if;
    end if;
    tpulse_out <= bit_idx_n(BS_PULSE_MAX);
  end process;
end architecture;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================