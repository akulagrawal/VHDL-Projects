----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/10/2018 07:10:17 PM
-- Design Name: 
-- Module Name: binary_to_bcd - Behavioral
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
use IEEE.Numeric_Std.all;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity binary_to_bcd is
    Port ( binary_in : in STD_LOGIC_VECTOR (15 downto 0);
           bcd_out : out STD_LOGIC_VECTOR (19 downto 0);
           clk : in std_logic);
end binary_to_bcd;

architecture Behavioral of binary_to_bcd is
--signal state, state_next: integer range 0 to 18;
--signal bcd, bcd_reg, bcd_next, bcd_stable, bcd_stable_next : std_logic_vector(19 downto 0);
--signal binary, binary_temp : std_logic_vector(15 downto 0);
--begin

----process(clk)
----begin
----    if falling_edge(clk) then
        
----    end if;
----end process;

--process(state, binary_in, binary, binary_temp, bcd, bcd_next)
--begin
--    state_next <= state + 1;
--    case state is
--        when 0 =>
--            state <= state_next;
--            binary_temp <= binary_in;
--            bcd_next <= (others => '0');
--        when 17 =>
--            state <= 0;
--        when others =>
--            state <= state_next;
--            binary_temp <= binary(14 downto 0) & '0';
--            bcd_next <= bcd_reg(18 downto 0) & binary(15);
--    end case;
--    binary <= binary_temp;
--    bcd_stable <= bcd_stable_next;
--    bcd <= bcd_next;     
--end process;

--bcd_reg(19 downto 16) <= bcd(19 downto 16) + 3 when bcd(19 downto 16) > 4 else
--                         bcd(19 downto 16);
--bcd_reg(15 downto 12) <= bcd(15 downto 12) + 3 when bcd(15 downto 12) > 4 else
--                         bcd(15 downto 12);
--bcd_reg(11 downto 8) <= bcd(11 downto 8) + 3 when bcd(11 downto 8) > 4 else
--                        bcd(11 downto 8);
--bcd_reg(7 downto 4) <= bcd(7 downto 4) + 3 when bcd(7 downto 4) > 4 else
--                       bcd(7 downto 4);
--bcd_reg(3 downto 0) <= bcd(3 downto 0) + 3 when bcd(3 downto 0) > 4 else
--                       bcd(3 downto 0);
                            
--bcd_stable_next <= bcd when state = 17 else 
--                   bcd_stable;

--bcd_out <= bcd_stable_next;

---------------------------------
--type states is (start, shift, done);
--signal state, state_next: states; 
--signal binary, binary_next: std_logic_vector(15 downto 0);
--signal bcds, bcds_reg, bcds_next: std_logic_vector(19 downto 0);
--signal bcds_out_reg, bcds_out_reg_next: std_logic_vector(19 downto 0);
--signal shift_counter, shift_counter_next: integer range 0 to 16;
--begin
 
--process(clk)
--begin
--    if falling_edge(clk) then
--        binary <= binary_next;
--        bcds <= bcds_next;
--        state <= state_next;
--        bcds_out_reg <= bcds_out_reg_next;
--        shift_counter <= shift_counter_next;
--    end if;
--end process;

--convert:
--process(state, binary, binary_in, bcds, bcds_reg, shift_counter)
--begin
--    state_next <= state;
--    bcds_next <= bcds;
--    binary_next <= binary;
--    shift_counter_next <= shift_counter;

--    case state is
--        when start =>
--            state_next <= shift;
--            binary_next <= binary_in;
--            bcds_next <= (others => '0');
--            shift_counter_next <= 0;
--        when shift =>
--            if shift_counter = 16 then
--                state_next <= done;
--            else
--                binary_next <= binary(14 downto 0) & '0';
--                bcds_next <= bcds_reg(18 downto 0) & binary(15);
--                shift_counter_next <= shift_counter + 1;
--            end if;
--        when done =>
--            state_next <= start;
--    end case;
--end process;

