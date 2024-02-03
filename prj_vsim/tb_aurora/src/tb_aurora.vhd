-- (c) Copyright 2023 Advanced Micro Devices, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Advanced Micro Devices, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- AMD, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) AMD shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or AMD had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- AMD products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of AMD products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
--

--
--  bs_duplex_aurora_8b10b_TB
--
--  Description:  This testbench instantiates 2 Aurora Sample Modules. The serial TX pins from 
--                one module are connected to the RX pins of the other and vice versa. A simple Local-Link
--                frame generator is used to generate packets for the TX data interface while a frame checker
--                module is connected to the RX data interface to check the incoming frames and keep
--                track of any errors.
--        
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use STD.TEXTIO.all;

package TB_PKG is
  procedure tbprint (message : in string);
end;

package body TB_PKG is
  function std_bool (EXP_IN : in boolean) return std_logic is
  begin
    if (EXP_IN) then
      return('1');
    else
      return('0');
    end if;
  end std_bool;

  procedure tbprint (message : in string) is
    variable outline : line;
  begin
    write(outline, string'("## Time: "));
    write(outline, NOW, RIGHT, 0, ps);
    write(outline, string'("  "));
    write(outline, string'(message));
    writeline(output, outline);
  end tbprint;
end;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use WORK.TB_PKG.all;

-- synthesis translate_off
-- library UNISIM;
-- use UNISIM.all;
-- synthesis translate_on

entity aurora_tb is
end entity;

architecture MAPPED of aurora_tb is

  --*************************Parameter Declarations**************************
  -- 125.0MHz GT Reference clock
  constant CLOCKPERIOD_1 : time := 5.0 ns; -- Board/System Clock
  constant CLOCKPERIOD_2 : time := 8.0 ns;
  constant DLY : time := 1 ns;
  --********************************Signal Declarations**********************************

  --Freerunning Clock
  signal CLK_IN1_D_0_clk_n_r : std_logic := '0';
  signal CLK_IN1_D_0_clk_p_r : std_logic := '0';
  signal GT_DIFF_REFCLK1_0_clk_n_r : std_logic := '0';
  signal GT_DIFF_REFCLK1_0_clk_p_r : std_logic := '0';
  signal bs_pl_dip_sw : std_logic_vector(3 downto 0) := (others => '0');
  signal bs_pl_led_out : std_logic_vector(3 downto 0) := (others => '0');
  -- Component Declarations --
  --GT Serial I/O
  signal rxp_1_i : std_logic_vector (0 to 0);
  signal rxn_1_i : std_logic_vector (0 to 0);
  signal txp_1_i : std_logic_vector (0 to 0);
  signal txn_1_i : std_logic_vector (0 to 0);
  -- --  
  -- signal m_axis_tx_tdata : std_logic_vector (31 downto 0);
  -- signal m_axis_tx_tlast : std_logic;
  -- signal m_axis_tx_tready : std_logic;
  -- signal m_axis_tx_tvalid : std_logic;
  -- --
  -- signal CLK_sc2sp_i : std_logic := '0';
  -- signal reset_n_i : std_logic := '0';
  -- signal bs_5us_i : std_logic := '0';
  -- signal reset_n_i_i : std_logic := '0';
  -- signal bs_5us_i_i : std_logic := '0';
  -- signal reset_i : std_logic;
  -- signal gt_reset_i : std_logic;
  -- component spb_pl_bd_wrapper is
  --   port (
  --     CLK_IN1_D_0_clk_n : in std_logic;
  --     CLK_IN1_D_0_clk_p : in std_logic;
  --     bs_pl_dip_sw_0 : in std_logic_vector (3 downto 0);
  --     bs_pl_led_out_0 : out std_logic_vector (3 downto 0)
  --   );
  -- end component;
  --
  component aurora_test_wrapper is
    port (
      CLK_IN1_D_0_clk_n : in std_logic;
      CLK_IN1_D_0_clk_p : in std_logic;
      GT_DIFF_REFCLK1_0_clk_n : in std_logic;
      GT_DIFF_REFCLK1_0_clk_p : in std_logic;
      GT_SERIAL_RX_0_rxn : in std_logic_vector (0 to 0);
      GT_SERIAL_RX_0_rxp : in std_logic_vector (0 to 0);
      GT_SERIAL_TX_0_txn : out std_logic_vector (0 to 0);
      GT_SERIAL_TX_0_txp : out std_logic_vector (0 to 0);
      bs_pl_dip_sw_0 : in std_logic_vector (3 downto 0);
      bs_pl_led_out_0 : out std_logic_vector (3 downto 0)
    );
  end component;
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
  component bs_atx_data_gen is
    port (
      --    
      m_axis_bs_atx_tvalid : out std_logic;
      m_axis_bs_atx_tready : in std_logic;
      m_axis_bs_atx_tlast : out std_logic;
      m_axis_bs_atx_tdata : out std_logic_vector(31 downto 0);

      m_rd_bs_atx_tstart : in std_logic;

      reset_n : in std_logic;
      Clk : in std_logic
      --    
    );
  end component;

  --
begin
  --_________________________GT Serial Connections________________

  rxn_1_i <= txn_1_i;
  rxp_1_i <= txp_1_i;
  --____________________________Clocks____________________________
  process
  begin
    CLK_IN1_D_0_clk_p_r <= '0';
    wait for CLOCKPERIOD_1 / 2;
    CLK_IN1_D_0_clk_p_r <= '1';
    wait for CLOCKPERIOD_1 / 2;
  end process;
  CLK_IN1_D_0_clk_n_r <= not CLK_IN1_D_0_clk_p_r;
  --____________________________Clocks____________________________
  process
  begin
    GT_DIFF_REFCLK1_0_clk_p_r <= '0';
    wait for CLOCKPERIOD_2 / 2;
    GT_DIFF_REFCLK1_0_clk_p_r <= '1';
    wait for CLOCKPERIOD_2 / 2;
  end process;
  GT_DIFF_REFCLK1_0_clk_n_r <= not GT_DIFF_REFCLK1_0_clk_p_r;
  --____________________________Clocks____________________________

  -- --____________________________Resets____________________________
  -- process
  -- begin
  --   reset_i <= '1';
  --   wait for 200 ns;
  --   reset_i <= '0';
  --   wait;
  -- end process;
  -- --____________________________Reseting PMA____________________________
  -- process
  -- begin
  --   gt_reset_i <= '1';
  --   wait for 5000 ns;
  --   gt_reset_i <= '0';
  --   wait;
  -- end process;
  --
  bs_pl_dip_sw <= "0000";
  --
  -- spb_pl_bd_wrapper_i : spb_pl_bd_wrapper
  -- port map
  -- (
  --   CLK_IN1_D_0_clk_n => CLK_IN1_D_0_clk_n_r,
  --   CLK_IN1_D_0_clk_p => CLK_IN1_D_0_clk_p_r,
  --   bs_pl_dip_sw_0(3 downto 0) => bs_pl_dip_sw(3 downto 0),
  --   bs_pl_led_out_0(3 downto 0) => bs_pl_led_out(3 downto 0)
  -- );
  --
  aurora_test_wrapper_i : aurora_test_wrapper
  port map(
    CLK_IN1_D_0_clk_n => CLK_IN1_D_0_clk_n_r,
    CLK_IN1_D_0_clk_p => CLK_IN1_D_0_clk_p_r,
    GT_DIFF_REFCLK1_0_clk_n => GT_DIFF_REFCLK1_0_clk_n_r,
    GT_DIFF_REFCLK1_0_clk_p => GT_DIFF_REFCLK1_0_clk_p_r,
    GT_SERIAL_RX_0_rxn(0) => rxn_1_i(0),
    GT_SERIAL_RX_0_rxp(0) => rxp_1_i(0),
    GT_SERIAL_TX_0_txn(0) => txn_1_i(0),
    GT_SERIAL_TX_0_txp(0) => txp_1_i(0),
    bs_pl_dip_sw_0(3 downto 0) => bs_pl_dip_sw(3 downto 0),
    bs_pl_led_out_0(3 downto 0) => bs_pl_led_out(3 downto 0)
  );
  --
  -- m_axis_tx_tvalid <= '0';
  -- m_axis_tx_tlast <= '0';
  -- m_axis_tx_tdata <= (others => '0');
  -- --
  -- bs_sync_gen_0 : bs_sync_gen
  -- port map(
  --   --    
  --   Clk => CLK_sc2sp_i,
  --   Clk_sync => CLK_sc2sp_i,
  --   user_in => bs_5us_i,
  --   user_sync_out => bs_5us_i_i
  --   --    
  -- );
  -- --
  -- bs_sync_gen_1 : bs_sync_gen
  -- port map(
  --   --    
  --   Clk => CLK_sc2sp_i,
  --   Clk_sync => CLK_sc2sp_i,
  --   user_in => reset_n_i,
  --   user_sync_out => reset_n_i_i
  --   --    
  -- );
  --
  -- bs_atx_data_gen_i : bs_atx_data_gen
  -- port map 
  -- (
  --   --    
  --   m_axis_bs_atx_tvalid => m_axis_tx_tvalid,
  --   m_axis_bs_atx_tready => m_axis_tx_tready,
  --   m_axis_bs_atx_tlast => m_axis_tx_tlast,
  --   m_axis_bs_atx_tdata => m_axis_tx_tdata,

  --   m_rd_bs_atx_tstart => bs_5us_i_i,

  --   reset_n => reset_n_i_i,
  --   Clk => CLK_sc2sp_i
  --   --    
  -- );
  --
  -- Checking CHANNEL_UP Signal
  -- process
  -- begin
  --   wait until ((channel_up_1_i and channel_up_2_i) = '1');
  --   tbprint("  ******************************************************  ");
  --   tbprint("  AURORA_TB : INFO  : CHANNEL_UP is asserted in both DUT");
  --   tbprint("  ******************************************************  ");
  --   wait for 5 us;
  --   tbprint("  AURORA_TB : INFO : Test Completed Successfully");
  --   assert FALSE
  --   report "Simulation Stopped."
  --     severity FAILURE;
  -- end process;

  -- Poll on ERR_COUNT signal and exit prematurely from simulation
  -- process
  -- begin
  --   wait until ((err_count_1_i or err_count_2_i) >= "00000001");
  --   tbprint("  **************************************************  ");
  --   tbprint("  AURORA_TB : INFO  : Data integrity check failed");
  --   tbprint("  **************************************************  ");
  --   wait for 1 us;
  --   tbprint("  AURORA_TB : ERROR : TEST FAIL");
  --   assert FALSE
  --   report "Simulation Stopped."
  --     severity FAILURE;
  -- end process;

  -- Abort the simulation when it reaches to max time limit
  -- process
  -- begin
  --   wait for 9500 us;
  --   tbprint(" *****************************************************  ");
  --   tbprint(" AURORA_TB : INFO : Reached max. simulation time limit  ");
  --   assert FALSE
  --   report "Simulation Stopped."
  --     severity FAILURE;
  -- end process;

end architecture;
-- //=============================================================================
-- //=============================================================================
-- //=============================================================================