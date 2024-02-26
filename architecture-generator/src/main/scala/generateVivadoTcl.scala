import java.io.PrintWriter
import java.io.File


/**
  * A class that reads a json file descriptor of the system and generates a TCL script for Vivado
  * to generate the hardware. For instance, the file "qsort_spatial.tcl" is the tcl file that 
  * contains the system description of the quicksort algorithm in  "qsort_descriptor.json".
  */


class tclGen() {
    // Create a file to write the TCL script
    val tclFile = new PrintWriter(new File("vivadoTcl/qsort_spatial.tcl"))



    // Create the clocking wizard
    tclFile.write("create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 clk_wiz_0\n")

    // Clocking wizard configuration
    tclFile.write("""set_property -dict [list \
        CONFIG.CLKOUT1_JITTER {94.862} \
        CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {300.000} \
        CONFIG.CLKOUT2_JITTER {115.831} \
        CONFIG.CLKOUT2_PHASE_ERROR {87.180} \
        CONFIG.CLKOUT2_USED {true} \
        CONFIG.CLK_IN1_BOARD_INTERFACE {pcie_refclk} \
        CONFIG.MMCM_CLKOUT0_DIVIDE_F {4.000} \
        CONFIG.MMCM_CLKOUT1_DIVIDE {12} \
        CONFIG.NUM_OUT_CLKS {2} \
        CONFIG.PRIM_SOURCE {Differential_clock_capable_pin} \
        CONFIG.RESET_PORT {resetn} \
        CONFIG.RESET_TYPE {ACTIVE_LOW} \
        ] [get_bd_cells clk_wiz_0] 
    """)


    // Export the input clock for the clocking wizard
    tclFile.write("""create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 pcie_refclk
        connect_bd_intf_net [get_bd_intf_pins clk_wiz_0/CLK_IN1_D] [get_bd_intf_ports pcie_refclk]
        """)

    

    // Create a processor system reset for the APB reset (100 MHZ) and the System reset (300 MHZ)
    tclFile.write("create_bd_port -dir I -type rst reset_rtl\n")
    tclFile.write("create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_clk_wiz_0_300M\n")
    tclFile.write("create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_clk_wiz_0_100M\n")

    // Connect clk_out1 (300 MhZ) to the first reset system
    tclFile.write("connect_bd_net [get_bd_pins clk_wiz_0/clk_out1] [get_bd_pins rst_clk_wiz_0_300M/slowest_sync_clk]\n")
    tclFile.write("connect_bd_net [get_bd_pins clk_wiz_0/locked] [get_bd_pins rst_clk_wiz_0_300M/dcm_locked]\n")

    // Connect clk_out2 (100 MhZ) to the second reset system
    tclFile.write("connect_bd_net [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins rst_clk_wiz_0_100M/slowest_sync_clk]\n")
    tclFile.write("connect_bd_net [get_bd_pins clk_wiz_0/locked] [get_bd_pins rst_clk_wiz_0_100M/dcm_locked]\n")

    // Export the reset signals
    tclFile.write("connect_bd_net [get_bd_ports reset_rtl] [get_bd_pins rst_clk_wiz_0_300M/ext_reset_in]\n")
    tclFile.write("connect_bd_net [get_bd_ports reset_rtl] [get_bd_pins rst_clk_wiz_0_100M/ext_reset_in]\n")
    tclFile.write("connect_bd_net [get_bd_ports reset_rtl] [get_bd_pins clk_wiz_0/resetn]\n")


    // HBM instantiation
    tclFile.write("create_bd_cell -type ip -vlnv xilinx.com:ip:hbm:1.0 hbm_0\n")


    // HBM configuration
    tclFile.write("""
        set_property -dict [list \
        CONFIG.USER_HBM_DENSITY {16GB} \
        CONFIG.USER_MC0_ECC_BYPASS {true}  \
        CONFIG.USER_XSDB_INTF_EN {FALSE} \
        CONFIG.USER_APB_EN {false} \
        CONFIG.USER_SWITCH_ENABLE_00 {FALSE} \
        CONFIG.USER_SWITCH_ENABLE_01 {FALSE} \
    """)

    for (i <- 0 until 32) {
        tclFile.write("CONFIG.USER_SAXI_" + f"${i}%02d" + " {true} \\\n")
    }

    tclFile.write("] [get_bd_cells hbm_0] \n")


    // Create a constant of width 32 bits and value 0x00000000 and connect to the parity input of the HBM
    tclFile.write("create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0\n")
    tclFile.write("set_property -dict [list CONFIG.CONST_VAL {0} CONFIG.CONST_WIDTH {32} ] [get_bd_cells xlconstant_0]\n")
    for(i <- 0 until 32){
        tclFile.write("connect_bd_net [get_bd_pins xlconstant_0/dout] [get_bd_pins hbm_0/AXI_"+f"${i}%02d"+"_WDATA_PARITY]\n")
    }