--bcds_reg(19 downto 16) <= bcds(19 downto 16) + 3 when bcds(19 downto 16) > 4 else
--                          bcds(19 downto 16);
--bcds_reg(15 downto 12) <= bcds(15 downto 12) + 3 when bcds(15 downto 12) > 4 else
--                          bcds(15 downto 12);
--bcds_reg(11 downto 8) <= bcds(11 downto 8) + 3 when bcds(11 downto 8) > 4 else
--                         bcds(11 downto 8);
--bcds_reg(7 downto 4) <= bcds(7 downto 4) + 3 when bcds(7 downto 4) > 4 else
--                        bcds(7 downto 4);
--bcds_reg(3 downto 0) <= bcds(3 downto 0) + 3 when bcds(3 downto 0) > 4 else
--                        bcds(3 downto 0);

--bcds_out_reg_next <= bcds when state = done else
--                     bcds_out_reg;
                        
--bcd_out <= bcds_out_reg;

--bcd4 <= bcds_out_reg(19 downto 16);
--bcd3 <= bcds_out_reg(15 downto 12);
--bcd2 <= bcds_out_reg(11 downto 8);
--bcd1 <= bcds_out_reg(7 downto 4);
--bcd0 <= bcds_out_reg(3 downto 0);

-------------------------------------------------
--type states is (start, shift, done);
signal state, state_next: integer range 0 to 19; 
signal binary, binary_next: std_logic_vector(15 downto 0);
signal bcds, bcds_reg, bcds_next: std_logic_vector(19 downto 0);
signal bcds_out_reg, bcds_out_reg_next: std_logic_vector(19 downto 0);
--signal shift_counter, shift_counter_next: integer range 0 to 16;
begin
 
process(clk)
begin
    if falling_edge(clk) then
        binary <= binary_next;
        bcds <= bcds_next;
        state <= state_next;
        bcds_out_reg <= bcds_out_reg_next;
--        shift_counter <= shift_counter_next;
    end if;
end process;

convert:
process(state, binary, binary_in, bcds, bcds_reg)
begin
    state_next <= state;
    bcds_next <= bcds;
    binary_next <= binary;
--    shift_counter_next <= shift_counter;

    case state is
        when 0 =>
            state_next <= 1;
            binary_next <= binary_in;
            bcds_next <= (others => '0');
--            shift_counter_next <= 0;
        when 18 =>
            state_next <= 0;
        when others =>  
            if state = 17 then
                state_next <= 18;
            else
                binary_next <= binary(14 downto 0) & '0';
                bcds_next <= bcds_reg(18 downto 0) & binary(15);
                state_next <= state +1;
--                shift_counter_next <= shift_counter + 1;
            end if;
    end case;
end process;

bcds_reg(19 downto 16) <= "0000";
bcds_reg(15 downto 12) <= bcds(15 downto 12) + 3 when bcds(15 downto 12) > 4 else
                          bcds(15 downto 12);
bcds_reg(11 downto 8) <= bcds(11 downto 8) + 3 when bcds(11 downto 8) > 4 else
                         bcds(11 downto 8);
bcds_reg(7 downto 4) <= bcds(7 downto 4) + 3 when bcds(7 downto 4) > 4 else
                        bcds(7 downto 4);
bcds_reg(3 downto 0) <= bcds(3 downto 0) + 3 when bcds(3 downto 0) > 4 else
                        bcds(3 downto 0);

bcds_out_reg_next <= bcds when state = 17 else
                     bcds_out_reg;
                        
bcd_out <= bcds_out_reg;

--bcd4 <= bcds_out_reg(19 downto 16);
--bcd3 <= bcds_out_reg(15 downto 12);
--bcd2 <= bcds_out_reg(11 downto 8);
--bcd1 <= bcds_out_reg(7 downto 4);
--bcd0 <= bcds_out_reg(3 downto 0);

end Behavioral;
