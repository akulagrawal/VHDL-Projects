----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.04.2018 13:22:18
-- Design Name: 
-- Module Name: top_level - Behavioral
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

entity top_level is
  Port (    clk : in STD_LOGIC;
            uart_rxd : in STD_LOGIC;
            uart_txd : out STD_LOGIC;
            data_o : out STD_LOGIC_vector(9 downto 0);
            data_in : in STD_LOGIC_VECTOR(7 downto 0);
            Anode_Activate : out STD_LOGIC_VECTOR (3 downto 0);-- 4 Anode signals
            LED_out : out STD_LOGIC_VECTOR (6 downto 0)
--            cntr_clear : in STD_LOGIC
--            data_o2 : out STD_LOGIC_VECTOR(3 downto 0);
--            data_o3 : out STD_LOGIC_VECTOR(7 downto 0)
        );
end top_level;

architecture Behavioral of top_level is

--Communcation Part Begins
    constant c_CLKS_PER_BIT : integer := 10416;
    
    signal r_RX_SERIAL : std_logic := '1';
    signal w_RX_DV : std_logic := '0';
    signal w_RX_BYTE : std_logic_vector(7 downto 0) ;
    signal temp_o : std_logic_vector(7 downto 0) := "00000000";
    signal r_TX_DV : std_logic;
    signal r_TX_BYTE : std_logic_vector(7 downto 0);
    signal w_tx_active : std_logic;
    signal w_TX_SERIAL : std_logic;
    signal w_TX_DONE : std_logic;
    
    component UART_RX is
    generic (
        g_CLKS_PER_BIT : integer := 10417
    );
    port(
        i_clk       : in  std_logic;
          i_rx_serial : in  std_logic;
          o_rx_dv     : out std_logic;
          o_rx_byte   : out std_logic_vector(7 downto 0)
    );
    end component;
    
    component UART_TX is
    generic (
        g_CLKS_PER_BIT : integer := 115     -- Needs to be set correctly
    );
    port (
        i_Clk       : in  std_logic;
        i_TX_DV     : in  std_logic;
        i_TX_Byte   : in  std_logic_vector(7 downto 0);
        o_TX_Active : out std_logic;
        o_TX_Serial : out std_logic;
        o_TX_Done   : out std_logic
    );
    end component;
    
    component binary_bcd is 
    port(
        clk: in std_logic;
        binary_in: in std_logic_vector(11 downto 0);
        bcd_out: out std_logic_vector(15 downto 0)
    );
    end component;
--Communication Part ends
    
    subtype cntr_word is std_logic_vector(9 downto 0);
    type ram_t is array (0 to 255) of std_logic_vector(127 downto 0);
    type cntr_t is array (0 to 255) of cntr_word;
    type cntr_port_t is array (0 to 15) of cntr_word;
    type state_types is (
        config_res_words,
        wait_config,
        send_wrd,
        wait_send,
        first_16,
        first_16_wait,
        next_char,
        next_char_wait,
        start_proc,
        send_to_wait,
        idle
    );
    type proc_states is (
        wait_start,
        allot_values,
        wait_cycle,
        incr_cntr,
        incr_ind,
        gen_end,
        wait_start_down
    );
    signal temp : std_logic_vector(15 downto 0) := x"0000";
    signal state : state_types := config_res_words;
    signal state_0, state_1, state_2, state_3, state_4, state_5, state_6, state_7,
           state_8, state_9, state_10, state_11, state_12, state_13, state_14, state_15 : proc_states := wait_start;
    signal ind_0, ind_1, ind_2, ind_3, ind_4, ind_5, ind_6, ind_7,
           ind_8, ind_9, ind_10, ind_11, ind_12, ind_13, ind_14, ind_15 : std_logic_vector(5 downto 0) := "000000";
    signal comp_res_0, comp_res_1, comp_res_2, comp_res_3, comp_res_4, comp_res_5, comp_res_6, comp_res_7, comp_res_8, comp_res_9, comp_res_10, comp_res_11, comp_res_12, comp_res_13, comp_res_14, comp_res_15 : std_logic_vector(127 downto 0) := (others=>'0');
    signal res_words : ram_t := (others => (others => '0'));
    signal test_word : std_logic_vector(127 downto 0) := (others => '0');
    signal wrd_ind : integer range 0 to 255 := 0;
    signal wrd_pos : integer range 0 to 15 := 15;
    signal equal : std_logic_vector(15 downto 0);
    signal cntr : cntr_t := (others => (others => '0'));
    signal end_proc : std_logic_vector(15 downto 0) := x"0000";
    signal cntr_ind : integer range 0 to 255 := 0;
    signal add_timer : std_logic_vector(3 downto 0) := x"0";
    signal LED_BCD: std_logic_vector(3 downto 0);
    signal refresh_counter: STD_LOGIC_VECTOR (20 downto 0);
    signal LED_activating_counter: std_logic_vector(1 downto 0);
    signal val : std_logic_vector(11 downto 0) := x"000";
    component word_comp is
    Port (
            test_word : in std_logic_vector(127 downto 0);
            res_word : in std_logic_vector(127 downto 0);
            equal : out std_logic
        );
    end component;
