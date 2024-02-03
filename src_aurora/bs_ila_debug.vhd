-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use ieee.std_logic_unsigned.all;
use work.SCB2SPB_Type.all; -- BS2_protocol_V0.56_20231121
--
entity bs_ila_debug is
  generic (
    ADDRESS_MAX : natural := 300;
    ADDRESS_WIDTH : natural := 9;
    DATA_WIDTH : natural := 32
  );
  port (
    --    
    s_axis_bs_aurora_ram_tvalid : in std_logic;
    s_axis_bs_aurora_ram_tlast : in std_logic;
    s_axis_bs_aurora_ram_tkeep : in std_logic_vector(3 downto 0);
    s_axis_bs_aurora_ram_tdata : in std_logic_vector(DATA_WIDTH - 1 downto 0);
    --
    ila_data : out std_logic_vector(ADDRESS_MAX * 8 - 1 downto 0);
    --
    reset_2_n : in std_logic;
    reset_1_n : in std_logic;
    Clk : in std_logic
    --    
  );
end entity;
--
architecture rtl of bs_ila_debug is
  --
  constant ADDRESS_MAX_WORD_CNT : natural := (DATA_WIDTH / 8); -- 75
  constant ADDRESS_MAX_WORD : natural := (ADDRESS_MAX / ADDRESS_MAX_WORD_CNT); -- 75
  constant C_DATA_ZERO : std_logic_vector(DATA_WIDTH - 1 downto 0) := (others => '0');
  --
  -- signal
  signal ila_data_r : std_logic_vector(ADDRESS_MAX * 8 - 1 downto 0) := (others => '0');
  signal Chan_Pkt_r : SCB2SPB_Pkt_300_Type;
  -- signal Chan_Str_r : std_logic_vector(2399 downto 0) := (others => '0');
  signal reset_n : std_logic := '0';
  --
begin
  --
  reset_n <= reset_1_n and reset_2_n;
  --
  -- Chan_Str_r <= conv_ch_bitvector(ila_data_r);
  Chan_Pkt_r <= conv_ch_packet(ila_data_r);
  --
  ila_data <= ila_data_r;
  -- ila_data_rec <= Chan_Pkt_r;
  --

  p_wr : process (Clk, reset_n)
    variable idx_v : natural := 0;
  begin
    if (reset_n = '0') then
      idx_v := 0;
    elsif (rising_edge(Clk)) then
      if (s_axis_bs_aurora_ram_tvalid = '1') then
        ila_data_r(idx_v * 32 + 31 downto idx_v * 32) <= s_axis_bs_aurora_ram_tdata;
        if (s_axis_bs_aurora_ram_tlast = '1') then
          idx_v := 0;
        else
          idx_v := idx_v + 1;
        end if;
      end if;
    end if;
  end process;

end architecture;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================