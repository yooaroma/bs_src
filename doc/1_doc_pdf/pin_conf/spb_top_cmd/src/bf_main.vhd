-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use work.SCB_2_SPB_Type.all;
use work.bs_define.all;

entity bf_main is
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
end entity;
--
architecture rtl of bf_main is
  --
  -- componet
  --  

  --
  -- componet
  --  

  -- component dpram_chip
  --   generic (
  --     ADDRESS_WIDTH : natural := (C_5_CH_DELAY_BIT_WIDTH + C_6_CH_BIT_WIDTH); -- 11; -- [18][37] -- 5 + 6 =  11
  --     DATA_WIDTH : natural := (C_24_CH_DATA_BIT) -- 24 bit...
  --   );
  --   port (
  --     clka : in std_logic;
  --     clkb : in std_logic;
  --     wea : in std_logic;
  --     addra : in std_logic_vector((ADDRESS_WIDTH - 1) downto 0);
  --     addrb : in std_logic_vector((ADDRESS_WIDTH - 1) downto 0);
  --     dia : in std_logic_vector((DATA_WIDTH - 1) downto 0);
  --     dob : out std_logic_vector((DATA_WIDTH - 1) downto 0)
  --   );
  -- end component;
  --
  component ct_dir_delay -- ct_dir_delay --
    generic (
      ADDRESS_WIDTH : natural := (C_3_DIR_BIT_WIDTH + C_6_CH_BIT_WIDTH); -- DIR + CH -- ; -- 9; -- [7][37]
      DATA_WIDTH : natural := C_5_CH_DELAY_BIT_WIDTH -- 5 -- 0 to 18
    );
    port (
      clock : in std_logic;
      address : in std_logic_vector ((ADDRESS_WIDTH - 1) downto 0);
      data_output : out std_logic_vector ((DATA_WIDTH - 1) downto 0)
    );
  end component;
  --
  component ct_dir_weight -- ct_dir_weight --
    generic (
      ADDRESS_WIDTH : natural := (C_3_DIR_BIT_WIDTH + C_6_CH_BIT_WIDTH); -- DIR + CH -- ; -- [7][37]
      DATA_WIDTH : natural := C_16_DIR_W_DATA_BIT -- 16 bit...
    );
    port (
      clock : in std_logic;
      address : in std_logic_vector ((ADDRESS_WIDTH - 1) downto 0);
      data_output : out std_logic_vector ((DATA_WIDTH - 1) downto 0)
    );
  end component;
  -- --
  component c_pos_mux -- c_pos_mux --
    generic (
      data_input_length : natural := C_46_DIR_SUM_DATA_BIT; -- 40; -- RxSig(24) * mDirBeamWeight(16)
      data_output_length : natural := C_46_DIR_SUM_DATA_BIT; -- 46; -- RxSig(24) * mDirBeamWeight(16) , 37 channel plus (6bit)
      weight_length : natural := (C_2_POS_W_BIT_WIDTH) -- 2 -- 24 bit...
    );
    port (
      clock : in std_logic;
      enable : in std_logic;
      weight : in std_logic_vector ((weight_length - 1) downto 0);
      data_input_1 : in std_logic_vector ((data_input_length - 1) downto 0);
      data_input_2 : in std_logic_vector ((data_input_length - 1) downto 0);
      data_output : out std_logic_vector ((data_output_length - 1) downto 0)
    );
  end component;
  --  
  component ct_pos_ele_weight -- 
    generic (
      ADDRESS_WIDTH : natural := (C_6_CH_BIT_WIDTH); -- 9; -- [7][37]
      DATA_WIDTH : natural := (2) --
    );
    port (
      clock : in std_logic;
      address : in std_logic_vector ((ADDRESS_WIDTH - 1) downto 0);
      data_up_output : out std_logic_vector ((DATA_WIDTH - 1) downto 0);
      data_down_output : out std_logic_vector ((DATA_WIDTH - 1) downto 0);
      data_right_output : out std_logic_vector ((DATA_WIDTH - 1) downto 0);
      data_left_output : out std_logic_vector ((DATA_WIDTH - 1) downto 0)
    );
  end component;
  --
  --
  --
  --
  signal bf_delay_19_enable : std_logic := '0';
  signal pipeline_idx : std_logic_vector(5 downto 0) := (others => '0');
  signal pipeline_s_en : std_logic := '0';
  signal pipeline_e_en : std_logic := '0';
  signal pipeline_1_en : std_logic := '0';
  signal pipeline_2_en : std_logic := '0';
  signal pipeline_3_en : std_logic := '0';
  signal pipeline_4_en : std_logic := '0';
  signal pipeline_5_en : std_logic := '0';
  signal pipeline_6_en : std_logic := '0';
  signal pipeline_7_en : std_logic := '0';
  signal pipeline_8_en : std_logic := '0';
  signal pipeline_9_en : std_logic := '0';
  signal pipeline_a_en : std_logic := '0';
  signal pipeline_0_en : std_logic := '0';
  --
  signal bf_reset_wr_ext_sync_buf : std_logic_vector(2 downto 0) := (others => '0');
  signal bf_reset_wr_ext_sync_low : std_logic := '0'; -- 
  signal bf_reset_rd_ext_sync_buf : std_logic_vector(2 downto 0) := (others => '0');
  signal bf_reset_rd_ext_sync_low : std_logic := '0'; -- 
  signal bf_reset_wr_sw_low : std_logic := '0'; -- 
  signal bf_reset_rd_sw_sync_buf : std_logic_vector(2 downto 0) := (others => '0');
  signal bf_reset_rd_sw_sync_low : std_logic := '0'; -- 
  signal bf_reset_rd_all_sync_buf : std_logic_vector(2 downto 0) := (others => '0');
  signal bf_reset_rd_all_sync_low : std_logic := '0'; -- 
  signal bf_reset_rd_self_buf : std_logic_vector(7 downto 0) := (others => '0');
  signal bf_reset_rd_self_low : std_logic := '0';
  --
  signal ram_wr_en : std_logic := '0';
  signal ram_rd_en : std_logic := '0';
  signal ram_wr_address : std_logic_vector((C_5_CH_DELAY_BIT_WIDTH + C_6_CH_BIT_WIDTH - 1) downto 0) := (others => '0');
  signal p3_ram_rd_address : std_logic_vector((C_5_CH_DELAY_BIT_WIDTH + C_6_CH_BIT_WIDTH - 1) downto 0) := (others => '0');
  signal ram_data_in : std_logic_vector ((C_24_CH_DATA_BIT - 1) downto 0);
  signal ram_data_out : std_logic_vector ((C_24_CH_DATA_BIT - 1) downto 0);
  signal p4_ram_data_out : std_logic_vector ((C_24_CH_DATA_BIT - 1) downto 0);
  --
  signal bf_wr_ch_idx : std_logic_vector((C_6_CH_BIT_WIDTH - 1) downto 0) := (others => '0');
  signal bf_wr_tdelay_idx : std_logic_vector((C_5_CH_DELAY_BIT_WIDTH - 1) downto 0) := (others => '0');
  signal bf_wr_idx : std_logic_vector(7 downto 0) := (others => '0');
  signal bf_axi_rx_tlast_delay : std_logic := '0';
  type delay_idx_buf_type is array (1 downto 0) of std_logic_vector((C_5_CH_DELAY_BIT_WIDTH - 1) downto 0);
  signal bf_wr_tdelay_idx_buf : delay_idx_buf_type := (others => (others => '0'));
  signal bf_wr_tdelay_idx_sync : std_logic_vector((C_5_CH_DELAY_BIT_WIDTH - 1) downto 0) := (others => '0');
  signal bf_rd_buff_idx : std_logic_vector((C_5_CH_DELAY_BIT_WIDTH - 1) downto 0) := (others => '0');
  signal ps_bf_rd_buff_idx : std_logic_vector((C_5_CH_DELAY_BIT_WIDTH - 1) downto 0) := (others => '0');
  --
  signal bf_rd_ch_idx : std_logic_vector((C_6_CH_BIT_WIDTH - 1) downto 0) := (others => '0');
  signal p1_bf_rd_ch_idx : std_logic_vector((C_6_CH_BIT_WIDTH - 1) downto 0) := (others => '0');
  signal p2_bf_rd_ch_idx : std_logic_vector((C_6_CH_BIT_WIDTH - 1) downto 0) := (others => '0');
  signal p3_bf_rd_ch_idx : std_logic_vector((C_6_CH_BIT_WIDTH - 1) downto 0) := (others => '0');
  signal p4_bf_rd_ch_idx : std_logic_vector((C_6_CH_BIT_WIDTH - 1) downto 0) := (others => '0');
  signal p5_bf_rd_ch_idx : std_logic_vector((C_6_CH_BIT_WIDTH - 1) downto 0) := (others => '0');
  signal p6_bf_rd_ch_idx : std_logic_vector((C_6_CH_BIT_WIDTH - 1) downto 0) := (others => '0');
  signal p7_bf_rd_ch_idx : std_logic_vector((C_6_CH_BIT_WIDTH - 1) downto 0) := (others => '0');
  signal p8_bf_rd_ch_idx : std_logic_vector((C_6_CH_BIT_WIDTH - 1) downto 0) := (others => '0');
  signal bf_wr_tdelay_idx_sync_check : std_logic_vector((C_5_CH_DELAY_BIT_WIDTH - 1) downto 0) := (others => '0');
  --
  signal bf_dir_idx : std_logic_vector((C_3_DIR_BIT_WIDTH - 1) downto 0) := (others => '0'); --
  -- signal dir_delay_weight_tbl_enable : std_logic := '0';
  signal p1_dir_delay_weight_tbl_addr : std_logic_vector((C_3_DIR_BIT_WIDTH + C_6_CH_BIT_WIDTH - 1) downto 0) := (others => '0');
  signal p2_dir_delay_tbl_data : std_logic_vector((C_5_CH_DELAY_BIT_WIDTH - 1) downto 0) := (others => '0'); --
  --
  signal p2_dir_weight_tbl_data : std_logic_vector((C_16_DIR_W_DATA_BIT - 1) downto 0) := (others => '0');
  signal p3_dir_weight_tbl_data : std_logic_vector((C_16_DIR_W_DATA_BIT - 1) downto 0) := (others => '0');
  signal p4_dir_weight_tbl_data : std_logic_vector((C_16_DIR_W_DATA_BIT - 1) downto 0) := (others => '0');
  --
  signal p5_pos_weight_mul_data_in : std_logic_vector (C_40_DIR_MUL_DATA_BIT - 1 downto 0) := (others => '0');
  signal p6_pos_weight_mul_data_in_1 : std_logic_vector (C_46_DIR_SUM_DATA_BIT - 1 downto 0) := (others => '0');
  signal p6_pos_weight_mul_data_in_2 : std_logic_vector (C_46_DIR_SUM_DATA_BIT - 1 downto 0) := (others => '0');
  --
  signal p7_pos_data_out_s : std_logic_vector (C_46_DIR_SUM_DATA_BIT - 1 downto 0) := (others => '0');
  signal p7_pos_data_out_up : std_logic_vector (C_46_DIR_SUM_DATA_BIT - 1 downto 0) := (others => '0');
  signal p7_pos_data_out_down : std_logic_vector (C_46_DIR_SUM_DATA_BIT - 1 downto 0) := (others => '0');
  signal p7_pos_data_out_right : std_logic_vector (C_46_DIR_SUM_DATA_BIT - 1 downto 0) := (others => '0');
  signal p7_pos_data_out_left : std_logic_vector (C_46_DIR_SUM_DATA_BIT - 1 downto 0) := (others => '0');
  -- 
  signal p7_bf_data_sum_s : std_logic_vector (C_46_DIR_SUM_DATA_BIT - 1 downto 0) := (others => '0');
  signal p7_bf_data_sum_up : std_logic_vector (C_46_DIR_SUM_DATA_BIT - 1 downto 0) := (others => '0');
  signal p7_bf_data_sum_down : std_logic_vector (C_46_DIR_SUM_DATA_BIT - 1 downto 0) := (others => '0');
  signal p7_bf_data_sum_right : std_logic_vector (C_46_DIR_SUM_DATA_BIT - 1 downto 0) := (others => '0');
  signal p7_bf_data_sum_left : std_logic_vector (C_46_DIR_SUM_DATA_BIT - 1 downto 0) := (others => '0');
  -- 
  -- signal p6_pos_element_sum_weight_part : std_logic_vector(1 downto 0) := (others => '0');
  signal p6_pos_element_up_weight_part : std_logic_vector(1 downto 0) := (others => '0');
  signal p6_pos_element_down_weight_part : std_logic_vector(1 downto 0) := (others => '0');
  signal p6_pos_element_right_weight_part : std_logic_vector(1 downto 0) := (others => '0');
  signal p6_pos_element_left_weight_part : std_logic_vector(1 downto 0) := (others => '0');
  --
  signal t_bf_dir_odata : bf_output_type := (others => (others => '0')); -- [POST:SUM,UP,DOWN,RIGHT,LEFT] 
  --  
  --
  signal last_check_start_s : std_logic := '0';
  signal last_check_cnt_s : std_logic_vector(4 downto 0) := "00000";
  signal last_check_tcnt_s : std_logic_vector(6 downto 0) := "0000000";
  signal last_check_tvalid : std_logic := '0';
  signal last_check_tready : std_logic := '0';
  signal last_check_tlast : std_logic := '0';
  signal last_check_tdata : std_logic_vector(31 downto 0) := (others => '0');
  --
  -- use work.SCB_2_SPB_Type.all;
  -- constant
  -- constant C_DATA_ZERO : std_logic_vector(DATA_WIDTH - 1 downto 0) := (others => '0');
  -- constant C_CH_START : std_logic_vector(ADDRESS_WIDTH - 1 downto 0) := std_logic_vector(to_unsigned(36, ADDRESS_WIDTH)); -- X"24"; -- ch1 : 36 from 0
  -- constant C_CH_END : std_logic_vector(ADDRESS_WIDTH - 1 downto 0) := std_logic_vector(to_unsigned(72, ADDRESS_WIDTH)); -- X"48"; -- ch37 : 72 from 0
  -- constant C_CMD_END_N1 : std_logic_vector(ADDRESS_WIDTH - 1 downto 0) := std_logic_vector(to_unsigned(73, ADDRESS_WIDTH)); -- X"49"; -- 73 
  -- constant C_CMD_END : std_logic_vector(ADDRESS_WIDTH - 1 downto 0) := std_logic_vector(to_unsigned(74, ADDRESS_WIDTH)); -- X"4A"; -- 74 : from 0 , 300 byte / 4 = 75
  -- constant C_CMD_END_P1 : std_logic_vector(ADDRESS_WIDTH - 1 downto 0) := std_logic_vector(to_unsigned(75, ADDRESS_WIDTH)); -- X"4B"; -- 75
  constant C_BF_START_T : natural := 19;
  -- signal
  signal Clk : std_logic := '0';
  signal reset_n : std_logic := '0';
  signal tstart : std_logic := '0';
  signal tstart_i : std_logic := '0';
  signal tdelay_19T : std_logic_vector(C_BF_START_T downto 0) := (others => '0');
  signal tpipeline_start : std_logic := '0';
  signal tpipeline_cnt : std_logic_vector(5 downto 0) := (others => '0');
  signal tbf_dir_idx : std_logic_vector(2 downto 0) := (others => '0');
  --
  --