    // Create a single smart connect to access the whole memory
    tclFile.write(f"create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_fullMem \n")
    tclFile.write(f"set_property -dict [list \\\n CONFIG.NUM_MI {16} \\\n CONFIG.NUM_SI {5} \\\n ] [get_bd_cells smartconnect_fullMem] \n")
    tclFile.write(f"connect_bd_net [get_bd_pins smartconnect_fullMem/aresetn] [get_bd_pins rst_clk_wiz_0_300M/peripheral_aresetn]\n")
    tclFile.write(f"connect_bd_net [get_bd_pins smartconnect_fullMem/ACLK] [get_bd_pins clk_wiz_0/clk_out1]\n")
    

    // Instantiate 16 smart connects, 16 address remappers, and 16 caches for all the HBM address channels
    for (i <- 0 until 16) {
        // Create the smart connect
        tclFile.write(f"create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_${i}%02d \n")
        // Configure the smart connect
        tclFile.write(f"set_property -dict [list \\\n CONFIG.NUM_MI {2} \\\n CONFIG.NUM_SI {1} \\\n ] [get_bd_cells smartconnect_${i}%02d] \n")
        
        // Create the axi remapper
        tclFile.write(f"create_bd_cell -type module -reference Axi4Remapper_RW Axi4Remapper_RW_${i} \n")
        // Configure the axi remapper
        tclFile.write("""set_property -dict [list \
        CONFIG.MASK {0x00000003FFFFFFFF} \
        CONFIG.WIDTH_ADDR {36} \
        CONFIG.WIDTH_DATA {128} \
        ] [get_bd_cells """+f"Axi4Remapper_RW_" + f"${i}" + "]\n")

        // Create the system cache
        tclFile.write(f"create_bd_cell -type ip -vlnv xilinx.com:ip:system_cache:5.0 system_cache_${i} \n")
        
        // Configure the system cache
        tclFile.write(f"set_property -dict [list CONFIG.C_M0_AXI_DATA_WIDTH.VALUE_SRC USER] [get_bd_cells system_cache_${i}]\n"+
        """set_property -dict [list \
        CONFIG.C_CACHE_DATA_WIDTH {128} \
        CONFIG.C_CACHE_SIZE {65536} \
        CONFIG.C_NUM_GENERIC_PORTS {1} \
        CONFIG.C_NUM_OPTIMIZED_PORTS {0} \
        CONFIG.C_M0_AXI_DATA_WIDTH {128} \
        """+
        f"] [get_bd_cells system_cache_${i}]\n")

        
    }




    // EXPORT HBM_CATTRIP_LS 
    tclFile.write("""
    create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_1
    set_property -dict [list CONFIG.C_OPERATION {or} CONFIG.C_SIZE {1} ] [get_bd_cells util_vector_logic_1]
    create_bd_port -dir O HBM_CATTRIP_LS
    connect_bd_net [get_bd_ports HBM_CATTRIP_LS] [get_bd_pins util_vector_logic_1/Res]
    connect_bd_net [get_bd_pins util_vector_logic_1/Op1] [get_bd_pins hbm_0/DRAM_0_STAT_CATTRIP]
    connect_bd_net [get_bd_pins util_vector_logic_1/Op2] [get_bd_pins hbm_0/DRAM_1_STAT_CATTRIP]
    """)

    // Connect the APB clocks and the HBM refclks with clk2
    tclFile.write("""connect_bd_net [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins hbm_0/HBM_REF_CLK_*]
        connect_bd_net [get_bd_pins hbm_0/APB_*_PCLK] [get_bd_pins clk_wiz_0/clk_out2]
        """)


    // Connect axi clocks
    tclFile.write("connect_bd_net [get_bd_pins clk_wiz_0/clk_out1] [get_bd_pins -hierarchical AXI*ACLK*] \n")
    
    // Connnect the reset signals
    tclFile.write("connect_bd_net [get_bd_pins rst_clk_wiz_0_300M/peripheral_aresetn] [get_bd_pins -hierarchical *AXI*ARESET*]\n")
    tclFile.write("connect_bd_net [get_bd_pins rst_clk_wiz_0_100M/peripheral_aresetn] [get_bd_pins -hierarchical *PRESET*]\n")


