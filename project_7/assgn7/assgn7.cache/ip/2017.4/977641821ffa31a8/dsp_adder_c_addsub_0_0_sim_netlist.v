// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Wed Apr 18 21:58:53 2018
// Host        : LAPTOP-LMI748BN running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ dsp_adder_c_addsub_0_0_sim_netlist.v
// Design      : dsp_adder_c_addsub_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35ticpg236-1L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "dsp_adder_c_addsub_0_0,c_addsub_v12_0_11,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0_11,Vivado 2017.4" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (A,
    B,
    CLK,
    CE,
    S);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [9:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [1:0]B;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF s_intf:c_out_intf:sinit_intf:sset_intf:bypass_intf:c_in_intf:add_intf:b_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN dsp_adder_CLK_0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_LOW" *) input CE;
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME s_intf, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value data} bitwidth {attribs {resolve_type generated dependency bitwidth format long minimum {} maximum {}} value 10} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type generated dependency signed format bool minimum {} maximum {}} value FALSE}}}} DATA_WIDTH 10}" *) output [9:0]S;

  wire [9:0]A;
  wire [1:0]B;
  wire CE;
  wire CLK;
  wire [9:0]S;
  wire NLW_U0_C_OUT_UNCONNECTED;

  (* C_ADD_MODE = "0" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_A_TYPE = "1" *) 
  (* C_A_WIDTH = "10" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_BYPASS_LOW = "0" *) 
  (* C_B_CONSTANT = "0" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "00" *) 
  (* C_B_WIDTH = "2" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_BYPASS = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_C_IN = "0" *) 
  (* C_HAS_C_OUT = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "1" *) 
  (* C_LATENCY = "2" *) 
  (* C_OUT_WIDTH = "10" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_addsub_v12_0_11 U0
       (.A(A),
        .ADD(1'b1),
        .B(B),
        .BYPASS(1'b0),
        .CE(CE),
        .CLK(CLK),
        .C_IN(1'b0),
        .C_OUT(NLW_U0_C_OUT_UNCONNECTED),
        .S(S),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule

(* C_ADD_MODE = "0" *) (* C_AINIT_VAL = "0" *) (* C_A_TYPE = "1" *) 
(* C_A_WIDTH = "10" *) (* C_BORROW_LOW = "1" *) (* C_BYPASS_LOW = "0" *) 
(* C_B_CONSTANT = "0" *) (* C_B_TYPE = "1" *) (* C_B_VALUE = "00" *) 
(* C_B_WIDTH = "2" *) (* C_CE_OVERRIDES_BYPASS = "1" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "0" *) (* C_HAS_CE = "1" *) (* C_HAS_C_IN = "0" *) 
(* C_HAS_C_OUT = "0" *) (* C_HAS_SCLR = "0" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "1" *) (* C_LATENCY = "2" *) 
(* C_OUT_WIDTH = "10" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* downgradeipidentifiedwarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_addsub_v12_0_11
   (A,
    B,
    CLK,
    ADD,
    C_IN,
    CE,
    BYPASS,
    SCLR,
    SSET,
    SINIT,
    C_OUT,
    S);
  input [9:0]A;
  input [1:0]B;
  input CLK;
  input ADD;
  input C_IN;
  input CE;
  input BYPASS;
  input SCLR;
  input SSET;
  input SINIT;
  output C_OUT;
  output [9:0]S;

  wire \<const0> ;
  wire [9:0]A;
  wire ADD;
  wire [1:0]B;
  wire CE;
  wire CLK;
  wire [9:0]S;
  wire NLW_xst_addsub_C_OUT_UNCONNECTED;

  assign C_OUT = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_ADD_MODE = "0" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_A_TYPE = "1" *) 
  (* C_A_WIDTH = "10" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_BYPASS_LOW = "0" *) 
  (* C_B_CONSTANT = "0" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "00" *) 
  (* C_B_WIDTH = "2" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_BYPASS = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_C_IN = "0" *) 
  (* C_HAS_C_OUT = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "1" *) 
  (* C_LATENCY = "2" *) 
  (* C_OUT_WIDTH = "10" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_addsub_v12_0_11_viv xst_addsub
       (.A(A),
        .ADD(ADD),
        .B(B),
        .BYPASS(1'b0),
        .CE(CE),
        .CLK(CLK),
        .C_IN(1'b0),
        .C_OUT(NLW_xst_addsub_C_OUT_UNCONNECTED),
        .S(S),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2015"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
iO2Bdkfy0dqqValMR4KhTWXpD0gDQF+kyoly3tZBTZTVs0CbWJ4Owhu4jxMCf8X2gbWR6iweF6Ks
B5dmLHZTDA==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
dbcEbgyZfx3YLmYpvjegvD9sRQCV1qBv0GqFBvCakC3SMR/H82zqo5uv5MZldBGUVmNHnxF3Vejx
zSqxUKfTNc90CS6quuoQe0eeq3T5XSdgwbNtjPZKvJuJTmQKT96yB3CfQOz13fGjaLrn/8NBUBBh
I7OEoGGg7ADph9V3vRg=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
bD3a4YgAnaoJx9/hljj2C1rODcUhawTVE1gtdPkNj8/YjemaFM6/sF7Q0CXbDJ7a+OBrB5pUgj3O
Vesi4yVmFp+mGmFarftWat5KmZiP3RVWrXwdzMj+f8T7p+lE3iD4njqUxIUz0TsUaNvFeW0xVNNb
OwTEX04nyt5HrU82dltJCclpFxE6yrP9YvI7l328bphwnC63xxk8T3yXwCrvj3VrIYuDT2yMRxrB
TBCv/Fe2f07JQyV73J7+DGAeJG0B1dTHeu48auQT63g1HsYaUXREihEUKgZe70QlOqlPbrr6Quhx
2LXE8LSdCA+FbJ7LlQc/Sgasj3ZYjM5lhEKleQ==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
GCfR7acMSeEtOw1DhZKkUXjh9Uw/vUar7CGDRG9rZcB9NFDtQTltJeuKjFg8eaeKH9HFBMryuX72
/tmzhtFaiSTjr2na4ncL2XV3QRXe7nQaiHdc7cKBcZDvdSSMzOSYcIxLunwLwQTLC7sCvINmlxO1
NXnYzJVL1xb9HP8QVnSYpo1p+gCXcRBZzrOjZjCUnl7F2t3ZZStSGjBEyXVLnV+ouU3+247oJAOa
kC7v+pOtG2ho4KclIg0MGijjPs+jyOFU+b5C+ufQp/zL9GiZ5waCjb/0Y1vkBc9jZKR7YRnv+ASG
ju1uP8oqEXR9742kXRnW4HkMKkCK1MLDgWYdqw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2017_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
L+AGKmFZ1zoRJFd2cA+zxJhkgQ1R0aEjGQCGRFLNNhLHZXpzGDIjdSLjralBVRJ2rD6UcJutapF5
YaMoV9kphGGG2B07dxBuIimVjOxS3ZQJ7ru59ddfGBxUe9EHrv00Q5hTwoxig0lxqnmjSSnfsDeF
weTIqNnXkG5kqqezKC8a2FvUD5QWQBibhK69OAdmhhIOwZmpfvQKbEKgLX70BzcNlmLnttRL7G+q
XZ3fabZ42+JJHDLiIfveB3Gp2Lf2tzTH1u2xx5aEUr9154pnC9PWIwL3y3VBAT1oHR7ScdoGDOEy
HoYUiDibldOidIeKW0KrTeAIuBNmtM4R0R+RSA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
V5ClnklUs5Wo++EDemG/KeowZlAfqB8SUrvSxPQGrdIwGfUvoCajhuABAWdS/L/pQl7Eyz51aiuw
KzPMrWtQozAEITf1xzvzgKbWZqoi4PQD3rThywFsFq60u8DdvHYM/kEvit0cZVFvG8rAbtlseHLu
0vU1kbrNgxb3bxjOovg=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
cRqAgScIUeXUwYGfCC0XDtpcc+mFNm3p8oTcFdtIU1nnlMagpBMqRm5ELc+m/Yw8jBwvcvt4tUFv
u/ypEEw+y12B+5Pr6SmnLJ+NVB3Q3Eyh4Q/d7p3jReIIsUxrlENpCTi4PVXMKr1B1Htzm8F8mXDq
y2UV+0SC+4yrBIntsdS0S8jPBERhfJhzNC5z38pPHANtM4wGGIUuKxIALLz1aq+2AjLbEgFHNrzw
2bJiDwRSTwrY4Yx2MSzYJk3O+cQBUe8nJDPx+aGEvDzQ4ZdJMNg2z+iaiE7OTaqK492Jb/1jvU0j
wlI+n35s2rrnc9QgfljdOJuueruPuYDi5vTTxA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
g5Jm6vlvYG9lJKq75zNCKcnoZg7AAzfkXuEc6APTeMWC2PjWGJmfSSIuqvjpYIyw81a54sBGK4iH
js+Nv+2f25exfmb6B16ODrlt5g+soIeIJTptm+MBQ8uMIypXYB9j9Q3OOxpZRxFEr8OMsaXzm9fX
G4j2fSvCP5/oTmgDakmewowbfSK5ZVNDC7nrPJ4uKpsV0W17s2GtiQh88eH9npS+TiB833DZY9HZ
8ZciQU3S4kIKJIkFlBMJqBJZtIC7Xh1+y/1fG6t34k08gri8pdORRg5fWMlluqMAu7TpomKu44UA
wqWszwid6CmpjONh1ZI/U57Jly9RTjJV4MDscA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
GFPPu9XQ3scowIW/i+Rp4uC9Za0w6sPyUhPEK8e2eJTOh3N5SFnBs79Bu0u+BdjyR9pz6u604b50
zHtV5gLRylB7gnPeBhGjNcnS1B8NorE5Xn7sJLDacf277cEVnm4eVIY83WVNlmqgrpCNUbj8bN9j
e5rA0QyRnrAqxiNrKCsYivpZJgxw2v1natvrxI3o9OoluGA37BHv2sVYV9oEptjKe7Xr+17vWiyk
L450pWh7YdMrfEYIFi8h05uSnO1TwvHv0MwqovE8UzjJzsJajH2R77BRagxOqmkPfHJBmFhrrjLH
HiaIIEwXVphPyUwPn8p/DmODVP8gt4DogoSxOw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 13200)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
