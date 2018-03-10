----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/10/2018 07:12:00 PM
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
use IEEE.numeric_bit.all;
use IEEE.std_logic_unsigned.all;-- Uncomultiplierent the following library declaration if using

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity simulation is
--  Port ( );
end simulation;

architecture Behavioral of simulation is
component main is
Port (  clk : in std_logic;
        address : in std_logic_vector(3 downto 0);
        we : in std_logic;
        compute : in std_logic;
        mode_change : in  std_logic;
        mode_select : in std_logic_vector(1 downto 0);
        data_i : in std_logic_vector(7 downto 0);
        data_o : out std_logic_vector(7 downto 0);
        state_display : out std_logic_vector(1 downto 0));
end component;

signal clk : std_logic := '0';
signal address : std_logic_vector(3 downto 0) := "0000";
signal we : std_logic := '0';
signal compute : std_logic := '0';
signal mode_change : std_logic := '0';
signal mode_select :  std_logic_vector(1 downto 0) := "00";
signal data_i : std_logic_vector(7 downto 0) := "00000000";
signal data_o : std_logic_vector(7 downto 0) := "00000000";
signal state_display : std_logic_vector(1 downto 0) := "00";

begin

CLOCK:
clk <= '1' after 5 ns when clk = '0' else
       '0' after 5 ns when clk = '1';

UUT: main port map(
    clk => clk,
    address => address,
    we => we,
    compute => compute,
    mode_change => mode_change,
    mode_select => mode_select,
    data_i => data_i,
    data_o => data_o,
    state_display => state_display
);

stim_proc: process
begin
mode_select <= "00";
mode_change <= '1';
wait for 50ns;

mode_change <= '0';
we <= '0';
wait for 50ns;

address <= "0000";
data_i <= "00001101";
we <= '1';
wait for 50ns;

we <= '0';
wait for 50ns;

address <= "0001";
data_i <= "00001001";
we <= '1';
wait for 50ns;

we <= '0';
wait for 50ns;

address <= "0010";
data_i <= "00101011";
we <= '1';
wait for 50ns;

we <= '0';
wait for 50ns;

address <= "0011";
data_i <= "00000111";
we <= '1';
wait for 50ns;

we <= '0';
wait for 50ns;

address <= "0100";
data_i <= "00010110";
we <= '1';
wait for 50ns;

we <= '0';
wait for 50ns;

address <= "0101";
data_i <= "10010110";
we <= '1';
wait for 50ns;

we <= '0';
wait for 50ns;

address <= "0110";
data_i <= "00100110";
we <= '1';
wait for 50ns;

we <= '0';
wait for 50ns;

address <= "0111";
data_i <= "00001110";
we <= '1';
wait for 50ns;

we <= '0';
wait for 50ns;

mode_select <= "01";
mode_change <= '1';
wait for 50ns;

mode_change <= '0';
compute <= '1';
wait for 50ns;

compute <= '0';
wait for 50ns;

mode_select <= "00";
mode_change <= '1';
wait for 50ns;

mode_change <= '0';
address <= "0000";
wait for 50 ns;

address <= "0001";
wait for 50 ns;

address <= "0010";
wait for 50 ns;

address <= "0011";
wait for 50 ns;

address <= "0100";
wait for 50 ns;

address <= "0101";
wait for 50 ns;

address <= "0110";
wait for 50 ns;

address <= "0111";
wait for 50 ns;

address <= "1000";
wait for 50 ns;

address <= "1001";
wait for 50 ns;

address <= "1010";
wait for 50 ns;

address <= "1011";
wait for 50 ns;

address <= "1100";
wait for 50 ns;

address <= "1101";
wait for 50 ns;

address <= "1110";
wait for 50 ns;

address <= "1111";
wait for 50 ns;

end process;
end Behavioral;
