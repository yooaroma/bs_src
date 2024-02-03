
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
--
entity rom_128_32 is
  port (
    rd_clk : in std_logic;
    rd_taddr_i : in std_logic_vector(6 downto 0);
    rd_tenable_i : in std_logic;
    rd_tdata_o : out std_logic_vector(31 downto 0)
  );
end rom_128_32;
--
architecture arch of rom_128_32 is
  --
  type rom_type is array (0 to 127) of std_logic_vector(31 downto 0);
  signal ROM : rom_type := (
    X"31310D0A", X"37363534", X"3B3A3938", X"3F3E3D3C", X"32310D0A", X"47464544", X"4B4A4948", X"4F4E4D4C",
    X"33310D0A", X"57565554", X"5B5A5958", X"5F5E5D5C", X"34310D0A", X"67666564", X"6B6A6968", X"6F6E6D6C",
    X"35310D0A", X"37363534", X"3B3A3938", X"3F3E3D3C", X"36310D0A", X"47464544", X"4B4A4948", X"4F4E4D4C",
    X"37310D0A", X"57565554", X"5B5A5958", X"5F5E5D5C", X"38310D0A", X"67666564", X"6B6A6968", X"6F6E6D6C",
    X"39310D0A", X"37363534", X"3B3A3938", X"3F3E3D3C", X"30320D0A", X"47464544", X"4B4A4948", X"4F4E4D4C",
    X"31320D0A", X"57565554", X"5B5A5958", X"5F5E5D5C", X"32320D0A", X"67666564", X"6B6A6968", X"6F6E6D6C",
    X"33320D0A", X"37363534", X"3B3A3938", X"3F3E3D3C", X"34320D0A", X"47464544", X"4B4A4948", X"4F4E4D4C",
    X"35320D0A", X"57565554", X"5B5A5958", X"5F5E5D5C", X"36320D0A", X"67666564", X"6B6A6968", X"6F6E6D6C",
    X"37320D0A", X"37363534", X"3B3A3938", X"3F3E3D3C", X"38320D0A", X"47464544", X"4B4A4948", X"4F4E4D4C",
    X"39320D0A", X"57565554", X"5B5A5958", X"5F5E5D5C", X"30330D0A", X"67666564", X"6B6A6968", X"6F6E6D6C",
    X"31330D0A", X"37363534", X"3B3A3938", X"3F3E3D3C", X"32330D0A", X"47464544", X"4B4A4948", X"4F4E4D4C",
    X"33330D0A", X"57565554", X"5B5A5958", X"5F5E5D5C", X"34330D0A", X"67666564", X"6B6A6968", X"6F6E6D6C",
    X"35330D0A", X"37363534", X"3B3A3938", X"3F3E3D3C", X"36330D0A", X"47464544", X"4B4A4948", X"4F4E4D4C",
    X"37330D0A", X"57565554", X"5B5A5958", X"5F5E5D5C", X"38330D0A", X"67666564", X"6B6A6968", X"6F6E6D6C",
    X"39330D0A", X"37363534", X"3B3A3938", X"3F3E3D3C", X"30340D0A", X"47464544", X"4B4A4948", X"4F4E4D4C",
    X"31340D0A", X"57565554", X"5B5A5958", X"5F5E5D5C", X"31340D0A", X"67666564", X"6B6A6968", X"6F6E6D6C"
  );
  attribute rom_style : string;
  attribute rom_style of ROM : signal is "block";
  --
begin
  --
  process (rd_clk, rd_tenable_i)
  begin
    if (rising_edge(rd_clk) and rd_tenable_i = '1') then
      rd_tdata_o <= ROM(conv_integer(rd_taddr_i));
    end if;
  end process;
  --
end arch;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
--
entity ramp_32 is
  generic (
    ADDRESS_WIDTH : natural := 7;
    DATA_WIDTH : natural := 32
  );
  port (
    rd_clk : in std_logic;
    rd_taddr_i : in std_logic_vector(ADDRESS_WIDTH - 1 downto 0);
    rd_tenable_i : in std_logic;
    rd_tdata_o : out std_logic_vector(DATA_WIDTH - 1 downto 0)
  );
end ramp_32;
--
architecture arch of ramp_32 is
  --
  constant C_DATA_ZERO : std_logic_vector(DATA_WIDTH - 1 downto 0) := (others => '0');
