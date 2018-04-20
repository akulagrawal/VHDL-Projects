----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.04.2018 23:16:43
-- Design Name: 
-- Module Name: binary_bcd - Behavioral
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


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity binary_bcd is
generic(N: positive := 12);
port(
clk: in std_logic;
binary_in: in std_logic_vector(N-1 downto 0);
bcd_out: out std_logic_vector(15 downto 0)
);

end binary_bcd ;

architecture Behavioral of binary_bcd is
type states is (start, shift, done);
signal state, state_next: states;
signal binary, binary_next: std_logic_vector(N-1 downto 0);
signal bcds, bcds_reg, bcds_next: std_logic_vector(15 downto 0);
-- output register keep output constant during conversion
signal bcds_out_reg, bcds_out_reg_next: std_logic_vector(15 downto 0);
-- need to keep track of shifts
signal shift_counter, shift_counter_next: natural range 0 to N;
begin

convert:

process(clk)
begin
if falling_edge(clk) then
    binary <= binary_next;
    bcds <= bcds_next;
    state <= state_next;
    bcds_out_reg <= bcds_out_reg_next;
    shift_counter <= shift_counter_next;
end if;
end process;

process(state, binary, binary_in, bcds, bcds_reg, shift_counter)
begin
    state_next <= state;
    bcds_next <= bcds;
    binary_next <= binary;
    shift_counter_next <= shift_counter;
    case state is
        when start =>
            state_next <= shift;
            binary_next <= binary_in;
            bcds_next <= (others => '0');
            shift_counter_next <= 0;
        when shift =>
            if shift_counter = N then
                state_next <= done;
            else
                binary_next <= binary(N-2 downto 0) & 'L';
                bcds_next <= bcds_reg(14 downto 0) & binary(N-1);
                shift_counter_next <= shift_counter + 1;
            end if;
        when done =>
            state_next <= start;
        end case;
end process;

bcds_reg(15 downto 12) <= bcds(15 downto 12) + 3 when bcds(15 downto 12) > 4 else
bcds(15 downto 12);
bcds_reg(11 downto 8) <= bcds(11 downto 8) + 3 when bcds(11 downto 8) > 4 else
bcds(11 downto 8);
bcds_reg(7 downto 4) <= bcds(7 downto 4) + 3 when bcds(7 downto 4) > 4 else
bcds(7 downto 4);
bcds_reg(3 downto 0) <= bcds(3 downto 0) + 3 when bcds(3 downto 0) > 4 else
bcds(3 downto 0);
bcds_out_reg_next <= bcds when state = done else
bcds_out_reg;
bcd_out <= bcds_out_reg;


end Behavioral;
