################################################################################
## XDC generated for xczu15egffvb1156pkg (XCZU15EG-ffvb1156-2-i) device
##Note: User should add LOC based upon the board
##       Below LOC's are place holders and need to be changed as per the device and board
################################################################################
#########################
set_property PACKAGE_PIN AK8 [get_ports {CLK_IN1_D_0_clk_p}]
set_property PACKAGE_PIN AK7 [get_ports {CLK_IN1_D_0_clk_n}]
#########################
set_property PACKAGE_PIN A20 [get_ports {m_led_out_pin_0[0]}]
set_property PACKAGE_PIN B20 [get_ports {m_led_out_pin_0[1]}]
set_property PACKAGE_PIN A22 [get_ports {m_led_out_pin_0[2]}]
set_property PACKAGE_PIN A21 [get_ports {m_led_out_pin_0[3]}]
#########################
set_property PACKAGE_PIN D21 [get_ports {s_dip_in_pin_0[0]}]
set_property PACKAGE_PIN C22 [get_ports {s_dip_in_pin_0[1]}]
set_property PACKAGE_PIN C21 [get_ports {s_dip_in_pin_0[2]}]
set_property PACKAGE_PIN B21 [get_ports {s_dip_in_pin_0[3]}]
#########################
#################################################################################
#########################
set_property IOSTANDARD DIFF_SSTL12 [get_ports {CLK_IN1_D_0_clk_p}]
set_property IOSTANDARD DIFF_SSTL12 [get_ports {CLK_IN1_D_0_clk_n}]
######################
set_property IOSTANDARD LVCMOS33 [get_ports {m_led_out_pin_0[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {m_led_out_pin_0[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {m_led_out_pin_0[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {m_led_out_pin_0[3]}]
######################
set_property IOSTANDARD LVCMOS33 [get_ports {s_dip_in_pin_0[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {s_dip_in_pin_0[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {s_dip_in_pin_0[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {s_dip_in_pin_0[3]}]
######################
#################################################################################
###############################
# 125.0MHz GT Reference clock constraint
create_clock -name GT_DIFF_REFCLK1_0 -period 8.0	 [get_ports GT_DIFF_REFCLK1_0_clk_p]
####################### GT reference clock LOC #######################
#################################################################################
# BANK230 : 230_X1Y12_X1Y15_CLK1_0_X1Y12_P1_P2_B10_B9
# BANK230 : 230_X1Y12_X1Y15_CLK1_2_X1Y14_P1_AH_B10_B9
# BANK230 : 230_X1Y12_X1Y15_CLK1_3_X1Y15_P1_BF_B10_B9
#################################################################################
# BANK230 : 230_X1Y12_X1Y15_CLK1_0_X1Y12_P2_BF_B10_B9
# BANK230 : 230_X1Y12_X1Y15_CLK1_2_X1Y14_P2_AH_B10_B9
# BANK230 : 230_X1Y12_X1Y15_CLK1_3_X1Y15_P2_P1_B10_B9
#################################################################################
#################################################################################
set_property PACKAGE_PIN B10 [get_ports {GT_DIFF_REFCLK1_0_clk_p}]
set_property PACKAGE_PIN B9  [get_ports {GT_DIFF_REFCLK1_0_clk_n}]
#################################################################################
#################################################################################
# set_clock_groups -asynchronous -group {clkA PLL1_c0 PLL1_c1 } -group {clkB PLL2_c0 PLL2_c1 } -group {dsp_clk PLL3_c0 PLL3_c1 PLL3_c2 }
# # Clocks A & C are never active when clocks B & D are active
# set_clock_groups -exclusive -group {A C} -group {B D}

# # Equivalent specification using false paths
# set_false_path -from [get_clocks A] -to [get_clocks B]
# set_false_path -from [get_clocks A] -to [get_clocks D]
# set_false_path -from [get_clocks C] -to [get_clocks B]
# set_false_path -from [get_clocks C] -to [get_clocks D]
# set_false_path -from [get_clocks B] -to [get_clocks A]
# set_false_path -from [get_clocks B] -to [get_clocks C]
# set_false_path -from [get_clocks D] -to [get_clocks A]
# set_false_path -from [get_clocks D] -to [get_clocks C]
###############################
set_clock_groups -name sys_clk -asynchronous -group [get_clocks -of_objects [get_pins bd_p1_i/clk_wiz/inst/mmcme4_adv_inst/CLKOUT1]]
set_clock_groups -name sys_clk2 -asynchronous -group [get_clocks -of_objects [get_pins bd_p1_i/clk_wiz/inst/mmcme4_adv_inst/CLKOUT0]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk]
#
# create_generated_clock -name clk_rx [get_pins clk_gen_i0/clk_core_i0/inst/mmcm_adv_inst/CLKOUT0] 
# create_generated_clock -name clk_tx [get_pins clk_gen_i0/clk_core_i0/inst/mmcm_adv_inst/CLKOUT1] 
# create_generated_clock -name clkfbout [get_pins clk_gen_i0/clk_core_i0/inst/mmcm_adv_inst/CLKFBOUT]
#
# bd_bf_i/aurora_8b10b_0/U0/bd_bf_aurora_8b10b_0_0_core_i/gt_wrapper_i/bd_bf_aurora_8b10b_0_0_gt_i/inst/gen_gtwizard_gthe4_top.bd_bf_aurora_8b10b_0_0_gt_gtwizard_gthe4_inst/gen_gtwizard_gthe4.gen_cpll_cal_gthe4.gen_cpll_cal_inst[0].gen_inst_cpll_cal.gtwizard_ultrascale_v1_7_17_gthe4_cpll_cal_inst/gtwizard_ultrascale_v1_7_17_gthe4_cpll_cal_tx_i/bufg_gt_txoutclkmon_inst/O
# CLK_IN1_D_0_clk_p
# clk_50M_bd_bf_clk_wiz_0
# dbg_hub/inst/BSCANID.u_xsdbm_id/SWITCH_N_EXT_BSCAN.bscan_inst/SERIES7_BSCAN.bscan_inst/INTERNAL_TCK
# GT_DIFF_REFCLK1_0
# rxoutclkpcs_out[0]
# txoutclk_out[0]
# set_false_path -from [get_clocks clk_50M_bd_bf_clk_wiz_0]
# set_false_path -to [get_clocks clk_50M_bd_bf_clk_wiz_0]
# set_false_path -from [get_clocks CLK_IN1_D_0_clk_p]
# set_false_path -to [get_clocks CLK_IN1_D_0_clk_p]