begin
  --
  process (rd_clk)
  begin
    if (rising_edge(rd_clk) and rd_tenable_i = '1') then
      rd_tdata_o <= C_DATA_ZERO(DATA_WIDTH - 1 downto ADDRESS_WIDTH) & rd_taddr_i;
    end if;
  end process;
  --
end arch;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
-- Simple Dual-Port Block RAM with Two Clocks
-- Correct Modelization with a Shared Variable
-- File: simple_dual_two_clocks.vhd
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity dpram_sync_32 is
  generic (
    ADDRESS_WIDTH : natural := 7
  );
  port (
    wr_tdata_i : in std_logic_vector(31 downto 0);
    wr_tvalid_i : in std_logic;
    wr_tready_i : in std_logic;
    wr_tlast_i : in std_logic;
    wr_treset_i : in std_logic;
    wr_clk : in std_logic;
    rd_clk : in std_logic;
    rd_ten_i : in std_logic;
    rd_taddr_i : in std_logic_vector(ADDRESS_WIDTH - 1 downto 0);
    rd_tdata_o : out std_logic_vector(31 downto 0)
  );
end dpram_sync_32;

architecture syn of dpram_sync_32 is
  type ram_type is array (0 to (2 ** ADDRESS_WIDTH) - 1) of std_logic_vector(31 downto 0);
  signal RAM : ram_type;
  attribute ram_style : string;
  attribute ram_style of RAM : signal is "block";
  signal wr_taddr_i : std_logic_vector(ADDRESS_WIDTH - 1 downto 0);
begin
  process (wr_clk)
  begin
    if (wr_treset_i = '1') then
      wr_taddr_i <= (others => '0');
    elsif wr_clk'event and wr_clk = '1' then
      if (wr_tvalid_i = '1') and (wr_tready_i = '1') then
        RAM(conv_integer(wr_taddr_i)) <= wr_tdata_i;
        if (wr_tlast_i = '1') then
          wr_taddr_i <= (others => '0');
        else
          wr_taddr_i <= wr_taddr_i + '1';
        end if;
      end if;
    end if;
  end process;

  process (rd_clk)
  begin
    if rd_clk'event and rd_clk = '1' then
      if rd_ten_i = '1' then
        rd_tdata_o <= RAM(conv_integer(rd_taddr_i));
      end if;
    end if;
  end process;

end syn;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
-- Simple Dual-Port Block RAM with Two Clocks
-- Correct Modelization with a Shared Variable
-- File: simple_dual_two_clocks.vhd
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity dpram_32 is
  generic (
    ADDRESS_WIDTH : natural := 7
  );
  port (
    wr_tdata_i : in std_logic_vector(31 downto 0);
    wr_taddr_i : in std_logic_vector(ADDRESS_WIDTH - 1 downto 0);
    wr_twe_i : in std_logic;
    wr_ten_i : in std_logic;
    wr_clk : in std_logic;
    rd_clk : in std_logic;
    rd_ten_i : in std_logic;
    rd_taddr_i : in std_logic_vector(ADDRESS_WIDTH - 1 downto 0);
    rd_tdata_o : out std_logic_vector(31 downto 0)
  );
end dpram_32;

architecture syn of dpram_32 is
  type ram_type is array (0 to (2 ** ADDRESS_WIDTH) - 1) of std_logic_vector(31 downto 0);
  signal RAM : ram_type;
  attribute ram_style : string;
  attribute ram_style of RAM : signal is "block";
begin
  process (wr_clk)
  begin
    if wr_clk'event and wr_clk = '1' then
      if wr_twe_i = '1' then
        if wr_ten_i = '1' then
          RAM(conv_integer(wr_taddr_i)) <= wr_tdata_i;
        end if;
      end if;
    end if;
  end process;

  process (rd_clk)
  begin
    if rd_clk'event and rd_clk = '1' then
      if rd_ten_i = '1' then
        rd_tdata_o <= RAM(conv_integer(rd_taddr_i));
      end if;
    end if;
  end process;

end syn;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================