    // Connect the axi remappers, system caches, and the smart connects
    for (i <- 0 until 16) { 
        tclFile.write(f"connect_bd_net [get_bd_pins system_cache_${i}/ARESETN] [get_bd_pins rst_clk_wiz_0_300M/peripheral_aresetn]\n")
        tclFile.write(f"connect_bd_net [get_bd_pins smartconnect_${i}%02d/aresetn] [get_bd_pins rst_clk_wiz_0_300M/peripheral_aresetn]\n")
        tclFile.write(f"connect_bd_net [get_bd_pins system_cache_${i}/ACLK] [get_bd_pins clk_wiz_0/clk_out1]\n")
        tclFile.write(f"connect_bd_net [get_bd_pins smartconnect_${i}%02d/ACLK] [get_bd_pins clk_wiz_0/clk_out1]\n")
        tclFile.write(f"connect_bd_intf_net [get_bd_intf_pins smartconnect_fullMem/M${i}%02d_AXI] [get_bd_intf_pins Axi4Remapper_RW_${i}/S_AXI] \n")
        tclFile.write(f"connect_bd_intf_net [get_bd_intf_pins Axi4Remapper_RW_${i}/M_AXI] [get_bd_intf_pins system_cache_${i}/S0_AXI_GEN]\n")
        tclFile.write(f"connect_bd_intf_net [get_bd_intf_pins system_cache_${i}/M0_AXI] [get_bd_intf_pins smartconnect_${i}%02d/S00_AXI]\n")
        tclFile.write("connect_bd_intf_net [get_bd_intf_pins smartconnect_"+f"${i}%02d"+"/M00_AXI] [get_bd_intf_pins hbm_0/SAXI_"+f"${2*i}%02d"+"_8HI]" + "\n")
        tclFile.write("connect_bd_intf_net [get_bd_intf_pins smartconnect_"+f"${i}%02d"+"/M01_AXI] [get_bd_intf_pins hbm_0/SAXI_"+f"${2*i+1}%02d"+"_8HI]" + "\n")
    }

    // Create a Microblaze
    tclFile.write("create_bd_cell -type ip -vlnv xilinx.com:ip:microblaze:11.0 microblaze_0\n")

    // Microblaze configuration
    tclFile.write("apply_bd_automation -rule xilinx.com:bd_rule:microblaze" + 
    " -config { axi_intc {1} axi_periph {Enabled} cache {None} clk {/clk_wiz_0/clk_out1 (300 MHz)} cores {1}" +
    " debug_module {Debug & UART} ecc {None} local_mem {128KB} preset {None}}  [get_bd_cells microblaze_0]" + "\n")

    tclFile.write("""set_property -dict [list \
        CONFIG.C_DATA_SIZE {64} \
        CONFIG.C_DEBUG_ENABLED {1} \
        CONFIG.C_M_AXI_DP_DATA_WIDTH {64} \
        CONFIG.C_USE_BARREL {1} \
        CONFIG.C_USE_HW_MUL {1} \
        CONFIG.G_USE_EXCEPTIONS {1} \
        ] [get_bd_cells microblaze_0]
        """)


    // APB complete to microblaze 
    // Microblaze axi periph should be changed later
    tclFile.write("""
    create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_0
    set_property CONFIG.C_SIZE {1} [get_bd_cells util_vector_logic_0]
    connect_bd_net [get_bd_pins hbm_0/apb_complete_0] [get_bd_pins util_vector_logic_0/Op1]
    connect_bd_net [get_bd_pins hbm_0/apb_complete_1] [get_bd_pins util_vector_logic_0/Op2]
    create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_0
    set_property -dict [list CONFIG.C_ALL_INPUTS {1} CONFIG.C_GPIO_WIDTH {1} ] [get_bd_cells axi_gpio_0]
    connect_bd_net [get_bd_pins util_vector_logic_0/Res] [get_bd_pins axi_gpio_0/gpio_io_i]
    set_property CONFIG.NUM_MI {3} [get_bd_cells microblaze_0_axi_periph] 
    connect_bd_intf_net -boundary_type upper [get_bd_intf_pins microblaze_0_axi_periph/M02_AXI] [get_bd_intf_pins axi_gpio_0/S_AXI]
    """)

    // Assign addresses
    for (i <- 0 until 16){
        tclFile.write("assign_bd_address -target_address_space /Axi4Remapper_RW_" + f"${i}" + "/M_AXI [get_bd_addr_seg /hbm_0/SAXI_"+f"${2*i}%02d"+"_8HI/HBM_MEM"+f"${i}%02d"+"] -force" + "\n")
        tclFile.write("assign_bd_address -target_address_space /Axi4Remapper_RW_" + f"${i}" + "/M_AXI [get_bd_addr_seg /hbm_0/SAXI_"+f"${2*i+1}%02d"+"_8HI/HBM_MEM"+f"${2*i+1}%02d"+"] -force" + "\n")
    }

    
    

    // close the file
    tclFile.close()
    
} 

object tclGen extends App {
    val temp = new tclGen()
}