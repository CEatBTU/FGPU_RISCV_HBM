
################################################################
# This is a generated script based on design: riscv
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################
variable FGPU_freq 100

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
set scripts_vivado_version 2023.1
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_gid_msg -ssname BD::TCL -id 2041 -severity "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source riscv_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# Rocket32s1, synchronizer, uart, ethernet

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xcu250-figd2104-2L-e
   set_property BOARD_PART xilinx.com:au250:part0:1.3 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name riscv

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
set_property  ip_repo_paths  fgpu/project_vivado/fgpu_ip [current_project]
update_ip_catalog

if { $bCheckIPs == 1 } {
   set list_check_ips "\ 
xilinx.com:ip:clk_wiz:6.0\
xilinx.com:ip:util_vector_logic:2.0\
xilinx.com:ip:proc_sys_reset:5.0\
xilinx.com:ip:ddr4:2.2\
xilinx.com:ip:axi_iic:2.1\
xilinx.com:ip:qdma:5.0\
user.org:user:FGPU:2.1\
xilinx.com:ip:util_ds_buf:2.2\
xilinx.com:ip:xlconcat:2.1\
xilinx.com:ip:xlconstant:1.1\
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
Rocket64b1\
synchronizer\
uart\
ethernet\
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


# Hierarchical cell: IO
proc create_hier_cell_IO { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_IO() - Empty argument(s)!"}
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
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M00_AXI

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M01_AXI

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S01_AXI

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 eth_rx_axis

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 eth_tx_axis

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 iic_main

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:pcie_7x_mgt_rtl:1.0 pci_express_x16

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 pcie_refclk

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M00_FGPU


  # Create pins
  create_bd_pin -dir I -type clk axi_clock
  create_bd_pin -dir I -type rst axi_reset
  create_bd_pin -dir I -type clk clock100MHz
  create_bd_pin -dir I -type clk eth_gt_user_clock
  create_bd_pin -dir I -from 15 -to 0 eth_status
  create_bd_pin -dir O -from 7 -to 0 interrupts
  create_bd_pin -dir I -type rst pcie_perstn
  create_bd_pin -dir I -type clk sdram_clock
  create_bd_pin -dir I usb_uart_rxd
  create_bd_pin -dir O usb_uart_txd
  create_bd_pin -dir O user_lnk_up
  create_bd_pin -dir I -type rst M02_ARESETN
  create_bd_pin -dir I fgpu_clk
  create_bd_pin -dir I -type rst M03_ARESETN
  create_bd_pin -dir I -type rst M04_ARESETN
  create_bd_pin -dir I -type rst resetn
  create_bd_pin -dir I -type rst M03_ARESETN1

  # Create instance: IIC, and set properties
  set IIC [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_iic:2.1 IIC ]
  set_property -dict [list \
    CONFIG.IIC_BOARD_INTERFACE {iic_main} \
    CONFIG.USE_BOARD_FLOW {true} \
  ] $IIC


  # Create instance: UART, and set properties
  set block_name uart
  set block_cell_name UART
  if { [catch {set UART [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $UART eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Ethernet, and set properties
  set block_name ethernet
  set block_cell_name Ethernet
  if { [catch {set Ethernet [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Ethernet eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [list \
    CONFIG.axis_word_bits {64} \
    CONFIG.burst_size {64} \
    CONFIG.dma_addr_bits {32} \
    CONFIG.dma_word_bits {64} \
    CONFIG.enable_mdio {0} \
  ] $Ethernet


  # Create instance: qdma_0, and set properties
  set qdma_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:qdma:5.0 qdma_0 ]
  set_property -dict [list \
    CONFIG.PCIE_BOARD_INTERFACE {pci_express_x8} \
    CONFIG.PF0_SRIOV_VF_DEVICE_ID {A038} \
    CONFIG.SYS_RST_N_BOARD_INTERFACE {pcie_perstn} \
    CONFIG.axi_data_width {256_bit} \
    CONFIG.axisten_freq {125} \
    CONFIG.cfg_mgmt_if {false} \
    CONFIG.dma_intf_sel_qdma {AXI_MM} \
    CONFIG.mode_selection {Advanced} \
    CONFIG.pf0_bar2_scale_qdma {Megabytes} \
    CONFIG.pf0_device_id {9028} \
    CONFIG.pf0_msix_enabled_qdma {false} \
    CONFIG.pf0_pciebar2axibar_2 {0x0000000060000000} \
    CONFIG.pf2_device_id {9228} \
    CONFIG.pf3_device_id {9328} \
    CONFIG.pl_link_cap_max_link_speed {5.0_GT/s} \
    CONFIG.pl_link_cap_max_link_width {X8} \
    CONFIG.plltype {QPLL1} \
  ] $qdma_0


  # Create instance: axi_interconnect_0, and set properties
  set axi_interconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_0 ]
  set_property -dict [list \
    CONFIG.NUM_MI {5} \
    CONFIG.NUM_SI {2} \
  ] $axi_interconnect_0


  # Create instance: axi_interconnect_1, and set properties
  set axi_interconnect_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_1 ]
  set_property -dict [list \
    CONFIG.NUM_MI {1} \
    CONFIG.NUM_SI {2} \
    CONFIG.S02_ARB_PRIORITY {15} \
  ] $axi_interconnect_1


  # Create instance: FGPU_0, and set properties
  set FGPU_0 [ create_bd_cell -type ip -vlnv user.org:user:FGPU:2.1 FGPU_0 ]
  set_property CONFIG.num_master_intf {1} $FGPU_0


  set_property -dict [ list \
   CONFIG.FREQ_HZ {100000000} \
 ] [get_bd_intf_pins /IO/FGPU_0/m00]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {100000000} \
 ] [get_bd_intf_pins /IO/FGPU_0/s]

  # Create instance: util_ds_buf, and set properties
  set util_ds_buf [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.2 util_ds_buf ]
  set_property -dict [list \
    CONFIG.DIFF_CLK_IN_BOARD_INTERFACE {pcie_refclk} \
    CONFIG.USE_BOARD_FLOW {true} \
  ] $util_ds_buf


  # Create instance: xlconcat_0, and set properties
  set xlconcat_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0 ]
  set_property CONFIG.NUM_PORTS {8} $xlconcat_0


  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]
  set_property -dict [list \
    CONFIG.CONST_VAL {0} \
    CONFIG.CONST_WIDTH {1} \
  ] $xlconstant_0


  # Create instance: xlconstant_1, and set properties
  set xlconstant_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1 ]

  # Create instance: xlconstant_2, and set properties
  set xlconstant_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_2 ]
  set_property CONFIG.CONST_VAL {0} $xlconstant_2


  # Create instance: util_vector_logic_0, and set properties
  set util_vector_logic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_0 ]
  set_property CONFIG.C_OPERATION {not} $util_vector_logic_0


  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins pcie_refclk] [get_bd_intf_pins util_ds_buf/CLK_IN_D]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins eth_tx_axis] [get_bd_intf_pins Ethernet/TX_AXIS]
  connect_bd_intf_net -intf_net Conn3 [get_bd_intf_pins eth_rx_axis] [get_bd_intf_pins Ethernet/RX_AXIS]
  connect_bd_intf_net -intf_net Ethernet_M_AXI [get_bd_intf_pins Ethernet/M_AXI] [get_bd_intf_pins axi_interconnect_1/S01_AXI]
  connect_bd_intf_net -intf_net FGPU_0_m00 [get_bd_intf_pins M00_FGPU] [get_bd_intf_pins FGPU_0/m00]
  connect_bd_intf_net -intf_net RocketChip_IO_AXI4 [get_bd_intf_pins S01_AXI] [get_bd_intf_pins axi_interconnect_0/S01_AXI]
  connect_bd_intf_net -intf_net axi_iic_0_IIC [get_bd_intf_pins iic_main] [get_bd_intf_pins IIC/IIC]
  connect_bd_intf_net -intf_net axi_interconnect_0_M00_AXI [get_bd_intf_pins IIC/S_AXI] [get_bd_intf_pins axi_interconnect_0/M00_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M02_AXI [get_bd_intf_pins UART/S_AXI_LITE] [get_bd_intf_pins axi_interconnect_0/M01_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M03_AXI [get_bd_intf_pins Ethernet/S_AXI_LITE] [get_bd_intf_pins axi_interconnect_0/M02_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M03_AXI1 [get_bd_intf_pins M01_AXI] [get_bd_intf_pins axi_interconnect_0/M03_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M04_AXI [get_bd_intf_pins axi_interconnect_0/M04_AXI] [get_bd_intf_pins FGPU_0/s]
  connect_bd_intf_net -intf_net axi_interconnect_1_M00_AXI [get_bd_intf_pins M00_AXI] [get_bd_intf_pins axi_interconnect_1/M00_AXI]
  connect_bd_intf_net -intf_net qdma_0_M_AXI [get_bd_intf_pins qdma_0/M_AXI] [get_bd_intf_pins axi_interconnect_1/S00_AXI]
  connect_bd_intf_net -intf_net qdma_0_M_AXI_LITE [get_bd_intf_pins qdma_0/M_AXI_LITE] [get_bd_intf_pins axi_interconnect_0/S00_AXI]
  connect_bd_intf_net -intf_net qdma_0_pcie_mgt [get_bd_intf_pins pci_express_x16] [get_bd_intf_pins qdma_0/pcie_mgt]

  # Create port connections
  connect_bd_net -net Ethernet_interrupt [get_bd_pins Ethernet/interrupt] [get_bd_pins xlconcat_0/In2]
  connect_bd_net -net M02_ARESETN_1 [get_bd_pins M02_ARESETN] [get_bd_pins axi_interconnect_0/M02_ARESETN] [get_bd_pins axi_interconnect_1/S01_ARESETN]
  connect_bd_net -net M03_ARESETN1_1 [get_bd_pins M03_ARESETN1] [get_bd_pins util_vector_logic_0/Op1]
  connect_bd_net -net M04_ARESETN_1 [get_bd_pins M04_ARESETN] [get_bd_pins axi_interconnect_0/M04_ARESETN]
  connect_bd_net -net axi_clock_1 [get_bd_pins axi_clock] [get_bd_pins axi_interconnect_0/ACLK] [get_bd_pins axi_interconnect_0/S01_ACLK] [get_bd_pins axi_interconnect_1/ACLK] [get_bd_pins axi_interconnect_1/M00_ACLK]
  connect_bd_net -net axi_iic_0_iic2intc_irpt [get_bd_pins IIC/iic2intc_irpt] [get_bd_pins xlconcat_0/In3]
  connect_bd_net -net axi_reset_1 [get_bd_pins axi_reset] [get_bd_pins Ethernet/async_resetn] [get_bd_pins UART/async_resetn] [get_bd_pins FGPU_0/axi_aresetn] [get_bd_pins axi_interconnect_0/ARESETN] [get_bd_pins axi_interconnect_0/S01_ARESETN] [get_bd_pins axi_interconnect_0/M01_ARESETN] [get_bd_pins axi_interconnect_1/ARESETN] [get_bd_pins axi_interconnect_1/M00_ARESETN]
  connect_bd_net -net clock100MHz_1 [get_bd_pins clock100MHz] [get_bd_pins UART/clock] [get_bd_pins axi_interconnect_0/M01_ACLK]
  connect_bd_net -net eth_gt_user_clock_1 [get_bd_pins eth_gt_user_clock] [get_bd_pins Ethernet/clock] [get_bd_pins axi_interconnect_0/M02_ACLK] [get_bd_pins axi_interconnect_1/S01_ACLK]
  connect_bd_net -net fgpu_clk_1 [get_bd_pins fgpu_clk] [get_bd_pins FGPU_0/axi_clk] [get_bd_pins axi_interconnect_0/M04_ACLK]
  connect_bd_net -net interrupts [get_bd_pins xlconcat_0/dout] [get_bd_pins interrupts]
  connect_bd_net -net pcie_perstn [get_bd_pins pcie_perstn] [get_bd_pins qdma_0/sys_rst_n]
  connect_bd_net -net qdma_0_axi_aclk [get_bd_pins qdma_0/axi_aclk] [get_bd_pins IIC/s_axi_aclk] [get_bd_pins axi_interconnect_0/S00_ACLK] [get_bd_pins axi_interconnect_0/M00_ACLK] [get_bd_pins axi_interconnect_1/S00_ACLK]
  connect_bd_net -net qdma_0_axi_aresetn [get_bd_pins qdma_0/axi_aresetn] [get_bd_pins IIC/s_axi_aresetn] [get_bd_pins axi_interconnect_0/S00_ARESETN] [get_bd_pins axi_interconnect_0/M00_ARESETN] [get_bd_pins axi_interconnect_1/S00_ARESETN]
  connect_bd_net -net qdma_0_user_lnk_up [get_bd_pins qdma_0/user_lnk_up] [get_bd_pins user_lnk_up]
  connect_bd_net -net sdram_clock_1 [get_bd_pins sdram_clock] [get_bd_pins axi_interconnect_0/M03_ACLK]
  connect_bd_net -net status_vector_0_1 [get_bd_pins eth_status] [get_bd_pins Ethernet/status_vector]
  connect_bd_net -net uart_0_interrupt [get_bd_pins UART/interrupt] [get_bd_pins xlconcat_0/In0]
  connect_bd_net -net usb_uart_rxd [get_bd_pins usb_uart_rxd] [get_bd_pins UART/RxD]
  connect_bd_net -net usb_uart_txd [get_bd_pins UART/TxD] [get_bd_pins usb_uart_txd]
  connect_bd_net -net util_ds_buf_IBUF_DS_ODIV2 [get_bd_pins util_ds_buf/IBUF_DS_ODIV2] [get_bd_pins qdma_0/sys_clk]
  connect_bd_net -net util_ds_buf_IBUF_OUT [get_bd_pins util_ds_buf/IBUF_OUT] [get_bd_pins qdma_0/sys_clk_gt]
  connect_bd_net -net util_vector_logic_0_Res [get_bd_pins util_vector_logic_0/Res] [get_bd_pins axi_interconnect_0/M03_ARESETN]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins xlconstant_0/dout] [get_bd_pins Ethernet/mdio_int] [get_bd_pins xlconcat_0/In1] [get_bd_pins xlconcat_0/In4] [get_bd_pins xlconcat_0/In5] [get_bd_pins xlconcat_0/In6] [get_bd_pins xlconcat_0/In7]
  connect_bd_net -net xlconstant_1_dout [get_bd_pins xlconstant_1/dout] [get_bd_pins qdma_0/soft_reset_n]
  connect_bd_net -net xlconstant_2_dout [get_bd_pins xlconstant_2/dout] [get_bd_pins UART/CTSn]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: DDR
proc create_hier_cell_DDR { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_DDR() - Empty argument(s)!"}
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
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 C0_DDR4_S_AXI_CTRL

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S00_AXI

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:ddr4_rtl:1.0 ddr4_sdram_c0

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 default_300mhz_clk0

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S00_FGPU


  # Create pins
  create_bd_pin -dir I axi_clock
  create_bd_pin -dir I axi_reset
  create_bd_pin -dir O -type clk c0_ddr4_ui_clk
  create_bd_pin -dir O c0_init_calib_complete
  create_bd_pin -dir I -type rst sys_reset
  create_bd_pin -dir I fgpu_clk
  create_bd_pin -dir O -type rst c0_ddr4_ui_clk_sync_rst

  # Create instance: ddr4_0, and set properties
  set ddr4_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:ddr4:2.2 ddr4_0 ]
  set_property -dict [list \
    CONFIG.C0_CLOCK_BOARD_INTERFACE {default_300mhz_clk0} \
    CONFIG.C0_DDR4_BOARD_INTERFACE {ddr4_sdram_c0} \
    CONFIG.RESET_BOARD_INTERFACE {resetn} \
  ] $ddr4_0


  # Create instance: synchronizer_0, and set properties
  set block_name synchronizer
  set block_cell_name synchronizer_0
  if { [catch {set synchronizer_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $synchronizer_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: axi_interconnect_0, and set properties
  set axi_interconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_0 ]
  set_property -dict [list \
    CONFIG.ENABLE_ADVANCED_OPTIONS {1} \
    CONFIG.NUM_MI {1} \
    CONFIG.NUM_SI {2} \
    CONFIG.S01_ARB_PRIORITY {15} \
  ] $axi_interconnect_0


  # Create instance: util_vector_logic_0, and set properties
  set util_vector_logic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_0 ]
  set_property CONFIG.C_OPERATION {not} $util_vector_logic_0


  # Create interface connections
  connect_bd_intf_net -intf_net S00_AXI_1 [get_bd_intf_pins S00_AXI] [get_bd_intf_pins axi_interconnect_0/S00_AXI]
  connect_bd_intf_net -intf_net S00_FGPU_1 [get_bd_intf_pins S00_FGPU] [get_bd_intf_pins axi_interconnect_0/S01_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M00_AXI [get_bd_intf_pins axi_interconnect_0/M00_AXI] [get_bd_intf_pins ddr4_0/C0_DDR4_S_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M04_AXI [get_bd_intf_pins C0_DDR4_S_AXI_CTRL] [get_bd_intf_pins ddr4_0/C0_DDR4_S_AXI_CTRL]
  connect_bd_intf_net -intf_net ddr4_0_C0_DDR4 [get_bd_intf_pins ddr4_sdram_c0] [get_bd_intf_pins ddr4_0/C0_DDR4]
  connect_bd_intf_net -intf_net default_300mhz_clk0_1 [get_bd_intf_pins default_300mhz_clk0] [get_bd_intf_pins ddr4_0/C0_SYS_CLK]

  # Create port connections
  connect_bd_net -net RocketChip_aresetn [get_bd_pins axi_reset] [get_bd_pins synchronizer_0/dinp] [get_bd_pins axi_interconnect_0/S01_ARESETN] [get_bd_pins axi_interconnect_0/S00_ARESETN] [get_bd_pins axi_interconnect_0/ARESETN]
  connect_bd_net -net axi_clock_1 [get_bd_pins axi_clock] [get_bd_pins axi_interconnect_0/ACLK] [get_bd_pins axi_interconnect_0/S00_ACLK]
  connect_bd_net -net ddr4_0_c0_ddr4_ui_clk [get_bd_pins ddr4_0/c0_ddr4_ui_clk] [get_bd_pins c0_ddr4_ui_clk] [get_bd_pins synchronizer_0/clock] [get_bd_pins axi_interconnect_0/M00_ACLK]
  connect_bd_net -net ddr4_0_c0_ddr4_ui_clk_sync_rst [get_bd_pins ddr4_0/c0_ddr4_ui_clk_sync_rst] [get_bd_pins c0_ddr4_ui_clk_sync_rst]
  connect_bd_net -net ddr4_0_c0_init_calib_complete [get_bd_pins ddr4_0/c0_init_calib_complete] [get_bd_pins c0_init_calib_complete]
  connect_bd_net -net fgpu_clk_1 [get_bd_pins fgpu_clk] [get_bd_pins axi_interconnect_0/S01_ACLK]
  connect_bd_net -net resetn_inv_0_Res [get_bd_pins sys_reset] [get_bd_pins ddr4_0/sys_rst] [get_bd_pins util_vector_logic_0/Op1]
  connect_bd_net -net synchronizer_0_dout [get_bd_pins synchronizer_0/dout] [get_bd_pins ddr4_0/c0_ddr4_aresetn]
  connect_bd_net -net util_vector_logic_0_Res [get_bd_pins util_vector_logic_0/Res] [get_bd_pins axi_interconnect_0/M00_ARESETN]

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
  set clk_user [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 clk_user ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {156250000} \
   ] $clk_user

  set ddr4_sdram_c0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddr4_rtl:1.0 ddr4_sdram_c0 ]

  set default_300mhz_clk0 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 default_300mhz_clk0 ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {300000000} \
   ] $default_300mhz_clk0

  set eth_rx_axis [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 eth_rx_axis ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {156250000} \
   CONFIG.HAS_TKEEP {1} \
   CONFIG.HAS_TLAST {1} \
   CONFIG.HAS_TREADY {1} \
   CONFIG.HAS_TSTRB {0} \
   CONFIG.LAYERED_METADATA {undef} \
   CONFIG.TDATA_NUM_BYTES {8} \
   CONFIG.TDEST_WIDTH {0} \
   CONFIG.TID_WIDTH {0} \
   CONFIG.TUSER_WIDTH {1} \
   ] $eth_rx_axis

  set eth_tx_axis [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 eth_tx_axis ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {156250000} \
   ] $eth_tx_axis

  set iic_main [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 iic_main ]

  set pci_express_x16 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:pcie_7x_mgt_rtl:1.0 pci_express_x16 ]

  set pcie_refclk [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 pcie_refclk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {100000000} \
   ] $pcie_refclk


  # Create ports
  set eth_clock [ create_bd_port -dir O -type clk eth_clock ]
  set eth_clock_ok [ create_bd_port -dir O -type rst eth_clock_ok ]
  set eth_gt_user_clock [ create_bd_port -dir I -type clk -freq_hz 156250000 eth_gt_user_clock ]
  set eth_status [ create_bd_port -dir I -from 15 -to 0 eth_status ]
  set pcie_perstn [ create_bd_port -dir I -type rst pcie_perstn ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_LOW} \
 ] $pcie_perstn
  set resetn [ create_bd_port -dir I -type rst resetn ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_LOW} \
 ] $resetn
  set usb_uart_rxd [ create_bd_port -dir I usb_uart_rxd ]
  set usb_uart_txd [ create_bd_port -dir O usb_uart_txd ]

  # Create instance: DDR
  create_hier_cell_DDR [current_bd_instance .] DDR

  # Create instance: IO
  create_hier_cell_IO [current_bd_instance .] IO

  # Create instance: RocketChip, and set properties
  set block_name Rocket64b1
  set block_cell_name RocketChip
  if { [catch {set RocketChip [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $RocketChip eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: clk_wiz_0, and set properties
  set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 clk_wiz_0 ]
  set_property -dict [list \
    CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {100.0} \
    CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {125.000} \
    CONFIG.CLKOUT2_USED {true} \
    CONFIG.CLKOUT3_REQUESTED_OUT_FREQ {100.000} \
    CONFIG.CLKOUT3_USED {true} \
    CONFIG.CLKOUT4_JITTER {194.337} \
    CONFIG.CLKOUT4_PHASE_ERROR {204.239} \
    CONFIG.CLKOUT4_USED {true} \
    CONFIG.CLK_OUT1_PORT {rocket_clk} \
    CONFIG.CLK_OUT2_PORT {eth_clk} \
    CONFIG.CLK_OUT3_PORT {ref100_clk} \
    CONFIG.CLK_OUT4_PORT {fgpu_clk} \
    CONFIG.MMCM_CLKOUT3_DIVIDE {10} \
    CONFIG.NUM_OUT_CLKS {4} \
    CONFIG.OPTIMIZE_CLOCKING_STRUCTURE_EN {true} \
    CONFIG.PRIM_SOURCE {Differential_clock_capable_pin} \
    CONFIG.USE_PHASE_ALIGNMENT {false} \
    CONFIG.USE_RESET {false} \
  ] $clk_wiz_0


  # Create instance: resetn_inv_0, and set properties
  set resetn_inv_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 resetn_inv_0 ]
  set_property -dict [list \
    CONFIG.C_OPERATION {not} \
    CONFIG.C_SIZE {1} \
  ] $resetn_inv_0


  # Create instance: proc_sys_reset_0, and set properties
  set proc_sys_reset_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0 ]

  # Create instance: proc_sys_reset_1, and set properties
  set proc_sys_reset_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_1 ]

  # Create interface connections
  connect_bd_intf_net -intf_net IO_M00_FGPU [get_bd_intf_pins IO/M00_FGPU] [get_bd_intf_pins DDR/S00_FGPU]
  connect_bd_intf_net -intf_net IO_TX_AXIS_0 [get_bd_intf_ports eth_tx_axis] [get_bd_intf_pins IO/eth_tx_axis]
  connect_bd_intf_net -intf_net RX_AXIS_0_1 [get_bd_intf_ports eth_rx_axis] [get_bd_intf_pins IO/eth_rx_axis]
  connect_bd_intf_net -intf_net RocketChip_IO_AXI4 [get_bd_intf_pins IO/S01_AXI] [get_bd_intf_pins RocketChip/IO_AXI4]
  connect_bd_intf_net -intf_net RocketChip_MEM_AXI4 [get_bd_intf_pins DDR/S00_AXI] [get_bd_intf_pins RocketChip/MEM_AXI4]
  connect_bd_intf_net -intf_net axi_iic_0_IIC [get_bd_intf_ports iic_main] [get_bd_intf_pins IO/iic_main]
  connect_bd_intf_net -intf_net axi_interconnect_0_M04_AXI [get_bd_intf_pins DDR/C0_DDR4_S_AXI_CTRL] [get_bd_intf_pins IO/M01_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_1_M00_AXI [get_bd_intf_pins IO/M00_AXI] [get_bd_intf_pins RocketChip/DMA_AXI4]
  connect_bd_intf_net -intf_net clk_user_1 [get_bd_intf_ports clk_user] [get_bd_intf_pins clk_wiz_0/CLK_IN1_D]
  connect_bd_intf_net -intf_net ddr4_0_C0_DDR4 [get_bd_intf_ports ddr4_sdram_c0] [get_bd_intf_pins DDR/ddr4_sdram_c0]
  connect_bd_intf_net -intf_net default_300mhz_clk0 [get_bd_intf_ports default_300mhz_clk0] [get_bd_intf_pins DDR/default_300mhz_clk0]
  connect_bd_intf_net -intf_net pcie_refclk [get_bd_intf_ports pcie_refclk] [get_bd_intf_pins IO/pcie_refclk]
  connect_bd_intf_net -intf_net qdma_0_pcie_mgt [get_bd_intf_ports pci_express_x16] [get_bd_intf_pins IO/pci_express_x16]

  # Create port connections
  connect_bd_net -net DDR_c0_ddr4_ui_clk_sync_rst [get_bd_pins DDR/c0_ddr4_ui_clk_sync_rst] [get_bd_pins IO/M03_ARESETN1]
  connect_bd_net -net DDR_clock [get_bd_pins DDR/c0_ddr4_ui_clk] [get_bd_pins IO/sdram_clock]
  connect_bd_net -net RocketChip_aresetn [get_bd_pins RocketChip/aresetn] [get_bd_pins DDR/axi_reset] [get_bd_pins IO/axi_reset]
  connect_bd_net -net RocketChip_clock [get_bd_pins clk_wiz_0/rocket_clk] [get_bd_pins DDR/axi_clock] [get_bd_pins IO/axi_clock] [get_bd_pins RocketChip/clock]
  connect_bd_net -net clk_wiz_0_eth_clk [get_bd_pins clk_wiz_0/eth_clk] [get_bd_ports eth_clock]
  connect_bd_net -net clk_wiz_0_fgpu_clk [get_bd_pins clk_wiz_0/fgpu_clk] [get_bd_pins DDR/fgpu_clk] [get_bd_pins IO/fgpu_clk] [get_bd_pins proc_sys_reset_1/slowest_sync_clk]
  connect_bd_net -net clk_wiz_0_locked [get_bd_pins clk_wiz_0/locked] [get_bd_ports eth_clock_ok] [get_bd_pins RocketChip/clock_ok]
  connect_bd_net -net clock100MHz_1 [get_bd_pins clk_wiz_0/ref100_clk] [get_bd_pins IO/clock100MHz]
  connect_bd_net -net ddr4_0_c0_init_calib_complete [get_bd_pins DDR/c0_init_calib_complete] [get_bd_pins RocketChip/mem_ok]
  connect_bd_net -net eth_gt_user_clock_1 [get_bd_ports eth_gt_user_clock] [get_bd_pins proc_sys_reset_0/slowest_sync_clk] [get_bd_pins IO/eth_gt_user_clock]
  connect_bd_net -net interrupts [get_bd_pins IO/interrupts] [get_bd_pins RocketChip/interrupts]
  connect_bd_net -net pcie_perstn [get_bd_ports pcie_perstn] [get_bd_pins IO/pcie_perstn]
  connect_bd_net -net proc_sys_reset_0_peripheral_aresetn [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins IO/M02_ARESETN]
  connect_bd_net -net proc_sys_reset_1_peripheral_aresetn [get_bd_pins proc_sys_reset_1/peripheral_aresetn] [get_bd_pins IO/M04_ARESETN]
  connect_bd_net -net qdma_0_user_lnk_up [get_bd_pins IO/user_lnk_up] [get_bd_pins RocketChip/io_ok]
  connect_bd_net -net reset [get_bd_pins resetn_inv_0/Res] [get_bd_pins DDR/sys_reset] [get_bd_pins RocketChip/sys_reset] [get_bd_pins IO/M03_ARESETN]
  connect_bd_net -net resetn_1 [get_bd_ports resetn] [get_bd_pins proc_sys_reset_0/ext_reset_in] [get_bd_pins resetn_inv_0/Op1] [get_bd_pins proc_sys_reset_1/ext_reset_in] [get_bd_pins IO/resetn]
  connect_bd_net -net status_vector_0_1 [get_bd_ports eth_status] [get_bd_pins IO/eth_status]
  connect_bd_net -net usb_uart_rxd [get_bd_ports usb_uart_rxd] [get_bd_pins IO/usb_uart_rxd]
  connect_bd_net -net usb_uart_txd [get_bd_pins IO/usb_uart_txd] [get_bd_ports usb_uart_txd]

  # Create address segments
  assign_bd_address -offset 0x60020000 -range 0x00010000 -target_address_space [get_bd_addr_spaces RocketChip/IO_AXI4] [get_bd_addr_segs IO/Ethernet/S_AXI_LITE/reg0] -force
  assign_bd_address -offset 0x60060000 -range 0x00010000 -target_address_space [get_bd_addr_spaces RocketChip/IO_AXI4] [get_bd_addr_segs IO/FGPU_0/s/reg0] -force
  assign_bd_address -offset 0x60040000 -range 0x00010000 -target_address_space [get_bd_addr_spaces RocketChip/IO_AXI4] [get_bd_addr_segs IO/IIC/S_AXI/Reg] -force
  assign_bd_address -offset 0x60010000 -range 0x00010000 -target_address_space [get_bd_addr_spaces RocketChip/IO_AXI4] [get_bd_addr_segs IO/UART/S_AXI_LITE/reg0] -force
  assign_bd_address -offset 0x60100000 -range 0x00100000 -target_address_space [get_bd_addr_spaces RocketChip/IO_AXI4] [get_bd_addr_segs DDR/ddr4_0/C0_DDR4_MEMORY_MAP_CTRL/C0_REG] -force
  assign_bd_address -offset 0x00000000 -range 0x000100000000 -target_address_space [get_bd_addr_spaces RocketChip/MEM_AXI4] [get_bd_addr_segs DDR/ddr4_0/C0_DDR4_MEMORY_MAP/C0_DDR4_ADDRESS_BLOCK] -force
  assign_bd_address -offset 0x00000000 -range 0x000100000000 -target_address_space [get_bd_addr_spaces IO/Ethernet/M_AXI] [get_bd_addr_segs RocketChip/DMA_AXI4/reg0] -force
  assign_bd_address -offset 0x00000000 -range 0x000100000000 -target_address_space [get_bd_addr_spaces IO/qdma_0/M_AXI] [get_bd_addr_segs RocketChip/DMA_AXI4/reg0] -force
  assign_bd_address -offset 0x60020000 -range 0x00010000 -target_address_space [get_bd_addr_spaces IO/qdma_0/M_AXI_LITE] [get_bd_addr_segs IO/Ethernet/S_AXI_LITE/reg0] -force
  assign_bd_address -offset 0x60060000 -range 0x00010000 -target_address_space [get_bd_addr_spaces IO/qdma_0/M_AXI_LITE] [get_bd_addr_segs IO/FGPU_0/s/reg0] -force
  assign_bd_address -offset 0x60040000 -range 0x00010000 -target_address_space [get_bd_addr_spaces IO/qdma_0/M_AXI_LITE] [get_bd_addr_segs IO/IIC/S_AXI/Reg] -force
  assign_bd_address -offset 0x60010000 -range 0x00010000 -target_address_space [get_bd_addr_spaces IO/qdma_0/M_AXI_LITE] [get_bd_addr_segs IO/UART/S_AXI_LITE/reg0] -force
  assign_bd_address -offset 0x60100000 -range 0x00100000 -target_address_space [get_bd_addr_spaces IO/qdma_0/M_AXI_LITE] [get_bd_addr_segs DDR/ddr4_0/C0_DDR4_MEMORY_MAP_CTRL/C0_REG] -force
  assign_bd_address -offset 0x00000000 -range 0x000100000000 -target_address_space [get_bd_addr_spaces IO/FGPU_0/m00] [get_bd_addr_segs DDR/ddr4_0/C0_DDR4_MEMORY_MAP/C0_DDR4_ADDRESS_BLOCK] -force

set_property CONFIG.FREQ_HZ ${::FGPU_freq}000000 [get_bd_intf_pins /IO/FGPU_0/s]
set_property CONFIG.FREQ_HZ ${::FGPU_freq}000000 [get_bd_intf_pins /IO/FGPU_0/m00]
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


