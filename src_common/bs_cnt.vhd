-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use ieee.std_logic_unsigned.all;
--
entity bs_cnt is
  generic (
    BS_CNT_MAX : natural := 1000
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
architecture rtl of bs_cnt is
  --
  constant P_CNT_MAX : integer := (BS_CNT_MAX);
  constant P_CNT_WIDTH : integer := integer(log2(real(P_CNT_MAX))) + 1;
  --
  signal start_init_n : std_logic := '0';
  signal start_n_i : std_logic := '0';
  signal start_n_i_i : std_logic := '0';
  signal tpulse_out_i : std_logic := '0';
  signal tpulse_out_i_i : std_logic := '0';
  signal bit_idx_i : std_logic_vector(P_CNT_WIDTH downto 0) := (others => '0');
  --
begin
  --
  tpulse_out <= tpulse_out_i;
  start_n_i <= tpulse_in;
  --
  p_5us : process (Clk, start_n_i)
  begin
    if (rising_edge(Clk)) then
      start_n_i_i <= start_n_i;
      if ((start_n_i = '1') and (start_n_i_i = '0')) then -- 5ns : 5us pulse
        bit_idx_i <= bit_idx_i + 1;
        if (start_init_n = '0') then
          start_init_n <= '1';
          tpulse_out_i <= '1';
        end if;
      end if;
      if (bit_idx_i = P_CNT_MAX) then
        bit_idx_i <= (others => '0');
        tpulse_out_i <= '1';
      end if;
      if (tpulse_out_i = '1') then
        tpulse_out_i_i <= '1';
      end if;
      if (tpulse_out_i_i = '1') then
        tpulse_out_i_i <= '0';
        tpulse_out_i <= '0';
      end if;
    end if;
  end process;
  --
end architecture;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================