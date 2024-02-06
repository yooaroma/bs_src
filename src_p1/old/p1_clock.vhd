-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
--
entity p1_clock is
  generic (
    PULSE_MAX : natural := 1000
  );
  port (
    --        --    
    vcc_out : out std_logic;
    gnd_out : out std_logic;
    --
    m_dip_0 : out std_logic;
    m_dip_1 : out std_logic;
    m_dip_2 : out std_logic;
    m_dip_3 : out std_logic;
    s_dip_in : in std_logic_vector(3 downto 0);
    --
    s_led_0 : in std_logic;
    s_led_1 : in std_logic;
    s_led_2 : in std_logic;
    s_led_3 : in std_logic;
    m_led_out : out std_logic_vector(3 downto 0);
    --
    tpulse_5us : out std_logic;
    gt_reset_n : out std_logic;
    reset_n : out std_logic;
    Clk : in std_logic
    --    
  );
end entity;
--
architecture rtl of p1_clock is
  --
  signal reset_n_i : std_logic := '0';
  signal gt_reset_n_i : std_logic := '0';
  signal tstart_i : std_logic := '0';
  signal tstart_i_i : std_logic := '0';
  signal tpulse_5us_i : std_logic := '0';
  signal tpulse_5us_i_i : std_logic := '0';
  signal tvalid : std_logic := '0';
  signal bit_idx_i : std_logic_vector(9 downto 0) := (others => '0');
  signal bit_idx_5us_i : std_logic_vector(10 downto 0) := (others => '0');
  --
begin
  --
  vcc_out <= '1';
  gnd_out <= '0';
  reset_n <= reset_n_i;
  gt_reset_n <= gt_reset_n_i;
  tpulse_5us <= tpulse_5us_i;
  --
  m_dip_0 <= s_dip_in(0);
  m_dip_1 <= s_dip_in(1);
  m_dip_2 <= s_dip_in(2);
  m_dip_3 <= s_dip_in(3);
  --
  m_led_out(0) <= s_led_0;
  m_led_out(1) <= s_led_1;
  m_led_out(2) <= s_led_2;
  m_led_out(3) <= s_led_3;
  --
  p_reset_n : process (Clk)
  begin
    if (rising_edge(Clk)) then
      if (bit_idx_i(9) = '1') then
        bit_idx_i <= bit_idx_i;
      else
        bit_idx_i <= bit_idx_i + 1;
      end if;
      if (reset_n_i = '0') and (bit_idx_i(6) = '1') then
        reset_n_i <= '1';
      end if;
      if (gt_reset_n_i = '0') and (bit_idx_i(7) = '1') then
        gt_reset_n_i <= '1';
      end if;
      if (tstart_i = '0') and (bit_idx_i(8) = '1') then
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
        tpulse_5us_i <= '1';
        tvalid <= '1';
      end if;
      if (tpulse_5us_i = '1') then
        tpulse_5us_i_i <= '1';
      end if;
      if (tpulse_5us_i_i = '1') then
        tpulse_5us_i_i <= '0';
        tpulse_5us_i <= '0';
      end if;
      if (tvalid = '1') then
        if (bit_idx_5us_i = PULSE_MAX) then
          bit_idx_5us_i <= (others => '0');
          tpulse_5us_i <= '1';
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