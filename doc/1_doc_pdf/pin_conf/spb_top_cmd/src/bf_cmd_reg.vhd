-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use work.SCB_2_SPB_Type.all;

entity bf_cmd_reg is
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
    m_rd_bf_cmd_reg_ram_tenable_o : out std_logic;
    m_rd_bf_cmd_reg_ram_taddr : out std_logic_vector(ADDRESS_WIDTH - 1 downto 0);
    m_rd_bf_cmd_reg_ram_tdata : in std_logic_vector(DATA_WIDTH - 1 downto 0);
    m_rd_bf_cmd_reg_ram_tnext_i : in std_logic;
    -- 
    m_axi_bf_cmd_reg_tvalid : out std_logic;
    m_axi_bf_cmd_reg_tlast : out std_logic;
    m_axi_bf_cmd_reg_tdata : out std_logic_vector(DATA_WIDTH - 1 downto 0);
    --
    s_bf_cmd_reg_ram_tclock_i : in std_logic;
    s_bf_cmd_reg_treset_n_i : in std_logic;
    s_bf_cmd_reg_tnext_o : out std_logic
    --    
  );
end entity;
--
architecture rtl of bf_cmd_reg is
  -- constant
  -- componet
  --  
  --
  -- ############################
  -- signal
  -- basic
  -- ############################
  signal m_cur_tenable : std_logic := '0';
  signal m_cur_tvaild : std_logic := '0';
  signal m_cur_tlast : std_logic := '0';
  signal m_cur_taddr : std_logic_vector(ADDRESS_WIDTH - 1 downto 0) := (others => '0');
  signal m_cur_tdata : std_logic_vector(DATA_WIDTH - 1 downto 0) := (others => '0');
  signal m_cur_start : std_logic := '0';
  --
  signal m_cur_start_i : std_logic := '0';
  signal m_cur_start_i_i : std_logic := '0';
  signal m_cur_start_i_i_i : std_logic := '0';
  --
  signal next_tvalid : std_logic := '0';
  signal next_tready : std_logic := '0';
  signal next_tlast : std_logic := '0';
  signal next_taddr : std_logic_vector(ADDRESS_WIDTH - 1 downto 0) := (others => '0');
  signal next_tdata : std_logic_vector(DATA_WIDTH - 1 downto 0) := (others => '0');
  -- 
  signal Clk : std_logic;
  signal reset_n : std_logic := '0';
  signal reset_n_i : std_logic := '0';
  signal reset_n_i_i : std_logic := '0';
  signal reset_n_i_i_i : std_logic := '0';
  -- ############################
  --
  signal m_cur_sum : std_logic_vector(15 downto 0) := (others => '0');
  signal m_cur_error_status : std_logic_vector(3 downto 0) := (others => '0'); -- sof, sum, rvd, sop
  --
  --
  signal Chan_Pkt : SCB2SPB_Pkt_300_Type;
  signal Chan_Str : std_logic_vector(2399 downto 0) := (others => '0');
  --
  signal CmdReg_Str : std_logic_vector(31 downto 0) := (others => '0');
  --
  --
  --
begin
  --
  Clk <= s_bf_cmd_reg_ram_tclock_i;
  reset_n <= s_bf_cmd_reg_treset_n_i;
  --
  m_rd_bf_cmd_reg_ram_tenable_o <= m_cur_tenable;
  m_rd_bf_cmd_reg_ram_taddr <= m_cur_taddr;
  m_cur_tdata <= m_rd_bf_cmd_reg_ram_tdata;
  m_cur_start <= m_rd_bf_cmd_reg_ram_tnext_i;
  --
  m_axi_bf_cmd_reg_tvalid <= next_tvalid;
  m_axi_bf_cmd_reg_tlast <= next_tlast;
  m_axi_bf_cmd_reg_tdata <= next_tdata;
  s_bf_cmd_reg_tnext_o <= next_tlast;
  --
  Chan_Pkt <= conv_ch_packet(Chan_Str);
  -- Chan_Str <= conv_ch_bitvector(Chan_Pkt);
  -- tdata <= Chan_Str(Word_Cnt * 32 + 31 downto Word_Cnt * 32) after 2 ns;
  --
  p_reset_n : process (Clk)
  begin
    if (rising_edge(Clk)) then
      m_cur_start_i <= m_cur_start;
      m_cur_start_i_i <= m_cur_start_i;
      m_cur_start_i_i_i <= m_cur_start_i_i;
      reset_n_i <= reset_n;
      reset_n_i_i <= reset_n_i;
      reset_n_i_i_i <= reset_n_i_i;
    end if;
  end process;

  p_wr_reg : process (Clk)
    variable Word_Cnt : natural := 0;
  begin
    if (reset_n_i_i_i = '0') then
      Word_Cnt := 0;
      m_cur_tenable <= '0';
      m_cur_tvaild <= '0';
      m_cur_tlast <= '0';
    elsif (rising_edge(Clk)) then
      if (m_cur_start_i_i_i = '0') and (m_cur_start_i_i = '1') and (m_cur_tenable = '0') then
        m_cur_tenable <= '1';
        m_cur_taddr <= (others => '0');
        Word_Cnt := 0;
        m_cur_sum <= (others => '0');
        m_cur_error_status <= (others => '0');
      end if;
      --
      if (m_cur_tenable = '1') and (m_cur_tvaild = '0') then
        m_cur_tvaild <= '1' after 1 ns;
        m_cur_taddr <= m_cur_taddr + '1';
      end if;
      --
      if (m_cur_tvaild = '1') then -- data... 
        -- cmd_reg(conv_integer(m_cur_taddr)) <= m_cur_tdata;
        Chan_Str(Word_Cnt * 32 + 31 downto Word_Cnt * 32) <= m_cur_tdata after 2 ns;
        m_cur_sum <= m_cur_sum + m_cur_tdata(31 downto 16) + m_cur_tdata(15 downto 0);
        m_cur_taddr <= m_cur_taddr + '1';
        Word_Cnt := Word_Cnt + 1;
      end if;
      --
      if (m_cur_taddr = C_CMD_END) then
        m_cur_tlast <= '1';
      end if;
      --
      if (m_cur_tlast = '1') then
        m_cur_tenable <= '0';
        m_cur_tvaild <= '0';
        m_cur_tlast <= '0';
        if(Chan_Pkt.Start_Bytes = X"7F7F7F7F") then
          m_cur_error_status(0) <= '1';
        end if;
        if(Chan_Pkt.Checksum /= m_cur_sum) then
          m_cur_error_status(1) <= '1';
        end if;
        if(Chan_Pkt.Stop_Bytes = X"8181") then
          m_cur_error_status(2) <= '1';
        end if;
      end if;
      --
    end if;
  end process;
  --
  p_tx_reg : process (Clk)
  begin
    if (reset_n_i_i_i = '0') then
      next_tvalid <= '0';
      next_tlast <= '0';
      next_tdata <= (others => '0');
    elsif (rising_edge(Clk)) then
    end if;
  end process;
  --
  --
  --
end architecture;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================