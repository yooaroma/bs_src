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
library UNISIM;
use UNISIM.all;
-- synthesis translate_on

entity tb_p1 is
end entity;

architecture MAPPED of tb_p1 is

  --*************************Parameter Declarations**************************
  -- 125.0MHz GT Reference clock
  constant CLOCKPERIOD_1 : time := 5.0 ns;
  constant DLY : time := 1 ns;
  --********************************Signal Declarations**********************************

  --Freerunning Clock
  signal CLK_IN1_D_0_clk_p_r : std_logic := '0';
  signal CLK_IN1_D_0_clk_n_r : std_logic := '0';
  signal bs_pl_dip_sw : std_logic_vector(3 downto 0) := (others => '0');
  signal bs_pl_led_out : std_logic_vector(3 downto 0) := (others => '0');
  -- Component Declarations --
  component bd_p1_wrapper is
    port (
      CLK_IN1_D_0_clk_n : in std_logic;
      CLK_IN1_D_0_clk_p : in std_logic;
      bs_pl_dip_sw_0 : in std_logic_vector (3 downto 0);
      bs_pl_led_out_0 : out std_logic_vector (3 downto 0)
    );
  end component;
  --
begin
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
  bs_pl_dip_sw <= "0000";
  --
  bd_p1_wrapper_i : bd_p1_wrapper
  port map
  (
    CLK_IN1_D_0_clk_n => CLK_IN1_D_0_clk_n_r,
    CLK_IN1_D_0_clk_p => CLK_IN1_D_0_clk_p_r,
    bs_pl_dip_sw_0(3 downto 0) => bs_pl_dip_sw(3 downto 0),
    bs_pl_led_out_0(3 downto 0) => bs_pl_led_out(3 downto 0)
  );
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