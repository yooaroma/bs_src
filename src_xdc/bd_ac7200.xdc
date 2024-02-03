 
################################################################################
##
## (c) Copyright 2010-2023 Advanced Micro Devices, Inc. All rights reserved.
##
## This file contains confidential and proprietary information
## of Advanced Micro Devices, Inc. and is protected under U.S. and
## international copyright and other intellectual property
## laws.
##
## DISCLAIMER
## This disclaimer is not a license and does not grant any
## rights to the materials distributed herewith. Except as
## otherwise provided in a valid license issued to you by
## AMD, and to the maximum extent permitted by applicable
## law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
## WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
## AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
## BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
## INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
## (2) AMD shall not be liable (whether in contract or tort,
## including negligence, or under any other theory of
## liability) for any loss or damage of any kind or nature
## related to, arising under or in connection with these
## materials, including for any direct, or any indirect,
## special, incidental, or consequential loss or damage
## (including loss of data, profits, goodwill, or any type of
## loss or damage suffered as a result of any action brought
## by a third party) even if such damage or loss was
## reasonably foreseeable or AMD had been advised of the
## possibility of the same.
##
## CRITICAL APPLICATIONS
## AMD products are not designed or intended to be fail-
## safe, or for use in any application requiring fail-safe
## performance, such as life-support or safety devices or
## systems, Class III medical devices, nuclear facilities,
## applications related to the deployment of airbags, or any
## other applications that could lead to death, personal
## injury, or severe property or environmental damage
## (individually and collectively, "Critical
## Applications"). Customer assumes the sole risk and
## liability of any use of AMD products in Critical
## Applications, subject only to applicable laws and
## regulations governing limitations on product liability.
##
## THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
## PART OF THIS FILE AT ALL TIMES.
##
##
################################################################################
## XDC generated for xc7a200tfbg484-2 device
# 125.0MHz GT Reference clock constraint
#create_clock -name GT_DIFF_REFCLK1_0 -period 8.0	 [get_ports GT_DIFF_REFCLK1_0_clk_p]
####################### GT reference clock LOC #######################
# set_property LOC E6 [get_ports GT_DIFF_REFCLK1_0_clk_n]
# set_property LOC F6 [get_ports GT_DIFF_REFCLK1_0_clk_p]

# SYNC_CLK constraint : Value is selected based on the line rate (3.125 Gbps) and lane width (4-Byte)
# create_clock -name sync_clk_i -period 6.4	 [get_pins aurora_top_i/aurora_module_i/clock_module_i/clkout1_buf/I]

# USER_CLK constraint : Value is selected based on the line rate (3.125 Gbps) and lane width (4-Byte)
# create_clock -name user_clk_i -period 12.8	 [get_pins aurora_top_i/aurora_module_i/clock_module_i/clkout0_buf/I]

# 20.0 ns period Board Clock Constraint 
#create_clock -name init_clk_i -period 20.0 [get_ports INIT_CLK_P]
#create_clock -name init_clk_i -period 20.0 [get_nets aurora_top_i/init_clk_i]

# 10.000	 ns period DRP Clock Constraint 
#create_clock -name drp_clk_i -period 10.000	 [get_ports DRP_CLK_IN]
#create_clock -name drpclk_i -period 20.000	 [get_nets aurora_top_i/drpclk_i]

###### CDC in RESET_LOGIC from INIT_CLK to USER_CLK ##############

# set_false_path -to [get_pins -filter {REF_PIN_NAME=~*D} -of_objects [get_cells -hierarchical -filter {NAME =~ *bs_cdc_to*}]]

# set_false_path -from [get_clocks -of_objects [get_pins u_INT_DESIGN/design_1_i/SYS_Main/inst/mmcme3_adv_inst/CLKOUT0]] -to [get_clocks -of_objects [get_pins u_INT_DESIGN/design_1_i/APDI_SYM_CLK_RnM/inst/mmcme3_adv_inst/CLKOUT0]]
# set_false_path -from [get_clocks -of_objects [get_pins -hierarchical "*SYS_Main/clk_out1*"]] -to [get_clocks -of_objects [get_pins -hierarchical "*APDI_SYM_CLK_RnM/clk_out1*"]]
#set_false_path -from [get_clocks -of_objects [get_pins -hierarchical "*clk_200MHz*"]] -to [get_clocks -of_objects [get_pins -hierarchical "*GT_REFCLK1*"]]

#set_false_path -from [get_clocks -of_objects [get_pins bs_cmd_scb_i/no_rom_test.dpram_sync_32_i/CLK]] -to [get_clocks -of_objects [get_pins bs_cmd_scb_i/dpram_test.bs_rom_gen_i/CLK]]
#bs_cmd_scb_i/no_rom_test.dpram_sync_32_i/CLK
#bs_cmd_scb_i/dpram_test.bs_rom_gen_i/CLK

