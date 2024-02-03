-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity bf_ram is
  generic (
    ADDRESS_MAX : natural := 75; -- 300 / 4 = 75
    ADDRESS_WIDTH : natural := 7;
    DATA_WIDTH : natural := 32
  );
  port (
    --
    -- user defined port
    --
    -- axi bus defined
    -- port
    s_axi_scb_to_spb_clk : in std_logic;
    s_axi_scb_to_spb_reset_n : in std_logic;
    s_axi_scb_to_spb_tvalid : in std_logic;
    s_axi_scb_to_spb_tlast : in std_logic;
    s_axi_scb_to_spb_tdata : in std_logic_vector(DATA_WIDTH - 1 downto 0);
    --
    s_rd_bf_ram_tenable_i : in std_logic;
    s_rd_bf_ram_taddr : in std_logic_vector(ADDRESS_WIDTH - 1 downto 0);
    s_rd_bf_ram_tdata : out std_logic_vector(DATA_WIDTH - 1 downto 0);
    --
    s_bf_ram_clock_i : in std_logic;
    s_bf_ram_tnext_o : out std_logic
    --     
  );
end entity;
--
architecture rtl of bf_ram is
  --
  -- componet
  --  
  component bs_aurora_8b10b_cdc_sync_exdes is
    generic (
      C_CDC_TYPE : integer range 0 to 2 := 1;
      -- 0 is pulse synch
      -- 1 is level synch
      -- 2 is ack based level sync
      C_RESET_STATE : integer range 0 to 1 := 0;
      -- 0 is reset not needed 
      -- 1 is reset needed 
      C_SINGLE_BIT : integer range 0 to 1 := 1;
      -- 0 is bus input
      -- 1 is single bit input
      C_FLOP_INPUT : integer range 0 to 1 := 0;
      C_VECTOR_WIDTH : integer range 0 to 32 := 32;
      C_MTBF_STAGES : integer range 0 to 6 := 2
      -- Vector Data witdth
    );

    port (
      prmry_aclk : in std_logic; --
      prmry_resetn : in std_logic; --
      prmry_in : in std_logic; --
      prmry_vect_in : in std_logic_vector --
      (C_VECTOR_WIDTH - 1 downto 0); --
      prmry_ack : out std_logic;
      --
      scndry_aclk : in std_logic; --
      scndry_resetn : in std_logic; --
      --
      -- Primary to Secondary Clock Crossing                                                  --
      scndry_out : out std_logic; --
      --
      scndry_vect_out : out std_logic_vector --
      (C_VECTOR_WIDTH - 1 downto 0) --

    );
  end component;
  --
  -- ram or rom  
  constant DPRAM_ADDRESS_WIDTH : natural := ADDRESS_WIDTH + 1; -- 300 * 2 = double buffer
  type ram_type is array (0 to (2 ** DPRAM_ADDRESS_WIDTH) - 1) of std_logic_vector(31 downto 0);
  signal RAM : ram_type := (others => (others => '0'));
  attribute ram_style : string;
  attribute ram_style of RAM : signal is "block";
  signal wr_taddr_i : std_logic_vector(DPRAM_ADDRESS_WIDTH - 2 downto 0);
  signal wr_taddr_high : std_logic;
  signal rd_taddr_high : std_logic;
  signal wr_taddr_high_i : std_logic;
  signal s_axi_scb_to_spb_tlast_i : std_logic;

  -- signal
  --
begin
  --
  s_bf_ram_tnext_o <= s_axi_scb_to_spb_tlast_i;
  --
  p_wr : process (s_axi_scb_to_spb_clk, s_axi_scb_to_spb_reset_n)
  begin
    if (s_axi_scb_to_spb_reset_n = '0') then
      wr_taddr_i <= (others => '0');
      wr_taddr_high <= '0';
    elsif (rising_edge(s_axi_scb_to_spb_clk)) then
      if (s_axi_scb_to_spb_tvalid = '1') then
        RAM(conv_integer(wr_taddr_high & wr_taddr_i)) <= s_axi_scb_to_spb_tdata;
        if (s_axi_scb_to_spb_tlast = '1') then
          wr_taddr_i <= (others => '0');
          wr_taddr_high <= not wr_taddr_high;
        else
          wr_taddr_i <= wr_taddr_i + '1';
        end if;
      end if;
    end if;
  end process;

  p_rd : process (s_bf_ram_clock_i)
  begin
    rd_taddr_high <= not wr_taddr_high_i;
    if (rising_edge(s_bf_ram_clock_i)) then
      if (s_rd_bf_ram_tenable_i = '1') then
        s_rd_bf_ram_tdata <= RAM(conv_integer(rd_taddr_high & s_rd_bf_ram_taddr)) after 1 ns;
      end if;
    end if;
  end process;
  --
  -- cdc : s_axi_scb_to_spb_tlast, wr_taddr_high
  --
  --    
  cdc_start_bit_0 : bs_aurora_8b10b_cdc_sync_exdes
  generic map
  (
    c_cdc_type => 1, -- 0 is pulse synch -- 1 is level synch
    c_flop_input => 1,
    c_reset_state => 0, -- 0 is reset not needed  -- 1 is reset needed 
    c_single_bit => 1,
    c_vector_width => 2,
    c_mtbf_stages => 3
  )
  port map
  (
    prmry_aclk => s_axi_scb_to_spb_clk,
    prmry_resetn => '1',
    prmry_in => s_axi_scb_to_spb_tlast,
    prmry_vect_in => "00",
    scndry_aclk => s_bf_ram_clock_i,
    scndry_resetn => '1',
    prmry_ack => open,
    scndry_out => s_axi_scb_to_spb_tlast_i,
    scndry_vect_out => open
  );
  --
  cdc_last_bit_0 : bs_aurora_8b10b_cdc_sync_exdes
  generic map
  (
    c_cdc_type => 1, -- 0 is pulse synch -- 1 is level synch
    c_flop_input => 1,
    c_reset_state => 0, -- 0 is reset not needed  -- 1 is reset needed 
    c_single_bit => 1,
    c_vector_width => 2,
    c_mtbf_stages => 3
  )
  port map
  (
    prmry_aclk => s_axi_scb_to_spb_clk,
    prmry_resetn => '1',
    prmry_in => wr_taddr_high,
    prmry_vect_in => "00",
    scndry_aclk => s_bf_ram_clock_i,
    scndry_resetn => '1',
    prmry_ack => open,
    scndry_out => wr_taddr_high_i,
    scndry_vect_out => open
  );
  --
end architecture;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================