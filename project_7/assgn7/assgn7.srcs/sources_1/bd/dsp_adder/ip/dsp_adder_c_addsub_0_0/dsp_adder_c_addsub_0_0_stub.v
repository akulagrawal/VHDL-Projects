// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Wed Apr 18 21:58:53 2018
// Host        : LAPTOP-LMI748BN running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {c:/Users/Mitansh
//               Jain/assgn7/assgn7.srcs/sources_1/bd/dsp_adder/ip/dsp_adder_c_addsub_0_0/dsp_adder_c_addsub_0_0_stub.v}
// Design      : dsp_adder_c_addsub_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35ticpg236-1L
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "c_addsub_v12_0_11,Vivado 2017.4" *)
module dsp_adder_c_addsub_0_0(A, B, CLK, CE, S)
/* synthesis syn_black_box black_box_pad_pin="A[9:0],B[1:0],CLK,CE,S[9:0]" */;
  input [9:0]A;
  input [1:0]B;
  input CLK;
  input CE;
  output [9:0]S;
endmodule
