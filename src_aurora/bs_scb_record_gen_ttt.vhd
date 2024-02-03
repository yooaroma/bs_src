
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use ieee.math_real.all;

entity bs_atx_data_table_gen is
  generic (
    ADDRESS_MAX : natural := 75; -- 300 / 4 = 75
    ADDRESS_WIDTH : natural := 7;
    DATA_WIDTH : natural := 32
  );
  port (
    --    
    m_axis_bs_atx_tvalid : out std_logic;
    m_axis_bs_atx_tready : in std_logic;
    m_axis_bs_atx_tlast : out std_logic;
    m_axis_bs_atx_tdata : out std_logic_vector(31 downto 0);
    -- 
    m_rd_bs_atx_tstart : in std_logic;
    --
    reset_n : in std_logic;
    Clk : in std_logic
    --    
  );
end entity;
--
architecture rtl of bs_atx_data_table_gen is
  --
  -- componet
  --  
  component bs_sync_gen is
    port (
      --    
      Clk : in std_logic;
      Clk_sync : in std_logic;
      user_in : in std_logic;
      user_sync_out : out std_logic
      --    
    );
  end component;
  --   
  -- signal m_rd_bs_atx_taddr : std_logic_vector(6 downto 0);
  -- signal m_rd_bs_atx_tdata : std_logic_vector(31 downto 0);
  signal reset_n_i : std_logic;
  signal rd_tstart : std_logic;
  signal rd_tstart_i : std_logic;
  signal rd_tenable : std_logic := '0';
  signal rd_tvalid : std_logic;
  signal rd_tready : std_logic;
  signal rd_tlast : std_logic;
  signal rd_taddr : std_logic_vector(6 downto 0);
  signal rd_tdata_o : std_logic_vector(31 downto 0);
  signal rd_tdata_i : std_logic_vector(31 downto 0);
  signal rd_tdata_i_i : std_logic_vector(31 downto 0);
  signal q_sel_pre : std_logic := '0';
  signal q_latch : std_logic := '0';
  --
  constant C_DATA_ZERO : std_logic_vector(DATA_WIDTH - 1 downto 0) := (others => '0');
  --
  constant a_length : natural := 12;
  constant d_length : natural := 24;
  constant SIN_ADDR_MAX : natural := 2 ** (a_length - 1) - 1;
  constant SIN_DATA_MAX : integer := 2 ** (d_length - 1) - 1;
  subtype SIN_DATA_VALUE is integer range -SIN_DATA_MAX to SIN_DATA_MAX;
  type SIN_TABLE is array (natural range <>) of SIN_DATA_VALUE;
  --
  signal t_sin : SIN_TABLE(0 to SIN_ADDR_MAX);
  --
  signal tch_data_enable : std_logic := '0';
  signal tProgramCount : std_logic_vector(31 downto 0);
  signal idx_n_sincos : std_logic_vector(a_length - 1 downto 0);
  --
