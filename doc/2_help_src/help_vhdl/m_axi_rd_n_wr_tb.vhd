library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity m_axi_rd_n_wr_tb is
  generic (
    ADDRESS_MAX : natural := 75;
    ADDRESS_WIDTH : natural := 7;
    DATA_WIDTH : natural := 32
  );
end m_axi_rd_n_wr_tb;

architecture Behaviour of m_axi_rd_n_wr_tb is
  component m_axi_rd_n_wr is
    generic (
      ADDRESS_MAX : natural := 75; -- 300 / 4 = 75
      ADDRESS_WIDTH : natural := 7;
      DATA_WIDTH : natural := 32
    );
    port (
      m_axi_rw_bus_tstart : in std_logic;
      --
      m_axi_rw_bus_clk : in std_logic;
      m_axi_rw_bus_reset_n : in std_logic;
      m_axi_rw_bus_tvalid : out std_logic;
      m_axi_rw_bus_tready : in std_logic;
      m_axi_rw_bus_tlast : out std_logic;
      m_axi_rw_bus_tdata : out std_logic_vector(DATA_WIDTH - 1 downto 0);
      --
      m_rd_tenable_o : out std_logic;
      m_rd_taddr : out std_logic_vector(ADDRESS_WIDTH - 1 downto 0);
      m_rd_tdata : in std_logic_vector(DATA_WIDTH - 1 downto 0)
    );
  end component;

  signal tb_tstart : std_logic;
  signal tb_clock : std_logic := '0';
  signal tb_clock_1 : std_logic := '0';
  signal tb_reset : std_logic;
  signal tb_reset_n : std_logic;
  signal tb_tvalid : std_logic;
  signal tb_tready : std_logic;
  signal tb_tlast : std_logic;
  signal tb_tdata : std_logic_vector(DATA_WIDTH - 1 downto 0);
  signal tb_rd_tenable_o : std_logic;
  signal tb_rd_taddr : std_logic_vector(ADDRESS_WIDTH - 1 downto 0);
  signal tb_rd_tdata : std_logic_vector(DATA_WIDTH - 1 downto 0);
  --  
  constant C_DATA_ZERO : std_logic_vector(DATA_WIDTH - 1 downto 0) := (others => '0');
  --
begin
  --
  tb_clock_1 <= not tb_clock_1 after 5 ns;
  tb_clock <= not tb_clock_1;
  --
  --
  p_tb_reset_n : process
  begin
    tb_reset_n <= '0';
    wait for 100 ns;
    tb_reset_n <= '1';
    wait;
  end process p_tb_reset_n;
  --
  tb_reset <= tb_reset_n;
  --
  p_tb_data : process(tb_clock)
  begin
    if(rising_edge(tb_clock)) then
      tb_rd_tdata <= C_DATA_ZERO(DATA_WIDTH - 1 downto ADDRESS_WIDTH) & tb_rd_taddr;
    end if;
  end process;
  -- main test
  p_tb_signal : process
  --
  begin
    --    
    tb_tstart <= '0' after 1 ns;
    tb_tready <= '0' after 1 ns;
    --
    wait for 200 ns;
    tb_tready <= '1' after 1 ns;
    wait for 50 ns;
    tb_tstart <= '1' after 1 ns;
    wait for 50 ns;
    tb_tstart <= '0' after 1 ns;
    wait for 200 ns;
    tb_tready <= '0' after 1 ns;
    wait for 200 ns;
    tb_tready <= '1' after 1 ns;
    wait for 1000 ns;
    --
    tb_tready <= '0' after 1 ns;
    wait for 50 ns;
    tb_tstart <= '1' after 1 ns;
    wait for 50 ns;
    tb_tstart <= '0' after 1 ns;
    wait for 50 ns;
    tb_tready <= '0' after 1 ns;
    wait for 50 ns;
    tb_tready <= '1' after 1 ns;
    wait for 1500 ns;
    wait;
  end process p_tb_signal;
  --
  m_axi_rd_n_wr_i : m_axi_rd_n_wr
  generic map
  (
    ADDRESS_MAX => 75, -- 300 / 4 = 75
    ADDRESS_WIDTH => 7,
    DATA_WIDTH => 32
  )
  port map
  (
    m_axi_rw_bus_tstart => tb_tstart,
    --
    m_axi_rw_bus_clk => tb_clock,
    m_axi_rw_bus_reset_n => tb_reset_n,
    m_axi_rw_bus_tvalid => tb_tvalid,
    m_axi_rw_bus_tready => tb_tready,
    m_axi_rw_bus_tlast => tb_tlast,
    m_axi_rw_bus_tdata => tb_tdata,
    --
    m_rd_tenable_o => tb_rd_tenable_o,
    m_rd_taddr => tb_rd_taddr,
    m_rd_tdata => tb_rd_tdata
  );

end Behaviour;