set_property BITSTREAM.CONFIG.CONFIGRATE 33 [current_design]

# setting U18 for clear
set_property PACKAGE_PIN U18 [get_ports {clear}]
set_property IOSTANDARD LVCMOS33 [get_ports clear]

#setting ports for counter
set_property PACKAGE_PIN U16 [get_ports {counter[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {counter[0]}]
set_property PACKAGE_PIN E19 [get_ports {counter[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {counter[1]}]
set_property PACKAGE_PIN U19 [get_ports {counter[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {counter[2]}]
set_property PACKAGE_PIN V19 [get_ports {counter[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {counter[3]}]
set_property PACKAGE_PIN W18 [get_ports {counter[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {counter[4]}]
set_property PACKAGE_PIN U15 [get_ports {counter[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {counter[5]}]
set_property PACKAGE_PIN U14 [get_ports {counter[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {counter[6]}]
set_property PACKAGE_PIN V14 [get_ports {counter[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {counter[7]}]

# setting W5 for clock
set_property PACKAGE_PIN W5 [get_ports {CLK}]
set_property IOSTANDARD LVCMOS33 [get_ports CLK]

#setting T18 for reset
set_property PACKAGE_PIN T18 [get_ports {reset}]
set_property IOSTANDARD LVCMOS33 [get_ports reset]

#setting R2 for pause
set_property PACKAGE_PIN R2 [get_ports {pause}]
set_property IOSTANDARD LVCMOS33 [get_ports pause]

#setting T1 for sense
set_property PACKAGE_PIN T1 [get_ports {sense}]
set_property IOSTANDARD LVCMOS33 [get_ports sense]

#setting U1 for apply_preset
set_property PACKAGE_PIN U1 [get_ports {apply_preset}]
set_property IOSTANDARD LVCMOS33 [get_ports apply_preset]

#setting ports for preset/load
set_property PACKAGE_PIN V17 [get_ports {preset[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {preset[0]}]
set_property PACKAGE_PIN V16 [get_ports {preset[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {preset[1]}]
set_property PACKAGE_PIN W16 [get_ports {preset[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {preset[2]}]
set_property PACKAGE_PIN W17 [get_ports {preset[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {preset[3]}]
set_property PACKAGE_PIN W15 [get_ports {preset[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {preset[4]}]
set_property PACKAGE_PIN V15 [get_ports {preset[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {preset[5]}]
set_property PACKAGE_PIN W14 [get_ports {preset[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {preset[6]}]
set_property PACKAGE_PIN W13 [get_ports {preset[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {preset[7]}]