-- //=============================================================================
-- //=============================================================================
-- //=============================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity bs_axi_read_hic_gen is
  generic (
    ADDRESS_MAX : natural := 75; -- 300 / 4 = 75
    ADDRESS_WIDTH : natural := 7;
    DATA_WIDTH : natural := 32
  );
  port (
    axi_tx_reset_n : in std_logic;
    axi_tx_clk : in std_logic;
    axi_rd_start_i : in std_logic;
    axi_tx_ten_rd_o : out std_logic;
    axi_tx_taddr_rd_o : out std_logic_vector(ADDRESS_WIDTH - 1 downto 0);
    axi_tx_tdata_rd_i : in std_logic_vector(DATA_WIDTH - 1 downto 0);
    axi_tx_tvalid_o : out std_logic;
    axi_tx_tready_i : in std_logic;
    axi_tx_tlast_o : out std_logic;
    axi_tx_tkeep_o : out std_logic_vector(3 downto 0);
    axi_tx_tdata_o : out std_logic_vector(DATA_WIDTH - 1 downto 0);
    ctl_state_status_o : out std_logic
  );
end bs_axi_read_hic_gen;
--
architecture rtl of bs_axi_read_hic_gen is

  signal axi_tx_tdata_rd_i_b : std_logic_vector(DATA_WIDTH - 1 downto 0) := (others => '0');
  signal axi_q : std_logic_vector(DATA_WIDTH - 1 downto 0) := (others => '0');
  signal a_valid : std_logic := '0';
  signal q1_valid, qb_valid, q_sel : std_logic := '0';
  signal axi_tx_tvalid_o_s : std_logic := '0';
  signal axi_tx_taddr_rd_o_s : std_logic_vector(ADDRESS_WIDTH - 1 downto 0);
  signal axi_rd_start_i_i : std_logic := '0';

begin

  axi_tx_tkeep_o <= "1111";
  axi_tx_tvalid_o <= axi_tx_tvalid_o_s;
  axi_tx_ten_rd_o <= a_valid;
  axi_tx_taddr_rd_o <= axi_tx_taddr_rd_o_s;

  -- p_RAM: process ( axi_tx_clk )	-- ram timing model
  -- begin
  -- 	if axi_tx_clk'event and axi_tx_clk = '1' then
  -- 		axi_tx_tdata_rd_i <= axi_tx_taddr_rd_o_s;
  -- 	end if;
  -- end process p_RAM;
  p_ifc_retime : process (axi_tx_clk, axi_tx_reset_n)
  begin
    if axi_tx_reset_n = '0' then
      axi_tx_taddr_rd_o_s <= (others => '0');
      a_valid <= '0';
      axi_tx_tvalid_o_s <= '0';
      q1_valid <= '0';
      qb_valid <= '0';
      q_sel <= '0';
      axi_tx_tlast_o <= '0';
    elsif axi_tx_clk'event and axi_tx_clk = '1' then

      -- address counter

      axi_rd_start_i_i <= axi_rd_start_i;
      if axi_rd_start_i = '1' and axi_rd_start_i_i = '0' then
        -- if axi_rd_start_i = '1' then
        q1_valid <= '1'; -- force advance address for early preparing second data
        a_valid <= '1';
        axi_tx_taddr_rd_o_s <= (others => '0');
      elsif (a_valid = '1') and ((q1_valid = '1') or (axi_tx_tvalid_o_s = '1' and axi_tx_tready_i = '1')) then
        q1_valid <= '0';
        if axi_tx_taddr_rd_o_s = std_logic_vector(to_unsigned(ADDRESS_MAX - 1, ADDRESS_WIDTH)) then
          a_valid <= '0';
          axi_tx_tlast_o <= '1';
        end if;
        axi_tx_taddr_rd_o_s <= axi_tx_taddr_rd_o_s + '1';
      end if;

      -- handshaking

      if a_valid = '1' then
        axi_tx_tvalid_o_s <= '1';
      elsif axi_tx_tready_i = '1' then -- (axi_tx_tvalid_o_s = '1') and (axi_tx_tready_i = '1')
        axi_tx_tvalid_o_s <= '0';
        axi_tx_tlast_o <= '0';
      end if;

      -- buffering

      qb_valid <= q1_valid or (axi_tx_tvalid_o_s and axi_tx_tready_i);
      if qb_valid = '1' then
        axi_tx_tdata_rd_i_b <= axi_tx_tdata_rd_i;
      end if;

      -- selection

      if q1_valid = '1' then
        q_sel <= '0';
      else
        q_sel <= axi_tx_tvalid_o_s and (not axi_tx_tready_i);
      end if;

    end if;
  end process p_ifc_retime;
  axi_tx_tdata_o <= axi_tx_tdata_rd_i when q_sel = '0' else
    axi_tx_tdata_rd_i_b;
  -- p_axi_ss: process ( axi_tx_clk )	-- axi streaming slave model
  -- begin
  -- 	if axi_tx_clk'event and axi_tx_clk = '1' then
  -- 		if axi_tx_tvalid_o_s = '1' and axi_tx_tready_i = '1' then
  -- 			axi_q <= axi_tx_tdata_o;
  -- 		end if;
  -- 	end if;
  -- end process p_axi_ss;
  --
