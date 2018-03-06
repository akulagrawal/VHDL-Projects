----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2018 02:41:43 PM
-- Design Name: 
-- Module Name: struct - Behavioral
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

entity struct is
    Port ( J : in STD_LOGIC;                    -- J input
           K : in STD_LOGIC;                    -- K input
           clear : in STD_LOGIC;                -- for clearing
           reset : in STD_LOGIC;                -- reset
           enable : in STD_LOGIC;               -- enable
           Q : out STD_LOGIC;                   -- output value
--           Qbar : out STD_LOGIC;
           apply_preset : in STD_LOGIC;         -- asks if user wants to apply preset
           preset : in STD_LOGIC;               -- presetting the values
           CLK : in STD_LOGIC);                 -- clock (actual)
end struct;

architecture Behavioral of struct is
signal qtemp,qbartemp : STD_LOGIC := '0';

begin
-- assigning output
Q <= qtemp;
--Qbar <= qbartemp;
-- process for JK flip flop
process(CLK,reset)
begin
    
    
    -- if applypreset is true...then user gives the preset
    if(apply_preset = '1') then
        qtemp <= preset;
        qbartemp <= not preset;
    -- if allone...set all ones
    elsif(reset = '1') then
        qtemp <= '1';
        qbartemp <= '0';
    -- if clear...set all zero
    elsif(clear = '1') then
        qtemp <= '0';
        qbartemp <= '1';
    -- if pause is true...do nothing
    elsif(enable = '0') then
        -- on rising edge...change the output signals
        if( rising_edge(CLK)) then
            if(J = '0' and K = '1') then
                qtemp <= '0';
                qbartemp <= '1';
            elsif(J = '1' and K = '0') then
                qtemp <= '1';
                qbartemp <= '0';
            elsif(J = '1' and K = '1') then
                qtemp <= not qtemp;
                qbartemp <= not qbartemp;
            end if;
        end if;
    end if;
    
end process;

end Behavioral;