#set_false_path -from [get_pins clk_check_i]
#set_false_path -from [get_clocks -of_objects [get_pins pll_i/clk_out1]] -to [get_clocks -of_objects [ get_pins pll_i/clk_in1] ]
#set DESIGN_CLOCKS {wclk rclk}
#foreach CLK_FROM $DESIGN_CLOCKS {
#set_false_path -from $CLK_FROM -to [remove_from_collection [all_clocks] $CLK_FROM]
#}


#################################################################################
#SFP1
# set_property LOC B4 [get_ports GT_SERIAL_TX_0_txp]
# set_property LOC A4 [get_ports GT_SERIAL_TX_0_txn]
# set_property LOC B8 [get_ports GT_SERIAL_RX_0_rxp]
# set_property LOC A8 [get_ports GT_SERIAL_RX_0_rxn]
##SFP2
#set_property LOC D5 [get_ports TXP]
#set_property LOC C5 [get_ports TXN]
#set_property LOC D11 [get_ports RXP]
#set_property LOC C11 [get_ports RXN]
#SFP3
#set_property LOC B6 [get_ports TXP]
#set_property LOC A6 [get_ports TXN]
#set_property LOC B10 [get_ports RXP]
#set_property LOC A10 [get_ports RXN]
#SFP4
#set_property LOC D7 [get_ports TXP]
#set_property LOC C7 [get_ports TXN]
#set_property LOC D9 [get_ports RXP]
#set_property LOC C9 [get_ports RXN]

# 20.0 ns period Board Clock Constraint 
#create_clock -name CLK_IN1_D_0 -period 5.0 [get_ports CLK_IN1_D_0_clk_p]
#create_clock -name init_clk_i -period 20.0 [get_ports INIT_CLK_P]

############################LOC Constrain ################################
##Note: User should add LOC based upon the board
##       Below LOC's are place holders and need to be changed as per the device and board
set_property LOC R4 [get_ports CLK_IN1_D_0_clk_p]
set_property LOC T4 [get_ports CLK_IN1_D_0_clk_n]

#set_property LOC T6 [get_ports FPGA_RST_N_PAD]
set_property LOC W5 [get_ports {m_led_out_pin_0[2]}]
set_property LOC E17 [get_ports {m_led_out_pin_0[0]}]
set_property LOC F16 [get_ports {m_led_out_pin_0[1]}]
set_property LOC D16 [get_ports {s_dip_in_pin_0[0]}]
set_property LOC E16 [get_ports {s_dip_in_pin_0[1]}]
# set_property LOC AA15 [get_ports m_bs_uart_rxd_0]
set_property LOC AB15 [get_ports m_bs_uart_txd_0]

set_property LOC A15 [get_ports {tx_disable_out_pin_0[0]}]
set_property LOC A16 [get_ports {tx_disable_out_pin_0[1]}]
set_property LOC A13 [get_ports {tx_disable_out_pin_0[2]}]
set_property LOC A14 [get_ports {tx_disable_out_pin_0[3]}]

set_property LOC B15 [get_ports {rx_loss_in_pin_0[0]}]
set_property LOC B16 [get_ports {rx_loss_in_pin_0[1]}]
set_property LOC C14 [get_ports {rx_loss_in_pin_0[2]}]
set_property LOC C15 [get_ports {rx_loss_in_pin_0[3]}]

set_property IOSTANDARD DIFF_SSTL15 [get_ports CLK_IN1_D_0_clk_p]
set_property IOSTANDARD DIFF_SSTL15 [get_ports CLK_IN1_D_0_clk_n]

