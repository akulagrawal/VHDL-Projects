----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/09/2018 07:20:14 AM
-- Design Name: 
-- Module Name: testbench - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_bit.all;
use IEEE.std_logic_unsigned.all;-- Uncomultiplierent the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomultiplierent the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sim is
--  Port ( );
end sim;

architecture Behavioral of sim is

component Multiplier_8bit is
 Port ( 
 Start : in STD_LOGIC;
 Clk : in STD_LOGIC;                       --Variable to behave as a 100 Mhz clock 
 A : in unsigned(7 downto 0);               --First 8 bit input
 B : in unsigned(7 downto 0);               --Second 8 bit input
 res : out unsigned(15 downto 0)
 );
end component;

 signal A : unsigned(7 downto 0) := (others => '0');
 signal B :unsigned(7 downto 0) := (others => '0');
 signal res : unsigned(15 downto 0) := (others => '0');
 signal Clk : std_logic := '1';
 signal Start : std_logic:='1';


begin

CLOCK:
 clk <=  '1' after 5 ns when clk = '0' else
         '0' after 5 ns when clk = '1';
-- Instantiate the Unit Under Test (UUT)
 uut: Multiplier_8bit PORT MAP (
 A => A,
 B => B,
 res => res,
 Clk => Clk,
 Start => Start
 );
 
 stim_proc: process
 begin
 -- hold reset state for 100 ns.
-- wait for 1 ns; 
 
 A <= "00001111";
 B <= "00000111";
-- Start <= '1';
 wait for 200 ns;
-- start<='0';
-- wait for 100 ns;
--  a <= "11111111";
-- b <= "11111111";
-- start<='1';
-- wait for 200 ns; 
--   a <= "00000011";
--b <= "00000101"; 
-- a <= "00000011";
-- b <= "00000101";  
 end process;
end Behavioral;
