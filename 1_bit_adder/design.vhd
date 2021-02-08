-- Code your 1-bit full adder here
--Note that the code provided to you is NOT full implemented
--You need to review what is given and complete the design

library IEEE;
use IEEE.std_logic_1164.all;

entity full_adder_1b is
	port( 	a_i 		: in std_logic;
    		b_i 		: in std_logic;
            carry_in_i 	: in std_logic;
            sum_i 		: out std_logic;
            carry_out_i : out std_logic);
	end full_adder_1b;
    
architecture behavioral of full_adder_1b is 

	--signal declarations
    signal sum_ha_1, carry_ha_1, carry_ha_2 : std_logic;

  	-- component declaration
  	component half_adder
      port(	  a 	: in std_logic;
              b 	: in std_logic;
              sum 	: out std_logic;
              carry : out std_logic);
  	end component;

	begin
    	--component instantiation
    	ha_1 : half_adder port map(a => a_i, b => b_i, sum => sum_ha_1, carry => carry_ha_1);
        
    	ha_2 : half_adder port map(a => carry_in_i, b => sum_ha_1, sum => sum_i, carry => carry_ha_2);
    	
    	
        --add your code here to complete the implementation
        -- final or gate
        carry_out_i <= carry_ha_2 or carry_ha_1;
        
   	end behavioral;
