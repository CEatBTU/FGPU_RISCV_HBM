set_property CONFIG_VOLTAGE 1.8                        [current_design]
set_property BITSTREAM.CONFIG.CONFIGFALLBACK Enable    [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE           [current_design]
set_property CONFIG_MODE SPIx4                         [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4           [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 85.0          [current_design]
set_property BITSTREAM.CONFIG.EXTMASTERCCLK_EN disable [current_design]
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES        [current_design]
set_property BITSTREAM.CONFIG.UNUSEDPIN Pullup         [current_design]
set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR Yes       [current_design]

#set_property BITSTREAM.CONFIG.UNUSEDPIN pulldown [current_design]
#set_property BITSTREAM.GENERAL.COMPRESS true [current_design]
#set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
#set_property BITSTREAM.CONFIG.CONFIGRATE 85.0 [current_design]
#set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES [current_design]
#set_property CONFIG_VOLTAGE 1.8 [current_design]
#set_property CONFIG_MODE SPIx4 [current_design]
#set_property CFGBVS GND [current_design]

# From U280 design
# set_property BITSTREAM.CONFIG.CONFIGFALLBACK ENABLE [current_design]
#set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR Yes [current_design] 
set_property -dict {PACKAGE_PIN BF41 IOSTANDARD LVCMOS18} [get_ports pcie_perstn]


# Using SYSCLK4
set_property -dict {PACKAGE_PIN F23 IOSTANDARD LVDS} [get_ports clk_user_clk_n]
set_property -dict {PACKAGE_PIN F24 IOSTANDARD LVDS} [get_ports clk_user_clk_p]

#PCIe ref clock to tackle IBUFDS_GTE4 needing a valid LOC constraint
set_property PACKAGE_PIN AL14     [get_ports "pcie_refclk_clk_n"] ;# Bank 227 - MGTREFCLK0N_227
set_property PACKAGE_PIN AL15     [get_ports "pcie_refclk_clk_p"] ;# Bank 227 - MGTREFCLK0P_227

set_property PACKAGE_PIN BM8 [get_ports resetn]
set_property IOSTANDARD LVCMOS18 [get_ports resetn]

set_property PACKAGE_PIN BM14     [get_ports "iic_main_scl_io"] ;# Bank  68 VCCO - VCC1V8   - IO_L5P_T0U_N8_AD14P_68
set_property IOSTANDARD  LVCMOS18 [get_ports "iic_main_scl_io"] ;# Bank  68 VCCO - VCC1V8   - IO_L5P_T0U_N8_AD14P_68
set_property PACKAGE_PIN BN14     [get_ports "iic_main_sda_io"] ;# Bank  68 VCCO - VCC1V8   - IO_L4N_T0U_N7_DBC_AD7N_68
set_property IOSTANDARD  LVCMOS18 [get_ports "iic_main_sda_io"] ;# Bank  68 VCCO - VCC1V8   - IO_L4N_T0U_N7_DBC_AD7N_68
