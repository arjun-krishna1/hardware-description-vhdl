-- The following was adapted from the EDA Playground example 
-- titled "VHDL - Basic OR Gate" by Victor Lyuboslavsky
-- as last modified on 10/28/2019

-- Testbench for AND gate
library IEEE;
use IEEE.std_logic_1164.all;
 
entity testbench is
-- empty
end testbench; 

architecture tb of testbench is

-- DUT component
component my_function is
port(
  x : in std_logic;
  y : in std_logic;
  z : in std_logic;
  w : out std_logic);
end component;

signal x_in, y_in, z_in, w_out: std_logic;

begin

  -- Connect DUT, design under test
  DUT: my_function port map(x_in, y_in, z_in, w_out);

  process
  begin
  	-- row 1
    x_in <= '0';
    y_in <= '0';
    z_in <= '0';
    wait for 1 ns;
    assert(w_out='1') report "row 1 failed" severity error;
    
    -- row 2
    x_in <= '0';
    y_in <= '0';
    z_in <= '1';
    wait for 1 ns;
    assert(w_out='1') report "row 2 failed" severity error;
    
    -- row 3
    x_in <= '0';
    y_in <= '1';
    z_in <= '0';
    wait for 1 ns;
    assert(w_out='0') report "row 3 failed" severity error;
    
    -- row 4
    x_in <= '0';
    y_in <= '1';
    z_in <= '1';
    wait for 1 ns;
    assert(w_out='1') report "row 4 failed" severity error;
    
    -- row 5
    x_in <= '1';
    y_in <= '0';
    z_in <= '0';
    wait for 1 ns;
    assert(w_out='0') report "row 5 failed" severity error;
    
    -- row 6
    x_in <= '1';
    y_in <= '0';
    z_in <= '1';
    wait for 1 ns;
    assert(w_out='0') report "row 6 failed" severity error;
    
    -- row 7
    x_in <= '1';
    y_in <= '1';
    z_in <= '0';
    wait for 1 ns;
    assert(w_out='0') report "row 7 failed" severity error;
    
    -- row 8
    x_in <= '1';
    y_in <= '1';
    z_in <= '1';
    wait for 1 ns;
    assert(w_out='1') report "row 8 failed" severity error;

    
    -- Clear inputs
    x_in <= '0';
    y_in <= '0';
    z_in <= '0';

    assert false report "Test done." severity note;
    wait;
  end process;
end tb;