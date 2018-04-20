--Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
--Date        : Wed Apr 18 20:57:57 2018
--Host        : LAPTOP-LMI748BN running 64-bit major release  (build 9200)
--Command     : generate_target dsp_adder_wrapper.bd
--Design      : dsp_adder_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dsp_adder_wrapper is
  port (
    A_0 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    B_0 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    CE_0 : in STD_LOGIC;
    CLK_0 : in STD_LOGIC;
    S_0 : out STD_LOGIC_VECTOR ( 9 downto 0 )
  );
end dsp_adder_wrapper;

architecture STRUCTURE of dsp_adder_wrapper is
  component dsp_adder is
  port (
    A_0 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    B_0 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    CE_0 : in STD_LOGIC;
    CLK_0 : in STD_LOGIC;
    S_0 : out STD_LOGIC_VECTOR ( 9 downto 0 )
  );
  end component dsp_adder;
begin
dsp_adder_i: component dsp_adder
     port map (
      A_0(9 downto 0) => A_0(9 downto 0),
      B_0(1 downto 0) => B_0(1 downto 0),
      CE_0 => CE_0,
      CLK_0 => CLK_0,
      S_0(9 downto 0) => S_0(9 downto 0)
    );
end STRUCTURE;