begin
    
    data_o <= cntr(to_integer(unsigned(data_in)));
    val <= "00" & cntr(to_integer(unsigned(data_in)));
    process(clk)
        variable msg : std_logic_vector(7 downto 0);
        variable temp_char : std_logic_vector(7 downto 0);
        variable temp_wrd_ind : integer range 0 to 255;
        variable temp_wrd_pos : integer range 0 to 15;
        variable temp_test_word : std_logic_vector(127 downto 0);
        variable temp_cntr : std_logic_vector(9 downto 0);
    begin
        msg := w_RX_BYTE;
        temp_wrd_ind := wrd_ind;
        temp_wrd_pos := wrd_pos;
        temp_test_word := test_word;
        temp_cntr := cntr(cntr_ind);
        if rising_edge(clk) then
            case state is
                when config_res_words =>
                    if (w_RX_DV = '1') then
                        if(wrd_pos = 0) then
                            res_words(wrd_ind)(7 downto 0) <= msg;
                        elsif (wrd_pos = 1) then
                            res_words(wrd_ind)(15 downto 8) <= msg;
                        elsif (wrd_pos = 2) then
                            res_words(wrd_ind)(23 downto 16) <= msg;
                        elsif (wrd_pos = 3) then
                            res_words(wrd_ind)(31 downto 24) <= msg;
                        elsif (wrd_pos = 4) then
                            res_words(wrd_ind)(39 downto 32) <= msg;
                        elsif (wrd_pos = 5) then
                            res_words(wrd_ind)(47 downto 40) <= msg;
                        elsif (wrd_pos = 6) then
                            res_words(wrd_ind)(55 downto 48) <= msg;
                        elsif (wrd_pos = 7) then
                            res_words(wrd_ind)(63 downto 56) <= msg;
                        elsif (wrd_pos = 8) then
                            res_words(wrd_ind)(71 downto 64) <= msg;    
                        elsif (wrd_pos = 9) then
                            res_words(wrd_ind)(79 downto 72) <= msg;
                        elsif (wrd_pos = 10) then
                            res_words(wrd_ind)(87 downto 80) <= msg;
                        elsif (wrd_pos = 11) then
                            res_words(wrd_ind)(95 downto 88) <= msg;
                        elsif (wrd_pos = 12) then
                            res_words(wrd_ind)(103 downto 96) <= msg;
                        elsif (wrd_pos = 13) then
                            res_words(wrd_ind)(111 downto 104) <= msg;
                        elsif (wrd_pos = 14) then
                            res_words(wrd_ind)(119 downto 112) <= msg;
                        elsif (wrd_pos = 15) then
                            res_words(wrd_ind)(127 downto 120) <= msg;
                        end if;
                        state <= wait_config;
                    end if;
                when wait_config=>
                    if(w_RX_DV = '0') then
                        if(wrd_ind = 255 and wrd_pos = 0) then
                            state <= send_wrd;
                            wrd_ind <= 0;
                            wrd_pos <= 15;
                        else
                            if(wrd_pos = 0) then
                                wrd_pos <= 15;
                                wrd_ind <= temp_wrd_ind + 1;
                                state <= config_res_words;
                            else
                                wrd_pos <= temp_wrd_pos - 1;
                                state <= config_res_words;
                            end if;
                        end if;
                    end if;
                when send_wrd=>
                    if (w_TX_ACTIVE = '0') then
                        if(wrd_pos = 0) then
                            r_TX_BYTE <= res_words(wrd_ind)(7 downto 0);
                        elsif (wrd_pos = 1) then
                            r_TX_BYTE <= res_words(wrd_ind)(15 downto 8);
                        elsif (wrd_pos = 2) then
                            r_TX_BYTE <= res_words(wrd_ind)(23 downto 16);
                        elsif (wrd_pos = 3) then
                            r_TX_BYTE <= res_words(wrd_ind)(31 downto 24);
                        elsif (wrd_pos = 4) then
                            r_TX_BYTE <= res_words(wrd_ind)(39 downto 32);
                        elsif (wrd_pos = 5) then
                            r_TX_BYTE <= res_words(wrd_ind)(47 downto 40);
                        elsif (wrd_pos = 6) then
                            r_TX_BYTE <= res_words(wrd_ind)(55 downto 48);
                        elsif (wrd_pos = 7) then
                            r_TX_BYTE <= res_words(wrd_ind)(63 downto 56);
                        elsif (wrd_pos = 8) then
                            r_TX_BYTE <= res_words(wrd_ind)(71 downto 64);    
                        elsif (wrd_pos = 9) then
                            r_TX_BYTE <= res_words(wrd_ind)(79 downto 72);
                        elsif (wrd_pos = 10) then
                            r_TX_BYTE <= res_words(wrd_ind)(87 downto 80);
                        elsif (wrd_pos = 11) then
                            r_TX_BYTE <= res_words(wrd_ind)(95 downto 88);
                        elsif (wrd_pos = 12) then
                            r_TX_BYTE <= res_words(wrd_ind)(103 downto 96);
                        elsif (wrd_pos = 13) then
                            r_TX_BYTE <= res_words(wrd_ind)(111 downto 104);
                        elsif (wrd_pos = 14) then
                            r_TX_BYTE <= res_words(wrd_ind)(119 downto 112);
                        elsif (wrd_pos = 15) then
                            r_TX_BYTE <= res_words(wrd_ind)(127 downto 120);
                        end if;
                        r_TX_DV <= '1';
                        state <= wait_send;
                    end if;
                when wait_send=>
                    if(w_TX_ACTIVE = '1') then
                        if(wrd_ind = 255 and wrd_pos = 0) then
                            state <= next_char;
                            wrd_ind <= 0;
                            wrd_pos <= 15;
                        else
                            if(wrd_pos = 0) then
                                wrd_pos <= 15;
                                wrd_ind <= temp_wrd_ind + 1;
                                state <= send_wrd;
                            else
                                wrd_pos <= temp_wrd_pos - 1;
                                state <= send_wrd;
                            end if;
                        end if;
                        r_TX_DV <= '0';
                    end if;
                when next_char=>
                    if(w_RX_DV = '1') then
                        test_word <= temp_test_word(119 downto 0) & msg;
                        state <= next_char_wait;
                        add_timer <= x"0";
                    end if;
                when next_char_wait=>
                    if(w_RX_DV = '0') then
                        state <= start_proc;
                    end if;
                when start_proc=>
                    if(end_proc = x"000F") then
                        state <= send_to_wait;
                    end if;
                when send_to_wait=>
                    if(state_0 = wait_start) then
                        state <= next_char;
                    end if;
                when others=>
                    state <= idle;
            end case;
        end if;
    end process;
    
    process_0 : process(clk, state)
        variable temp_ind : std_logic_vector(7 downto 0) := x"00";
        variable temp_cntr : std_logic_vector(9 downto 0) := (others => '0');
    begin
        temp_ind := "00"&ind_0;
        temp_cntr :=  cntr(to_integer(unsigned(temp_ind)));
        if rising_edge(clk) then
            case state_0 is
                when wait_start=>
                    if(state = start_proc) then
                        state_0 <= allot_values;
                        ind_0 <= "000000";
                    end if;
                when allot_values=>
                    comp_res_0 <= res_words(to_integer(unsigned(temp_ind)));
                    state_0 <= wait_cycle;
                when wait_cycle=>
                    state_0 <= incr_cntr;
                when incr_cntr=>
                    if(equal(0) = '1') then
                        cntr(to_integer(unsigned(temp_ind))) <= temp_cntr + 1;
                    end if;
                    state_0 <= incr_ind;
                when incr_ind =>
                    if(ind_0 /= "111111") then
                        ind_0 <= temp_ind(5 downto 0) + 1;
                        state_0 <= allot_values;
                    else
                        state_0 <= gen_end;
                    end if;
                when gen_end =>
                    end_proc(0) <= '1';
                    state_0 <= wait_start_down;
                when wait_start_down=>
                    if(state = send_to_wait) then
                        state_0 <= wait_start;
                        end_proc(0) <= '0';
                    end if;
            end case;
        end if;
    end process;
    
    process_1 : process(clk, state)
        variable temp_ind : std_logic_vector(7 downto 0) := x"00";
        variable temp_cntr : std_logic_vector(9 downto 0) := (others => '0');
    begin
        temp_ind := "01"&ind_1;
        temp_cntr :=  cntr(to_integer(unsigned(temp_ind)));
        if rising_edge(clk) then
            case state_1 is
                when wait_start=>
                    if(state = start_proc) then
                        state_1 <= allot_values;
                        ind_1 <= "000000";
                    end if;
                when allot_values=>
                    comp_res_1 <= res_words(to_integer(unsigned(temp_ind)));
                    state_1 <= wait_cycle;
                when wait_cycle=>
                    state_1 <= incr_cntr;
                when incr_cntr=>
                    if(equal(1) = '1') then
                        cntr(to_integer(unsigned(temp_ind))) <= temp_cntr + 1;
                    end if;
                    state_1 <= incr_ind;
                when incr_ind =>
                    if(ind_1 /= "111111") then
                        ind_1 <= temp_ind(5 downto 0) + 1;
                        state_1 <= allot_values;
                    else
                        state_1 <= gen_end;
                    end if;
                when gen_end =>
                    end_proc(1) <= '1';
                    state_1 <= wait_start_down;
                when wait_start_down=>
                    if(state = send_to_wait) then
                        state_1 <= wait_start;
                        end_proc(1) <= '0';
                    end if;
            end case;
        end if;
    end process;
    
    process_2 : process(clk, state)
        variable temp_ind : std_logic_vector(7 downto 0) := x"00";
        variable temp_cntr : std_logic_vector(9 downto 0) := (others => '0');
    begin
        temp_ind := "10"&ind_2;
        temp_cntr :=  cntr(to_integer(unsigned(temp_ind)));
        if rising_edge(clk) then
            case state_2 is
                when wait_start=>
                    if(state = start_proc) then
                        state_2 <= allot_values;
                        ind_2 <= "000000";
                    end if;
                when allot_values=>
                    comp_res_2 <= res_words(to_integer(unsigned(temp_ind)));
                    state_2 <= wait_cycle;
                when wait_cycle=>
                    state_2 <= incr_cntr;
                when incr_cntr=>
                    if(equal(2) = '1') then
                        cntr(to_integer(unsigned(temp_ind))) <= temp_cntr + 1;
                    end if;
                    state_2 <= incr_ind;
                when incr_ind =>
                    if(ind_2 /= "111111") then
                        ind_2 <= temp_ind(5 downto 0) + 1;
                        state_2 <= allot_values;
                    else
                        state_2 <= gen_end;
                    end if;
                when gen_end =>
                    end_proc(2) <= '1';
                    state_2 <= wait_start_down;
                when wait_start_down=>
                    if(state = send_to_wait) then
                        state_2 <= wait_start;
                        end_proc(2) <= '0';
                    end if;
            end case;
        end if;
    end process;
    
    process_3 : process(clk, state)
        variable temp_ind : std_logic_vector(7 downto 0) := x"00";
        variable temp_cntr : std_logic_vector(9 downto 0) := (others => '0');
    begin
        temp_ind := "11"&ind_3;
        temp_cntr :=  cntr(to_integer(unsigned(temp_ind)));
        if rising_edge(clk) then
            case state_3 is
                when wait_start=>
                    if(state = start_proc) then
                        state_3 <= allot_values;
                        ind_3 <= "000000";
                    end if;
                when allot_values=>
                    comp_res_3 <= res_words(to_integer(unsigned(temp_ind)));
                    state_3 <= wait_cycle;
                when wait_cycle=>
                    state_3 <= incr_cntr;
                when incr_cntr=>
                    if(equal(3) = '1') then
                        cntr(to_integer(unsigned(temp_ind))) <= temp_cntr + 1;
                    end if;
                    state_3 <= incr_ind;
                when incr_ind =>
                    if(ind_3 /= "111111") then
                        ind_3 <= temp_ind(5 downto 0) + 1;
                        state_3 <= allot_values;
                    else
                        state_3 <= gen_end;
                    end if;
                when gen_end =>
                    end_proc(3) <= '1';
                    state_3 <= wait_start_down;
                when wait_start_down=>
                    if(state = send_to_wait) then
                        state_3 <= wait_start;
                        end_proc(3) <= '0';
                    end if;
            end case;
        end if;
    end process;
    
         
