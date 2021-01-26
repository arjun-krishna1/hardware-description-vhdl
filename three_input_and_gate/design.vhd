-- The following was adapted from the EDA Playground example 
-- titled "VHDL - Basic OR Gate" by Victor Lyuboslavsky
-- as last modified on 10/28/2019

-- Arjun Krishna, 3 input AND gate
library IEEE;
use IEEE.std_logic_1164.all;

entity my_function is -- the function name is my_function
  Port( x : in std_logic; -- port of the function
	  	y : in std_logic; -- three signals of mode in and type std_logic
        z : in std_logic;
  		w : out std_logic -- one signal of mode output and type std_logic
  );
  end my_function; -- end entity declaration

architecture Behavioral of my_function is -- start architecture definition
	-- declarative section is empty
	begin -- implementation section
		w<= (not (x or y)) or (y and z); -- a concurrent signal assignment to get the output
	end Behavioral;