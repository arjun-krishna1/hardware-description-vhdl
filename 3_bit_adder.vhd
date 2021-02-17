-- 3-it adder design composed of 3 1-bit adders
library IEEE;
use IEEE.std_logic_1164.all;

entity full_adder_3b is
	port( 	
          x, y 	: in std_logic_vector(2 downto 0);
          cin     : in std_logic;    
          sum 	: out std_logic_vector(2 downto 0);
          cout    : out std_logic);
	end full_adder_3b;
    
architecture behavioral of full_adder_3b is 

	--signal declarations
    signal c1, c2 : std_logic;

  	-- component declaration
  	component full_adder_1b
      port( 	
              a_i  		: in std_logic;
              b_i 		: in std_logic;
              carry_in_i 	: in std_logic;
              sum_i 		: out std_logic;
              carry_out_i : out std_logic);
  	end component;

	begin
    	--component instantiation
    	bit0 : full_adder_1b port map(a_i => x(0), b_i => y(0), carry_in_i => cin, sum_i => sum(0), carry_out_i => c1);
        
        bit1 : full_adder_1b port map(a_i => x(1), b_i => y(1), carry_in_i => c1, sum_i => sum(1), carry_out_i => c2);
        
        bit3 : full_adder_1b port map(a_i => x(2), b_i => y(2), carry_in_i => c2, sum_i => sum(2), carry_out_i => cout);
        
   	end behavioral;
