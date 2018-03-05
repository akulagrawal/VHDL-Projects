----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2018 09:38:51 PM
-- Design Name: 
-- Module Name: counter_8bit - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter_8bit is
    -- for general purpose usage according to clock frequency of different boards
    Generic (numBIT : INTEGER := 25);
    
    -- defining the I/O
    Port ( sense : in STD_LOGIC;                      -- for denoting up/down counting
           clear :in STD_LOGIC;                       -- for clearing
           CLK : in STD_LOGIC;                        -- clock (actual)
           allone : in STD_LOGIC;                     -- reset
           preset : in STD_LOGIC_VECTOR(7 downto 0);  -- presetting the values
           pause : in STD_LOGIC;                      -- enable
           apply_preset : in STD_LOGIC;               -- asks if user wants to apply preset
           counterval : out STD_LOGIC_VECTOR(7 downto 0)); -- output counter value
end counter_8bit;

architecture Behavioral of counter_8bit is
-- for clock divider
signal newCLK : STD_LOGIC_VECTOR( numBIT downto 0) := "00000000000000000000000000";
-- for storing the counter result
signal dummyCounter : STD_LOGIC_VECTOR(7 downto 0):= X"00";

begin
    -- process for clock dividing
    process(CLK)
    begin
        if(CLK'Event and CLK = '1') then
            newCLK <= newCLK + '1';
        end if;
    end process;
    
    -- process for changing the value of counter
    process(newCLK(numBIT),sense,pause,apply_preset)
    begin
        -- if clear...set all zero
        if(clear = '1') then
           dummyCounter <= X"00";
        -- if allone...set all ones
        elsif(allone = '1') then
            dummyCounter <= X"FF";
        -- if applypreset is true...then user gives the preset
        elsif(apply_preset = '1') then
            dummyCounter <= preset;
        -- if pause is true...do nothing
        elsif(pause = '0') then
               -- on rising edge...increment/ decrement counter based on sense value
            if(newCLK(numBIT)'Event and newCLK(numBIT) = '1') then
                if(sense = '0') then
                    dummyCounter <= dummyCounter + '1';
                else
                    dummyCounter <= dummyCounter - '1';
                end if;
             end if;
        end if;
    end process;
    -- setting value of counter to vale of dummycounter..
    counterval <= dummyCounter;
end Behavioral;
