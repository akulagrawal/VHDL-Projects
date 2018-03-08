----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/08/2018 07:05:34 AM
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity testbench is
--  Port ( );
end testbench;

architecture Behavioral of testbench is

component ALU
      Port ( A : in STD_LOGIC_Vector (3 downto 0);
             B : in STD_LOGIC_Vector (3 downto 0);
             S : in STD_LOGIC_Vector (3 downto 0);
             Cn : in STD_LOGIC;
             M : in STD_LOGIC;
             LED_out : out STD_LOGIC_Vector (6 downto 0);
             Cout : out STD_LOGIC;
             P : out STD_LOGIC;
             G : out STD_LOGIC);
  end component;

  signal A: STD_LOGIC_Vector (3 downto 0);
  signal B: STD_LOGIC_Vector (3 downto 0);
  signal S: STD_LOGIC_Vector (3 downto 0);
  signal Cn: STD_LOGIC;
  signal M: STD_LOGIC;
  signal LED_out: STD_LOGIC_Vector (6 downto 0);
  signal Cout: STD_LOGIC;
  signal P: STD_LOGIC;
  signal G: STD_LOGIC;

begin

  uut: ALU port map ( A    => A,
                      B    => B,
                      S    => S,
                      Cn   => Cn,
                      M    => M,
                      LED_out    => LED_out,
                      Cout => Cout,
                      P    => P,
                      G    => G );

  stimulus: process
  begin
  
    -- Put initialisation code here
--    wait for 100 ns;
    M <= '0';
    S <= "0000";
    A <= "0101";
    B <= "0011";
    Cn <= '1';
    wait for 30 ns;
    
--    M <= '0';
--    B <= "0001";
--    Cn <= '0';
    S <= "0001";
    wait for 30 ns;
    
--    S <= "0010";
--    wait for 30 ns;
        
    S <= "1001";
    wait for 30 ns; 
    
    A <= "1001";
    B <= "1010";
    S <= "1001";
    wait for 30 ns; 

    wait;
  end process;


end Behavioral;
