-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use work.SCB_2_SPB_Type.all;

entity spb_top_cmd_tb is
  generic (
    ADDRESS_MAX : natural := 75; -- 300 / 4 = 75
    ADDRESS_WIDTH : natural := 7;
    ADDRESS_BANK_WIDTH : natural := 5; -- 18T (32:5)
    ADDRESS_CH_WIDTH : natural := 6; -- 37 ch (64:6)
    ADDRESS_BUFF_WIDTH : natural := 11;
    DATA_CH_WIDTH : natural := 24;
    DATA_WIDTH : natural := 32
  );
end entity;

architecture Behaviour of spb_top_cmd_tb is
  --
  --
  component bs_reset_expansion is
    generic (
      expansion_max : natural := 10 -- 10 * 5 ns = 50 ns
    );
    port (
      clk : in std_logic;
      treset_n_in : in std_logic;
      treset_n_out : out std_logic
    );
  end component;
  --
  component bs_sync_gen is
    port (
      clk : in std_logic;
      clk_sync : in std_logic;
      user_in : in std_logic;
      user_sync_out : out std_logic
    );
  end component;
  --
  component bs_pulse_5us is
    generic (
      PULSE_MAX : natural := 1000
    );
    port (
      clk : in std_logic;
      reset_n : in std_logic;
      tstart_level : in std_logic;
      tpulse_5us : out std_logic
    );
  end component;
  --  
  component bs_pulse_oneshot is
    generic (
      PULSE_ONESHOT_MAX : natural := 10 -- 10 * 5 = 50 nsec
    );
    port (
      clk : in std_logic;
      reset_n : in std_logic;
      tstart_level : in std_logic;
      tpulse_oneshot : out std_logic
    );
  end component;
  --
  component scb_cmd_gen_table is
  -- component scb_cmd_gen_ramp is
  -- component scb_cmd_gen is
    port (
      --
      -- user defined port
      --
      -- axi bus defined
      -- port
      m_axi_scb_to_spb_clk : out std_logic;
      m_axi_scb_to_spb_tvalid : out std_logic;
      m_axi_scb_to_spb_tlast : out std_logic;
      m_axi_scb_to_spb_tdata : out std_logic_vector(31 downto 0);
      --
      s_scb_cmd_clock_i : in std_logic;
      s_scb_cmd_reset_n_i : in std_logic;
      s_scb_cmd_tnext_i : in std_logic
      --     
    );
  end component;
  --
  component bf_ram is
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
  end component;
  --
  component bf_buff is
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
  end component;
  --
  component bf_main is
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
      m_axi_bf_main_tvalid : out std_logic;
      m_axi_bf_main_tready : in std_logic;
      m_axi_bf_main_tlast : out std_logic;
      m_axi_bf_main_tdata : out std_logic_vector(DATA_WIDTH - 1 downto 0);
      --
      m_rd_bf_main_tenable_o : out std_logic;
      m_rd_bf_main_taddr : out std_logic_vector(ADDRESS_BUFF_WIDTH - 1 downto 0);
      m_rd_bf_main_tdata : in std_logic_vector(DATA_CH_WIDTH - 1 downto 0);
      m_rd_bf_main_tnext_i : in std_logic;
      --
      m_bf_main_ram_tclock_i : in std_logic;
      m_bf_main_ram_treset_n_i : in std_logic;
      m_bf_main_ram_tnext_o : out std_logic
      --    
    );
  end component;
  --
  component bf_cmd_reg is
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
  end component;
  --
  --
  --
  --
  --
  --
  --
  --
  --
  --
  --
  --
  --
  --
  --
  --
  --
  --
  --
  --
  --#######################
  --# basic signal 
  --#######################
  signal tb_clk : std_logic := '0';
  signal tb_clk_1 : std_logic := '0';
  signal tb_axi_clock : std_logic := '0';
  signal tb_axi_clock_1 : std_logic := '0';
  signal tb_axi_tstart : std_logic := '0';
  signal tb_axi_reset_n : std_logic := '0';
  --
  signal tb_reset_pin_n : std_logic := '0';
  signal tb_reset_org_n : std_logic := '0';
  signal tb_reset_org_n_i : std_logic := '0';
  signal tb_reset_cmd : std_logic := '0';
  signal tb_reset_cmd_i : std_logic := '0';
  signal tb_reset_n : std_logic := '0';
  --
  --#######################
  --#######################
  --#######################
  -- bs_pulse_5us
  signal tb_pulse_start : std_logic := '0';
  signal tb_pulse_start_i : std_logic := '0';
  signal tb_pulse_5us : std_logic := '0';
  signal tb_pulse_5us_i : std_logic := '0';
  --#######################
  --#######################
  -- signal
  --#######################
  -- scb_cmd_gen
  signal tb_m_axi_scb_to_spb_clk : std_logic;
  signal tb_m_axi_scb_to_spb_tvalid : std_logic;
  signal tb_m_axi_scb_to_spb_tlast : std_logic;
  signal tb_m_axi_scb_to_spb_tdata : std_logic_vector(DATA_WIDTH - 1 downto 0);

  signal tb_s_scb_cmd_clock_i : std_logic;
  signal tb_s_scb_cmd_reset_n_i : std_logic;
  signal tb_s_scb_cmd_tnext_i : std_logic;
  --#######################
  -- bf_ram
  --#######################
  --#######################
  -- bf_buff
  signal tb_m_rd_bf_ram_tenable_o : std_logic;
  signal tb_m_rd_bf_ram_taddr : std_logic_vector(ADDRESS_WIDTH - 1 downto 0);
  signal tb_m_rd_bf_ram_tdata : std_logic_vector(DATA_WIDTH - 1 downto 0);
  signal tb_m_rd_bf_ram_tnext_i : std_logic;
  --#######################
  --#######################
  -- bf_main
  signal tb_m_rd_bf_main_tenable_o : std_logic;
  signal tb_m_rd_bf_main_taddr : std_logic_vector(ADDRESS_BUFF_WIDTH - 1 downto 0);
  signal tb_m_rd_bf_main_tdata : std_logic_vector(DATA_CH_WIDTH - 1 downto 0);
  signal tb_m_rd_bf_main_tnext_i : std_logic;
  --
  signal tb_m_axi_bf_main_tvalid : std_logic;
  signal tb_m_axi_bf_main_tready : std_logic;
  signal tb_m_axi_bf_main_tlast : std_logic;
  signal tb_m_axi_bf_main_tdata : std_logic_vector(DATA_WIDTH - 1 downto 0);
  --#######################
  --#######################
  -- bf_cmd_reg
  signal tb_m_rd_bf_cmd_reg_ram_tenable_o : std_logic;
  signal tb_m_rd_bf_cmd_reg_ram_taddr : std_logic_vector(ADDRESS_WIDTH - 1 downto 0);
  signal tb_m_rd_bf_cmd_reg_ram_tdata : std_logic_vector(DATA_WIDTH - 1 downto 0);
  signal tb_m_rd_bf_cmd_reg_ram_tnext_i : std_logic;
  --
  --#######################
  --
  --
  --
  --
  --
  --
  --
  --
  --
  --
  --
  --
  --
