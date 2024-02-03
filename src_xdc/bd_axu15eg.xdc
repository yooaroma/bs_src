################################################################################
## XDC generated for xczu15egffvb1156pkg (XCZU15EG-ffvb1156-2-i) device
# 125.0MHz GT Reference clock constraint
create_clock -name GT_DIFF_REFCLK1_0 -period 8.0	 [get_ports GT_DIFF_REFCLK1_0_clk_p]
####################### GT reference clock LOC #######################
# BANK228 : 228_CLK0
set_property LOC L7 [get_ports GT_DIFF_REFCLK1_0_clk_n]
set_property LOC L8 [get_ports GT_DIFF_REFCLK1_0_clk_p]
#################################################################################
#SFP1 : BANK228 : 2 port X1Y6
# set_property LOC GTHE4_CHANNEL_X1Y6 [get_cells {bd_bf_i/aurora_8b10b_0/U0/bd_bf_aurora_8b10b_0_0_core_i/gt_wrapper_i/bd_bf_aurora_8b10b_0_0_gt_i/inst/gen_gtwizard_gthe4_top.bd_bf_aurora_8b10b_0_0_gt_gtwizard_gthe4_inst/gen_gtwizard_gthe4.gen_channel_container[25].gen_enabled_channel.gthe4_channel_wrapper_inst/channel_inst/gthe4_channel_gen.gen_gthe4_channel_inst[0].GTHE4_CHANNEL_PRIM_INST}]
# set_property PACKAGE_PIN M2 [get_ports {GT_SERIAL_RX_0_rxp[0]}]
# set_property PACKAGE_PIN M1 [get_ports {GT_SERIAL_RX_0_rxn[0]}]
# set_property PACKAGE_PIN N4 [get_ports {GT_SERIAL_TX_0_txp[0]}]
# set_property PACKAGE_PIN N3 [get_ports {GT_SERIAL_TX_0_txn[0]}]
# set_property LOC N3 [get_ports GT_SERIAL_TX_0_txn]
# set_property LOC N4 [get_ports GT_SERIAL_TX_0_txp]
# set_property LOC M1 [get_ports GT_SERIAL_RX_0_rxn]
# set_property LOC M2 [get_ports GT_SERIAL_RX_0_rxp]
##SFP2 : BANK228 : 0 port X1Y4
# set_property LOC R3 [get_ports GT_SERIAL_TX_1_txn]
# set_property LOC R4 [get_ports GT_SERIAL_TX_1_txp]
# set_property LOC T1 [get_ports GT_SERIAL_RX_1_rxn]
# set_property LOC T2 [get_ports GT_SERIAL_RX_1_rxp]
############################LOC Constrain ################################
##Note: User should add LOC based upon the board
##       Below LOC's are place holders and need to be changed as per the device and board
set_property LOC AL8 [get_ports CLK_IN1_D_0_clk_p]
set_property LOC AL7 [get_ports CLK_IN1_D_0_clk_n]
# pull up.. 
set_property LOC AM13 [get_ports {m_led_out_pin_0[0]}]
set_property LOC AP12 [get_ports {m_led_out_pin_0[1]}]
# push gnd
set_property LOC AN12 [get_ports {s_dip_in_pin_0[0]}]
#
# set_property LOC D11 [get_ports s_bs_uart_rxd_0]
# set_property LOC D10 [get_ports m_bs_uart_txd_0]
#
set_property LOC G13 [get_ports {tx_disable_out_pin_0[0]}]
set_property LOC H12 [get_ports {tx_disable_out_pin_0[1]}]
#
set_property LOC H13 [get_ports {rx_loss_in_pin_0[0]}]
set_property LOC J12 [get_ports {rx_loss_in_pin_0[1]}]
#
set_property IOSTANDARD DIFF_SSTL15 [get_ports CLK_IN1_D_0_clk_p]
set_property IOSTANDARD DIFF_SSTL15 [get_ports CLK_IN1_D_0_clk_n]
#
set_property IOSTANDARD LVCMOS33 [get_ports {tx_disable_out_pin_0[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {tx_disable_out_pin_0[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rx_loss_in_pin_0[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rx_loss_in_pin_0[0]}]
#
set_property IOSTANDARD LVCMOS33 [get_ports {m_led_out_pin_0[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {m_led_out_pin_0[1]}]
#
set_property IOSTANDARD LVCMOS33 [get_ports {s_dip_in_pin_0[0]}]
#
# set_property IOSTANDARD LVCMOS33 [get_ports m_bs_uart_txd_0]
# set_property IOSTANDARD LVCMOS33 [get_ports s_bs_uart_rxd_0]
###############################
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
set_clock_groups -name sys_clk -asynchronous -group [get_clocks -of_objects [get_pins bd_alinx_i/clk_wiz/inst/mmcme4_adv_inst/CLKOUT1]]
# set_clock_groups -name sys_clk2 -asynchronous -group [get_clocks -of_objects [get_pins bd_bf_i/clk_wiz/inst/mmcme4_adv_inst/CLKOUT0]]
# set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
# set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
# set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
# connect_debug_port dbg_hub/clk [get_nets clk]