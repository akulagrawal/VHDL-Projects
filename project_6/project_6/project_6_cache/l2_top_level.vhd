----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:48:45 03/29/2018 
-- Design Name: 
-- Module Name:    l1_top_level - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity l2_top_level is
	port(
		l2_addra : in std_logic_vector(15 downto 0);
		l2_dina : in std_logic_vector(127 downto 0);
		clka : in std_logic;
		l2_wea : in std_logic;
		l2_hit : out std_logic;
		l2_douta : out std_logic_vector(127 downto 0);
		l2_lru_update : in std_logic;
		lru_0 : OUT std_logic_vector(2 downto 0);
		lru_1 : OUT std_logic_vector(2 downto 0);
		lru_2 : OUT std_logic_vector(2 downto 0);
		lru_3 : OUT std_logic_vector(2 downto 0);
		lru_4 : OUT std_logic_vector(2 downto 0);
		lru_5 : OUT std_logic_vector(2 downto 0);
		lru_6 : OUT std_logic_vector(2 downto 0);
		lru_7 : OUT std_logic_vector(2 downto 0);
		tag0 : out std_logic_vector(4 downto 0);
		tag1 : out std_logic_vector(4 downto 0);
		tag2 : out std_logic_vector(4 downto 0);
		tag3 : out std_logic_vector(4 downto 0);
		tag4 : out std_logic_vector(4 downto 0);
		tag5 : out std_logic_vector(4 downto 0);
		tag6 : out std_logic_vector(4 downto 0);
		tag7 : out std_logic_vector(4 downto 0);
		l2_lru_complete : out std_logic
	);
end l2_top_level;

architecture Behavioral of l2_top_level is
	type write_states is (
		enable_writing,
		disable_writing
	);
	type update_states is (
		start_update,
		l2_wea_down,
		l2_complete_down
	);
	type lru_array is array (0 to 127) of std_logic_vector(2 downto 0);
	signal lru_block0 : lru_array := (others => "000");
	signal lru_block1 : lru_array := (others => "001");
	signal lru_block2 : lru_array := (others => "010");
	signal lru_block3 : lru_array := (others => "011");
	signal lru_block4 : lru_array := (others => "100");
	signal lru_block5 : lru_array := (others => "101");
	signal lru_block6 : lru_array := (others => "110");
	signal lru_block7 : lru_array := (others => "111");
	
	signal write_state : write_states := enable_writing;
	signal update_state : update_states := start_update;
	signal dina : std_logic_vector(133 downto 0);
	signal wea0 : std_logic := '0';
	signal wea1 : std_logic := '0';
	signal wea2 : std_logic := '0';
	signal wea3 : std_logic := '0';
	signal wea4 : std_logic := '0';
	signal wea5 : std_logic := '0';
	signal wea6 : std_logic := '0';
	signal wea7 : std_logic := '0';
	signal address : integer;
	
	signal douta0 : std_logic_vector(133 downto 0);
	signal douta1 : std_logic_vector(133 downto 0);
	signal douta2 : std_logic_vector(133 downto 0);
	signal douta3 : std_logic_vector(133 downto 0);
	signal douta4 : std_logic_vector(133 downto 0);
	signal douta5 : std_logic_vector(133 downto 0);
	signal douta6 : std_logic_vector(133 downto 0);
	signal douta7 : std_logic_vector(133 downto 0);
	
	signal lru_in0 : std_logic_vector(2 downto 0);
	signal lru_in1 : std_logic_vector(2 downto 0);
	signal lru_in2 : std_logic_vector(2 downto 0);
	signal lru_in3 : std_logic_vector(2 downto 0);
	signal lru_in4 : std_logic_vector(2 downto 0);
	signal lru_in5 : std_logic_vector(2 downto 0);
	signal lru_in6 : std_logic_vector(2 downto 0);
	signal lru_in7 : std_logic_vector(2 downto 0);
	
	signal lru_out0 : std_logic_vector(2 downto 0);
	signal lru_out1 : std_logic_vector(2 downto 0);
	signal lru_out2 : std_logic_vector(2 downto 0);
	signal lru_out3 : std_logic_vector(2 downto 0);
	signal lru_out4 : std_logic_vector(2 downto 0);
	signal lru_out5 : std_logic_vector(2 downto 0);
	signal lru_out6 : std_logic_vector(2 downto 0);
	signal lru_out7 : std_logic_vector(2 downto 0);
	
	signal equal_0, equal_1, equal_2, equal_3, equal_4, equal_5, equal_6, equal_7 : std_logic;
	
	signal tag :std_logic_vector(4 downto 0);
	signal set_number : std_logic_vector(6 downto 0);
	signal ini : std_logic := '1';
	
	COMPONENT l2_cache_mem
	PORT(
		addra : IN std_logic_vector(6 downto 0);
		dina : IN std_logic_vector(133 downto 0);
		wea0 : IN std_logic;
		wea1 : IN std_logic;
		wea2 : IN std_logic;
		wea3 : IN std_logic;
		wea4 : IN std_logic;
		wea5 : IN std_logic;
		wea6 : IN std_logic;
		wea7 : IN std_logic;
		clka : IN std_logic; 		
		douta0 : OUT std_logic_vector(133 downto 0);
		douta1 : OUT std_logic_vector(133 downto 0);
		douta2 : OUT std_logic_vector(133 downto 0);
		douta3 : OUT std_logic_vector(133 downto 0);
		douta4 : OUT std_logic_vector(133 downto 0);
		douta5 : OUT std_logic_vector(133 downto 0);
		douta6 : OUT std_logic_vector(133 downto 0);
		douta7 : OUT std_logic_vector(133 downto 0)
		);
	END COMPONENT;
	
	COMPONENT l2_comparator is
    PORT (
        add_tag : in std_logic_vector(4 downto 0);
        data_tag : in std_logic_vector(4 downto 0);
        valid_bit : in std_logic;
        equal : out std_logic
    );
    END COMPONENT l2_comparator; 
	
