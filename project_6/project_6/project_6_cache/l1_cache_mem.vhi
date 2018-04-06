
-- VHDL Instantiation Created from source file l1_cache_mem.vhd -- 21:49:03 03/29/2018
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT l1_cache_mem
	PORT(
		addra : IN std_logic_vector(4 downto 0);
		dina : IN std_logic_vector(135 downto 0);
		wea0 : IN std_logic;
		wea1 : IN std_logic;
		wea2 : IN std_logic;
		wea3 : IN std_logic;
		clka : IN std_logic;          
		douta0 : OUT std_logic_vector(135 downto 0);
		douta1 : OUT std_logic_vector(135 downto 0);
		douta2 : OUT std_logic_vector(135 downto 0);
		douta3 : OUT std_logic_vector(135 downto 0)
		);
	END COMPONENT;

	Inst_l1_cache_mem: l1_cache_mem PORT MAP(
		addra => ,
		dina => ,
		douta0 => ,
		douta1 => ,
		douta2 => ,
		douta3 => ,
		wea0 => ,
		wea1 => ,
		wea2 => ,
		wea3 => ,
		clka => 
	);


