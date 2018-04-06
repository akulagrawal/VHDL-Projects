
-- VHDL Instantiation Created from source file l1_lru_mem.vhd -- 21:49:59 03/29/2018
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT l1_lru_mem
	PORT(
		lru_in0 : IN std_logic_vector(1 downto 0);
		lru_in1 : IN std_logic_vector(1 downto 0);
		lru_in2 : IN std_logic_vector(1 downto 0);
		lru_in3 : IN std_logic_vector(1 downto 0);
		lru_out0 : IN std_logic_vector(1 downto 0);
		lru_out1 : IN std_logic_vector(1 downto 0);
		lru_out2 : IN std_logic_vector(1 downto 0);
		lru_out3 : IN std_logic_vector(1 downto 0);
		clka : IN std_logic;
		lru_wea0 : IN std_logic;
		lru_wea1 : IN std_logic;
		lru_wea2 : IN std_logic;
		lru_wea3 : IN std_logic;
		addra : IN std_logic_vector(4 downto 0);       
		);
	END COMPONENT;

	Inst_l1_lru_mem: l1_lru_mem PORT MAP(
		lru_in0 => ,
		lru_in1 => ,
		lru_in2 => ,
		lru_in3 => ,
		lru_out0 => ,
		lru_out1 => ,
		lru_out2 => ,
		lru_out3 => ,
		clka => ,
		lru_wea0 => ,
		lru_wea1 => ,
		lru_wea2 => ,
		lru_wea3 => ,
		addra => 
	);


