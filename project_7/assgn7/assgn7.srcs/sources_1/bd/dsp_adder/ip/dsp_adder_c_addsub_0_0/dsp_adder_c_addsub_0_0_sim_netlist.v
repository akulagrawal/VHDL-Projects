// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Wed Apr 18 21:58:53 2018
// Host        : LAPTOP-LMI748BN running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim {c:/Users/Mitansh
//               Jain/assgn7/assgn7.srcs/sources_1/bd/dsp_adder/ip/dsp_adder_c_addsub_0_0/dsp_adder_c_addsub_0_0_sim_netlist.v}
// Design      : dsp_adder_c_addsub_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35ticpg236-1L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "dsp_adder_c_addsub_0_0,c_addsub_v12_0_11,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0_11,Vivado 2017.4" *) 
(* NotValidForBitStream *)
module dsp_adder_c_addsub_0_0
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
  dsp_adder_c_addsub_0_0_c_addsub_v12_0_11 U0
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
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "c_addsub_v12_0_11" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module dsp_adder_c_addsub_0_0_c_addsub_v12_0_11
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
  dsp_adder_c_addsub_0_0_c_addsub_v12_0_11_viv xst_addsub
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
f3KC8iu7aNjsZWNN/OW+cWRSzTsfqBukNwV9ysFEoyCoSvsZHzjocZfybB5WWACDZrJoVoAu9tAp
vpTmdeRZ1FhdYj3G640/i2vnyQGP/DaqGx8mtuF2fjtVpJssmHbCajHjpdtGq/CggwJSxUkf7lQI
d0ipt3N5sX39sjugFibYI+kaHzWcpYNVL6cu1xNYgDWWOrqDqpqVQl5/XhOnZyR/KTtE47+vTVB4
qRlyjpC0ktuzxF5e8cOsueS136L2L91ePBEF2BkviZYSLd54lahgdMCBtxu5DQbw/ULSqtWNGicY
LChPIsBwA2+phsfTQBKKRZPuZ1lQp+Ep8GMDOg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
R6PA1Up0dCh9Uo7KlcA30jRbpy8i/Irvg/W98xM4sDGgBt49CfsQQDZr3iuUBFLmYOo9qs1LbJ3w
QIuHPlGYqO7pvXo6g1KHu6fojbCoqIuJsfwf0Qz6kDjJOJUioMccXOTGRyp3Gq8edepqZBGr00pT
R4C8B65ZvFB1qvdJBToGeQUsLb6OUVzcy1yFqBl0Nc2t5H8/j9OIZyrNj9mL2dEA6XUqp5c6w28D
zX7hqSP3aj24GH3KPeR2GGy5jkdWkQu+UfvJZLu4OQYtKS0ZaozzPDDbTzcu+lzdQW698iivTH7i
Bcb3lKOsumb871YDXEuGizJt6gjtmwCPD3pluw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 13280)
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
