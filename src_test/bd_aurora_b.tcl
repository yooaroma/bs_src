
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
# bs_usec_reset_n, bs_sw_led_axu15egb, bs_scb_record_gen, bs_reset, bs_reset, bs_ila_debug, bs_scb_record_gen, bs_ila_debug, bs_usec_reset_n, bs_scb_data_record_pin, bs_scb_data_record_pin, bs_scb_data_record_pin, bs_scb_data_record_pin

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xczu15eg-ffvb1156-2-i
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name bd_alinx

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_gid_msg -ssname BD::TCL -id 2001 -severity "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_gid_msg -ssname BD::TCL -id 2002 -severity "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_gid_msg -ssname BD::TCL -id 2003 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_gid_msg -ssname BD::TCL -id 2004 -severity "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_gid_msg -ssname BD::TCL -id 2005 -severity "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_gid_msg -ssname BD::TCL -id 2006 -severity "ERROR" $errMsg}
   return $nRet
}

set bCheckIPsPassed 1
##################################################################
# CHECK IPs
##################################################################
set bCheckIPs 1
if { $bCheckIPs == 1 } {
   set list_check_ips "\ 
xilinx.com:ip:clk_wiz:6.0\
xilinx.com:ip:aurora_8b10b:11.1\
xilinx.com:ip:util_vector_logic:2.0\
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
bs_sw_led_axu15egb\
bs_scb_record_gen\
bs_reset\
bs_reset\
bs_ila_debug\
bs_scb_record_gen\
bs_ila_debug\
bs_usec_reset_n\
bs_scb_data_record_pin\
bs_scb_data_record_pin\
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


# Hierarchical cell: gen_ila_debug_2
proc create_hier_cell_gen_ila_debug_2 { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_gen_ila_debug_2() - Empty argument(s)!"}
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
    CONFIG.C_NUM_OF_PROBES {6} \
    CONFIG.C_PROBE0_WIDTH {32} \
    CONFIG.C_PROBE1_WIDTH {32} \
    CONFIG.C_PROBE2_WIDTH {32} \
    CONFIG.C_PROBE3_WIDTH {32} \
    CONFIG.C_PROBE4_WIDTH {32} \
    CONFIG.C_PROBE5_WIDTH {16} \
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
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Count [get_bd_pins bs_scb_data_record_p_0/pkt_Count] [get_bd_pins ila_0/probe1]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Data_CH_Data_1 [get_bd_pins bs_scb_data_record_p_0/pkt_Data_CH_Data_1] [get_bd_pins ila_0/probe2]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Data_CH_Data_17 [get_bd_pins bs_scb_data_record_p_0/pkt_Data_CH_Data_17] [get_bd_pins ila_0/probe3]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Data_CH_Data_37 [get_bd_pins bs_scb_data_record_p_0/pkt_Data_CH_Data_37] [get_bd_pins ila_0/probe4]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Start_Bytes [get_bd_pins bs_scb_data_record_p_0/pkt_Start_Bytes] [get_bd_pins ila_0/probe0]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Stop_Bytes [get_bd_pins bs_scb_data_record_p_0/pkt_Stop_Bytes] [get_bd_pins ila_0/probe5]
  connect_bd_net -net bs_scb_record_gen_1_m_record_data [get_bd_pins bitvector] [get_bd_pins bs_scb_data_record_p_0/bitvector]
  connect_bd_net -net clk_wiz_0_clk_50M [get_bd_pins clk] [get_bd_pins ila_0/clk]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: rx_ila_debug_2
proc create_hier_cell_rx_ila_debug_2 { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_rx_ila_debug_2() - Empty argument(s)!"}
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
    CONFIG.C_NUM_OF_PROBES {6} \
    CONFIG.C_PROBE0_WIDTH {32} \
    CONFIG.C_PROBE1_WIDTH {32} \
    CONFIG.C_PROBE2_WIDTH {32} \
    CONFIG.C_PROBE3_WIDTH {32} \
    CONFIG.C_PROBE4_WIDTH {32} \
    CONFIG.C_PROBE5_WIDTH {16} \
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
  connect_bd_net -net bs_ila_debug_1_ila_data [get_bd_pins bitvector] [get_bd_pins bs_scb_data_record_p_0/bitvector]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Count [get_bd_pins bs_scb_data_record_p_0/pkt_Count] [get_bd_pins ila_0/probe1]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Data_CH_Data_1 [get_bd_pins bs_scb_data_record_p_0/pkt_Data_CH_Data_1] [get_bd_pins ila_0/probe2]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Data_CH_Data_9 [get_bd_pins bs_scb_data_record_p_0/pkt_Data_CH_Data_9] [get_bd_pins ila_0/probe3]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Data_CH_Data_37 [get_bd_pins bs_scb_data_record_p_0/pkt_Data_CH_Data_37] [get_bd_pins ila_0/probe4]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Start_Bytes [get_bd_pins bs_scb_data_record_p_0/pkt_Start_Bytes] [get_bd_pins ila_0/probe0]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Stop_Bytes [get_bd_pins bs_scb_data_record_p_0/pkt_Stop_Bytes] [get_bd_pins ila_0/probe5]
  connect_bd_net -net clk_wiz_0_clk_50M [get_bd_pins clk] [get_bd_pins ila_0/clk]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: rx_ila_debug_1
proc create_hier_cell_rx_ila_debug_1 { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_rx_ila_debug_1() - Empty argument(s)!"}
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
  create_bd_pin -dir I -from 2399 -to 0 bitvector
  create_bd_pin -dir I -type clk clk

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
  
  # Create instance: ila_0, and set properties
  set ila_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:ila:6.2 ila_0 ]
  set_property -dict [list \
    CONFIG.C_MONITOR_TYPE {Native} \
    CONFIG.C_NUM_OF_PROBES {6} \
    CONFIG.C_PROBE0_WIDTH {32} \
    CONFIG.C_PROBE1_WIDTH {32} \
    CONFIG.C_PROBE2_WIDTH {32} \
    CONFIG.C_PROBE3_WIDTH {32} \
    CONFIG.C_PROBE4_WIDTH {32} \
    CONFIG.C_PROBE5_WIDTH {16} \
  ] $ila_0


  # Create port connections
  connect_bd_net -net bitvector_1 [get_bd_pins bitvector] [get_bd_pins bs_scb_data_record_p_0/bitvector]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Count [get_bd_pins bs_scb_data_record_p_0/pkt_Count] [get_bd_pins ila_0/probe1]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Data_CH_Data_1 [get_bd_pins bs_scb_data_record_p_0/pkt_Data_CH_Data_1] [get_bd_pins ila_0/probe2]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Data_CH_Data_17 [get_bd_pins bs_scb_data_record_p_0/pkt_Data_CH_Data_17] [get_bd_pins ila_0/probe3]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Data_CH_Data_37 [get_bd_pins bs_scb_data_record_p_0/pkt_Data_CH_Data_37] [get_bd_pins ila_0/probe4]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Start_Bytes [get_bd_pins bs_scb_data_record_p_0/pkt_Start_Bytes] [get_bd_pins ila_0/probe0]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Stop_Bytes [get_bd_pins bs_scb_data_record_p_0/pkt_Stop_Bytes] [get_bd_pins ila_0/probe5]
  connect_bd_net -net clk_1 [get_bd_pins clk] [get_bd_pins ila_0/clk]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: gen_ila_debug_1
proc create_hier_cell_gen_ila_debug_1 { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_gen_ila_debug_1() - Empty argument(s)!"}
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
    CONFIG.C_ADV_TRIGGER {true} \
    CONFIG.C_EN_STRG_QUAL {1} \
    CONFIG.C_MONITOR_TYPE {Native} \
    CONFIG.C_NUM_OF_PROBES {5} \
    CONFIG.C_PROBE0_WIDTH {32} \
    CONFIG.C_PROBE1_WIDTH {32} \
    CONFIG.C_PROBE2_WIDTH {32} \
    CONFIG.C_PROBE3_WIDTH {32} \
    CONFIG.C_PROBE4_WIDTH {16} \
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
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Count [get_bd_pins bs_scb_data_record_p_0/pkt_Count] [get_bd_pins ila_0/probe0]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Data_CH_Data_1 [get_bd_pins bs_scb_data_record_p_0/pkt_Data_CH_Data_1] [get_bd_pins ila_0/probe2]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Data_CH_Data_2 [get_bd_pins bs_scb_data_record_p_0/pkt_Data_CH_Data_2] [get_bd_pins ila_0/probe3]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Start_Bytes [get_bd_pins bs_scb_data_record_p_0/pkt_Start_Bytes] [get_bd_pins ila_0/probe1]
  connect_bd_net -net bs_scb_data_record_p_0_pkt_Stop_Bytes [get_bd_pins bs_scb_data_record_p_0/pkt_Stop_Bytes] [get_bd_pins ila_0/probe4]
  connect_bd_net -net bs_scb_record_gen_0_m_record_data [get_bd_pins bitvector] [get_bd_pins bs_scb_data_record_p_0/bitvector]
  connect_bd_net -net clk_wiz_0_clk_50M [get_bd_pins clk] [get_bd_pins ila_0/clk]

  # Restore current instance
  current_bd_instance $oldCurInst
}


# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
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


  # Create interface ports
  set CLK_IN1_D_0 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 CLK_IN1_D_0 ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {200000000} \
   ] $CLK_IN1_D_0

  set GT_DIFF_REFCLK1_0 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 GT_DIFF_REFCLK1_0 ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {125000000} \
   ] $GT_DIFF_REFCLK1_0

  set GT_SERIAL_RX_0 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:display_aurora:GT_Serial_Transceiver_Pins_RX_rtl:1.0 GT_SERIAL_RX_0 ]

  set GT_SERIAL_TX_0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_aurora:GT_Serial_Transceiver_Pins_TX_rtl:1.0 GT_SERIAL_TX_0 ]


  # Create ports
  set rx_loss_in_pin_0 [ create_bd_port -dir I -from 1 -to 0 rx_loss_in_pin_0 ]
  set s_dip_in_pin_0 [ create_bd_port -dir I -from 0 -to 0 s_dip_in_pin_0 ]
  set tx_disable_out_pin_0 [ create_bd_port -dir O -from 1 -to 0 tx_disable_out_pin_0 ]
  set m_led_out_pin_0 [ create_bd_port -dir O -from 1 -to 0 m_led_out_pin_0 ]
  set m_bs_uart_txd_0 [ create_bd_port -dir O m_bs_uart_txd_0 ]
  set s_bs_uart_rxd_0 [ create_bd_port -dir I s_bs_uart_rxd_0 ]

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
    set_property CONFIG.BS_MCLK {50} $bs_usec_reset_n_0


  # Create instance: bs_sw_led_axu15egb_0, and set properties
  set block_name bs_sw_led_axu15egb
  set block_cell_name bs_sw_led_axu15egb_0
  if { [catch {set bs_sw_led_axu15egb_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $bs_sw_led_axu15egb_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: clk_wiz_0, and set properties
  set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 clk_wiz_0 ]
  set_property -dict [list \
    CONFIG.CLKIN1_JITTER_PS {50.0} \
    CONFIG.CLKOUT1_JITTER {92.799} \
    CONFIG.CLKOUT1_PHASE_ERROR {82.655} \
    CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {200.000} \
    CONFIG.CLKOUT2_JITTER {121.478} \
    CONFIG.CLKOUT2_PHASE_ERROR {82.655} \
    CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {50.000} \
    CONFIG.CLKOUT2_USED {true} \
    CONFIG.CLK_OUT1_PORT {clk_200M} \
    CONFIG.CLK_OUT2_PORT {clk_50M} \
    CONFIG.MMCM_CLKFBOUT_MULT_F {6.000} \
    CONFIG.MMCM_CLKIN1_PERIOD {5.000} \
    CONFIG.MMCM_CLKIN2_PERIOD {10.0} \
    CONFIG.MMCM_CLKOUT0_DIVIDE_F {6.000} \
    CONFIG.MMCM_CLKOUT1_DIVIDE {24} \
    CONFIG.NUM_OUT_CLKS {2} \
    CONFIG.PRIM_IN_FREQ {200.000} \
    CONFIG.PRIM_SOURCE {Differential_clock_capable_pin} \
    CONFIG.USE_RESET {false} \
  ] $clk_wiz_0


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
  
  # Create instance: gen_ila_debug_1
  create_hier_cell_gen_ila_debug_1 [current_bd_instance .] gen_ila_debug_1

  # Create instance: aurora_8b10b_0, and set properties
  set aurora_8b10b_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:aurora_8b10b:11.1 aurora_8b10b_0 ]
  set_property -dict [list \
    CONFIG.C_DRP_IF {true} \
    CONFIG.C_LANE_WIDTH {4} \
    CONFIG.C_START_LANE {X1Y6} \
    CONFIG.C_USE_BYTESWAP {true} \
    CONFIG.SupportLevel {1} \
  ] $aurora_8b10b_0


  # Create instance: bs_reset_0, and set properties
  set block_name bs_reset
  set block_cell_name bs_reset_0
  if { [catch {set bs_reset_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $bs_reset_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property CONFIG.BS_MCLK {50} $bs_reset_0


  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_HIGH} \
 ] [get_bd_pins /bs_reset_0/reset]

  # Create instance: bs_reset_1, and set properties
  set block_name bs_reset
  set block_cell_name bs_reset_1
  if { [catch {set bs_reset_1 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $bs_reset_1 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [list \
    CONFIG.BS_MCLK {50} \
    CONFIG.RESET_NS_MAX {1000} \
  ] $bs_reset_1


  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_HIGH} \
 ] [get_bd_pins /bs_reset_1/reset]

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
  
  # Create instance: util_vector_logic_0, and set properties
  set util_vector_logic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_0 ]
  set_property CONFIG.C_SIZE {1} $util_vector_logic_0


  # Create instance: rx_ila_debug_1
  create_hier_cell_rx_ila_debug_1 [current_bd_instance .] rx_ila_debug_1

  # Create instance: aurora_8b10b_1, and set properties
  set aurora_8b10b_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:aurora_8b10b:11.1 aurora_8b10b_1 ]
  set_property -dict [list \
    CONFIG.C_DRP_IF {true} \
    CONFIG.C_LANE_WIDTH {4} \
    CONFIG.C_USE_BYTESWAP {true} \
    CONFIG.SINGLEEND_GTREFCLK {true} \
    CONFIG.SupportLevel {1} \
  ] $aurora_8b10b_1


  # Create instance: bs_scb_record_gen_1, and set properties
  set block_name bs_scb_record_gen
  set block_cell_name bs_scb_record_gen_1
  if { [catch {set bs_scb_record_gen_1 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $bs_scb_record_gen_1 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property CONFIG.RECORD_ID {0x3262} $bs_scb_record_gen_1


  # Create instance: bs_ila_debug_1, and set properties
  set block_name bs_ila_debug
  set block_cell_name bs_ila_debug_1
  if { [catch {set bs_ila_debug_1 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $bs_ila_debug_1 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: rx_ila_debug_2
  create_hier_cell_rx_ila_debug_2 [current_bd_instance .] rx_ila_debug_2

  # Create instance: bs_usec_reset_n_1, and set properties
  set block_name bs_usec_reset_n
  set block_cell_name bs_usec_reset_n_1
  if { [catch {set bs_usec_reset_n_1 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $bs_usec_reset_n_1 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: gen_ila_debug_2
  create_hier_cell_gen_ila_debug_2 [current_bd_instance .] gen_ila_debug_2

  # Create instance: util_vector_logic_1, and set properties
  set util_vector_logic_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_1 ]
  set_property CONFIG.C_SIZE {1} $util_vector_logic_1


  # Create interface connections
  connect_bd_intf_net -intf_net CLK_IN1_D_0_1 [get_bd_intf_ports CLK_IN1_D_0] [get_bd_intf_pins clk_wiz_0/CLK_IN1_D]
  connect_bd_intf_net -intf_net GT_DIFF_REFCLK1_0_1 [get_bd_intf_ports GT_DIFF_REFCLK1_0] [get_bd_intf_pins aurora_8b10b_0/GT_DIFF_REFCLK1]
  connect_bd_intf_net -intf_net GT_SERIAL_RX_0_1 [get_bd_intf_ports GT_SERIAL_RX_0] [get_bd_intf_pins aurora_8b10b_0/GT_SERIAL_RX]
  connect_bd_intf_net -intf_net aurora_8b10b_0_GT_SERIAL_TX [get_bd_intf_ports GT_SERIAL_TX_0] [get_bd_intf_pins aurora_8b10b_0/GT_SERIAL_TX]
  connect_bd_intf_net -intf_net aurora_8b10b_0_USER_DATA_M_AXI_RX [get_bd_intf_pins bs_ila_debug_0/s_axis_bs_aurora_ram] [get_bd_intf_pins aurora_8b10b_0/USER_DATA_M_AXI_RX]
  connect_bd_intf_net -intf_net aurora_8b10b_1_USER_DATA_M_AXI_RX [get_bd_intf_pins bs_ila_debug_1/s_axis_bs_aurora_ram] [get_bd_intf_pins aurora_8b10b_1/USER_DATA_M_AXI_RX]
  connect_bd_intf_net -intf_net bs_scb_record_gen_0_m_axis [get_bd_intf_pins aurora_8b10b_0/USER_DATA_S_AXI_TX] [get_bd_intf_pins bs_scb_record_gen_0/m_axis]
  connect_bd_intf_net -intf_net bs_scb_record_gen_1_m_axis [get_bd_intf_pins aurora_8b10b_1/USER_DATA_S_AXI_TX] [get_bd_intf_pins bs_scb_record_gen_1/m_axis]

  # Create port connections
  connect_bd_net -net Net [get_bd_pins aurora_8b10b_1/channel_up] [get_bd_pins bs_usec_reset_n_1/channel_up] [get_bd_pins bs_scb_record_gen_1/reset_2_n] [get_bd_pins util_vector_logic_1/Op1]
  connect_bd_net -net Net1 [get_bd_pins aurora_8b10b_1/lane_up] [get_bd_pins bs_usec_reset_n_1/lane_up] [get_bd_pins bs_scb_record_gen_1/reset_1_n] [get_bd_pins util_vector_logic_1/Op2]
  connect_bd_net -net aurora_8b10b_0_channel_up [get_bd_pins aurora_8b10b_0/channel_up] [get_bd_pins bs_usec_reset_n_0/channel_up] [get_bd_pins bs_scb_record_gen_0/reset_1_n] [get_bd_pins util_vector_logic_0/Op1]
  connect_bd_net -net aurora_8b10b_0_gt_refclk1_out [get_bd_pins aurora_8b10b_0/gt_refclk1_out] [get_bd_pins aurora_8b10b_1/gt_refclk1]
  connect_bd_net -net aurora_8b10b_0_lane_up [get_bd_pins aurora_8b10b_0/lane_up] [get_bd_pins bs_usec_reset_n_0/lane_up] [get_bd_pins bs_scb_record_gen_0/reset_2_n] [get_bd_pins util_vector_logic_0/Op2]
  connect_bd_net -net aurora_8b10b_0_user_clk_out [get_bd_pins aurora_8b10b_0/user_clk_out] [get_bd_pins bs_scb_record_gen_0/Clk] [get_bd_pins bs_ila_debug_0/Clk]
  connect_bd_net -net aurora_8b10b_1_user_clk_out [get_bd_pins aurora_8b10b_1/user_clk_out] [get_bd_pins bs_scb_record_gen_1/Clk] [get_bd_pins bs_ila_debug_1/Clk]
  connect_bd_net -net bs_ila_debug_0_ila_data [get_bd_pins bs_ila_debug_0/ila_data] [get_bd_pins rx_ila_debug_1/bitvector]
  connect_bd_net -net bs_ila_debug_1_ila_data [get_bd_pins bs_ila_debug_1/ila_data] [get_bd_pins rx_ila_debug_2/bitvector]
  connect_bd_net -net bs_reset_0_reset [get_bd_pins bs_reset_0/reset] [get_bd_pins aurora_8b10b_0/reset] [get_bd_pins aurora_8b10b_1/reset]
  connect_bd_net -net bs_reset_1_reset [get_bd_pins bs_reset_1/reset] [get_bd_pins aurora_8b10b_0/gt_reset] [get_bd_pins aurora_8b10b_1/gt_reset]
  connect_bd_net -net bs_scb_record_gen_0_m_record_data [get_bd_pins bs_scb_record_gen_0/m_record_data] [get_bd_pins gen_ila_debug_1/bitvector]
  connect_bd_net -net bs_scb_record_gen_1_m_record_data [get_bd_pins bs_scb_record_gen_1/m_record_data] [get_bd_pins gen_ila_debug_2/bitvector]
  connect_bd_net -net bs_sw_led_axu15egb_0_gnd_out [get_bd_pins bs_sw_led_axu15egb_0/gnd_out] [get_bd_pins bs_sw_led_axu15egb_0/tx_disable_in] [get_bd_pins aurora_8b10b_0/loopback] [get_bd_pins aurora_8b10b_0/power_down] [get_bd_pins aurora_8b10b_0/gt0_drpaddr] [get_bd_pins aurora_8b10b_0/gt0_drpen] [get_bd_pins aurora_8b10b_0/gt0_drpdi] [get_bd_pins aurora_8b10b_0/gt0_drpwe]
  connect_bd_net -net bs_sw_led_axu15egb_0_m_dip_0 [get_bd_pins bs_sw_led_axu15egb_0/m_dip_0] [get_bd_pins bs_sw_led_axu15egb_0/s_led_0] [get_bd_pins bs_sw_led_axu15egb_0/s_led_1]
  connect_bd_net -net bs_sw_led_axu15egb_0_m_led_out_pin [get_bd_pins bs_sw_led_axu15egb_0/m_led_out_pin] [get_bd_ports m_led_out_pin_0]
  connect_bd_net -net bs_sw_led_axu15egb_0_tx_disable_out_pin [get_bd_pins bs_sw_led_axu15egb_0/tx_disable_out_pin] [get_bd_ports tx_disable_out_pin_0]
  connect_bd_net -net bs_usec_reset_n_0_tpulse_us [get_bd_pins bs_usec_reset_n_0/tpulse_us] [get_bd_pins bs_scb_record_gen_0/s_tstart]
  connect_bd_net -net bs_usec_reset_n_1_tpulse_us [get_bd_pins bs_usec_reset_n_1/tpulse_us] [get_bd_pins bs_scb_record_gen_1/s_tstart]
  connect_bd_net -net clk_wiz_0_clk_50M [get_bd_pins clk_wiz_0/clk_50M] [get_bd_pins bs_usec_reset_n_0/Clk] [get_bd_pins gen_ila_debug_1/clk] [get_bd_pins aurora_8b10b_0/init_clk_in] [get_bd_pins bs_reset_1/Clk] [get_bd_pins bs_reset_0/Clk] [get_bd_pins rx_ila_debug_1/clk] [get_bd_pins aurora_8b10b_1/init_clk_in] [get_bd_pins rx_ila_debug_2/clk] [get_bd_pins bs_usec_reset_n_1/Clk] [get_bd_pins gen_ila_debug_2/clk]
  connect_bd_net -net rx_loss_in_pin_0_1 [get_bd_ports rx_loss_in_pin_0] [get_bd_pins bs_sw_led_axu15egb_0/rx_loss_in_pin]
  connect_bd_net -net s_dip_in_pin_0_1 [get_bd_ports s_dip_in_pin_0] [get_bd_pins bs_sw_led_axu15egb_0/s_dip_in_pin]
  connect_bd_net -net util_vector_logic_0_Res [get_bd_pins util_vector_logic_0/Res] [get_bd_pins bs_ila_debug_0/reset_n]
  connect_bd_net -net util_vector_logic_1_Res [get_bd_pins util_vector_logic_1/Res] [get_bd_pins bs_ila_debug_1/reset_n]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


