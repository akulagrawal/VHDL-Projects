--Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
--Date        : Sat Mar 31 02:25:37 2018
--Host        : Shubhendu-PC running 64-bit major release  (build 9200)
--Command     : generate_target trace_ram_wrapper.bd
--Design      : trace_ram_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity trace_ram_wrapper is
  port (
    addra_0 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    clka_0 : in STD_LOGIC;
    dina_0 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    douta_0 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    wea_0 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end trace_ram_wrapper;

architecture STRUCTURE of trace_ram_wrapper is
  component trace_ram is
  port (
    addra : in STD_LOGIC_VECTOR ( 9 downto 0 );
    clka : in STD_LOGIC;
    dina : in STD_LOGIC_VECTOR ( 15 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 15 downto 0 );
    wea : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component trace_ram;
begin
trace_ram_i: component trace_ram
     port map (
      addra(9 downto 0) => addra_0(9 downto 0),
      clka => clka_0,
      dina(15 downto 0) => dina_0(15 downto 0),
      douta(15 downto 0) => douta_0(15 downto 0),
      wea(0) => wea_0(0)
    );
end STRUCTURE;