set_property IOSTANDARD LVCMOS33 [get_ports {tx_disable_out_pin_0[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {tx_disable_out_pin_0[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {tx_disable_out_pin_0[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {tx_disable_out_pin_0[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rx_loss_in_pin_0[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rx_loss_in_pin_0[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rx_loss_in_pin_0[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rx_loss_in_pin_0[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports FPGA_RST_N_PAD]
set_property IOSTANDARD LVCMOS33 [get_ports {m_led_out_pin_0[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {m_led_out_pin_0[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {m_led_out_pin_0[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {s_dip_in_pin_0[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {s_dip_in_pin_0[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports m_bs_uart_txd_0]
# set_property IOSTANDARD LVCMOS33 [get_ports m_bs_uart_rxd_0]
###############################
# entity bd_aurora_wrapper is
#   port (
#     CLK_IN1_D_0_clk_n : in STD_LOGIC;
#     CLK_IN1_D_0_clk_p : in STD_LOGIC;
#     GT_DIFF_REFCLK1_0_clk_n : in STD_LOGIC;
#     GT_DIFF_REFCLK1_0_clk_p : in STD_LOGIC;
#     GT_SERIAL_RX_0_rxn : in STD_LOGIC_VECTOR ( 0 to 0 );
#     GT_SERIAL_RX_0_rxp : in STD_LOGIC_VECTOR ( 0 to 0 );
#     GT_SERIAL_TX_0_txn : out STD_LOGIC_VECTOR ( 0 to 0 );
#     GT_SERIAL_TX_0_txp : out STD_LOGIC_VECTOR ( 0 to 0 );
#     m_bs_uart_txd_0 : out STD_LOGIC;
#     m_led_out_pin_0 : out STD_LOGIC_VECTOR ( 2 downto 0 );
#     rx_loss_in_pin_0 : in STD_LOGIC_VECTOR ( 3 downto 0 );
#     s_dip_in_pin_0 : in STD_LOGIC_VECTOR ( 1 downto 0 );
#     tx_disable_out_pin_0 : out STD_LOGIC_VECTOR ( 3 downto 0 )
#   );
# end bd_aurora_wrapper;
##################### Locatoin constrain #########################
##Note: User should add LOC based upon the board
#       Below LOC's are place holders and need to be changed as per the device and board
#set_property LOC D17 [get_ports INIT_CLK_P]
#set_property LOC D18 [get_ports INIT_CLK_N]
#set_property LOC G19 [get_ports RESET]
#set_property LOC K18 [get_ports GT_RESET_IN]
#set_property LOC A20 [get_ports CHANNEL_UP]
#set_property LOC A17 [get_ports LANE_UP]
#set_property LOC Y15 [get_ports HARD_ERR]   
#set_property LOC AH10 [get_ports SOFT_ERR]   
#set_property LOC AD16 [get_ports ERR_COUNT[0]]   
#set_property LOC Y19 [get_ports ERR_COUNT[1]]   
#set_property LOC Y18 [get_ports ERR_COUNT[2]]   
#set_property LOC AA18 [get_ports ERR_COUNT[3]]   
#set_property LOC AB18 [get_ports ERR_COUNT[4]]   
#set_property LOC AB19 [get_ports ERR_COUNT[5]]   
#set_property LOC AC19 [get_ports ERR_COUNT[6]]   
#set_property LOC AB17 [get_ports ERR_COUNT[7]]   
#set_property LOC AC17 [get_ports FRAME_ERR]
    
    
#set_property LOC AG29 [get_ports DRP_CLK_IN]
#// DRP CLK needs a clock LOC

##Note: User should add IOSTANDARD based upon the board
#       Below IOSTANDARD's are place holders and need to be changed as per the device and board
#set_property IOSTANDARD DIFF_HSTL_II_18 [get_ports INIT_CLK_P]
#set_property IOSTANDARD DIFF_HSTL_II_18 [get_ports INIT_CLK_N]
#set_property IOSTANDARD LVCMOS18 [get_ports RESET]
#set_property IOSTANDARD LVCMOS18 [get_ports GT_RESET_IN]

#set_property IOSTANDARD LVCMOS18 [get_ports CHANNEL_UP]
#set_property IOSTANDARD LVCMOS18 [get_ports LANE_UP]
#set_property IOSTANDARD LVCMOS18 [get_ports HARD_ERR]   
#set_property IOSTANDARD LVCMOS18 [get_ports SOFT_ERR]   
#set_property IOSTANDARD LVCMOS18 [get_ports ERR_COUNT[0]]   
#set_property IOSTANDARD LVCMOS18 [get_ports ERR_COUNT[1]]   
#set_property IOSTANDARD LVCMOS18 [get_ports ERR_COUNT[2]]   
#set_property IOSTANDARD LVCMOS18 [get_ports ERR_COUNT[3]]   
#set_property IOSTANDARD LVCMOS18 [get_ports ERR_COUNT[4]]   
#set_property IOSTANDARD LVCMOS18 [get_ports ERR_COUNT[5]]   
#set_property IOSTANDARD LVCMOS18 [get_ports ERR_COUNT[6]]   
#set_property IOSTANDARD LVCMOS18 [get_ports ERR_COUNT[7]]   
#set_property IOSTANDARD LVCMOS18 [get_ports FRAME_ERR]
    
    
#set_property IOSTANDARD LVCMOS18 [get_ports DRP_CLK_IN]
#// DRP CLK needs a clock IOSTDLOC
    
##################################################################


############################### GT LOC ###################################
#set_property LOC GTPE2_CHANNEL_X0Y4 [get_cells aurora_top_i/aurora_module_i/bs_aurora_8b10b_i/U0/gt_wrapper_i/bs_aurora_8b10b_multi_gt_i/gt0_bs_aurora_8b10b_i/gtpe2_i]

#connect_debug_port dbg_hub/clk [get_nets init_clk_i]
  
