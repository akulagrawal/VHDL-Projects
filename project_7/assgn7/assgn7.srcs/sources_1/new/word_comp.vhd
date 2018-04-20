----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.04.2018 18:30:35
-- Design Name: 
-- Module Name: word_comp - Behavioral
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

entity word_comp is
    Port (
        test_word : in std_logic_vector(127 downto 0);
        res_word : in std_logic_vector(127 downto 0);
        equal : out std_logic
    );
end word_comp;

architecture Behavioral of word_comp is
    signal equal_vec : std_logic_vector(15 downto 0) := x"0000";
begin
    
--    equal_vec <= (((test_word(127 downto 120) xnor res_word(127 downto 120)) or not(res_word(127 downto 120))) and
--                  ((test_word(119 downto 112) xnor res_word(119 downto 112)) or not(res_word(119 downto 112))) and
--                  ((test_word(111 downto 104) xnor res_word(111 downto 104)) or not(res_word(111 downto 104))) and
--                  ((test_word(103 downto 96) xnor res_word(103 downto 96)) or (res_word(103 downto 96))) and
--                  ((test_word(95 downto 88) xnor res_word(95 downto 88)) or not(res_word(95 downto 88))) and
--                  ((test_word(87 downto 80) xnor res_word(87 downto 80)) or not(res_word(87 downto 80))) and
--                  ((test_word(79 downto 72) xnor res_word(79 downto 72)) or not(res_word(79 downto 72))) and
--                  ((test_word(71 downto 64) xnor res_word(71 downto 64)) or not(res_word(71 downto 64))) and
--                  ((test_word(63 downto 56) xnor res_word(63 downto 56)) or not(res_word(63 downto 56))) and
--                  ((test_word(55 downto 48) xnor res_word(55 downto 48)) or not(res_word(55 downto 48))) and
--                  ((test_word(47 downto 40) xnor res_word(47 downto 40)) or not(res_word(47 downto 40))) and
--                  ((test_word(39 downto 32) xnor res_word(39 downto 32)) or not(res_word(39 downto 32))) and
--                  ((test_word(31 downto 24) xnor res_word(31 downto 24)) or not(res_word(31 downto 24))) and
--                  ((test_word(23 downto 16) xnor res_word(23 downto 16)) or not(res_word(23 downto 16))) and
--                  ((test_word(15 downto 8) xnor res_word(15 downto 8)) or not(res_word(15 downto 8))) and
--                  ((test_word(7 downto 0) xnor res_word(7 downto 0)) or not(res_word(7 downto 0))));
    
    equal_vec(0) <= '1' when res_word(7 downto 0) = x"00" or res_word(7 downto 0) = test_word(7 downto 0) else
                    '0';
    
    equal_vec(1) <= '1' when res_word(15 downto 8) = x"00" or res_word(15 downto 8) = test_word(15 downto 8) else
                    '0';
    
    equal_vec(2) <= '1' when res_word(23 downto 16) = x"00" or res_word(23 downto 16) = test_word(23 downto 16) else
                    '0';
                    
    equal_vec(3) <= '1' when res_word(31 downto 24) = x"00" or res_word(31 downto 24) = test_word(31 downto 24) else
                    '0';
    
    equal_vec(4) <= '1' when res_word(39 downto 32) = x"00" or res_word(39 downto 32) = test_word(39 downto 32) else
                    '0';
                        
    equal_vec(5) <= '1' when res_word(47 downto 40) = x"00" or res_word(47 downto 40) = test_word(47 downto 40) else
                    '0';
    
    equal_vec(6) <= '1' when res_word(55 downto 48) = x"00" or res_word(55 downto 48) = test_word(55 downto 48) else
                    '0';
                    
    equal_vec(7) <= '1' when res_word(63 downto 56) = x"00" or res_word(63 downto 56) = test_word(63 downto 56) else
                    '0';
    
    equal_vec(8) <= '1' when res_word(71 downto 64) = x"00" or res_word(71 downto 64) = test_word(71 downto 64) else
                    '0';
    
    equal_vec(9) <= '1' when res_word(79 downto 72) = x"00" or res_word(79 downto 72) = test_word(79 downto 72) else
                    '0';
    
    equal_vec(10) <= '1' when res_word(87 downto 80) = x"00" or res_word(87 downto 80) = test_word(87 downto 80) else
                    '0';
                    
    equal_vec(11) <= '1' when res_word(95 downto 88) = x"00" or res_word(95 downto 88) = test_word(95 downto 88) else
                    '0';
    
    equal_vec(12) <= '1' when res_word(103 downto 96) = x"00" or res_word(103 downto 96) = test_word(103 downto 96) else
                    '0';
                        
    equal_vec(13) <= '1' when res_word(111 downto 104) = x"00" or res_word(111 downto 104) = test_word(111 downto 104) else
                    '0';
    
    equal_vec(14) <= '1' when res_word(119 downto 112) = x"00" or res_word(119 downto 112) = test_word(119 downto 112) else
                    '0';
                    
    equal_vec(15) <= '1' when res_word(127 downto 120) = x"00" or res_word(127 downto 120) = test_word(127 downto 120) else
                    '0';
                                            
