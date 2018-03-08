----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/08/2018 07:02:19 AM
-- Design Name: 
-- Module Name: ALU - Behavioral
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
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( A,B,S : in STD_LOGIC_Vector (3 downto 0);
           Cn,M : in STD_LOGIC;
           LED_out : out  STD_LOGIC_VECTOR(6 downto 0);
           Cout,P,G,sign : out STD_LOGIC;
           Anode_Activate : out STD_LOGIC_VECTOR (3 downto 0);-- 4 Anode signals
           clock_100Mhz : in STD_LOGIC -- 100Mhz clock on Basys 3 FPGA board
           );
end ALU;

architecture Behavioral of ALU is

signal p0,p1,p2,p3,g0,g1,g2,g3,c0,c1,c2,c3,e0,e1,e2,e3,mc,x,y,z,out1,temp2 : STD_LOGIC;
signal temp :STD_LOGIC_Vector (3 downto 0);
signal F : STD_LOGIC_Vector (3 downto 0);
signal LED_BCD: STD_LOGIC_VECTOR (3 downto 0);
signal refresh_counter: STD_LOGIC_VECTOR (20 downto 0);
-- the first 19-bit for creating 190Hz refresh rate
signal LED_activating_counter: std_logic_vector(1 downto 0);
-- the other 2-bit for creating 4 LED-activating signals
-- count         0    ->  1  ->  2  ->  3
-- activates    LED1    LED2   LED3   LED4
-- and repeat

begin

process( A,B,M,S,p0,p1,p2,p3,g0,g1,g2,g3,c0,c1,c2,c3,e0,e1,e2,e3,mc,x,Cn,y,F,z,temp )
begin

p0 <= NOT ( ( A(0) ) OR ( B(0) AND S(0) ) OR ( (NOT B(0)) AND S(1) ) );
g0 <= NOT ( ( ( NOT B(0) ) AND S(2) AND A(0) ) OR ( A(0) AND B(0) AND S(3) ) );

p1 <= NOT ( ( A(1) ) OR ( B(1) AND S(0) ) OR ( (NOT B(1)) AND S(1) ) );
g1 <= NOT ( ( ( NOT B(1) ) AND S(2) AND A(1) ) OR ( A(1) AND B(1) AND S(3) ) );

p2 <= NOT ( ( A(2) ) OR ( B(2) AND S(0) ) OR ( (NOT B(2)) AND S(1) ) );
g2 <= NOT ( ( ( NOT B(2) ) AND S(2) AND A(2) ) OR ( A(2) AND B(2) AND S(3) ) );

p3 <= NOT ( ( A(3) ) OR ( B(3) AND S(0) ) OR ( (NOT B(3)) AND S(1) ) );
g3 <= NOT ( ( ( NOT B(3) ) AND S(2) AND A(3) ) OR ( A(3) AND B(3) AND S(3) ) );

mc <= NOT M;

c0 <= Cn NAND mc ;
e0 <= ( p0 XOR g0 );


c1 <= NOT ( ( mc AND p0 ) OR ( mc AND Cn AND g0 ) );
e1 <= ( p1 XOR g1 );


c2 <= NOT ( ( mc AND p1 ) OR ( mc AND Cn AND g0 AND g1 ) OR ( mc AND p0 AND g1 ) );
e2 <= ( p2 XOR g2 );


c3 <= NOT ( ( mc AND p2 ) OR ( mc AND Cn AND g0 AND g1 AND g2 ) OR ( mc AND p0 AND g1 AND g2 ) OR ( mc AND p1 AND g2 ) );
e3 <= ( p3 XOR g3 );



x <= ( p3 OR ( g3 AND p2 ) OR ( g3 AND g2 AND p1 ) OR ( g3 AND g2 AND g1 AND p0 ) );
y <=  (( g3 AND g2 AND g1 AND g0 AND Cn ) OR ( x )); 

z <= (y) AND ( NOT M ) AND S(1) AND ( ( Cn AND S(0) ) OR ( ( NOT S(3) ) AND S(2) AND ( NOT S(0) ) ) );

F(0) <= ( c0 XOR e0 );
F(1) <= ( c1 XOR e1 );
F(2) <= ( c2 XOR e2 );
F(3) <= ( c3 XOR e3 );

if  ( z = '1' ) then
    temp <= NOT F;
    F <= temp + '1';
end if;
end process;

G <= NOT ( g0 AND g1 AND g2 AND g3 ) ;
P <= NOT x;
Cout <= NOT y;
sign <= z;

process(out1,y,A,B,S,temp2)
begin
temp2 <= (S(1) AND ( S(0) OR ((NOT S(3)) AND S(2) AND (NOT S(3)) )));
if (A >= B ) and ( temp2 = '1') then
    out1 <= NOT y;   
else 
    out1 <= y;
end if;


end process;

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
    end case;
end process;
-- 7-segment display controller
-- generate refresh rate of 190HZ
process(clock_100Mhz)
begin 
--    if(reset='1') then
--        refresh_counter <= (others => '0');
    if(rising_edge(clock_100Mhz)) then
        refresh_counter <= refresh_counter + 1;
    end if;
end process;

--Anode_Activate <= "1100";
--Anode_Activate <= "1110";
 LED_activating_counter <= refresh_counter(20 downto 19);
-- 4-to-1 MUX to generate anode activating signals for 4 LEDs 
process(LED_activating_counter,F,A,B,y,z,out1)
begin
    case LED_activating_counter is
    when "00" =>
        Anode_Activate <= "0111"; 
        -- activate LED1 and Deactivate LED2, LED3, LED4
        LED_BCD <= A;
        -- the first hex digit of the 16-bit number
    when "01" =>
        Anode_Activate <= "1011"; 
        -- activate LED2 and Deactivate LED1, LED3, LED4
        LED_BCD <= B;
        -- the second hex digit of the 16-bit number
    when "10" =>
        Anode_Activate <= "1101"; 
        -- activate LED3 and Deactivate LED2, LED1, LED4
        if (( z = '0' ) and ( out1 = '0' ) ) then
            LED_BCD <= "0001";
        else 
            LED_BCD <= "0000";
        end if;
        -- the third hex digit of the 16-bit number
    when "11" =>
        Anode_Activate <= "1110"; 
        -- activate LED4 and Deactivate LED2, LED3, LED1
        LED_BCD <= F;
        -- the fourth hex digit of the 16-bit number    
    end case;
end process;
end Behavioral;