--Communication Part Begins
    UART_RX_INST : UART_RX
    generic map (
        g_CLKS_PER_BIT => c_CLKS_PER_BIT
    )
    port map (
        i_clk       => clk,
        i_rx_serial => r_RX_SERIAL,
        o_rx_dv     => w_RX_DV,
        o_rx_byte   => w_RX_BYTE
    );
    
    UART_TX_INST : uart_tx
    generic map (
        g_CLKS_PER_BIT => c_CLKS_PER_BIT
    )
    port map (
       i_clk       => clk,
       i_tx_dv     => r_TX_DV,
       i_tx_byte   => r_TX_BYTE,
       o_tx_active => w_tx_active,
       o_tx_serial => w_TX_SERIAL,
       o_tx_done   => w_TX_DONE
    );
    
    uart_txd <= w_TX_SERIAL;
    r_RX_SERIAL <= uart_rxd;
--Communication Part Ends
    
    bcdconv : binary_bcd
    port map (
        clk => clk,
        binary_in => val,
        bcd_out => temp
    );
    
    word_comp_0 : word_comp
		port map (
		test_word => test_word,
		res_word => comp_res_0,
		equal => equal(0)
	);
    
    word_comp_1 : word_comp
        port map (
        test_word => test_word,
        res_word => comp_res_1,
        equal => equal(1)
    );
    
    word_comp_2 : word_comp
        port map (
        test_word => test_word,
        res_word => comp_res_2,
        equal => equal(2)
    );
    
    word_comp_3 : word_comp
        port map (
        test_word => test_word,
        res_word => comp_res_3,
        equal => equal(3)
    );
    
    
    process(LED_BCD)
    begin
        case LED_BCD is
        when "0000" => LED_out <= "0000001"; -- "0"     
        when "0001" => LED_out <= "1001111"; -- "1" 
        when "0010" => LED_out <= "0010010"; -- "2" 
        when "0011" => LED_out <= "0000110"; -- "3" 
        when "0100" => LED_out <= "1001100"; -- "4" 
        when "0101" => LED_out <= "0100100"; -- "5" 
        when "0110" => LED_out <= "0100000"; -- "6" 
        when "0111" => LED_out <= "0001111"; -- "7" 
        when "1000" => LED_out <= "0000000"; -- "8"     
        when "1001" => LED_out <= "0000100"; -- "9" 
        when "1010" => LED_out <= "0000010"; -- a
        when "1011" => LED_out <= "1100000"; -- b
        when "1100" => LED_out <= "0110001"; -- C
        when "1101" => LED_out <= "1000010"; -- d
        when "1110" => LED_out <= "0110000"; -- E
        when "1111" => LED_out <= "0111000"; -- F
        when others => null;
        end case;
    end process;
    -- 7-segment display controller
    -- generate refresh rate of 190HZ
    process(Clk)
    begin 
        if(rising_edge(Clk)) then
            refresh_counter <= refresh_counter + 1;
        end if;
    end process;
     LED_activating_counter <= refresh_counter(20 downto 19);
    -- 4-to-1 MUX to generate anode activating signals for 4 LEDs 
    process(LED_activating_counter)
    begin
        case LED_activating_counter is
        when "00" =>
            Anode_Activate <= "0111"; 
            -- activate LED1 and Deactivate LED2, LED3, LED4
            LED_BCD(0) <= temp(12);
            LED_BCD(1) <= temp(13);
            LED_BCD(2) <= temp(14);
            LED_BCD(3) <= temp(15);
            -- the first hex digit of the 16-bit number
        when "01" =>
            Anode_Activate <= "1011"; 
            -- activate LED2 and Deactivate LED1, LED3, LED4
            LED_BCD(0) <= temp(8);
            LED_BCD(1) <= temp(9);
            LED_BCD(2) <= temp(10);
            LED_BCD(3) <= temp(11);
            -- the second hex digit of the 16-bit number
        when "10" =>
            Anode_Activate <= "1101"; 
            -- activate LED3 and Deactivate LED2, LED1, LED4
            LED_BCD(0) <= temp(4);
            LED_BCD(1) <= temp(5);
            LED_BCD(2) <= temp(6);
            LED_BCD(3) <= temp(7);
            -- the third hex digit of the 16-bit number
        when "11" =>
            Anode_Activate <= "1110"; 
            -- activate LED4 and Deactivate LED2, LED3, LED1
            LED_BCD(0) <= temp(0);
            LED_BCD(1) <= temp(1);
            LED_BCD(2) <= temp(2);
            LED_BCD(3) <= temp(3);
            -- the fourth hex digit of the 16-bit number    
        when others => null;
        end case;
    end process;
    
end Behavioral;
