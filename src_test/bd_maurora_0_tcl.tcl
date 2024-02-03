
################################################################
# This is a generated script based on design: bd_alinx
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2023.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   if { [string compare $scripts_vivado_version $current_vivado_version] > 0 } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2042 -severity "ERROR" " This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Sourcing the script failed since it was created with a future version of Vivado."}

   } else {
     catch {common::send_gid_msg -ssname BD::TCL -id 2041 -severity "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   }

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source bd_alinx_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# bs_usec_reset_n, bs_ila_debug, bs_scb_record_gen, bs_scb_data_record_pin, bs_scb_data_record_pin

# Please add the sources of those modules before sourcing this Tcl script.

set bCheckIPsPassed 1
##################################################################
# CHECK IPs
##################################################################
set bCheckIPs 1
if { $bCheckIPs == 1 } {
   set list_check_ips "\ 
xilinx.com:ip:aurora_8b10b:11.1\
xilinx.com:ip:ila:6.2\
"

   set list_ips_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2011 -severity "INFO" "Checking if the following IPs exist in the project's IP catalog: $list_check_ips ."

   foreach ip_vlnv $list_check_ips {
      set ip_obj [get_ipdefs -all $ip_vlnv]
      if { $ip_obj eq "" } {
         lappend list_ips_missing $ip_vlnv
      }
   }

   if { $list_ips_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2012 -severity "ERROR" "The following IPs are not found in the IP Catalog:\n  $list_ips_missing\n\nResolution: Please add the repository containing the IP(s) to the project." }
      set bCheckIPsPassed 0
   }

}

##################################################################
# CHECK Modules
##################################################################
set bCheckModules 1
if { $bCheckModules == 1 } {
   set list_check_mods "\ 
bs_usec_reset_n\
bs_ila_debug\
bs_scb_record_gen\
bs_scb_data_record_pin\
bs_scb_data_record_pin\
"

   set list_mods_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2020 -severity "INFO" "Checking if the following modules exist in the project's sources: $list_check_mods ."

   foreach mod_vlnv $list_check_mods {
      if { [can_resolve_reference $mod_vlnv] == 0 } {
         lappend list_mods_missing $mod_vlnv
      }
   }

   if { $list_mods_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2021 -severity "ERROR" "The following module(s) are not found in the project: $list_mods_missing" }
      common::send_gid_msg -ssname BD::TCL -id 2022 -severity "INFO" "Please add source files for the missing module(s) above."
      set bCheckIPsPassed 0
   }
}

if { $bCheckIPsPassed != 1 } {
  common::send_gid_msg -ssname BD::TCL -id 2023 -severity "WARNING" "Will not continue with creation of design due to the error(s) above."
  return 3
}

##################################################################
# DESIGN PROCs
##################################################################


