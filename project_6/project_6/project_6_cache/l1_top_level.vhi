
-- VHDL Instantiation Created from source file l1_top_level.vhd -- 23:11:45 03/31/2018
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT l1_top_level
	PORT(
		l1_addra : IN std_logic_vector(15 downto 0);
		l1_dina : IN std_logic_vector(127 downto 0);
		clka : IN std_logic;
		l1_wea : IN std_logic;
		l1_lru_update : IN std_logic;          
		l1_hit : OUT std_logic;
		l1_douta : OUT std_logic_vector(127 downto 0);
		lru_0 : OUT std_logic_vector(1 downto 0);
		lru_1 : OUT std_logic_vector(1 downto 0);
		lru_2 : OUT std_logic_vector(1 downto 0);
		lru_3 : OUT std_logic_vector(1 downto 0);
		tag0 : OUT std_logic_vector(6 downto 0);
		tag1 : OUT std_logic_vector(6 downto 0);
		tag2 : OUT std_logic_vector(6 downto 0);
		tag3 : OUT std_logic_vector(6 downto 0);
		l1_lru_complete : OUT std_logic
		);
	END COMPONENT;

	Inst_l1_top_level: l1_top_level PORT MAP(
		l1_addra => ,
		l1_dina => ,
		clka => ,
		l1_wea => ,
		l1_hit => ,
		l1_douta => ,
		l1_lru_update => ,
		lru_0 => ,
		lru_1 => ,
		lru_2 => ,
		lru_3 => ,
		tag0 => ,
		tag1 => ,
		tag2 => ,
		tag3 => ,
		l1_lru_complete => 
	);


