----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.03.2018 00:10:13
-- Design Name: 
-- Module Name: L1_comparator - Behavioral
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

entity l1_comparator is
Port ( 
    add_tag : in std_logic_vector(6 downto 0);
    data_tag : in std_logic_vector(6 downto 0);
    valid_bit : in std_logic;
    equal : out std_logic
);
end l1_comparator;

architecture Behavioral of l1_comparator is

begin

equal<= (not ((add_tag(0) xor data_tag(0)) or 
        (add_tag(1) xor data_tag(1)) or 
        (add_tag(2) xor data_tag(2)) or 
        (add_tag(3) xor data_tag(3)) or 
        (add_tag(4) xor data_tag(4)) or 
        (add_tag(5) xor data_tag(5)) or
        (add_tag(6) xor data_tag(6)))) and
        valid_bit;
        
end Behavioral;
