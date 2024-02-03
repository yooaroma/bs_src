-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use work.SCB_2_SPB_Type.all;

entity bf_buff is
  generic (
    ADDRESS_MAX : natural := 75; -- 300 / 4 = 75
    ADDRESS_WIDTH : natural := 7;
    ADDRESS_BANK_WIDTH : natural := 5; -- 18T (32:5)
    ADDRESS_CH_WIDTH : natural := 6; -- 37 ch (64:6)
    ADDRESS_BUFF_WIDTH : natural := 11;
    DATA_CH_WIDTH : natural := 24;
    DATA_WIDTH : natural := 32
  );
  port (
    --
    -- user defined port
    --
    -- axi bus defined
    -- port
    m_rd_bf_ram_tenable_o : out std_logic;
    m_rd_bf_ram_taddr : out std_logic_vector(ADDRESS_WIDTH - 1 downto 0);
    m_rd_bf_ram_tdata : in std_logic_vector(DATA_WIDTH - 1 downto 0);
    m_rd_bf_ram_tnext_i : in std_logic;
    -- 
    s_rd_bf_main_ram_tenable_i : in std_logic;
    s_rd_bf_main_ram_taddr : in std_logic_vector(ADDRESS_BUFF_WIDTH - 1 downto 0);
    s_rd_bf_main_ram_tdata : out std_logic_vector(DATA_CH_WIDTH - 1 downto 0);
    --
    s_bf_main_ram_tclock_i : in std_logic;
    s_bf_main_ram_treset_n_i : in std_logic;
    s_bf_main_ram_tnext_o : out std_logic
    --    
  );
end entity;
--
architecture rtl of bf_buff is
  --
  -- componet
  --  
  --
  -- ram or rom  
  constant DPRAM_BUFF_ADDRESS_WIDTH : natural := ADDRESS_BUFF_WIDTH; -- (ADDRESS_WIDTH + ADDRESS_BANK_WIDTH); -- 128 sample , 18T (32 : 5)
  type ram_type is array (0 to (2 ** DPRAM_BUFF_ADDRESS_WIDTH) - 1) of std_logic_vector(DATA_CH_WIDTH - 1 downto 0);
  signal RAM : ram_type := (others => (others => '0'));
  attribute ram_style : string;
  attribute ram_style of RAM : signal is "block";
  signal rd_taddr : std_logic_vector(ADDRESS_WIDTH - 1 downto 0);
  signal wr_ch_taddr : std_logic_vector(ADDRESS_CH_WIDTH - 1 downto 0);
  signal wr_ch_taddr_bank : std_logic_vector(ADDRESS_BANK_WIDTH - 1 downto 0);
  --
  signal rd_tenable : std_logic := '0';
  signal next_tlast : std_logic;
  signal rd_tnext : std_logic;
  signal rd_tstart : std_logic;
  signal rd_tvalid : std_logic;
  -- constant
  --
  -- signal
  signal Clk : std_logic;
  signal reset_n : std_logic;

  --
begin
  --
  Clk <= s_bf_main_ram_tclock_i;
  reset_n <= s_bf_main_ram_treset_n_i;
  --
  s_bf_main_ram_tnext_o <= m_rd_bf_ram_tnext_i;
  --
  m_rd_bf_ram_tenable_o <= rd_tenable;
  m_rd_bf_ram_taddr <= rd_taddr;
  --
  p_wr : process (Clk)
  begin
    if (reset_n = '0') then
      rd_tenable <= '0';
      next_tlast <= '0';
      rd_tstart <= '0';
      rd_tvalid <= '0';
      rd_taddr <= (others => '0');
      wr_ch_taddr <= (others => '0');
      wr_ch_taddr_bank <= (others => '0');
      -- wr_ch_taddr_bank <= (others => '1');
    elsif (rising_edge(Clk)) then
      rd_tstart <= m_rd_bf_ram_tnext_i;
      if (rd_tstart = '1') and (rd_tenable = '0') then
        rd_tenable <= '1';
        rd_taddr <= C_CH_START; -- (others => '0');
        wr_ch_taddr <= (others => '0');
        -- rd_taddr <= C_DATA_ZERO(ADDRESS_WIDTH - 1 downto 1) & '1';
      end if;
      --
      if (rd_tenable = '1') and (rd_tvalid = '0') then
        rd_tvalid <= '1' after 1 ns;
        rd_taddr <= rd_taddr + '1';
      end if;
      --
      if (rd_tvalid = '1') then
        RAM(conv_integer(wr_ch_taddr_bank & wr_ch_taddr)) <= m_rd_bf_ram_tdata(DATA_CH_WIDTH - 1 downto 0);
        rd_taddr <= rd_taddr + '1';
        wr_ch_taddr <= wr_ch_taddr + '1';
      end if;
      --
      if (rd_taddr = C_CH_END) then
        next_tlast <= '1';
      end if;
      --
      if (next_tlast = '1') then
        rd_tenable <= '0';
        rd_tvalid <= '0';
        next_tlast <= '0';
        wr_ch_taddr_bank <= wr_ch_taddr_bank + '1';
        -- wr_ch_taddr_bank <= wr_ch_taddr_bank + "11111";
      end if;
      --
    end if;
  end process;
  --
  --
  p_rd : process (Clk)
  begin
    if (rising_edge(Clk)) then
      if (s_rd_bf_main_ram_tenable_i = '1') then
        s_rd_bf_main_ram_tdata <= RAM(conv_integer(s_rd_bf_main_ram_taddr)) after 1 ns;
      end if;
    end if;
  end process;
  --
  --
end architecture;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================