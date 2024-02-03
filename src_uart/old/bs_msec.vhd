-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use ieee.std_logic_unsigned.all;
--
entity bs_msec is
  generic (
    BS_MS_MAX : natural := 50
  );
  port (
    --    
    tpulse_ms : out std_logic;
    tpulse_5us : in std_logic;
    Clk : in std_logic
    --    
  );
end entity;
--
architecture rtl of bs_msec is
  --
  constant P_CNT_MAX : integer := (BS_MS_MAX * (1000 / 5) / 128);
  constant P_CNT_WIDTH : integer := integer(log2(real(P_CNT_MAX))) + 1;
  --
  signal start_init_n : std_logic := '0';
  signal start_n_i : std_logic := '0';
  signal start_n_i_i : std_logic := '0';
  signal tpulse_ms_i : std_logic := '0';
  signal tpulse_ms_i_i : std_logic := '0';
  signal bit_idx_i : std_logic_vector(P_CNT_WIDTH downto 0) := (others => '0');
  signal bit_idx_sub_i : std_logic_vector(7 downto 0) := (others => '0');
  --
begin
  --
  tpulse_ms <= tpulse_ms_i;
  start_n_i <= tpulse_5us;
  --
  p_5us : process (Clk, start_n_i)
  begin
    if (rising_edge(Clk)) then
      start_n_i_i <= start_n_i;
      if ((start_n_i = '1') and (start_n_i_i = '0')) then -- 5ns : 5us pulse
        bit_idx_sub_i <= bit_idx_sub_i + 1;
        if (start_init_n = '0') then
          start_init_n <= '1';
          tpulse_ms_i <= '1';
        end if;
      end if;
      if (bit_idx_sub_i(7) = '1') then
        bit_idx_sub_i <= (others => '0');
        bit_idx_i <= bit_idx_i + 1;
      end if;
      if (bit_idx_i = P_CNT_MAX) then
        bit_idx_i <= (others => '0');
        tpulse_ms_i <= '1';
      end if;
      if (tpulse_ms_i = '1') then
        tpulse_ms_i_i <= '1';
      end if;
      if (tpulse_ms_i_i = '1') then
        tpulse_ms_i_i <= '0';
        tpulse_ms_i <= '0';
      end if;
    end if;
  end process;
  --
end architecture;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================