----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/19/2018 02:12:34 PM
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb is
--  Port ( );
end tb;

architecture Behavioral of tb is
constant baud_div : integer := 10416;
constant bit_period : time := 104160ns;
constant byte_period : time := 1041600ns;
signal clk : std_logic := '0';
signal tx_out : std_logic := '1';
signal rx_in : std_logic := '1';
signal out_data_o : std_logic_vector(15 downto 0);
component main is
port(
    clk : in std_logic;
    uart_txd : out std_logic;
    uart_rxd : in std_logic;
    data_o : out std_logic_vector(15 downto 0)
);
end component;

procedure write_byte (
data_byte       : in  std_logic_vector(7 downto 0);
signal serial : out std_logic) is
begin
serial <= '0';
wait for bit_period;
for i in 0 to 7 loop
  serial <= data_byte(i);
  wait for bit_period;
end loop; 
serial <= '1';
wait for bit_period;
end write_byte;

begin
cut: main
port map(
    clk => clk,
    uart_txd => tx_out,
    uart_rxd => rx_in,
    data_o => out_data_o
);

clk <= not clk after 5ns;

process is
begin
    wait until rising_edge(clk);
    write_byte(X"00", rx_in);
    wait for byte_period;
    write_byte(X"57", rx_in);
    wait for 100ns;
    
    wait until rising_edge(clk);
    write_byte(X"01", rx_in);
    wait for byte_period;
    write_byte(X"9c", rx_in);
    wait for 100ns;
    
    wait until rising_edge(clk);
    write_byte(X"02", rx_in);
    wait for byte_period;
    write_byte(X"23", rx_in);
    wait for 100ns;
    
    wait until rising_edge(clk);
    write_byte(X"03", rx_in);
    wait for byte_period;
    write_byte(X"9c", rx_in);
    wait for 100ns;
    
    wait until rising_edge(clk);
    write_byte(X"04", rx_in);
    wait for byte_period;
    write_byte(X"23", rx_in);
    wait for 100ns;
    
    wait until rising_edge(clk);
    write_byte(X"05", rx_in);
    wait for byte_period;
    write_byte(X"da", rx_in);
    wait for 100ns;
    
    wait until rising_edge(clk);
    write_byte(X"06", rx_in);
    wait for byte_period;
    write_byte(X"9c", rx_in);
    wait for 100ns;
    
    wait until rising_edge(clk);
    write_byte(X"07", rx_in);
    wait for byte_period;
    write_byte(X"da", rx_in);
    wait for 100ns;
    
    wait until rising_edge(clk);
    write_byte(X"10", rx_in);
    wait for 1000ns;
    
    wait until rising_edge(clk);
    write_byte(X"20", rx_in);
    wait for byte_period;

    
    wait until rising_edge(clk);
    write_byte(X"21", rx_in);
    wait for byte_period;
    
    wait until rising_edge(clk);
    write_byte(X"22", rx_in);
    wait for byte_period;
    
    wait until rising_edge(clk);
    write_byte(X"23", rx_in);
    wait for byte_period;
    
    wait until rising_edge(clk);
    write_byte(X"24", rx_in);
    wait for byte_period;
    
    wait until rising_edge(clk);
    write_byte(X"25", rx_in);
    wait for byte_period;
    
    wait until rising_edge(clk);
    write_byte(X"26", rx_in);
    wait for byte_period;
    
    wait until rising_edge(clk);
    write_byte(X"27", rx_in);
    wait for byte_period;
    
    wait until rising_edge(clk);
    write_byte(X"28", rx_in);
    wait for byte_period;
    
    wait until rising_edge(clk);
    write_byte(X"29", rx_in);
    wait for byte_period;
    
    wait until rising_edge(clk);
    write_byte(X"2a", rx_in);
    wait for byte_period;
    
    wait until rising_edge(clk);
    write_byte(X"2b", rx_in);
    wait for byte_period;
    
    wait until rising_edge(clk);
    write_byte(X"2c", rx_in);
    wait for byte_period;
    
    wait until rising_edge(clk);
    write_byte(X"2d", rx_in);
    wait for byte_period;
    
    wait until rising_edge(clk);
    write_byte(X"2e", rx_in);
    wait for byte_period;
    
    wait until rising_edge(clk);
    write_byte(X"2f", rx_in);
    wait for byte_period;
    
    wait until rising_edge(clk);
    write_byte(X"30", rx_in);
    wait for byte_period;
    
end process;
end Behavioral;