# Hierarchical cell: gen_ila_0
proc create_hier_cell_gen_ila_0 { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_gen_ila_0() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -type clk clk
  create_bd_pin -dir I -from 2399 -to 0 bitvector

  # Create instance: ila_0, and set properties
  set ila_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:ila:6.2 ila_0 ]
  set_property -dict [list \
    CONFIG.C_MONITOR_TYPE {Native} \
    CONFIG.C_NUM_OF_PROBES {64} \
    CONFIG.C_PROBE19_WIDTH {2} \
    CONFIG.C_PROBE21_WIDTH {6} \
    CONFIG.C_PROBE24_WIDTH {7} \
    CONFIG.C_PROBE26_WIDTH {8} \
    CONFIG.C_PROBE28_WIDTH {8} \
    CONFIG.C_PROBE29_WIDTH {4} \
    CONFIG.C_PROBE30_WIDTH {2} \
    CONFIG.C_PROBE40_WIDTH {2} \
    CONFIG.C_PROBE42_WIDTH {8} \
    CONFIG.C_PROBE43_WIDTH {32} \
    CONFIG.C_PROBE44_WIDTH {32} \
    CONFIG.C_PROBE45_WIDTH {32} \
    CONFIG.C_PROBE46_WIDTH {16} \
    CONFIG.C_PROBE47_WIDTH {16} \
    CONFIG.C_PROBE48_WIDTH {16} \
    CONFIG.C_PROBE49_WIDTH {16} \
    CONFIG.C_PROBE50_WIDTH {32} \
    CONFIG.C_PROBE51_WIDTH {32} \
    CONFIG.C_PROBE52_WIDTH {32} \
    CONFIG.C_PROBE53_WIDTH {32} \
    CONFIG.C_PROBE54_WIDTH {32} \
    CONFIG.C_PROBE55_WIDTH {32} \
    CONFIG.C_PROBE56_WIDTH {32} \
    CONFIG.C_PROBE57_WIDTH {32} \
    CONFIG.C_PROBE58_WIDTH {32} \
    CONFIG.C_PROBE59_WIDTH {32} \
    CONFIG.C_PROBE60_WIDTH {32} \
    CONFIG.C_PROBE61_WIDTH {32} \
    CONFIG.C_PROBE62_WIDTH {32} \
    CONFIG.C_PROBE63_WIDTH {32} \
    CONFIG.C_PROBE6_WIDTH {32} \
    CONFIG.C_PROBE7_WIDTH {8} \
    CONFIG.C_PROBE8_WIDTH {32} \
  ] $ila_0


  # Create instance: bs_scb_data_record_p_0, and set properties
  set block_name bs_scb_data_record_pin
  set block_cell_name bs_scb_data_record_p_0
  if { [catch {set bs_scb_data_record_p_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $bs_scb_data_record_p_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create port connections
  connect_bd_net -net bs_ila_debug_0_ila_data [get_bd_pins bitvector] [get_bd_pins bs_scb_data_record_p_0/bitvector]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_ACK [get_bd_pins bs_scb_data_record_p_0/pkt_ACK] [get_bd_pins ila_0/probe47]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Checksum [get_bd_pins bs_scb_data_record_p_0/pkt_Checksum] [get_bd_pins ila_0/probe48]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Command [get_bd_pins bs_scb_data_record_p_0/pkt_Command] [get_bd_pins ila_0/probe46]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Count [get_bd_pins bs_scb_data_record_p_0/pkt_Count] [get_bd_pins ila_0/probe45]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Data_CH_Data_1 [get_bd_pins bs_scb_data_record_p_0/pkt_Data_CH_Data_1] [get_bd_pins ila_0/probe50]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Data_CH_Data_2 [get_bd_pins bs_scb_data_record_p_0/pkt_Data_CH_Data_2] [get_bd_pins ila_0/probe51]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Data_CH_Data_3 [get_bd_pins bs_scb_data_record_p_0/pkt_Data_CH_Data_3] [get_bd_pins ila_0/probe52]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Data_CH_Data_4 [get_bd_pins bs_scb_data_record_p_0/pkt_Data_CH_Data_4] [get_bd_pins ila_0/probe53]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Data_CH_Data_5 [get_bd_pins bs_scb_data_record_p_0/pkt_Data_CH_Data_5] [get_bd_pins ila_0/probe54]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Data_CH_Data_6 [get_bd_pins bs_scb_data_record_p_0/pkt_Data_CH_Data_6] [get_bd_pins ila_0/probe55]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Data_CH_Data_7 [get_bd_pins bs_scb_data_record_p_0/pkt_Data_CH_Data_7] [get_bd_pins ila_0/probe56]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Data_CH_Data_31 [get_bd_pins bs_scb_data_record_p_0/pkt_Data_CH_Data_31] [get_bd_pins ila_0/probe57]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Data_CH_Data_32 [get_bd_pins bs_scb_data_record_p_0/pkt_Data_CH_Data_32] [get_bd_pins ila_0/probe58]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Data_CH_Data_33 [get_bd_pins bs_scb_data_record_p_0/pkt_Data_CH_Data_33] [get_bd_pins ila_0/probe59]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Data_CH_Data_34 [get_bd_pins bs_scb_data_record_p_0/pkt_Data_CH_Data_34] [get_bd_pins ila_0/probe60]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Data_CH_Data_35 [get_bd_pins bs_scb_data_record_p_0/pkt_Data_CH_Data_35] [get_bd_pins ila_0/probe61]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Data_CH_Data_36 [get_bd_pins bs_scb_data_record_p_0/pkt_Data_CH_Data_36] [get_bd_pins ila_0/probe62]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Data_CH_Data_37 [get_bd_pins bs_scb_data_record_p_0/pkt_Data_CH_Data_37] [get_bd_pins ila_0/probe63]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Beam_Steering_Angle [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Beam_Steering_Angle] [get_bd_pins ila_0/probe26]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Number_of_Tx [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Number_of_Tx] [get_bd_pins ila_0/probe25]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_PA_Tx_FPGA_CMD_PRI [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_PRI] [get_bd_pins ila_0/probe21]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Stave_Tx_Mode [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Stave_Tx_Mode] [get_bd_pins ila_0/probe27]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Stave_Weight [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Stave_Weight] [get_bd_pins ila_0/probe28]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx_Pulse_Interval [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx_Pulse_Interval] [get_bd_pins ila_0/probe24]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx_Reset [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx_Reset] [get_bd_pins ila_0/probe22]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx_Trigger [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx_Trigger] [get_bd_pins ila_0/probe23]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_SC_Rx_FPGA_CMD_AD_On [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_AD_On] [get_bd_pins ila_0/probe33]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_SC_Rx_FPGA_CMD_BPF_On_Off [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_BPF_On_Off] [get_bd_pins ila_0/probe35]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_SC_Rx_FPGA_CMD_DAQ_Count_Reset [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_DAQ_Count_Reset] [get_bd_pins ila_0/probe32]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Data_Path [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Data_Path] [get_bd_pins ila_0/probe41]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Gain [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Gain] [get_bd_pins ila_0/probe42]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Gain_Mode [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Gain_Mode] [get_bd_pins ila_0/probe34]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_SC_Rx_FPGA_CMD_PLC [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_PLC] [get_bd_pins ila_0/probe31]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_SC_Rx_FPGA_CMD_PLC_Mode [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_PLC_Mode] [get_bd_pins ila_0/probe40]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Pass_Active [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Pass_Active] [get_bd_pins ila_0/probe36]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_SC_Rx_FPGA_CMD_REC_Mode [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_REC_Mode] [get_bd_pins ila_0/probe30]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_SC_Rx_FPGA_CMD_REC_On_Off [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_REC_On_Off] [get_bd_pins ila_0/probe39]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Reserved [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Reserved] [get_bd_pins ila_0/probe43]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Reset [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Reset] [get_bd_pins ila_0/probe37]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Stop_Run [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Stop_Run] [get_bd_pins ila_0/probe38]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_SC_Rx_FPGA_CMD_TVG [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_TVG] [get_bd_pins ila_0/probe29]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_Save_Beam_INFO_Ethernet_On [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_Save_Beam_INFO_Ethernet_On] [get_bd_pins ila_0/probe18]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_Save_Beam_INFO_Optic_On [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_Save_Beam_INFO_Optic_On] [get_bd_pins ila_0/probe17]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_Save_Beam_INFO_Save_C [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_Save_Beam_INFO_Save_C] [get_bd_pins ila_0/probe13]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_Save_Beam_INFO_Save_L0 [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_Save_Beam_INFO_Save_L0] [get_bd_pins ila_0/probe14]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_Save_Beam_INFO_Save_L1 [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_Save_Beam_INFO_Save_L1] [get_bd_pins ila_0/probe15]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_Save_Beam_INFO_Save_L2 [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_Save_Beam_INFO_Save_L2] [get_bd_pins ila_0/probe16]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_Save_Beam_INFO_Save_L3 [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_Save_Beam_INFO_Save_L3] [get_bd_pins ila_0/probe20]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_Save_Beam_INFO_Save_R0 [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_Save_Beam_INFO_Save_R0] [get_bd_pins ila_0/probe12]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_Save_Beam_INFO_Save_R1 [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_Save_Beam_INFO_Save_R1] [get_bd_pins ila_0/probe11]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_Save_Beam_INFO_Save_R2 [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_Save_Beam_INFO_Save_R2] [get_bd_pins ila_0/probe10]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_Save_Beam_INFO_Save_R3 [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_Save_Beam_INFO_Save_R3] [get_bd_pins ila_0/probe9]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_Save_Beam_INFO_TE_Data_Input [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_Save_Beam_INFO_TE_Data_Input] [get_bd_pins ila_0/probe19]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_State_DAQCounter [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_State_DAQCounter] [get_bd_pins ila_0/probe6]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_State_FPGA_Zynq_Control_AD_On_Result [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_State_FPGA_Zynq_Control_AD_On_Result] [get_bd_pins ila_0/probe2]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_State_FPGA_Zynq_Control_DAQ_Count_Reset [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_State_FPGA_Zynq_Control_DAQ_Count_Reset] [get_bd_pins ila_0/probe1]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_State_FPGA_Zynq_Control_PA_FPGA_Reset [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_State_FPGA_Zynq_Control_PA_FPGA_Reset] [get_bd_pins ila_0/probe4]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_State_FPGA_Zynq_Control_PLC_State [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_State_FPGA_Zynq_Control_PLC_State] [get_bd_pins ila_0/probe0]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_State_FPGA_Zynq_Control_Ping_On_Off [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_State_FPGA_Zynq_Control_Ping_On_Off] [get_bd_pins ila_0/probe5]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_State_FPGA_Zynq_Control_SC_FPGA_Reset [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_State_FPGA_Zynq_Control_SC_FPGA_Reset] [get_bd_pins ila_0/probe3]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_State_SC_GainValue [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_State_SC_GainValue] [get_bd_pins ila_0/probe7]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_GC_INFO_GC_Count [get_bd_pins bs_scb_data_record_p_0/pkt_GC_INFO_GC_Count] [get_bd_pins ila_0/probe8]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Start_Bytes [get_bd_pins bs_scb_data_record_p_0/pkt_Start_Bytes] [get_bd_pins ila_0/probe44]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Stop_Bytes [get_bd_pins bs_scb_data_record_p_0/pkt_Stop_Bytes] [get_bd_pins ila_0/probe49]
  connect_bd_net -net clk_wiz_0_clk_50M [get_bd_pins clk] [get_bd_pins ila_0/clk]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: rx_ila_0
proc create_hier_cell_rx_ila_0 { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_rx_ila_0() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -type clk clk
  create_bd_pin -dir I -from 2399 -to 0 bitvector

  # Create instance: ila_0, and set properties
  set ila_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:ila:6.2 ila_0 ]
  set_property -dict [list \
    CONFIG.C_MONITOR_TYPE {Native} \
    CONFIG.C_NUM_OF_PROBES {64} \
    CONFIG.C_PROBE19_WIDTH {2} \
    CONFIG.C_PROBE21_WIDTH {6} \
    CONFIG.C_PROBE24_WIDTH {7} \
    CONFIG.C_PROBE26_WIDTH {8} \
    CONFIG.C_PROBE28_WIDTH {8} \
    CONFIG.C_PROBE29_WIDTH {4} \
    CONFIG.C_PROBE30_WIDTH {2} \
    CONFIG.C_PROBE40_WIDTH {2} \
    CONFIG.C_PROBE42_WIDTH {8} \
    CONFIG.C_PROBE43_WIDTH {32} \
    CONFIG.C_PROBE44_WIDTH {32} \
    CONFIG.C_PROBE45_WIDTH {32} \
    CONFIG.C_PROBE46_WIDTH {16} \
    CONFIG.C_PROBE47_WIDTH {16} \
    CONFIG.C_PROBE48_WIDTH {16} \
    CONFIG.C_PROBE49_WIDTH {16} \
    CONFIG.C_PROBE50_WIDTH {32} \
    CONFIG.C_PROBE51_WIDTH {32} \
    CONFIG.C_PROBE52_WIDTH {32} \
    CONFIG.C_PROBE53_WIDTH {32} \
    CONFIG.C_PROBE54_WIDTH {32} \
    CONFIG.C_PROBE55_WIDTH {32} \
    CONFIG.C_PROBE56_WIDTH {32} \
    CONFIG.C_PROBE57_WIDTH {32} \
    CONFIG.C_PROBE58_WIDTH {32} \
    CONFIG.C_PROBE59_WIDTH {32} \
    CONFIG.C_PROBE60_WIDTH {32} \
    CONFIG.C_PROBE61_WIDTH {32} \
    CONFIG.C_PROBE62_WIDTH {32} \
    CONFIG.C_PROBE63_WIDTH {32} \
    CONFIG.C_PROBE6_WIDTH {32} \
    CONFIG.C_PROBE7_WIDTH {8} \
    CONFIG.C_PROBE8_WIDTH {32} \
  ] $ila_0


  # Create instance: bs_scb_data_record_p_0, and set properties
  set block_name bs_scb_data_record_pin
  set block_cell_name bs_scb_data_record_p_0
  if { [catch {set bs_scb_data_record_p_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $bs_scb_data_record_p_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create port connections
  connect_bd_net -net bs_ila_debug_0_ila_data [get_bd_pins bitvector] [get_bd_pins bs_scb_data_record_p_0/bitvector]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_ACK [get_bd_pins bs_scb_data_record_p_0/pkt_ACK] [get_bd_pins ila_0/probe47]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Checksum [get_bd_pins bs_scb_data_record_p_0/pkt_Checksum] [get_bd_pins ila_0/probe48]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Command [get_bd_pins bs_scb_data_record_p_0/pkt_Command] [get_bd_pins ila_0/probe46]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Count [get_bd_pins bs_scb_data_record_p_0/pkt_Count] [get_bd_pins ila_0/probe45]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Data_CH_Data_1 [get_bd_pins bs_scb_data_record_p_0/pkt_Data_CH_Data_1] [get_bd_pins ila_0/probe50]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Data_CH_Data_2 [get_bd_pins bs_scb_data_record_p_0/pkt_Data_CH_Data_2] [get_bd_pins ila_0/probe51]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Data_CH_Data_3 [get_bd_pins bs_scb_data_record_p_0/pkt_Data_CH_Data_3] [get_bd_pins ila_0/probe52]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Data_CH_Data_4 [get_bd_pins bs_scb_data_record_p_0/pkt_Data_CH_Data_4] [get_bd_pins ila_0/probe53]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Data_CH_Data_5 [get_bd_pins bs_scb_data_record_p_0/pkt_Data_CH_Data_5] [get_bd_pins ila_0/probe54]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Data_CH_Data_6 [get_bd_pins bs_scb_data_record_p_0/pkt_Data_CH_Data_6] [get_bd_pins ila_0/probe55]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Data_CH_Data_7 [get_bd_pins bs_scb_data_record_p_0/pkt_Data_CH_Data_7] [get_bd_pins ila_0/probe56]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Data_CH_Data_31 [get_bd_pins bs_scb_data_record_p_0/pkt_Data_CH_Data_31] [get_bd_pins ila_0/probe57]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Data_CH_Data_32 [get_bd_pins bs_scb_data_record_p_0/pkt_Data_CH_Data_32] [get_bd_pins ila_0/probe58]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Data_CH_Data_33 [get_bd_pins bs_scb_data_record_p_0/pkt_Data_CH_Data_33] [get_bd_pins ila_0/probe59]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Data_CH_Data_34 [get_bd_pins bs_scb_data_record_p_0/pkt_Data_CH_Data_34] [get_bd_pins ila_0/probe60]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Data_CH_Data_35 [get_bd_pins bs_scb_data_record_p_0/pkt_Data_CH_Data_35] [get_bd_pins ila_0/probe61]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Data_CH_Data_36 [get_bd_pins bs_scb_data_record_p_0/pkt_Data_CH_Data_36] [get_bd_pins ila_0/probe62]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Data_CH_Data_37 [get_bd_pins bs_scb_data_record_p_0/pkt_Data_CH_Data_37] [get_bd_pins ila_0/probe63]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Beam_Steering_Angle [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Beam_Steering_Angle] [get_bd_pins ila_0/probe26]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Number_of_Tx [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Number_of_Tx] [get_bd_pins ila_0/probe25]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_PA_Tx_FPGA_CMD_PRI [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_PRI] [get_bd_pins ila_0/probe21]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Stave_Tx_Mode [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Stave_Tx_Mode] [get_bd_pins ila_0/probe27]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Stave_Weight [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Stave_Weight] [get_bd_pins ila_0/probe28]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx_Pulse_Interval [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx_Pulse_Interval] [get_bd_pins ila_0/probe24]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx_Reset [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx_Reset] [get_bd_pins ila_0/probe22]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx_Trigger [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_PA_Tx_FPGA_CMD_Tx_Trigger] [get_bd_pins ila_0/probe23]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_SC_Rx_FPGA_CMD_AD_On [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_AD_On] [get_bd_pins ila_0/probe33]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_SC_Rx_FPGA_CMD_BPF_On_Off [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_BPF_On_Off] [get_bd_pins ila_0/probe35]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_SC_Rx_FPGA_CMD_DAQ_Count_Reset [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_DAQ_Count_Reset] [get_bd_pins ila_0/probe32]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Data_Path [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Data_Path] [get_bd_pins ila_0/probe41]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Gain [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Gain] [get_bd_pins ila_0/probe42]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Gain_Mode [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Gain_Mode] [get_bd_pins ila_0/probe34]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_SC_Rx_FPGA_CMD_PLC [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_PLC] [get_bd_pins ila_0/probe31]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_SC_Rx_FPGA_CMD_PLC_Mode [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_PLC_Mode] [get_bd_pins ila_0/probe40]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Pass_Active [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Pass_Active] [get_bd_pins ila_0/probe36]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_SC_Rx_FPGA_CMD_REC_Mode [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_REC_Mode] [get_bd_pins ila_0/probe30]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_SC_Rx_FPGA_CMD_REC_On_Off [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_REC_On_Off] [get_bd_pins ila_0/probe39]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Reserved [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Reserved] [get_bd_pins ila_0/probe43]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Reset [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Reset] [get_bd_pins ila_0/probe37]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Stop_Run [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Stop_Run] [get_bd_pins ila_0/probe38]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_SC_Rx_FPGA_CMD_TVG [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_TVG] [get_bd_pins ila_0/probe29]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_Save_Beam_INFO_Ethernet_On [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_Save_Beam_INFO_Ethernet_On] [get_bd_pins ila_0/probe18]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_Save_Beam_INFO_Optic_On [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_Save_Beam_INFO_Optic_On] [get_bd_pins ila_0/probe17]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_Save_Beam_INFO_Save_C [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_Save_Beam_INFO_Save_C] [get_bd_pins ila_0/probe13]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_Save_Beam_INFO_Save_L0 [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_Save_Beam_INFO_Save_L0] [get_bd_pins ila_0/probe14]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_Save_Beam_INFO_Save_L1 [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_Save_Beam_INFO_Save_L1] [get_bd_pins ila_0/probe15]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_Save_Beam_INFO_Save_L2 [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_Save_Beam_INFO_Save_L2] [get_bd_pins ila_0/probe16]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_Save_Beam_INFO_Save_L3 [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_Save_Beam_INFO_Save_L3] [get_bd_pins ila_0/probe20]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_Save_Beam_INFO_Save_R0 [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_Save_Beam_INFO_Save_R0] [get_bd_pins ila_0/probe12]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_Save_Beam_INFO_Save_R1 [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_Save_Beam_INFO_Save_R1] [get_bd_pins ila_0/probe11]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_Save_Beam_INFO_Save_R2 [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_Save_Beam_INFO_Save_R2] [get_bd_pins ila_0/probe10]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_Save_Beam_INFO_Save_R3 [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_Save_Beam_INFO_Save_R3] [get_bd_pins ila_0/probe9]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_Save_Beam_INFO_TE_Data_Input [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_Save_Beam_INFO_TE_Data_Input] [get_bd_pins ila_0/probe19]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_State_DAQCounter [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_State_DAQCounter] [get_bd_pins ila_0/probe6]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_State_FPGA_Zynq_Control_AD_On_Result [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_State_FPGA_Zynq_Control_AD_On_Result] [get_bd_pins ila_0/probe2]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_State_FPGA_Zynq_Control_DAQ_Count_Reset [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_State_FPGA_Zynq_Control_DAQ_Count_Reset] [get_bd_pins ila_0/probe1]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_State_FPGA_Zynq_Control_PA_FPGA_Reset [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_State_FPGA_Zynq_Control_PA_FPGA_Reset] [get_bd_pins ila_0/probe4]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_State_FPGA_Zynq_Control_PLC_State [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_State_FPGA_Zynq_Control_PLC_State] [get_bd_pins ila_0/probe0]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_State_FPGA_Zynq_Control_Ping_On_Off [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_State_FPGA_Zynq_Control_Ping_On_Off] [get_bd_pins ila_0/probe5]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_State_FPGA_Zynq_Control_SC_FPGA_Reset [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_State_FPGA_Zynq_Control_SC_FPGA_Reset] [get_bd_pins ila_0/probe3]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_State_SC_GainValue [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_State_SC_GainValue] [get_bd_pins ila_0/probe7]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_GC_INFO_GC_Count [get_bd_pins bs_scb_data_record_p_0/pkt_GC_INFO_GC_Count] [get_bd_pins ila_0/probe8]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Start_Bytes [get_bd_pins bs_scb_data_record_p_0/pkt_Start_Bytes] [get_bd_pins ila_0/probe44]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Stop_Bytes [get_bd_pins bs_scb_data_record_p_0/pkt_Stop_Bytes] [get_bd_pins ila_0/probe49]
  connect_bd_net -net clk_wiz_0_clk_50M [get_bd_pins clk] [get_bd_pins ila_0/clk]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: maurora_0
proc create_hier_cell_maurora_0 { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_maurora_0() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 GT_DIFF_REFCLK1_0

  create_bd_intf_pin -mode Master -vlnv xilinx.com:display_aurora:GT_Serial_Transceiver_Pins_TX_rtl:1.0 GT_SERIAL_TX_0

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:display_aurora:GT_Serial_Transceiver_Pins_RX_rtl:1.0 GT_SERIAL_RX_0


  # Create pins
  create_bd_pin -dir O s_tstart
  create_bd_pin -dir O channel_up
  create_bd_pin -dir O -from 0 -to 0 lane_up
  create_bd_pin -dir I -type clk init_clk_in
  create_bd_pin -dir I -type rst reset
  create_bd_pin -dir I -type rst gt_reset
  create_bd_pin -dir I -type rst power_down

  # Create instance: bs_usec_reset_n_0, and set properties
  set block_name bs_usec_reset_n
  set block_cell_name bs_usec_reset_n_0
  if { [catch {set bs_usec_reset_n_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $bs_usec_reset_n_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: bs_ila_debug_0, and set properties
  set block_name bs_ila_debug
  set block_cell_name bs_ila_debug_0
  if { [catch {set bs_ila_debug_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $bs_ila_debug_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: bs_scb_record_gen_0, and set properties
  set block_name bs_scb_record_gen
  set block_cell_name bs_scb_record_gen_0
  if { [catch {set bs_scb_record_gen_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $bs_scb_record_gen_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: aurora_8b10b_0, and set properties
  set aurora_8b10b_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:aurora_8b10b:11.1 aurora_8b10b_0 ]
  set_property -dict [list \
    CONFIG.C_DRP_IF {true} \
    CONFIG.C_LANE_WIDTH {4} \
    CONFIG.C_START_LANE {X1Y6} \
    CONFIG.C_USE_BYTESWAP {true} \
    CONFIG.SupportLevel {1} \
  ] $aurora_8b10b_0


  # Create instance: rx_ila_0
  create_hier_cell_rx_ila_0 $hier_obj rx_ila_0

  # Create instance: gen_ila_0
  create_hier_cell_gen_ila_0 $hier_obj gen_ila_0

  # Create interface connections
  connect_bd_intf_net -intf_net GT_DIFF_REFCLK1_0_1 [get_bd_intf_pins GT_DIFF_REFCLK1_0] [get_bd_intf_pins aurora_8b10b_0/GT_DIFF_REFCLK1]
  connect_bd_intf_net -intf_net GT_SERIAL_RX_0_1 [get_bd_intf_pins GT_SERIAL_RX_0] [get_bd_intf_pins aurora_8b10b_0/GT_SERIAL_RX]
  connect_bd_intf_net -intf_net aurora_8b10b_0_GT_SERIAL_TX [get_bd_intf_pins GT_SERIAL_TX_0] [get_bd_intf_pins aurora_8b10b_0/GT_SERIAL_TX]
  connect_bd_intf_net -intf_net aurora_8b10b_0_USER_DATA_M_AXI_RX [get_bd_intf_pins bs_ila_debug_0/s_axis_bs_aurora_ram] [get_bd_intf_pins aurora_8b10b_0/USER_DATA_M_AXI_RX]
  connect_bd_intf_net -intf_net bs_scb_record_gen_0_m_axis [get_bd_intf_pins bs_scb_record_gen_0/m_axis] [get_bd_intf_pins aurora_8b10b_0/USER_DATA_S_AXI_TX]

  # Create port connections
  connect_bd_net -net aurora_8b10b_0_channel_up [get_bd_pins aurora_8b10b_0/channel_up] [get_bd_pins channel_up] [get_bd_pins bs_ila_debug_0/reset_2_n] [get_bd_pins bs_scb_record_gen_0/reset_2_n] [get_bd_pins bs_usec_reset_n_0/channel_up]
  connect_bd_net -net aurora_8b10b_0_lane_up [get_bd_pins aurora_8b10b_0/lane_up] [get_bd_pins lane_up] [get_bd_pins bs_ila_debug_0/reset_1_n] [get_bd_pins bs_scb_record_gen_0/reset_1_n] [get_bd_pins bs_usec_reset_n_0/lane_up]
  connect_bd_net -net aurora_8b10b_0_user_clk_out [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins bs_ila_debug_0/Clk] [get_bd_pins bs_scb_record_gen_0/Clk]
  connect_bd_net -net bs_gt_reset_0_reset [get_bd_pins reset] [get_bd_pins aurora_8b10b_0/reset]
  connect_bd_net -net bs_gt_reset_0_reset_gt [get_bd_pins gt_reset] [get_bd_pins aurora_8b10b_0/gt_reset]
  connect_bd_net -net bs_ila_debug_0_ila_data [get_bd_pins bs_ila_debug_0/ila_data] [get_bd_pins rx_ila_0/bitvector]
  connect_bd_net -net bs_scb_record_gen_0_m_record_data [get_bd_pins bs_scb_record_gen_0/m_record_data] [get_bd_pins gen_ila_0/bitvector]
  connect_bd_net -net bs_sw_led_axu15egb_0_gnd_out [get_bd_pins power_down] [get_bd_pins aurora_8b10b_0/power_down] [get_bd_pins aurora_8b10b_0/gt0_drpaddr] [get_bd_pins aurora_8b10b_0/gt0_drpen] [get_bd_pins aurora_8b10b_0/gt0_drpdi] [get_bd_pins aurora_8b10b_0/gt0_drpwe] [get_bd_pins aurora_8b10b_0/loopback]
  connect_bd_net -net bs_usec_reset_n_0_tpulse_us [get_bd_pins bs_usec_reset_n_0/tpulse_us] [get_bd_pins s_tstart] [get_bd_pins bs_scb_record_gen_0/s_tstart]
  connect_bd_net -net clk_wiz_clk_50M [get_bd_pins init_clk_in] [get_bd_pins aurora_8b10b_0/init_clk_in] [get_bd_pins gen_ila_0/clk] [get_bd_pins rx_ila_0/clk] [get_bd_pins bs_usec_reset_n_0/Clk]

  # Restore current instance
  current_bd_instance $oldCurInst
}


proc available_tcl_procs { } {
   puts "##################################################################"
   puts "# Available Tcl procedures to recreate hierarchical blocks:"
   puts "#"
   puts "#    create_hier_cell_maurora_0 parentCell nameHier"
   puts "#    create_hier_cell_rx_ila_0 parentCell nameHier"
   puts "#    create_hier_cell_gen_ila_0 parentCell nameHier"
   puts "#"
   puts "##################################################################"
}

available_tcl_procs
