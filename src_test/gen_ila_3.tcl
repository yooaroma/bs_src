
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
# bs_scb_data_record_pin

# Please add the sources of those modules before sourcing this Tcl script.

set bCheckIPsPassed 1
##################################################################
# CHECK IPs
##################################################################
set bCheckIPs 1
if { $bCheckIPs == 1 } {
   set list_check_ips "\ 
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
    CONFIG.C_NUM_OF_PROBES {10} \
    CONFIG.C_PROBE6_WIDTH {32} \
    CONFIG.C_PROBE7_WIDTH {32} \
    CONFIG.C_PROBE8_WIDTH {32} \
    CONFIG.C_PROBE9_WIDTH {16} \
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
  connect_bd_net -net Net [get_bd_pins clk] [get_bd_pins ila_0/clk]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Count [get_bd_pins bs_scb_data_record_p_0/pkt_Count] [get_bd_pins ila_0/probe7]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Reserved [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_CMD_SC_Rx_FPGA_CMD_Reserved] [get_bd_pins ila_0/probe8]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_State_Trigger_State_TE_RX_TRIG [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_State_Trigger_State_TE_RX_TRIG] [get_bd_pins ila_0/probe1]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_State_Trigger_State_TE_TX_TRIG [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_State_Trigger_State_TE_TX_TRIG] [get_bd_pins ila_0/probe0]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_State_Trigger_State_TX_P_GATE [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_State_Trigger_State_TX_P_GATE] [get_bd_pins ila_0/probe3]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_FPGA_State_Trigger_State_TX_TRIG [get_bd_pins bs_scb_data_record_p_0/pkt_FPGA_State_Trigger_State_TX_TRIG] [get_bd_pins ila_0/probe2]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Start_Bytes [get_bd_pins bs_scb_data_record_p_0/pkt_Start_Bytes] [get_bd_pins ila_0/probe6]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Stop_Bytes [get_bd_pins bs_scb_data_record_p_0/pkt_Stop_Bytes] [get_bd_pins ila_0/probe9]
  connect_bd_net -net bs_scb_record_gen_0_m_record_data [get_bd_pins bitvector] [get_bd_pins bs_scb_data_record_p_0/bitvector]

  # Restore current instance
  current_bd_instance $oldCurInst
}


proc available_tcl_procs { } {
   puts "##################################################################"
   puts "# Available Tcl procedures to recreate hierarchical blocks:"
   puts "#"
   puts "#    create_hier_cell_gen_ila_0 parentCell nameHier"
   puts "#"
   puts "##################################################################"
}

available_tcl_procs