end rtl;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
--
entity bs_reset_gen is
  generic (
    delay_max : natural := 15 -- 50MHz ,,, 300 ns delay
  );
  port (
    clk : in std_logic;
    reset_n : in std_logic;
    reset_n_delay : out std_logic
  );
end bs_reset_gen;
--
architecture arch of bs_reset_gen is
begin
  --      
  p_last_expansion : process (clk, reset_n)
    variable bit_idx : std_logic_vector(delay_max downto 0);
  begin
    if (reset_n = '0') then
      bit_idx := (others => '0');
    elsif (rising_edge(clk)) then
      bit_idx := bit_idx(delay_max - 1 downto 0) & '1';
    end if;
    reset_n_delay <= bit_idx(delay_max);
  end process;
  --
end arch;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
--
entity bs_status_check is
  port (
    -- LED pin
    FPGA_LED_USER_PAD : out std_logic;
    FPGA_LED_1_PAD : out std_logic;
    FPGA_LED_2_PAD : out std_logic;
    -- key pin
    FPGA_KEY_1_PAD : in std_logic;
    FPGA_KEY_2_PAD : in std_logic;
    --
    tx_disable : out std_logic_vector(3 downto 0);
    rx_loss : in std_logic_vector(3 downto 0);
    --
    -- status
    --
    status_cmd_scb_top : in std_logic;
    error_cmd_scb_top : in std_logic;
    --
    status_aurora_top : in std_logic;
    error_aurora_top : in std_logic;
    --
    status_last : out std_logic;
    error_last : out std_logic
    --
  );
end bs_status_check;
--
architecture arch of bs_status_check is
  --
  signal t_high : std_logic;
  signal t_low : std_logic;
  signal status_last_i : std_logic;
  signal error_last_i : std_logic;
  --
begin
  --
  t_high <= '1';
  t_low <= '0';
  tx_disable <= "0000";
  status_last <= status_last_i;
  error_last <= error_last_i;
  FPGA_LED_USER_PAD <= not error_last_i;
  -- FPGA_LED_USER_PAD <= '1';
  FPGA_LED_2_PAD <= not (rx_loss(3) or rx_loss(2) or rx_loss(1) or rx_loss(0) or not status_last_i);
  FPGA_LED_1_PAD <= FPGA_KEY_1_PAD and FPGA_KEY_2_PAD;
  --    
  status_last_i <= status_cmd_scb_top and status_aurora_top and t_high and t_high and t_high;
  error_last_i <= error_cmd_scb_top or error_aurora_top or t_low or t_low or t_low;
end arch;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
--
entity bs_pulse_expansion is
  generic (
    expansion_max : natural := 5 -- max 7
  );
  port (
    clk : in std_logic;
    reset_n : in std_logic;
    tlast_in : in std_logic;
    tlast_out : out std_logic
  );
end bs_pulse_expansion;
--
architecture arch of bs_pulse_expansion is
begin
  --    
  p_last_expansion : process (clk, reset_n)
    variable bit_idx : std_logic_vector(expansion_max downto 0);
  begin
    if (reset_n = '0') then
      bit_idx := (others => '0');
    elsif (rising_edge(clk)) then
      if (tlast_in = '1') then
        bit_idx := (others => '1');
      else
        bit_idx := bit_idx(expansion_max - 1 downto 0) & '0';
      end if;
    end if;
    tlast_out <= bit_idx(expansion_max);
  end process;
end arch;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================