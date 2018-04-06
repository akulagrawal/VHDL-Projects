----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:11:44 03/29/2018 
-- Design Name: 
-- Module Name:    top_level - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_level is
end top_level;

architecture Behavioral of top_level is
	type state_types is (
		hit_l1,
		hit_l2,
		);
	singal state : state_types := hit_l1;							
begin
	
	proces(clk)
	begin
		if rising_edge(clk) then
			case state is
				when hit_l1=>
					if(l1_hit='1') then
						lru_update <= '1';
						state <= l1_lru_update_down
					else
						
					end if;
				when l1_lru_update_down=>
					incr address
					state <= l1_hit;
		end if;
	end process;

end Behavioral;