begin
  --
  m_bf_main_ram_tnext_o <= pipeline_e_en;
  --  
  m_axi_bf_main_tvalid <= last_check_tvalid;
  last_check_tready <= m_axi_bf_main_tready;
  m_axi_bf_main_tlast <= last_check_tlast;
  m_axi_bf_main_tdata <= last_check_tdata;
  --
  Clk <= m_bf_main_ram_tclock_i;
  reset_n <= m_bf_main_ram_treset_n_i;
  tstart <= m_rd_bf_main_tnext_i;
  -- dpram read data
  m_rd_bf_main_tenable_o <= '1';
  m_rd_bf_main_taddr <= p3_ram_rd_address;
  p4_ram_data_out <= m_rd_bf_main_tdata;
  --  
  p_delay_19T : process (Clk, tstart, reset_n)
  begin
    if (reset_n = '0') then
      tdelay_19T <= (others => '0');
      tpipeline_start <= '0';
      tpipeline_cnt <= (others => '0');
      tbf_dir_idx <= (others => '0');
    elsif (rising_edge(Clk)) then
      tstart_i <= tstart after 1 ns;
      --
      if (tstart = '1') and (tstart_i = '0') then
        if (tdelay_19T(1 downto 0) = "01") then
          bf_rd_buff_idx <= "00000";
        else
          bf_rd_buff_idx <= bf_rd_buff_idx + '1';
        end if;
        tdelay_19T <= tdelay_19T(C_BF_START_T - 1 downto 0) & '1' after 1 ns;
        tpipeline_start <= '1';
        tpipeline_cnt <= (others => '0');
        tbf_dir_idx <= (others => '0');
      end if;
      --
      if (tpipeline_start = '1') then
        if (tpipeline_cnt = std_logic_vector(to_unsigned(51, 6))) then
          tbf_dir_idx <= tbf_dir_idx + '1';
          tpipeline_cnt <= std_logic_vector(to_unsigned(1, 6));
        else
          tpipeline_cnt <= tpipeline_cnt + '1';
        end if;
        --
        if (tpipeline_cnt = 0) then
          pipeline_s_en <= '1';
          pipeline_e_en <= '0';
        elsif (tpipeline_cnt = 1) then
          pipeline_s_en <= '0';
        elsif (tpipeline_cnt = 2) then
          pipeline_1_en <= '1';
        elsif (tpipeline_cnt = 39) then
          pipeline_1_en <= '0';
        elsif (tpipeline_cnt = 50) then
          pipeline_a_en <= '1';
        elsif (tpipeline_cnt = 51) then
          pipeline_a_en <= '0';
        end if;
        pipeline_2_en <= pipeline_1_en;
        pipeline_3_en <= pipeline_2_en;
        pipeline_4_en <= pipeline_3_en;
        pipeline_5_en <= pipeline_4_en;
        pipeline_6_en <= pipeline_5_en;
        pipeline_7_en <= pipeline_6_en;
        pipeline_8_en <= pipeline_7_en;
        pipeline_9_en <= pipeline_8_en;
        --
        if (tbf_dir_idx = "111") then
          tpipeline_start <= '0';
          pipeline_e_en <= '1';
        end if;
      else
        pipeline_e_en <= '0';
        tpipeline_cnt <= (others => '0');
        tbf_dir_idx <= (others => '0');
      end if;
    end if;
  end process;
  --
  --
  --
  pipeline_s_init : process (Clk)
    -- veriable
  begin
    if (rising_edge(Clk) and pipeline_s_en = '1') then
      ps_bf_rd_buff_idx <= bf_rd_buff_idx;
    end if;
  end process pipeline_s_init;
  --
  pipeline_1_gen_addr : process (Clk)
    -- [vnIndexDirBeam][vnIndexChannel]
    variable v_bf_rd_ch_idx : natural := 0;
  begin
    if (rising_edge(Clk) and pipeline_1_en = '1') then
      p1_bf_rd_ch_idx <= bf_rd_ch_idx;
      p1_dir_delay_weight_tbl_addr <= bf_dir_idx & bf_rd_ch_idx;
      v_bf_rd_ch_idx := conv_integer(bf_rd_ch_idx);
      v_bf_rd_ch_idx := v_bf_rd_ch_idx + 1;
      if (v_bf_rd_ch_idx > 36) then
        v_bf_rd_ch_idx := 0;
      end if;
      bf_rd_ch_idx <= std_logic_vector(to_unsigned(v_bf_rd_ch_idx, C_6_CH_BIT_WIDTH));
    end if;
  end process pipeline_1_gen_addr;
  --
  pipeline_2_tbl_data : process (Clk)
    -- U2_ct_dir_delay
    -- U3_ct_dir_weight
    --
  begin
    if (rising_edge(Clk) and pipeline_2_en = '1') then
      p2_bf_rd_ch_idx <= p1_bf_rd_ch_idx;
    end if;
  end process pipeline_2_tbl_data;
  --
  pipeline_3_tbl_data : process (Clk)
    -- vnIndexDelayTimeTmp = mDirBeamDelay[vnIndexDirBeam][vnIndexChannel];
    -- vfWeightChannelTmp = mDirBeamWeight[vnIndexDirBeam][vnIndexChannel];
    -- U2_ct_dir_delay
    -- U3_ct_dir_weight
    -- [vnIndexTime - vnIndexDelayTimeTmp][vnIndexChannel]
    --
    variable v_dir_delay_tbl_data : natural := 0;
    variable v_bf_rd_buff_idx : natural := 0;
    --
  begin
    if (rising_edge(Clk) and pipeline_3_en = '1') then
      p3_bf_rd_ch_idx <= p2_bf_rd_ch_idx;
      p3_dir_weight_tbl_data <= p2_dir_weight_tbl_data;
      v_dir_delay_tbl_data := conv_integer(p2_dir_delay_tbl_data);
      v_bf_rd_buff_idx := conv_integer(ps_bf_rd_buff_idx);
      if (v_bf_rd_buff_idx >= v_dir_delay_tbl_data) then
        v_bf_rd_buff_idx := v_bf_rd_buff_idx - v_dir_delay_tbl_data;
      else
        v_bf_rd_buff_idx := v_bf_rd_buff_idx + (32 - v_dir_delay_tbl_data);
      end if;
      p3_ram_rd_address <= std_logic_vector(to_unsigned(v_bf_rd_buff_idx, C_5_CH_DELAY_BIT_WIDTH)) & p2_bf_rd_ch_idx; -- after 10 ps;
    end if;
  end process pipeline_3_tbl_data;
  --
  pipeline_4_tbl_data : process (Clk)
    -- vfRxSigTmp = pmRxSig[vnIndexTime - vnIndexDelayTimeTmp][vnIndexChannel];
    -- U4_dpram_chip  : p4_ram_data_out
  begin
    if (rising_edge(Clk) and pipeline_4_en = '1') then
      p4_bf_rd_ch_idx <= p3_bf_rd_ch_idx;
      p4_dir_weight_tbl_data <= p3_dir_weight_tbl_data;
    end if;
  end process pipeline_4_tbl_data;
  --
  pipeline_5_mul_data : process (Clk)
    -- vfRxSigWeightTmp = vfRxSigTmp * vfWeightChannelTmp;
    -- 1870 * -6757799 = -12,637,084,130 = 2 F13A 99E2   FD 0EC5 661E
    -- 1870 * 10,019,417(98 E259)= 18,736,309,790
    -- 247817758  
    variable vdata_in_a24 : signed(C_24_CH_DATA_BIT - 1 downto 0);
    variable vdata_in_b16 : signed(C_16_DIR_W_DATA_BIT - 1 downto 0);
    variable vdata_output : signed(C_40_DIR_MUL_DATA_BIT - 1 downto 0);
  begin
    if (rising_edge(Clk) and pipeline_5_en = '1') then
      p5_bf_rd_ch_idx <= p4_bf_rd_ch_idx;
      vdata_in_a24 := signed(p4_ram_data_out);
      vdata_in_b16 := signed(p4_dir_weight_tbl_data);
      vdata_output := vdata_in_a24 * vdata_in_b16;
      p5_pos_weight_mul_data_in <= std_logic_vector(vdata_output);
    end if;
  end process pipeline_5_mul_data;
  --
  pipeline_6_sum_data : process (Clk)
    variable vdata_output : signed(C_40_DIR_MUL_DATA_BIT - 1 downto 0);
    variable vdata_output_1 : signed(C_46_DIR_SUM_DATA_BIT - 1 downto 0);
    variable vdata_output_2 : signed(C_46_DIR_SUM_DATA_BIT - 1 downto 0);
    --
  begin
    if (rising_edge(Clk) and pipeline_6_en = '1') then
      vdata_output := signed(p5_pos_weight_mul_data_in);
      p6_bf_rd_ch_idx <= p5_bf_rd_ch_idx;
      if (vdata_output(C_40_DIR_MUL_DATA_BIT - 1) = '0') then
        vdata_output_1 := B"000000" & vdata_output;
      else
        vdata_output_1 := B"111111" & vdata_output;
      end if;
      vdata_output_2 := vdata_output_1 + vdata_output_1;
      p6_pos_weight_mul_data_in_1 <= std_logic_vector(vdata_output_1);
      p6_pos_weight_mul_data_in_2 <= std_logic_vector(vdata_output_2);
      -- p6_pos_element_sum_weight_part <= B"01"; -- 
      -- p6_pos_element_up_weight_part <= B"01"; -- pos_element_weight_full(1 downto 0);
      -- p6_pos_element_down_weight_part <= B"01"; -- pos_element_weight_full(3 downto 2);
      -- p6_pos_element_right_weight_part <= B"01"; -- pos_element_weight_full(5 downto 4);
      -- p6_pos_element_left_weight_part <= B"01"; -- pos_element_weight_full(7 downto 6);
    end if;
  end process pipeline_6_sum_data;
  --
  pipeline_7_sum_data : process (Clk)
    --
  begin
    if (rising_edge(Clk) and pipeline_7_en = '1') then
      p7_bf_rd_ch_idx <= p6_bf_rd_ch_idx;
      p7_pos_data_out_s <= p6_pos_weight_mul_data_in_1;
      -- p7_pos_data_out_up
      -- p7_pos_data_out_down
      -- p7_pos_data_out_right
      -- p7_pos_data_out_left
    end if;
  end process pipeline_7_sum_data;
  --
  pipeline_8_sum_data : process (Clk)
    -- U4_up_c_pos_mux
    -- U4_down_c_pos_mux
    -- U4_right_c_pos_mux
    -- U4_left_c_pos_mux
    -- sum = sum + pos_weight for ch1 to ch37
    variable vbf_dir_sum_data_s : signed ((C_46_DIR_SUM_DATA_BIT - 1) downto 0);
    variable vbf_dir_sum_data_up : signed ((C_46_DIR_SUM_DATA_BIT - 1) downto 0);
    variable vbf_dir_sum_data_down : signed ((C_46_DIR_SUM_DATA_BIT - 1) downto 0);
    variable vbf_dir_sum_data_right : signed ((C_46_DIR_SUM_DATA_BIT - 1) downto 0);
    variable vbf_dir_sum_data_left : signed ((C_46_DIR_SUM_DATA_BIT - 1) downto 0);
    --
    variable vbf_pos_data_out_s : signed ((C_46_DIR_SUM_DATA_BIT - 1) downto 0);
    variable vbf_pos_data_out_up : signed ((C_46_DIR_SUM_DATA_BIT - 1) downto 0);
    variable vbf_pos_data_out_down : signed ((C_46_DIR_SUM_DATA_BIT - 1) downto 0);
    variable vbf_pos_data_out_right : signed ((C_46_DIR_SUM_DATA_BIT - 1) downto 0);
    variable vbf_pos_data_out_left : signed ((C_46_DIR_SUM_DATA_BIT - 1) downto 0);
    --
  begin
    --
    if (rising_edge(Clk) and pipeline_8_en = '1') then
      p8_bf_rd_ch_idx <= p7_bf_rd_ch_idx;
      --
      if (p7_bf_rd_ch_idx = B"000000") then
        vbf_dir_sum_data_s := (others => '0');
        vbf_dir_sum_data_up := (others => '0');
        vbf_dir_sum_data_down := (others => '0');
        vbf_dir_sum_data_right := (others => '0');
        vbf_dir_sum_data_left := (others => '0');
      else
        vbf_dir_sum_data_s := signed(p7_bf_data_sum_s);
        vbf_dir_sum_data_up := signed(p7_bf_data_sum_up);
        vbf_dir_sum_data_down := signed(p7_bf_data_sum_down);
        vbf_dir_sum_data_right := signed(p7_bf_data_sum_right);
        vbf_dir_sum_data_left := signed(p7_bf_data_sum_left);
      end if;
      --
      vbf_pos_data_out_s := signed(p7_pos_data_out_s);
      vbf_pos_data_out_up := signed(p7_pos_data_out_up);
      vbf_pos_data_out_down := signed(p7_pos_data_out_down);
      vbf_pos_data_out_right := signed(p7_pos_data_out_right);
      vbf_pos_data_out_left := signed(p7_pos_data_out_left);
      --
      vbf_dir_sum_data_s := vbf_dir_sum_data_s + vbf_pos_data_out_s;
      vbf_dir_sum_data_up := vbf_dir_sum_data_up + vbf_pos_data_out_up;
      vbf_dir_sum_data_down := vbf_dir_sum_data_down + vbf_pos_data_out_down;
      vbf_dir_sum_data_right := vbf_dir_sum_data_right + vbf_pos_data_out_right;
      vbf_dir_sum_data_left := vbf_dir_sum_data_left + vbf_pos_data_out_left;
      --      
      p7_bf_data_sum_s <= std_logic_vector(vbf_dir_sum_data_s);
      p7_bf_data_sum_up <= std_logic_vector(vbf_dir_sum_data_up);
      p7_bf_data_sum_down <= std_logic_vector(vbf_dir_sum_data_down);
      p7_bf_data_sum_right <= std_logic_vector(vbf_dir_sum_data_right);
      p7_bf_data_sum_left <= std_logic_vector(vbf_dir_sum_data_left);
      --
    end if;
  end process pipeline_8_sum_data;
  --
  --
  --
  --
  --

  --
  --
  pipeline_9_bf_last_check : process (Clk)
    --
  begin
    if (rising_edge(Clk) and pipeline_9_en = '1') then
      --
    end if;
  end process pipeline_9_bf_last_check;
  --
  --
  --
  --
  --
  --
  pipeline_a_bf_last_check : process (Clk)
  begin
    if (reset_n = '0') then
      last_check_start_s <= '0';
      last_check_tvalid <= '0';
      last_check_tlast <= '0';
      last_check_tcnt_s <= (others => '0'); -- 7 
      last_check_cnt_s <= (others => '0');
      last_check_tdata <= (others => '0');
    elsif (rising_edge(Clk)) then
      if (pipeline_a_en = '1') then
        t_bf_dir_odata(0) <= p7_bf_data_sum_s((C_46_DIR_SUM_DATA_BIT - 1) downto (C_46_DIR_SUM_DATA_BIT - 1 - 31));
        t_bf_dir_odata(1) <= p7_bf_data_sum_up((C_46_DIR_SUM_DATA_BIT - 1) downto (C_46_DIR_SUM_DATA_BIT - 1 - 31));
        t_bf_dir_odata(2) <= p7_bf_data_sum_down((C_46_DIR_SUM_DATA_BIT - 1) downto (C_46_DIR_SUM_DATA_BIT - 1 - 31));
        t_bf_dir_odata(3) <= p7_bf_data_sum_right((C_46_DIR_SUM_DATA_BIT - 1) downto (C_46_DIR_SUM_DATA_BIT - 1 - 31));
        t_bf_dir_odata(4) <= p7_bf_data_sum_left((C_46_DIR_SUM_DATA_BIT - 1) downto (C_46_DIR_SUM_DATA_BIT - 1 - 31));
        last_check_cnt_s <= (others => '0');
        if (tdelay_19T(C_BF_START_T) = '1') then
          last_check_start_s <= '1';
          last_check_tcnt_s <= last_check_tcnt_s(5 downto 0) & '1';
        end if;
      end if;
      if (last_check_start_s = '1') then
        if (last_check_tvalid = '0') and (last_check_tready = '1') then
          last_check_tvalid <= '1';
          last_check_tdata <= t_bf_dir_odata(0);
          t_bf_dir_odata(0) <= t_bf_dir_odata(1);
          t_bf_dir_odata(1) <= t_bf_dir_odata(2);
          t_bf_dir_odata(2) <= t_bf_dir_odata(3);
          t_bf_dir_odata(3) <= t_bf_dir_odata(4);
          last_check_cnt_s <= last_check_cnt_s(3 downto 0) & '1';
          if (last_check_tcnt_s(6) = '1') and (last_check_cnt_s(3) = '1') then
            last_check_tlast <= '1';
          end if;
        end if;
        if (last_check_tvalid = '1') then
          last_check_tvalid <= '0';
        end if;
        if (last_check_tvalid = '1') and (last_check_cnt_s(4) = '1') then
          last_check_cnt_s <= (others => '0');
          last_check_start_s <= '0';
          if (last_check_tcnt_s(6) = '1') then
            last_check_tcnt_s <= (others => '0'); -- 7 
            last_check_tlast <= '0';
          end if;
        end if;
      end if;
    end if;
  end process pipeline_a_bf_last_check;
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
  U2_ct_dir_delay : ct_dir_delay
  port map
  (
    clock => Clk,
    address => p1_dir_delay_weight_tbl_addr,
    data_output => p2_dir_delay_tbl_data
  );
  --
  U2_ct_dir_weight : ct_dir_weight
  port map
  (
    clock => Clk,
    address => p1_dir_delay_weight_tbl_addr,
    data_output => p2_dir_weight_tbl_data
  );
  --
  -- U4_dpram_chip : dpram_chip port map(
  --   clka => bf_axi_clk_in,
  --   clkb => Clk,
  --   wea => ram_wr_en,
  --   addra => ram_wr_address,
  --   addrb => p3_ram_rd_address,
  --   dia => ram_data_in,
  --   dob => p4_ram_data_out);
  --
  U6_ct_pos_ele_weight : ct_pos_ele_weight
  port map
  (
    clock => Clk,
    address => p5_bf_rd_ch_idx,
    data_up_output => p6_pos_element_up_weight_part,
    data_down_output => p6_pos_element_down_weight_part,
    data_right_output => p6_pos_element_right_weight_part,
    data_left_output => p6_pos_element_left_weight_part
  );
  --
  U7_up_c_pos_mux : c_pos_mux
  port map
  (
    clock => Clk,
    enable => pipeline_7_en,
    weight => p6_pos_element_up_weight_part,
    data_input_1 => p6_pos_weight_mul_data_in_1,
    data_input_2 => p6_pos_weight_mul_data_in_2,
    data_output => p7_pos_data_out_up
  );
  --
  U7_down_c_pos_mux : c_pos_mux
  port map
  (
    clock => Clk,
    enable => pipeline_7_en,
    weight => p6_pos_element_down_weight_part,
    data_input_1 => p6_pos_weight_mul_data_in_1,
    data_input_2 => p6_pos_weight_mul_data_in_2,
    data_output => p7_pos_data_out_down
  );
  --
  U7_right_c_pos_mux : c_pos_mux
  port map
  (
    clock => Clk,
    enable => pipeline_7_en,
    weight => p6_pos_element_right_weight_part,
    data_input_1 => p6_pos_weight_mul_data_in_1,
    data_input_2 => p6_pos_weight_mul_data_in_2,
    data_output => p7_pos_data_out_right
  );
  --
  U7_left_c_pos_mux : c_pos_mux
  port map
  (
    clock => Clk,
    enable => pipeline_7_en,
    weight => p6_pos_element_left_weight_part,
    data_input_1 => p6_pos_weight_mul_data_in_1,
    data_input_2 => p6_pos_weight_mul_data_in_2,
    data_output => p7_pos_data_out_left
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

end architecture;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================