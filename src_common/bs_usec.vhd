-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use ieee.std_logic_unsigned.all;
--
entity bs_usec is
  generic (
    BS_MCLK : natural := 50;
    BS_US_RDY_MAX : natural := 1;
    BS_US_MAX : natural := 5
  );
  port (
    --    
    tpulse_us : out std_logic;
    Clk : in std_logic 
    --    
  );
end entity;
--
architecture rtl of bs_usec is
  --
  constant P_CNT_MAX : integer := (BS_US_MAX * BS_MCLK);
  constant P_CNT_WIDTH : integer := integer(log2(real(P_CNT_MAX))) + 1;
  --
  constant P_RCNT_MAX : integer := (BS_US_RDY_MAX * BS_MCLK);
  constant P_RCNT_WIDTH : integer := integer(log2(real(P_RCNT_MAX))) + 1;
  --
  signal tstart_i : std_logic := '0';
  signal tstart_i_i : std_logic := '0';
  signal bit_idx_i : std_logic_vector(P_RCNT_WIDTH downto 0) := (others => '0');
  --
  signal tvalid : std_logic := '0';
  signal tpulse_us_i : std_logic := '0';
  signal tpulse_us_i_i : std_logic := '0';
  signal bit_idx_5us_i : std_logic_vector(P_CNT_WIDTH downto 0) := (others => '0');
  --
begin
  --
  tpulse_us <= tpulse_us_i;
  --
  p_reset_n : process (Clk)
  begin
    if (rising_edge(Clk)) then
      if (bit_idx_i(P_RCNT_WIDTH) = '1') then
        bit_idx_i <= bit_idx_i;
      else
        bit_idx_i <= bit_idx_i + 1;
      end if;
      if (tstart_i = '0') and (bit_idx_i = P_RCNT_MAX) then
        tstart_i <= '1';
      end if;
    end if;
  end process;
  --
  p_5us : process (Clk, tstart_i)
  begin
    if (rising_edge(Clk)) then
      tstart_i_i <= tstart_i;
      if ((tstart_i = '1') and (tstart_i_i = '0')) then -- 5ns : 5us pulse
        bit_idx_5us_i <= (others => '0');
        tpulse_us_i <= '1';
        tvalid <= '1';
      end if;
      if (tpulse_us_i = '1') then
        tpulse_us_i_i <= '1';
      end if;
      if (tpulse_us_i_i = '1') then
        tpulse_us_i_i <= '0';
        tpulse_us_i <= '0';
      end if;
      if (tvalid = '1') then
        if (bit_idx_5us_i = P_CNT_MAX) then
          bit_idx_5us_i <= (others => '0');
          tpulse_us_i <= '1';
        else
          bit_idx_5us_i <= bit_idx_5us_i + 1;
        end if;
      end if;
    end if;
  end process;
  --
end architecture;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================