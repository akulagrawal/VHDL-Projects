----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/09/2018 07:17:05 AM
-- Design Name: 
-- Module Name: Multiplier_8bit - Behavioral
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
use IEEE.numeric_bit.all;
use IEEE.std_logic_unsigned.all;

entity Multiplier_8bit is
  Port ( Clk, Start : in std_logic; --clock and start to start multiplication
         A, B : in unsigned(7 downto 0); -- A-> Multiplier and B->Multiplicand
         Anode_Activate : out STD_LOGIC_VECTOR (3 downto 0);-- 4 Anode signals
         LED_out : out STD_LOGIC_VECTOR (6 downto 0); --for 7 segmant display
         res : out unsigned(15 downto 0) --result for LEDs
         );
end Multiplier_8bit;

architecture Behavioral of Multiplier_8bit is
signal state : integer range 1 to 18; -- states for various purposes
signal calculate : unsigned(16 downto 0); --a temporary signal to calculate as booth's algorithm
signal temp : unsigned(15 downto 0); -- temporary signal for LED_OUT
signal LED_BCD: unsigned (3 downto 0); -- for 7 segment
signal refresh_counter: STD_LOGIC_VECTOR (20 downto 0); --for 7 segment
signal LED_activating_counter: std_logic_vector(1 downto 0);
begin
--for 7 segment display output
process(LED_BCD)
begin
    case LED_BCD is
    when "0000" => LED_out <= "0000001"; -- "0"     
    when "0001" => LED_out <= "1001111"; -- "1" 
    when "0010" => LED_out <= "0010010"; -- "2" 
    when "0011" => LED_out <= "0000110"; -- "3" 
    when "0100" => LED_out <= "1001100"; -- "4" 
    when "0101" => LED_out <= "0100100"; -- "5" 
    when "0110" => LED_out <= "0100000"; -- "6" 
    when "0111" => LED_out <= "0001111"; -- "7" 
    when "1000" => LED_out <= "0000000"; -- "8"     
    when "1001" => LED_out <= "0000100"; -- "9" 
    when "1010" => LED_out <= "0000010"; -- a
    when "1011" => LED_out <= "1100000"; -- b
    when "1100" => LED_out <= "0110001"; -- C
    when "1101" => LED_out <= "1000010"; -- d
    when "1110" => LED_out <= "0110000"; -- E
    when "1111" => LED_out <= "0111000"; -- F
    when others => NULL;
    end case;
end process;
-- 7-segment display controller
-- generate refresh rate of 190HZ
process(Clk)
begin 
    if(rising_edge(Clk)) then
        refresh_counter <= refresh_counter + 1;
    end if;
end process;
 LED_activating_counter <= refresh_counter(20 downto 19);
-- 4-to-1 MUX to generate anode activating signals for 4 LEDs 
process(LED_activating_counter)
begin
    case LED_activating_counter is
    when "00" =>
        Anode_Activate <= "0111"; 
        -- activate LED1 and Deactivate LED2, LED3, LED4
          LED_BCD <= temp(15 downto 12);
        -- the first hex digit of the 16-bit number
    when "01" =>
        Anode_Activate <= "1011"; 
        -- activate LED2 and Deactivate LED1, LED3, LED4
        LED_BCD <= temp(11 downto 8);
        -- the second hex digit of the 16-bit number
    when "10" =>
        Anode_Activate <= "1101"; 
        -- activate LED3 and Deactivate LED2, LED1, LED4
             LED_BCD <= temp(7 downto 4);
        -- the third hex digit of the 16-bit number
    when "11" =>
        Anode_Activate <= "1110"; 
        -- activate LED4 and Deactivate LED2, LED3, LED1);
         LED_BCD <= temp(3 downto 0);
        -- the fourth hex digit of the 16-bit number   
     when others => NULL; 
    end case;
end process;
--main multiplicaton proceess
process(Clk)
begin
if(Clk'event and Clk = '1') then
    case state is
        when 1 => --if in state 1
            if(Start = '1') then --if start =1 then start doing multiplication
                calculate(16 downto 8) <= "000000000";       
                calculate(7 downto 0) <= A ;
                state <= 2;
            end if;
        when 2 | 4 | 6 | 8 | 10 | 12 | 14 | 16 => --if state is even
            if(calculate(0) = '1') then 
                calculate(16 downto 8) <= '0' & calculate(15 downto 8) + B;
                state <= state + 1;
            else
                calculate <= '0' & calculate(16 downto 1) ;
                state <= state + 2;
            end if; 
        when 3 | 5 | 7 | 9 | 11 | 13 | 15 | 17 => --if state is output
            calculate <= '0' & calculate(16 downto 1) ;
            state <= state + 1;
        when 18 => --if last state
            state <= 1;
    end case;
end if;
end process;

temp <= calculate(15 downto 0);
res <= calculate(15 downto 0); --for output in LEDs


end Behavioral;
