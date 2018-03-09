----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/09/2018 05:19:37 PM
-- Design Name: 
-- Module Name: mean_8num_8bit - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mean_8num_8bit is
    Port (  
            Clk: in std_logic; -- processing clock
            we : in std_logic; -- write enable signal
            mode : in std_logic_vector(1 downto 0); -- four modes 
            add : in std_logic_vector(3 downto 0); -- address to store/display the data in ram
            data_in : in std_logic_vector(7 downto 0); -- input data to store into ram
            data_out : out std_logic_vector(7 downto 0)); -- output data from memory);
end mean_8num_8bit;

architecture Behavioral of mean_8num_8bit is

------------------------------------- RAM declaration
type ram is array(255 downto 0) of std_logic_vector(15 downto 0);
signal ram1_1: ram;
-------------------------------------- Signal declaration
signal n1: integer range 0 to 255;
signal n2: integer range 0 to 255;
signal n3: integer range 0 to 255;
signal n4: integer range 0 to 255;
signal n5: integer range 0 to 255;
signal n6: integer range 0 to 255;
signal n7: integer range 0 to 255;
signal n8: integer range 0 to 255;
signal av: integer range 0 to 255;
signal addr : std_logic_vector(3 downto 0);

begin

    process(Clk, we, mode, add, data_in, ram1_1)
    begin

        if(we = '1' and Clk'event and Clk = '1') then
            case mode is
            when "00" =>
                --if(Clk'event and Clk = '1') then
                    -- In this process writing the input data into ram
                    ram1_1(conv_integer(add)) <= data_in;
                --end if;
                data_out <= ram1_1(conv_integer(add))(7 downto 0);
            --when "10" =>
              --  data_out <= ram1_1(conv_integer(add))(7 downto 0);
            when "01" =>
                n1 <= conv_integer(ram1_1(conv_integer(0)));
                n2 <= conv_integer(ram1_1(conv_integer(1)));
                n3 <= conv_integer(ram1_1(conv_integer(2)));
                n4 <= conv_integer(ram1_1(conv_integer(3)));
                n5 <= conv_integer(ram1_1(conv_integer(4)));
                n6 <= conv_integer(ram1_1(conv_integer(5)));
                n7 <= conv_integer(ram1_1(conv_integer(6)));
                n8 <= conv_integer(ram1_1(conv_integer(7)));
                av <= (n1+n2+n3+n4+n5+n6+n7+n8)/8;
                ram1_1(8) <= std_logic_vector(to_unsigned(av, 16));
                data_out <= ram1_1(conv_integer(add))(7 downto 0);
            when "10" =>
                data_out <= ram1_1(conv_integer(8))(7 downto 0);
            when others =>
                ram1_1(0) <= X"00";
                ram1_1(1) <= X"00";
                ram1_1(2) <= X"00";
                ram1_1(3) <= X"00";
                ram1_1(4) <= X"00";
                ram1_1(5) <= X"00";
                ram1_1(6) <= X"00";
                ram1_1(7) <= X"00";
                ram1_1(8) <= X"00";
                data_out <= X"00";
            end case;
        end if;
        
    end process;

end Behavioral;