--    process_0 : process(test_word)
--    begin
--        if (res_word(7 downto 0) = x"00" or res_word(7 downto 0) = test_word(7 downto 0)) then
--            equal_vec(0) <= '1';
--        else
--            equal_vec(0) <= '0';
--        end if;
--    end process;
    
--    process_1 : process(test_word)
--    begin
--        if (res_word(15 downto 8) = x"00" or res_word(15 downto 8) = test_word(15 downto 8)) then
--            equal_vec(1) <= '1';
--        else
--            equal_vec(1) <= '0';
--        end if;
--    end process;
    
--    process_2 : process(test_word)
--    begin
--        if (res_word(23 downto 16) = x"00" or res_word(23 downto 16) = test_word(23 downto 16)) then
--            equal_vec(2) <= '1';
--        else
--            equal_vec(2) <= '0';
--        end if;
--    end process;
    
--    process_3 : process(test_word)
--    begin
--        if (res_word(31 downto 24) = x"00" or res_word(31 downto 24) = test_word(31 downto 24)) then
--            equal_vec(3) <= '1';
--        else
--            equal_vec(3) <= '0';
--        end if;
--    end process;
            
--    process_4 : process(test_word)
--    begin
--        if (res_word(39 downto 32) = x"00" or res_word(39 downto 32) = test_word(39 downto 32)) then
--            equal_vec(4) <= '1';
--        else
--            equal_vec(4) <= '0';
--        end if;
--    end process;
    
--    process_5 : process(test_word)
--    begin
--        if (res_word(47 downto 40) = x"00" or res_word(47 downto 40) = test_word(47 downto 40)) then
--            equal_vec(5) <= '1';
--        else
--            equal_vec(5) <= '0';
--        end if;
--    end process;
    
--    process_6 : process(test_word)
--    begin
--        if (res_word(55 downto 48) = x"00" or res_word(55 downto 48) = test_word(55 downto 48)) then
--            equal_vec(6) <= '1';
--        else
--            equal_vec(6) <= '0';
--        end if;
--    end process;
    
--    process_7 : process(test_word)
--    begin
--        if (res_word(63 downto 56) = x"00" or res_word(63 downto 56) = test_word(63 downto 56)) then
--            equal_vec(7) <= '1';
--        else
--            equal_vec(7) <= '0';
--        end if;
--    end process;
    
--    process_8 : process(test_word)
--    begin
--        if (res_word(71 downto 64) = x"00" or res_word(71 downto 64) = test_word(71 downto 64)) then
--            equal_vec(8) <= '1';
--        else
--            equal_vec(8) <= '0';
--        end if;
--    end process;
    
--    process_9 : process(test_word)
--    begin
--        if (res_word(79 downto 72) = x"00" or res_word(79 downto 72) = test_word(79 downto 72)) then
--            equal_vec(9) <= '1';
--        else
--            equal_vec(9) <= '0';
--        end if;
--    end process;
    
--    process_10 : process(test_word)
--    begin
--        if (res_word(87 downto 80) = x"00" or res_word(87 downto 80) = test_word(87 downto 80)) then
--            equal_vec(10) <= '1';
--        else
--            equal_vec(10) <= '0';
--        end if;
--    end process;
    
--    process_11 : process(test_word)
--    begin
--        if (res_word(95 downto 88) = x"00" or res_word(95 downto 88) = test_word(95 downto 88)) then
--            equal_vec(11) <= '1';
--        else
--            equal_vec(11) <= '0';
--        end if;
--    end process;
            
--    process_12 : process(test_word)
--    begin
--        if (res_word(103 downto 96) = x"00" or res_word(103 downto 96) = test_word(103 downto 96)) then
--            equal_vec(12) <= '1';
--        else
--            equal_vec(12) <= '0';
--        end if;
--    end process;
    
--    process_13 : process(test_word)
--    begin
--        if (res_word(111 downto 104) = x"00" or res_word(111 downto 104) = test_word(111 downto 104)) then
--            equal_vec(13) <= '1';
--        else
--            equal_vec(13) <= '0';
--        end if;
--    end process;
    
--    process_14 : process(test_word)
--    begin
--        if (res_word(119 downto 112) = x"00" or res_word(119 downto 112) = test_word(119 downto 112)) then
--            equal_vec(14) <= '1';
--        else
--            equal_vec(14) <= '0';
--        end if;
--    end process;
    
--    process_15 : process(test_word)
--    begin
--        if (res_word(127 downto 120) = x"00" or res_word(127 downto 120) = test_word(127 downto 120)) then
--            equal_vec(15) <= '1';
--        else
--            equal_vec(15) <= '0';
--        end if;
--    end process;
    
    equal <= equal_vec(0) and
             equal_vec(1) and
             equal_vec(2) and
             equal_vec(3) and
             equal_vec(4) and
             equal_vec(5) and
             equal_vec(6) and
             equal_vec(7) and
             equal_vec(8) and
             equal_vec(9) and
             equal_vec(10) and
             equal_vec(11) and
             equal_vec(12) and
             equal_vec(13) and
             equal_vec(14) and
             equal_vec(15) ;
              
end Behavioral;