begin
  --     
  sin_gen : for t in t_sin'range generate
  begin
    t_sin(t) <= SIN_DATA_VALUE(real(SIN_DATA_MAX) * sin(2.0 * MATH_PI/real(t_sin'length) * real(t)));
  end generate sin_gen;
  --
  m_axis_bs_atx_tvalid <= rd_tvalid;
  rd_tready <= m_axis_bs_atx_tready;
  m_axis_bs_atx_tlast <= rd_tlast;
  m_axis_bs_atx_tdata <= rd_tdata_o;
  --
  -- m_rd_bs_atx_taddr <= rd_taddr;
  -- rd_tdata_i <= m_rd_bs_atx_tdata;

  p_rd : process (Clk, reset_n_i)
  begin
    if (reset_n_i = '0') then
      tProgramCount <= (others => '0');
      rd_tdata_i <= (others => '0');
      idx_n_sincos <= (others => '0');
    elsif (rising_edge(Clk)) then
      if (rd_taddr = 0) then
        rd_tdata_i <= X"7F7F7F7F";
        idx_n_sincos <= tProgramCount(a_length - 1 downto 0);
      elsif (rd_taddr = 1) then
        rd_tdata_i <= tProgramCount;
      elsif (rd_taddr = ADDRESS_MAX - 1) then
        rd_tdata_i <= X"8181CCCC";
        tProgramCount <= tProgramCount + '1';
      elsif (tch_data_enable = '1') then
        -- rd_tdata_i <= X"000" & idx_n_sincos & '0' & rd_taddr(6 downto 0);
        rd_tdata_i <= X"00" & std_logic_vector(to_signed(t_sin(conv_integer(idx_n_sincos)), 24)) after 2 ns;
        idx_n_sincos <= idx_n_sincos + std_logic_vector(to_unsigned(16, a_length)); -- "0000001000";
      else
        rd_tdata_i <= C_DATA_ZERO(DATA_WIDTH - 1 downto ADDRESS_WIDTH) & rd_taddr;
      end if;
      --
      if (tch_data_enable = '0') and (rd_taddr = 35) then -- 35 : 36 from 0 to 36 is ch1
        tch_data_enable <= '1';
      end if;
      if (tch_data_enable = '1') and (rd_taddr = 72) then -- 72 : ch37 from 0 to 72 is ch37
        tch_data_enable <= '0';
      end if;
    end if;
  end process;
  --
  p_wr : process (Clk)
  begin
    --
    if (q_sel_pre = '1') and (rd_tready = '1') then
      rd_tdata_o <= rd_tdata_i_i;
    else
      rd_tdata_o <= rd_tdata_i;
    end if;
    --
    if (reset_n_i = '0') then
      rd_tenable <= '0';
      rd_tvalid <= '0';
      rd_tlast <= '0';
      rd_taddr <= (others => '0');
    elsif (rising_edge(Clk)) then
      rd_tstart_i <= rd_tstart;
      if (rd_tstart_i = '1') and (rd_tenable = '0') then
        rd_tenable <= '1';
        rd_taddr <= (others => '0');
      end if;
      --
      if (rd_tenable = '1') and (rd_tvalid = '0') then
        rd_tvalid <= '1';
      end if;
      --      
      if (rd_tenable = '1') and (rd_tvalid = '0') and (rd_tready = '1') then
        q_sel_pre <= '1';
      elsif (rd_tvalid = '1') and (rd_tready = '0') then
        q_sel_pre <= '1';
      else
        q_sel_pre <= '0';
      end if;
      --
      if (rd_tvalid = '0') then
        q_latch <= '1';
      elsif (rd_tvalid = '1') and (rd_tready = '1') then
        q_latch <= '1';
      else
        q_latch <= '0';
      end if;
      --
      if (rd_tenable = '1') and (rd_tvalid = '0') then
        rd_taddr <= rd_taddr + '1';
      elsif (rd_tvalid = '1') and (rd_tready = '1') then
        rd_taddr <= rd_taddr + '1';
      end if;
      --
      if (q_latch = '1') then
        rd_tdata_i_i <= rd_tdata_i;
      end if;
      --      
      if (rd_taddr = ADDRESS_MAX - 1) then -- 71, 72 : rvd, 73 : rvd, 74 : checksum + stop bytes
        rd_tlast <= '1';
        rd_tenable <= '0';
      end if;
      --
      if (rd_tlast = '1') and (rd_tready = '1') then
        rd_taddr <= (others => '0');
        rd_tlast <= '0';
        rd_tvalid <= '0';
        --
        --
      end if;
      --
    end if;
  end process;
  --
  --
  bs_sync_gen_0 : bs_sync_gen
  port map
  (
    --    
    Clk => Clk,
    Clk_sync => Clk,
    user_in => reset_n,
    user_sync_out => reset_n_i
    --    
  );
  --
  bs_sync_gen_1 : bs_sync_gen
  port map
  (
    --    
    Clk => Clk,
    Clk_sync => Clk,
    user_in => m_rd_bs_atx_tstart,
    user_sync_out => rd_tstart
    --    
  );
end architecture;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================