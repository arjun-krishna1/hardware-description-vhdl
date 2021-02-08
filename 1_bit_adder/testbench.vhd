-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is
-- empty
end testbench; 

architecture tb of testbench is

-- DUT (device under test) component
component full_adder_1b is
port(
  a_i: in std_logic;
  b_i: in std_logic;
  carry_in_i : in std_logic;
  sum_i : out std_logic;
  carry_out_i : out std_logic);
end component;

signal a_in, b_in, carry_in, sum_out, carry_out : std_logic;

begin

  -- Connect DUT
  DUT: full_adder_1b port map(a_in, b_in, carry_in, sum_out, carry_out);

  process
  begin
    a_in <= '0';
    b_in <= '0';
    carry_in <= '0';
    wait for 1 ns;
    assert(sum_out='0' and carry_out='0') report "Fail 0/0" severity error;
    
    a_in <= '0';
    b_in <= '0';
    carry_in <= '1';
    wait for 1 ns;
    assert(sum_out='1' and carry_out='0') report "Fail 0/0" severity error;
    
    a_in <= '0';
    b_in <= '1';
    carry_in <= '0';
    wait for 1 ns;
    assert(sum_out='1' and carry_out='0') report "Fail 0/0" severity error;
    
    a_in <= '0';
    b_in <= '1';
    carry_in <= '1';
    wait for 1 ns;
    assert(sum_out='0' and carry_out='1') report "Fail 0/0" severity error;
    
    a_in <= '1';
    b_in <= '0';
    carry_in <= '0';
    wait for 1 ns;
    assert(sum_out='1' and carry_out='0') report "Fail 0/0" severity error;
    
    a_in <= '1';
    b_in <= '0';
    carry_in <= '1';
    wait for 1 ns;
    assert(sum_out='0' and carry_out='1') report "Fail 0/0" severity error;
    
    a_in <= '1';
    b_in <= '1';
    carry_in <= '0';
    wait for 1 ns;
    assert(sum_out='0' and carry_out='1') report "Fail 0/0" severity error;
    
    a_in <= '1';
    b_in <= '1';
    carry_in <= '1';
    wait for 1 ns;
    assert(sum_out='1' and carry_out='1') report "Fail 0/0" severity error;

    assert false report "Test done." severity note;
    wait;
  end process;
end tb;
