
-- VHDL Instantiation Created from source file l2_top_level.vhd -- 02:33:08 04/01/2018
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT l2_top_level
	PORT(
		l2_addra : IN std_logic_vector(15 downto 0);
		l2_dina : IN std_logic_vector(127 downto 0);
		clka : IN std_logic;
		l2_wea : IN std_logic;
		l2_lru_update : IN std_logic;          
		l2_hit : OUT std_logic;
		l2_douta : OUT std_logic_vector(127 downto 0);
		lru_0 : OUT std_logic_vector(2 downto 0);
		lru_1 : OUT std_logic_vector(2 downto 0);
		lru_2 : OUT std_logic_vector(2 downto 0);
		lru_3 : OUT std_logic_vector(2 downto 0);
		lru_4 : OUT std_logic_vector(2 downto 0);
		lru_5 : OUT std_logic_vector(2 downto 0);
		lru_6 : OUT std_logic_vector(2 downto 0);
		lru_7 : OUT std_logic_vector(2 downto 0);
		tag0 : OUT std_logic_vector(4 downto 0);
		tag1 : OUT std_logic_vector(4 downto 0);
		tag2 : OUT std_logic_vector(4 downto 0);
		tag3 : OUT std_logic_vector(4 downto 0);
		tag4 : OUT std_logic_vector(4 downto 0);
		tag5 : OUT std_logic_vector(4 downto 0);
		tag6 : OUT std_logic_vector(4 downto 0);
		tag7 : OUT std_logic_vector(4 downto 0);
		l2_lru_complete : OUT std_logic
		);
	END COMPONENT;

	Inst_l2_top_level: l2_top_level PORT MAP(
		l2_addra => ,
		l2_dina => ,
		clka => ,
		l2_wea => ,
		l2_hit => ,
		l2_douta => ,
		l2_lru_update => ,
		lru_0 => ,
		lru_1 => ,
		lru_2 => ,
		lru_3 => ,
		lru_4 => ,
		lru_5 => ,
		lru_6 => ,
		lru_7 => ,
		tag0 => ,
		tag1 => ,
		tag2 => ,
		tag3 => ,
		tag4 => ,
		tag5 => ,
		tag6 => ,
		tag7 => ,
		l2_lru_complete => 
	);


