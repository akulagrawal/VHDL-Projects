----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2018 11:51:13 PM
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

entity testbench is
--  Port ( );
end testbench;

architecture Behavioral of testbench is

component full_adder
  Port ( 
          a : in STD_LOGIC;
          b : in STD_LOGIC;
          c_in : in STD_LOGIC;
          sum : out STD_LOGIC;
          c_out : out STD_LOGIC);
end component;

--Inputs
signal a : std_logic := '0';
signal b : std_logic := '0';
signal c_in : std_logic := '0';
 
--Outputs
signal sum : std_logic;
signal c_out : std_logic;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: full_adder PORT MAP (
    a => a,
    b => b,
    c_in => c_in,
    sum => sum,
    c_out => c_out
    );
    
    -- Stimulus process
    stim_proc: process
    begin
    -- hold reset state for 100 ns.
    wait for 100 ns;
    
    -- insert stimulus here
     a <= '0';
     b <= '0';
     c_in <= '0';
     wait for 10 ns;
     
     a <= '0';
     b <= '0';
     c_in <= '1';
     wait for 10 ns;
     
     a <= '0';
     b <= '1';
     c_in <= '0';
     wait for 10 ns;
     
     a <= '0';
     b <= '1';
     c_in <= '1';
     wait for 10 ns;
     
     a <= '1';
     b <= '0';
     c_in <= '0';
     wait for 10 ns;
          
     a <= '1';
     b <= '0';
     c_in <= '1';
     wait for 10 ns;
          
     a <= '1';
     b <= '1';
     c_in <= '0';
     wait for 10 ns;
          
     a <= '1';
     b <= '1';
     c_in <= '1';
     wait for 10 ns;
     
     end process;

end Behavioral;
