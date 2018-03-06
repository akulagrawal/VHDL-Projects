----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2018 02:39:18 PM
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
    Port ( reset : in STD_LOGIC;                            -- reset
           pause :in STD_LOGIC;                             -- enable
           counter : out STD_LOGIC_VECTOR(7 downto 0);      -- output counter value
           clear : in STD_LOGIC;                            -- for clearing
           apply_preset : in STD_LOGIC;                     -- asks if user wants to apply preset
           preset : in STD_LOGIC_VECTOR(7 downto 0);        -- presetting the values
           sense : in STD_LOGIC;                            -- for denoting up/down counting
           CLK : in STD_LOGIC);                             -- clock (actual)
end counter_8bit;

architecture Behavioral of counter_8bit is
    -- inputs to J-K flip flop
    signal J8,J7,J6,J5,J4,J3,J2: std_logic := '0';
    -- Q and Qbar input
    signal Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Qbar1,Qbar2,Qbar3,Qbar4,Qbar5,Qbar6,Qbar7,Qbar8 : std_logic := '0';
    -- for clock divider
    signal newCLK : STD_LOGIC_VECTOR(25 downto 0) := "00000000000000000000000000";

begin
    -- process for clock dividing
    process(CLK)
    begin
        if(CLK'Event and CLK = '1') then
            newCLK <= newCLK + '1';
        end if;
    end process;

    -- giving input to JK flipflop
    process (Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,sense)
    begin
    J2 <= Q1 xor sense;
    J3 <= J2 and (Q2 xor sense);
    J4 <= J3 and (Q3 xor sense);
    J5 <= J4 and (Q4 xor sense);
    J6 <= J5 and (Q5 xor sense);
    J7 <= J6 and (Q6 xor sense);     
    J8 <= J7 and (Q7 xor sense);       
    end process;
    
    -- using the flipflop structure
    FF1 : entity work.struct port map ('1','1',clear,reset,pause,Q1,apply_preset,preset(0),newCLK(25));
    FF2 : entity work.struct port map (J2,J2,clear,reset,pause,Q2,apply_preset,preset(1),newCLK(25));
    FF3 : entity work.struct port map (J3,J3,clear,reset,pause,Q3,apply_preset,preset(2),newCLK(25));
    FF4 : entity work.struct port map (J4,J4,clear,reset,pause,Q4,apply_preset,preset(3),newCLK(25));
    FF5 : entity work.struct port map (J5,J5,clear,reset,pause,Q5,apply_preset,preset(4),newCLK(25));
    FF6 : entity work.struct port map (J6,J6,clear,reset,pause,Q6,apply_preset,preset(5),newCLK(25));
    FF7 : entity work.struct port map (J7,J7,clear,reset,pause,Q7,apply_preset,preset(6),newCLK(25));
    FF8 : entity work.struct port map (J8,J8,clear,reset,pause,Q8,apply_preset,preset(7),newCLK(25));
    -- counter output
    counter <= Q8 & Q7 & Q6 & Q5 & Q4 & Q3 & Q2 & Q1;
    
end Behavioral;
