----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2018 04:16:08 PM
-- Design Name: 
-- Module Name: ram_rw - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ram_rw is
    Port (  Clk : in std_logic; -- processing clock
            we : in std_logic; -- write enable signal
            wadd : in std_logic_vector(2 downto 0); -- write address to store the data into ram
            radd : in std_logic_vector(2 downto 0); -- read address to read the data from the ram
            data_in : in std_logic_vector(7 downto 0); -- input data to store into ram
            data_out : out std_logic_vector(7 downto 0)); -- output data from memory);
end ram_rw;

architecture Behavioral of ram_rw is

------------------------------------- RAM declaration
type ram is array(127 downto 0) of std_logic_vector(7 downto 0);
signal ram1_1 : ram;
-------------------------------------- Signal declaration
signal r_add : std_logic_vector(2 downto 0);

begin

    process(Clk, we)
    begin
        if Clk'event and Clk = '1' then
            if we = '1' then -- In this process writing the input data into ram
                ram1_1(conv_integer(wadd)) <= data_in;
            end if;
            r_add <= radd;
        end if;
    end process;
    data_out <= ram1_1(conv_integer(r_add)); --Reading the data from RAM

end Behavioral;
