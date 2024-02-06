-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use ieee.std_logic_unsigned.all;
--
entity fft_last_ram is
  generic (
    ADDRESS_MAX : natural := 32768;
    ADDRESS_WIDTH : natural := 15;
    DATA_WIDTH : natural := 256
  );
  port (
    --    
    s_axis_tvalid : in std_logic;
    s_axis_tready : out std_logic;
    s_axis_tlast : in std_logic;
    s_axis_tdata : in std_logic_vector(255 downto 0);
    -- 
    m_rd_tnext : out std_logic;
    s_rd_taddr : in std_logic_vector(ADDRESS_WIDTH - 1 downto 0);
    s_rd_tdata : out std_logic_vector(DATA_WIDTH - 1 downto 0);
    --
    reset_n : in std_logic;
    Clk_rd : in std_logic;
    Clk : in std_logic
    --    
  );
end entity;
--
architecture rtl of fft_last_ram is
  --
  constant C_DATA_ZERO : std_logic_vector(DATA_WIDTH - 1 downto 0) := (others => '0');
  --
  -- ram or rom  
  type ram_type is array (0 to (2 ** (ADDRESS_WIDTH+1)) - 1) of std_logic_vector(DATA_WIDTH - 1 downto 0);
  signal RAM : ram_type := (others => (others => '0'));
  attribute ram_style : string;
  attribute ram_style of RAM : signal is "block";
  signal wr_taddr_i : std_logic_vector(ADDRESS_WIDTH - 1 downto 0);
  signal s_axis_tlast_i : std_logic := '0';
  signal s_axis_tlast_i_i : std_logic := '0';
  -- signal
begin

  m_rd_tnext <= s_axis_tlast_i_i;
  s_axis_tready <= '1';

  p_wr : process (Clk, reset_n)
  begin
    if (reset_n = '0') then
      wr_taddr_i <= (others => '0');
    elsif (rising_edge(Clk)) then
      if (s_axis_tvalid = '1') then
        RAM(conv_integer(wr_taddr_i)) <= s_axis_tdata;
        if (s_axis_tlast = '1') then
          wr_taddr_i <= (others => '0');
        else
          wr_taddr_i <= wr_taddr_i + '1';
        end if;
      end if;
    end if;
  end process;

  p_rd : process (Clk_rd)
  begin
    if (rising_edge(Clk_rd)) then
      s_rd_tdata <= RAM(conv_integer(s_rd_taddr)) after 1 ns;
    end if;
  end process;

end architecture;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================