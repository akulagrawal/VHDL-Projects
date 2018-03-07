set_property BITSTREAM.CONFIG.CONFIGRATE 33 [current_design]

#setting U18 for clear
#set_property PACKAGE_PIN U18 [get_ports {clear}]
#set_property IOSTANDARD LVCMOS33 [get_ports clear]

#setting ports for data
set_property PACKAGE_PIN V17 [get_ports {data_in[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_in[0]}]
set_property PACKAGE_PIN V16 [get_ports {data_in[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_in[1]}]
set_property PACKAGE_PIN W16 [get_ports {data_in[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_in[2]}]
set_property PACKAGE_PIN W17 [get_ports {data_in[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_in[3]}]
set_property PACKAGE_PIN W15 [get_ports {data_in[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_in[4]}]
set_property PACKAGE_PIN V15 [get_ports {data_in[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_in[5]}]
set_property PACKAGE_PIN W14 [get_ports {data_in[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_in[6]}]
set_property PACKAGE_PIN W13 [get_ports {data_in[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_in[7]}]

set_property PACKAGE_PIN U16 [get_ports {data_out[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_out[0]}]
set_property PACKAGE_PIN E19 [get_ports {data_out[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_out[1]}]
set_property PACKAGE_PIN U19 [get_ports {data_out[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_out[2]}]
set_property PACKAGE_PIN V19 [get_ports {data_out[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_out[3]}]
set_property PACKAGE_PIN W18 [get_ports {data_out[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_out[4]}]
set_property PACKAGE_PIN U15 [get_ports {data_out[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_out[5]}]
set_property PACKAGE_PIN U14 [get_ports {data_out[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_out[6]}]
set_property PACKAGE_PIN V14 [get_ports {data_out[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_out[7]}]

#setting W5 for clock
set_property PACKAGE_PIN W5 [get_ports {Clk}]
set_property IOSTANDARD LVCMOS33 [get_ports Clk]

#setting T18 for reset/allone
#set_property PACKAGE_PIN T18 [get_ports {allone}]
#set_property IOSTANDARD LVCMOS33 [get_ports allone]

#setting R2 for write enable
set_property PACKAGE_PIN R2 [get_ports {we}]
set_property IOSTANDARD LVCMOS33 [get_ports we]

#setting T1 for sense
#set_property PACKAGE_PIN T1 [get_ports {sense}]
#set_property IOSTANDARD LVCMOS33 [get_ports sense]

#setting U1 for apply_preset
#set_property PACKAGE_PIN U1 [get_ports {apply_preset}]
#set_property IOSTANDARD LVCMOS33 [get_ports apply_preset]

#setting ports for address
set_property PACKAGE_PIN V2 [get_ports {wadd[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {wadd[0]}]
set_property PACKAGE_PIN T3 [get_ports {wadd[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {wadd[1]}]
set_property PACKAGE_PIN T2 [get_ports {wadd[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {wadd[2]}]

set_property PACKAGE_PIN R3 [get_ports {radd[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {radd[0]}]
set_property PACKAGE_PIN W2 [get_ports {radd[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {radd[1]}]
set_property PACKAGE_PIN U1 [get_ports {radd[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {radd[2]}]