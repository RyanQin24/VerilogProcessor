###############################################################################
# Clock
###############################################################################
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10.000 -name sys_clk -waveform {0 5} [get_ports clk]

###############################################################################
# SPI Bus 0 - Flash Memory (PMOD JA)
###############################################################################
set_property PACKAGE_PIN J1 [get_ports flash_spi_sck]
set_property IOSTANDARD LVCMOS33 [get_ports flash_spi_sck]

set_property PACKAGE_PIN L2 [get_ports flash_spi_mosi]
set_property IOSTANDARD LVCMOS33 [get_ports flash_spi_mosi]

set_property PACKAGE_PIN J2 [get_ports flash_spi_miso]
set_property IOSTANDARD LVCMOS33 [get_ports flash_spi_miso]

set_property PACKAGE_PIN G2 [get_ports flash_spi_cs]
set_property IOSTANDARD LVCMOS33 [get_ports flash_spi_cs]

###############################################################################
# SPI Bus 1 - Register Debug Interface (PMOD JB)
###############################################################################
set_property PACKAGE_PIN A14 [get_ports dbg_spi_sck]
set_property IOSTANDARD LVCMOS33 [get_ports dbg_spi_sck]

set_property PACKAGE_PIN A16 [get_ports dbg_spi_mosi]
set_property IOSTANDARD LVCMOS33 [get_ports dbg_spi_mosi]

set_property PACKAGE_PIN B15 [get_ports dbg_spi_miso]
set_property IOSTANDARD LVCMOS33 [get_ports dbg_spi_miso]

set_property PACKAGE_PIN B16 [get_ports dbg_spi_cs]
set_property IOSTANDARD LVCMOS33 [get_ports dbg_spi_cs]

###############################################################################
# LEDs
###############################################################################
set_property PACKAGE_PIN U16 [get_ports {led[0]}]
set_property PACKAGE_PIN E19 [get_ports {led[1]}]
set_property PACKAGE_PIN U19 [get_ports {led[2]}]
set_property PACKAGE_PIN V19 [get_ports {led[3]}]
set_property PACKAGE_PIN W18 [get_ports {led[4]}]
set_property PACKAGE_PIN U15 [get_ports {led[5]}]
set_property PACKAGE_PIN U14 [get_ports {led[6]}]
set_property PACKAGE_PIN V14 [get_ports {led[7]}]
set_property PACKAGE_PIN V13 [get_ports {led[8]}]
set_property PACKAGE_PIN V3  [get_ports {led[9]}]
set_property PACKAGE_PIN W3  [get_ports {led[10]}]
set_property PACKAGE_PIN U3  [get_ports {led[11]}]
set_property PACKAGE_PIN P3  [get_ports {led[12]}]
set_property PACKAGE_PIN N3  [get_ports {led[13]}]
set_property PACKAGE_PIN P1  [get_ports {led[14]}]
set_property PACKAGE_PIN L1  [get_ports {led[15]}]

set_property IOSTANDARD LVCMOS33 [get_ports {led[*]}]