// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Wed Apr 18 21:28:41 2018
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
  (* C_LATENCY = "1" *) 
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
(* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "1" *) (* C_LATENCY = "1" *) 
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
  (* C_LATENCY = "1" *) 
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
j9nPjvOohddW8cxVn7dCkHnOjlGmjAQmyZZg5xuf1LvVctgivZMdxYnlwRvtNuTdM/7ABe1bl++p
nEvYz8YkQjZDZPnK9UXByUPO8fdosM77y6ll8aaMblEgBH/8Q5zfyTyUg90OXyfqJJ1V2dPAlBkG
5MZNM7BDd3N2W0fDBc0WAFkGSYl7wzwPT9QaFl+FDDYJn1jJYBPPIOwYvRHDj4FGAIIavJld+KFE
qwd3GjLG3O2BmKS9Ia95JLupy6eGbU5p12VUycow8v1U5foDH9L29sObjkGX30Bk4kNZmIsJfzE3
U6epi5DlqsE8txGkvmiOVnjb/FTDwl65gHP8MQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
LBTsmXQrY8TK73KV1zuJKxiJZISxZlPFwPS2AfdWzw8p3gchGvWDEaJELxsNPV7wEk2YCCVKe9E2
KMhTp5yFs5kvlcQhG8nWwXzGe2emGyHKFzacENIMmqMM7LgC1q+Pgr7xu/f8bI76n0/KsECYGP7/
aoazwSsJbZRzSBPes8LTg7kve4gp2NOgDsKipO94vYOYSJ+OzN/1Ky+GkVfzjF9vbyJAvZLSGvZC
pfs/PluoyOK4lcp+xCAs5nNxiSTiTLimqB3OWAvJFNUOWRKAYTpSd8LuvfHODZrCJYDgAgkSX4/p
QvLpyB4dvQs4E/eNK92MKQ55LAiFj59JY4dHrA==

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