begin
  --
  --
  --
  --
  --
  --
  --
  --
  --
  --
  --#######################
  -- scb_cmd_gen
  tb_s_scb_cmd_clock_i <= tb_axi_clock;
  tb_s_scb_cmd_reset_n_i <= tb_reset_n;
  tb_s_scb_cmd_tnext_i <= tb_axi_tstart;
  --#######################
  --#######################
  -- bf_ram
  --#######################
  --#######################
  -- bf_buff
  --#######################
  --#######################
  -- bf_main
  tb_m_axi_bf_main_tready <= '1';
  --#######################
  --
  --
  --
  --#######################
  --# basic signal 
  --#######################
  --
  tb_reset_cmd <= '0';
  --
  tb_reset_n <= tb_reset_org_n_i and not tb_reset_cmd_i;
  --
  tb_axi_clock_1 <= not tb_axi_clock_1 after 4000 ps; -- 8 ns;
  tb_axi_clock <= not tb_axi_clock_1;
  --
  tb_clk_1 <= not tb_clk_1 after 2500 ps; -- 5 ns;
  tb_clk <= not tb_clk_1;
  --
  --
  --
  --
  --
  p_tb_tb_reset_pin_n : process
  begin
    tb_reset_pin_n <= '0';
    wait for 20 ns;
    tb_reset_pin_n <= '1';
    wait;
  end process;
  --
  --
  --
  --
  --
  p_tb_tstart : process(tb_clk,tb_reset_n)
  begin
    if(tb_reset_n = '0')then
      tb_pulse_start <= '0';
    elsif(rising_edge(tb_clk))then
      if(tb_pulse_start = '0')then
        tb_pulse_start <= '1';
      end if;
    end if;
  end process;
  --
  tb_axi_tstart <= tb_pulse_5us_i;
  --
  --#######################
  --#######################
  --#######################
  --
  --
  --  
  scb_cmd_gen_i : scb_cmd_gen_table
  -- scb_cmd_gen_i : scb_cmd_gen_ramp
  -- scb_cmd_gen_i : scb_cmd_gen
  port map
  (
    --
    -- user defined port
    --
    -- axi bus defined
    -- port
    m_axi_scb_to_spb_clk => tb_m_axi_scb_to_spb_clk,
    m_axi_scb_to_spb_tvalid => tb_m_axi_scb_to_spb_tvalid,
    m_axi_scb_to_spb_tlast => tb_m_axi_scb_to_spb_tlast,
    m_axi_scb_to_spb_tdata => tb_m_axi_scb_to_spb_tdata,
    --
    s_scb_cmd_clock_i => tb_s_scb_cmd_clock_i,
    s_scb_cmd_reset_n_i => tb_s_scb_cmd_reset_n_i,
    s_scb_cmd_tnext_i => tb_s_scb_cmd_tnext_i
    --     
  );
  --  
  bf_ram_i : bf_ram
  generic map
  (
    ADDRESS_MAX => 75, -- 300 / 4 = 75
    ADDRESS_WIDTH => 7,
    DATA_WIDTH => 32
  )
  port map
  (
    --
    -- user defined port
    --
    -- axi bus defined
    -- port
    s_axi_scb_to_spb_clk => tb_m_axi_scb_to_spb_clk,
    s_axi_scb_to_spb_reset_n => tb_axi_reset_n,
    s_axi_scb_to_spb_tvalid => tb_m_axi_scb_to_spb_tvalid,
    s_axi_scb_to_spb_tlast => tb_m_axi_scb_to_spb_tlast,
    s_axi_scb_to_spb_tdata => tb_m_axi_scb_to_spb_tdata,
    --
    s_rd_bf_ram_tenable_i => tb_m_rd_bf_ram_tenable_o,
    s_rd_bf_ram_taddr => tb_m_rd_bf_ram_taddr,
    s_rd_bf_ram_tdata => tb_m_rd_bf_ram_tdata,
    --
    s_bf_ram_clock_i => tb_clk,
    s_bf_ram_tnext_o => tb_m_rd_bf_ram_tnext_i
    --     
  );
  --
  --
  bf_buff_i : bf_buff
  generic map
  (
    ADDRESS_MAX => 75, -- 300 / 4 = 75
    ADDRESS_WIDTH => 7,
    ADDRESS_BANK_WIDTH => 5,
    ADDRESS_CH_WIDTH => 6,
    ADDRESS_BUFF_WIDTH => 11,
    DATA_CH_WIDTH => 24,
    DATA_WIDTH => 32
  )
  port map
  (
    --
    -- user defined port
    --
    -- axi bus defined
    -- port
    m_rd_bf_ram_tenable_o => tb_m_rd_bf_ram_tenable_o,
    m_rd_bf_ram_taddr => tb_m_rd_bf_ram_taddr,
    m_rd_bf_ram_tdata => tb_m_rd_bf_ram_tdata,
    m_rd_bf_ram_tnext_i => tb_m_rd_bf_ram_tnext_i,
    -- 
    s_rd_bf_main_ram_tenable_i => tb_m_rd_bf_main_tenable_o,
    s_rd_bf_main_ram_taddr => tb_m_rd_bf_main_taddr,
    s_rd_bf_main_ram_tdata => tb_m_rd_bf_main_tdata,
    --
    s_bf_main_ram_tclock_i => tb_clk,
    s_bf_main_ram_treset_n_i => tb_reset_n,
    s_bf_main_ram_tnext_o => tb_m_rd_bf_main_tnext_i
    --    
  );
  --
  bf_main_i : bf_main
  generic map
  (
    ADDRESS_MAX => 75, -- 300 / 4 = 75
    ADDRESS_WIDTH => 7,
    ADDRESS_BANK_WIDTH => 5,
    ADDRESS_CH_WIDTH => 6,
    ADDRESS_BUFF_WIDTH => 11,
    DATA_CH_WIDTH => 24,
    DATA_WIDTH => 32
  )
  port map
  (
    --
    -- user defined port
    --
    -- axi bus defined
    -- port
    m_axi_bf_main_tvalid => tb_m_axi_bf_main_tvalid,
    m_axi_bf_main_tready => tb_m_axi_bf_main_tready,
    m_axi_bf_main_tlast => tb_m_axi_bf_main_tlast,
    m_axi_bf_main_tdata => tb_m_axi_bf_main_tdata,
    --
    m_rd_bf_main_tenable_o => tb_m_rd_bf_main_tenable_o,
    m_rd_bf_main_taddr => tb_m_rd_bf_main_taddr,
    m_rd_bf_main_tdata => tb_m_rd_bf_main_tdata,
    m_rd_bf_main_tnext_i => tb_m_rd_bf_main_tnext_i,
    --
    m_bf_main_ram_tclock_i => tb_clk,
    m_bf_main_ram_treset_n_i => tb_reset_n,
    m_bf_main_ram_tnext_o => open
    --    
  );
  --
  bf_cmd_reg_ram_i : bf_ram
  generic map
  (
    ADDRESS_MAX => 75, -- 300 / 4 = 75
    ADDRESS_WIDTH => 7,
    DATA_WIDTH => 32
  )
  port map
  (
    --
    -- user defined port
    --
    -- axi bus defined
    -- port
    s_axi_scb_to_spb_clk => tb_m_axi_scb_to_spb_clk,
    s_axi_scb_to_spb_reset_n => tb_axi_reset_n,
    s_axi_scb_to_spb_tvalid => tb_m_axi_scb_to_spb_tvalid,
    s_axi_scb_to_spb_tlast => tb_m_axi_scb_to_spb_tlast,
    s_axi_scb_to_spb_tdata => tb_m_axi_scb_to_spb_tdata,
    --
    s_rd_bf_ram_tenable_i => tb_m_rd_bf_cmd_reg_ram_tenable_o,
    s_rd_bf_ram_taddr => tb_m_rd_bf_cmd_reg_ram_taddr,
    s_rd_bf_ram_tdata => tb_m_rd_bf_cmd_reg_ram_tdata,
    --
    s_bf_ram_clock_i => tb_clk,
    s_bf_ram_tnext_o => tb_m_rd_bf_cmd_reg_ram_tnext_i
    --     
  );
  --  
  bf_cmd_reg_i : bf_cmd_reg
  generic map
  (
    ADDRESS_MAX => 75, -- 300 / 4 = 75
    ADDRESS_WIDTH => 7,
    DATA_WIDTH => 32
  )
  port map
  (
    --
    -- user defined port
    --
    -- axi bus defined
    -- port
    --    
    m_rd_bf_cmd_reg_ram_tenable_o => tb_m_rd_bf_cmd_reg_ram_tenable_o,
    m_rd_bf_cmd_reg_ram_taddr => tb_m_rd_bf_cmd_reg_ram_taddr,
    m_rd_bf_cmd_reg_ram_tdata => tb_m_rd_bf_cmd_reg_ram_tdata,
    m_rd_bf_cmd_reg_ram_tnext_i => tb_m_rd_bf_cmd_reg_ram_tnext_i,
    --
    m_axi_bf_cmd_reg_tvalid => open, -- tb_m_axi_bf_cmd_reg_tvalid,
    m_axi_bf_cmd_reg_tlast => open, -- tb_m_axi_bf_cmd_reg_tlast,
    m_axi_bf_cmd_reg_tdata => open, -- tb_m_axi_bf_cmd_reg_tdata,
    --
    s_bf_cmd_reg_ram_tclock_i => tb_clk,
    s_bf_cmd_reg_treset_n_i => tb_reset_n,
    s_bf_cmd_reg_tnext_o => open
    --   
  );
  --
  --
  bs_sync_reset_n_i : bs_sync_gen
  port map
  (
    clk => tb_clk,
    clk_sync => tb_clk,
    user_in => tb_reset_org_n,
    user_sync_out => tb_reset_org_n_i
  );
  --
  bs_sync_axi_reset_n_i : bs_sync_gen
  port map
  (
    clk => tb_clk,
    clk_sync => tb_axi_clock,
    user_in => tb_reset_n,
    user_sync_out => tb_axi_reset_n
  );
  --
  bs_sync_reset_cmd_i : bs_sync_gen
  port map
  (
    clk => tb_clk,
    clk_sync => tb_clk,
    user_in => tb_reset_cmd,
    user_sync_out => tb_reset_cmd_i
  );
  --

  bs_pulse_5us_i : bs_pulse_5us
  generic map
  (
    PULSE_MAX => 1000
  )
  port map
  (
    clk => tb_clk,
    reset_n => tb_reset_n,
    tstart_level => tb_pulse_start_i,
    tpulse_5us => tb_pulse_5us
  );
  --
  bs_sync_pulse_5us_i : bs_sync_gen
  port map
  (
    clk => tb_clk,
    clk_sync => tb_axi_clock,
    user_in => tb_pulse_5us,
    user_sync_out => tb_pulse_5us_i
  );
  --
  bs_pulse_oneshot_i : bs_pulse_oneshot
  generic map
  (
    PULSE_ONESHOT_MAX => 10 -- 10 * 5 = 50 nsec
  )
  port map
  (
    clk => tb_clk,
    reset_n => tb_reset_n,
    tstart_level => tb_pulse_start,
    tpulse_oneshot => tb_pulse_start_i
  );
  --  
  bs_reset_expansion_i : bs_reset_expansion
  generic map
  (
    expansion_max => 10 -- 10 * 5 ns = 50 ns
  )
  port map
  (
    clk => tb_clk,
    treset_n_in => tb_reset_pin_n,
    treset_n_out => tb_reset_org_n
  );
  --
  --
  --
  --
  --
  --
  --
  --
  --
  --
  --
  --
  --
  --
  --
  --
  --
  --
  --
  --
  --
  --
end architecture;
--
--
--
--
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================