begin
--	lru_0 <= lru_out0;
--	lru_1 <= lru_out1;
--	lru_2 <= lru_out2;
--	lru_3 <= lru_out3;
--	lru_4 <= lru_out4;
--	lru_5 <= lru_out5;
--	lru_6 <= lru_out6;
--	lru_7 <= lru_out7;
	address <= to_integer(unsigned(l2_addra(10 downto 4)));
	lru_out0 <= lru_block0(address);
	lru_out1 <= lru_block1(address);
	lru_out2 <= lru_block2(address);
	lru_out3 <= lru_block3(address);
	lru_out4 <= lru_block4(address);
	lru_out5 <= lru_block5(address);
	lru_out6 <= lru_block6(address);
	lru_out7 <= lru_block7(address);
	
	tag <= l2_addra(15 downto 11);
	set_number <= l2_addra(10 downto 4);
	tag0 <= douta0(4 downto 0);
	tag1 <= douta1(4 downto 0);
	tag2 <= douta2(4 downto 0);
	tag3 <= douta3(4 downto 0);
	tag4 <= douta4(4 downto 0);
	tag5 <= douta5(4 downto 0);
	tag6 <= douta6(4 downto 0);
	tag7 <= douta7(4 downto 0);
	l2_mem : l2_cache_mem 
	PORT MAP(
		addra => set_number,
		dina => dina,
		douta0 => douta0,
		douta1 => douta1,
		douta2 => douta2,
		douta3 => douta3,
		douta4 => douta4,
		douta5 => douta5,
		douta6 => douta6,
		douta7 => douta7,
		wea0 => wea0,
		wea1 => wea1,
		wea2 => wea2,
		wea3 => wea3,
		wea4 => wea4,
		wea5 => wea5,
		wea6 => wea6,
		wea7 => wea7,
		clka => clka 
	);
	
	l2_comparator_0 : component l2_comparator
    port map(
        add_tag => tag,
        data_tag => douta0(4 downto 0),
        valid_bit => douta0(5),
        equal => equal_0
    );
    
    l2_comparator_1 : component l2_comparator
    port map(
        add_tag => tag,
        data_tag => douta1(4 downto 0),
        valid_bit => douta1(5),
        equal => equal_1
    );
    
    l2_comparator_2 : component l2_comparator
    port map(
        add_tag => tag,
        data_tag => douta2(4 downto 0),
        valid_bit => douta2(5),
        equal => equal_2
    );
    
    l2_comparator_3 : component l2_comparator
    port map(
        add_tag => tag,
        data_tag => douta3(4 downto 0),
        valid_bit => douta3(5),
        equal => equal_3
    );
    l2_comparator_4 : component l2_comparator
    port map(
        add_tag => tag,
        data_tag => douta4(4 downto 0),
        valid_bit => douta4(5),
        equal => equal_4
    );
    
    l2_comparator_5 : component l2_comparator
    port map(
        add_tag => tag,
        data_tag => douta5(4 downto 0),
        valid_bit => douta5(5),
        equal => equal_5
    );
    
    l2_comparator_6 : component l2_comparator
    port map(
        add_tag => tag,
        data_tag => douta6(4 downto 0),
        valid_bit => douta6(5),
        equal => equal_6
    );
    
    l2_comparator_7 : component l2_comparator
    port map(
        add_tag => tag,
        data_tag => douta7(4 downto 0),
        valid_bit => douta7(5),
        equal => equal_7
    );
	 
	 l2_hit <= equal_0 or equal_1 or equal_2 or equal_3 or equal_4 or equal_5 or equal_6 or equal_7 ;
	 
	 lru_update : process(clka, lru_out0, lru_out1, lru_out2, lru_out3, lru_out4, lru_out5, lru_out6, lru_out7)
		variable prev_val0 : std_logic_vector(2 downto 0) := "000";
		variable prev_val1 : std_logic_vector(2 downto 0) := "001";
		variable prev_val2 : std_logic_vector(2 downto 0) := "010";
		variable prev_val3 : std_logic_vector(2 downto 0) := "011";
		variable prev_val4 : std_logic_vector(2 downto 0) := "100";
		variable prev_val5 : std_logic_vector(2 downto 0) := "101";
		variable prev_val6 : std_logic_vector(2 downto 0) := "110";
		variable prev_val7 : std_logic_vector(2 downto 0) := "111";
		variable min_val : std_logic_vector(2 downto 0);
	 begin
		prev_val0 := lru_out0;
		prev_val1 := lru_out1;
		prev_val2 := lru_out2;
		prev_val3 := lru_out3;
		prev_val4 := lru_out4;
		prev_val5 := lru_out5;
		prev_val6 := lru_out6;
		prev_val7 := lru_out7;
		
		if rising_edge(clka) then
			case update_state is
				when start_update=>
					if(l2_lru_update = '1') then
						if(equal_0 = '1') then
							min_val := prev_val0;
							lru_block0(address) <= "000";
						elsif (equal_1 = '1') then
							min_val := prev_val1;
							lru_block1(address) <= "000";
						elsif (equal_2 = '1') then
							min_val := prev_val2;
							lru_block2(address) <= "000";
						elsif (equal_3 = '1') then
							min_val := prev_val3;
							lru_block3(address) <= "000";
						elsif (equal_4 = '1') then
							min_val := prev_val4;
							lru_block4(address) <= "000";
						elsif (equal_5 = '1') then
							min_val := prev_val5;
							lru_block5(address) <= "000";
						elsif (equal_6 = '1') then
							min_val := prev_val6;
							lru_block6(address) <= "000";
						elsif (equal_7 = '1') then
							min_val := prev_val7;
							lru_block7(address) <= "000";
						end if;
						
						if (prev_val0 < min_val) then
							lru_block0(address) <= prev_val0 + 1;
						end if;
						if (prev_val1 < min_val) then
							lru_block1(address) <= prev_val1 + 1;
						end if;
						if (prev_val2 < min_val) then
							lru_block2(address) <= prev_val2 + 1;
						end if;
						if (prev_val3 < min_val) then
							lru_block3(address) <= prev_val3 + 1;
						end if;
						if (prev_val4 < min_val) then
							lru_block4(address) <= prev_val4 + 1;
						end if;
						if (prev_val5 < min_val) then
							lru_block5(address) <= prev_val5 + 1;
						end if;
						if (prev_val6 < min_val) then
							lru_block6(address) <= prev_val6 + 1;
						end if;
						if (prev_val7 < min_val) then
							lru_block7(address) <= prev_val7 + 1;
						end if;
						update_state <= l2_wea_down;
					end if;
				when l2_wea_down=>
					update_state <= l2_complete_down;
					l2_lru_complete <= '1';
				when l2_complete_down=>
					if(l2_lru_update = '0') then
						l2_lru_complete <= '0';
						update_state <= start_update;
					end if;
			end case;
		end if;
	 end process;
	 
	 write_data : process(clka)
	 begin
		if rising_edge(clka) then
			case write_state is
				when enable_writing=>
					if(lru_out0 = "111") then
						wea0 <= l2_wea;
					elsif(lru_out1 = "111") then
						wea1 <= l2_wea;
					elsif(lru_out2 = "111") then
						wea2 <= l2_wea;
					elsif(lru_out3 = "111") then
						wea3 <= l2_wea;
					elsif(lru_out4 = "111") then
						wea4 <= l2_wea;
					elsif(lru_out5 = "111") then
						wea5 <= l2_wea;
					elsif(lru_out6 = "111") then
						wea6 <= l2_wea;
					else
						wea7 <= l2_wea;
					end if;
					write_state <= disable_writing;
				when disable_writing=>
					wea0 <= '0';
					wea1 <= '0';
					wea2 <= '0';
					wea3 <= '0';
					wea4 <= '0';
					wea5 <= '0';
					wea6 <= '0';
					wea7 <= '0';
					write_state <= enable_writing;
			end case;
		end if;
	 end process;
	 
	 dina <= l2_dina & "1" & tag;
	 
end Behavioral;

