-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
--
entity p1_buff32k is
  generic (
    ADDRESS_WIDTH : natural := 15;
    DATA_WIDTH : natural := 32
  );
  port (
    --    
    s_axis_p1_buff32k_tvalid : in std_logic;
    s_axis_p1_buff32k_tdata : in std_logic_vector(31 downto 0);
    --
    m_rd_p1_buff32k_tnext : out std_logic;
    m_rd_p1_buff32k_tstart_addr : out std_logic_vector(14 downto 0);
    s_rd_p1_buff32k_taddr : in std_logic_vector(14 downto 0);
    s_rd_p1_buff32k_tdata : out std_logic_vector(31 downto 0);
    --
    reset_n : in std_logic;
    Clk : in std_logic
    --    
  );
end entity;
--
architecture rtl of p1_buff32k is
  -- ram or rom  
  type ram_type is array (0 to (2 ** ADDRESS_WIDTH) - 1) of std_logic_vector(31 downto 0);
  signal RAM : ram_type := (others => (others => '0'));
  attribute ram_style : string;
  attribute ram_style of RAM : signal is "block";
  signal wr_taddr_i : std_logic_vector(ADDRESS_WIDTH - 1 downto 0);
  -- signal
  signal tvalid : std_logic := '0';
  signal tnext : std_logic := '0';
  signal tdata : std_logic_vector(31 downto 0) := (others => '0');
  signal tcnt : std_logic_vector(6 downto 0) := (others => '0');
  signal tstart_addr : std_logic_vector(14 downto 0) := (others => '0');
  --
begin
  --
  m_rd_p1_buff32k_tstart_addr <= tstart_addr;
  tvalid <= s_axis_p1_buff32k_tvalid;
  tdata <= s_axis_p1_buff32k_tdata;
  --
  m_rd_p1_buff32k_tnext <= tnext;
  --
  p_wr : process (Clk, reset_n)
  begin
    if (reset_n = '0') then
      wr_taddr_i <= (others => '0');
      tcnt <= (others => '0');
      tstart_addr <= (others => '0');
      tnext <= '0';
    elsif (rising_edge(Clk)) then
      if (tvalid = '1') then
        RAM(conv_integer(wr_taddr_i)) <= tdata;
        wr_taddr_i <= wr_taddr_i + '1';
        if (tcnt = 99) then
          tcnt <= (others => '0');
          tnext <= '1';
          tstart_addr <= wr_taddr_i + '1';
        else
          tcnt <= tcnt + '1';
        end if;
      end if;
      if(tnext = '1')then
        tnext <= '0';
      end if;
    end if;
  end process;

  p_rd : process (Clk)
  begin
    if (rising_edge(Clk)) then
      s_rd_p1_buff32k_tdata <= RAM(conv_integer(s_rd_p1_buff32k_taddr)) after 1 ns;
    end if;
  end process;
  --
end architecture;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================