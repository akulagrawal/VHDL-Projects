--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:35:46 03/30/2018
-- Design Name:   
-- Module Name:   C:/Xilinx projects/cache_final_1/l1_tb.vhd
-- Project Name:  cache_final_1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: l1_top_level
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY l1_tb IS
END l1_tb;
 
ARCHITECTURE behavior OF l1_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT l1_top_level
    PORT(
         l1_addra : IN  std_logic_vector(15 downto 0);
         l1_dina : IN  std_logic_vector(127 downto 0);
         clka : IN  std_logic;
         l1_wea : IN  std_logic;
         l1_hit : OUT  std_logic;
         l1_douta : OUT  std_logic_vector(127 downto 0);
         l1_lru_update : IN  std_logic;
         lru_0 : OUT  std_logic_vector(1 downto 0);
         lru_1 : OUT  std_logic_vector(1 downto 0);
         lru_2 : OUT  std_logic_vector(1 downto 0);
         lru_3 : OUT  std_logic_vector(1 downto 0);
         tag0 : OUT  std_logic_vector(6 downto 0);
         tag1 : OUT  std_logic_vector(6 downto 0);
         tag2 : OUT  std_logic_vector(6 downto 0);
         tag3 : OUT  std_logic_vector(6 downto 0);
			l1_lru_complete : out std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal l1_addra : std_logic_vector(15 downto 0) := (others => '0');
   signal l1_dina : std_logic_vector(127 downto 0) := (others => '0');
   signal clka : std_logic := '0';
   signal l1_wea : std_logic := '0';
   signal l1_lru_update : std_logic := '0';

 	--Outputs
   signal l1_hit : std_logic;
   signal l1_douta : std_logic_vector(127 downto 0);
   signal lru_0 : std_logic_vector(1 downto 0);
   signal lru_1 : std_logic_vector(1 downto 0);
   signal lru_2 : std_logic_vector(1 downto 0);
   signal lru_3 : std_logic_vector(1 downto 0);
   signal tag0 : std_logic_vector(6 downto 0);
   signal tag1 : std_logic_vector(6 downto 0);
   signal tag2 : std_logic_vector(6 downto 0);
   signal tag3 : std_logic_vector(6 downto 0);
	signal l1_lru_complete : std_logic;
   -- Clock period definitions
   constant clka_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: l1_top_level PORT MAP (
          l1_addra => l1_addra,
          l1_dina => l1_dina,
          clka => clka,
          l1_wea => l1_wea,
          l1_hit => l1_hit,
          l1_douta => l1_douta,
          l1_lru_update => l1_lru_update,
          lru_0 => lru_0,
          lru_1 => lru_1,
          lru_2 => lru_2,
          lru_3 => lru_3,
          tag0 => tag0,
          tag1 => tag1,
          tag2 => tag2,
          tag3 => tag3,
			 l1_lru_complete => l1_lru_complete
        );

   -- Clock process definitions
   clka_process :process
   begin
		clka <= '0';
		wait for clka_period/2;
		clka <= '1';
		wait for clka_period/2;
   end process;
 
	l1_dina <= (others => '1');
	
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		l1_addra <= "1101010011010000";      
		wait until rising_edge(clka);
		if(l1_hit = '0') then
			l1_wea <= '1';
			wait until l1_hit='1';
			l1_wea <= '0';
		end if;
		wait until rising_edge(clka);
		l1_lru_update <= '1';
		wait until l1_lru_complete='1';
		l1_lru_update <= '0';
--		wait until rising_edge(clka);
		
		l1_addra <= "1111011011010000";
		wait until rising_edge(clka);
		if(l1_hit = '0') then
			l1_wea <= '1';
			wait until l1_hit='1';
			l1_wea <= '0';
		end if;
		wait until rising_edge(clka);
		l1_lru_update <= '1';
		wait until l1_lru_complete='1';
		l1_lru_update <= '0';
--		wait until rising_edge(clka);
		
		l1_addra <= "1011011011010000";
		wait until rising_edge(clka);
		if(l1_hit = '0') then
			l1_wea <= '1';
			wait until l1_hit='1';
			l1_wea <= '0';
		end if;
		wait until rising_edge(clka);
		l1_lru_update <= '1';
		wait until l1_lru_complete='1';
		l1_lru_update <= '0';
--		wait until rising_edge(clka);
		
		l1_addra <= "1101010011010000";
		wait until rising_edge(clka);
		if(l1_hit = '0') then
			l1_wea <= '1';
			wait until l1_hit='1';
			l1_wea <= '0';
		end if;
		wait until rising_edge(clka);
		l1_lru_update <= '1';
		wait until l1_lru_complete='1';
		l1_lru_update <= '0';
--		wait until rising_edge(clka);
		
		l1_addra <= "1101011011010000";
		wait until rising_edge(clka);
		if(l1_hit = '0') then
			l1_wea <= '1';
			wait until l1_hit='1';
			l1_wea <= '0';
		end if;
		wait until rising_edge(clka);
		l1_lru_update <= '1';
		wait until l1_lru_complete='1';
		l1_lru_update <= '0';
		wait until rising_edge(clka);
		
		l1_addra <= "1011100011010000";
		wait until rising_edge(clka);
		if(l1_hit = '0') then
			l1_wea <= '1';
			wait until l1_hit='1';
			l1_wea <= '0';
		end if;
		wait until rising_edge(clka);
		l1_lru_update <= '1';
		wait until l1_lru_complete='1';
		l1_lru_update <= '0';
		wait until rising_edge(clka);
		
		
		l1_addra <= "1011011011010000";
		wait until rising_edge(clka);
		if(l1_hit = '0') then
			l1_wea <= '1';
			wait until l1_hit='1';
			l1_wea <= '0';
		end if;
		wait until rising_edge(clka);
		l1_lru_update <= '1';
		wait until l1_lru_complete='1';
		l1_lru_update <= '0';
		wait until rising_edge(clka);
		
		l1_addra <= "0010001011010000";
		wait until rising_edge(clka);
		if(l1_hit = '0') then
			l1_wea <= '1';
			wait until l1_hit='1';
			l1_wea <= '0';
		end if;
		wait until rising_edge(clka);
		l1_lru_update <= '1';
		wait until l1_lru_complete='1';
		l1_lru_update <= '0';
		wait until rising_edge(clka);
		
   end process;

END;
