library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is
end testbench; 

architecture tb of testbench is

-- DUT (device under test) component
component full_adder_3b is
	port(
          x, y 	: in std_logic_vector(2 downto 0);
          cin    : in std_logic;    
          sum 	: out std_logic_vector(2 downto 0);
          cout   : out std_logic);
	end component;

signal a_in, b_in, sum_out  : std_logic_vector(2 downto 0);
signal carry_in, carry_out : std_logic;

begin

  -- Connect DUT
  DUT: full_adder_3b port map( a_in, b_in, carry_in, sum_out, carry_out);

  process
  begin
    -- test all equivalence classes of circuit
    --- sum is 000, carry out is 0
    a_in(0) <= '0';
    a_in(1) <= '0';
    a_in(2) <= '0';
    
    b_in(0) <= '0';
    b_in(1) <= '0';
    b_in(2) <= '0';
    
    carry_in <= '0';
    
    wait for 1 ns;
    assert(sum_out(2) = '0' and sum_out(1)='0' and sum_out(0)='0' and carry_out='0') report "Fail 0/0" severity error;
    
    -- sum is 000, carry out is 1
    a_in(0) <= '1';
    a_in(1) <= '0';
    a_in(2) <= '1';
    
    b_in(0) <= '0';
    b_in(1) <= '1';
    b_in(2) <= '0';
    
    carry_in <= '1';
    
    wait for 1 ns;
    assert(sum_out(2) = '0' and sum_out(1)='0' and sum_out(0)='0' and carry_out='1') report "Fail 0/0" severity error;
    
    a_in(0) <= '1';
    a_in(1) <= '1';
    a_in(2) <= '1';
    
    b_in(0) <= '0';
    b_in(1) <= '0';
    b_in(2) <= '0';
    
    carry_in <= '1';
    
    wait for 1 ns;
    assert(sum_out(2) = '0' and sum_out(1)='0' and sum_out(0)='0' and carry_out='1') report "Fail 0/0" severity error;
    
    -- carry over from 1st bit to 2nd bit
    
    a_in(0) <= '1';
    a_in(1) <= '0';
    a_in(2) <= '0';
    
    b_in(0) <= '1';
    b_in(1) <= '0';
    b_in(2) <= '0';
    
    carry_in <= '0';
    
    wait for 1 ns;
    assert(sum_out(2) = '0' and sum_out(1)='1' and sum_out(0)= '0' and carry_out = '0') report "Fail 0/0" severity error;
    
    a_in(0) <= '1';
    a_in(1) <= '0';
    a_in(2) <= '0';
    
    b_in(0) <= '0';
    b_in(1) <= '0';
    b_in(2) <= '0';
    
    carry_in <= '1';
    
    wait for 1 ns;
    assert(sum_out(2) = '0' and sum_out(1)='1' and sum_out(0)= '0' and carry_out = '0') report "Fail 0/0" severity error;
    
    -- carry over from 2nd bit to 3d bit
    
    a_in(0) <= '0';
    a_in(1) <= '1';
    a_in(2) <= '0';
    
    b_in(0) <= '0';
    b_in(1) <= '1';
    b_in(2) <= '0';
    
    carry_in <= '0';
    
    wait for 1 ns;
    assert(sum_out(2) = '1' and sum_out(1)='0' and sum_out(0)= '0' and carry_out = '0') report "Fail 0/0" severity error;
    
    a_in(0) <= '1';
    a_in(1) <= '1';
    a_in(2) <= '0';
    
    b_in(0) <= '1';
    b_in(1) <= '0';
    b_in(2) <= '0';
    
    carry_in <= '0';
    
    wait for 1 ns;
    assert(sum_out(2) = '1' and sum_out(1)='0' and sum_out(0)= '0' and carry_out = '0') report "Fail 0/0" severity error;
    
    -- carry out from 3rd bit
    
    a_in(0) <= '0';
    a_in(1) <= '0';
    a_in(2) <= '1';
    
    b_in(0) <= '0';
    b_in(1) <= '0';
    b_in(2) <= '1';
    
    carry_in <= '0';
    
    wait for 1 ns;
    assert(sum_out(2) = '0' and sum_out(1)='0' and sum_out(0)= '0' and carry_out = '1') report "Fail 0/0" severity error;
    
    a_in(0) <= '0';
    a_in(1) <= '1';
    a_in(2) <= '1';
    
    b_in(0) <= '0';
    b_in(1) <= '1';
    b_in(2) <= '0';
    
    carry_in <= '0';
    
    wait for 1 ns;
    assert(sum_out(2) = '0' and sum_out(1)='0' and sum_out(0)= '0' and carry_out = '1') report "Fail 0/0" severity error;
    
    -- No carry over
    
    a_in(0) <= '0';
    a_in(1) <= '0';
    a_in(2) <= '0';
    
    b_in(0) <= '1';
    b_in(1) <= '0';
    b_in(2) <= '0';
    
    carry_in <= '0';
    
    wait for 1 ns;
    assert(sum_out(2) = '0' and sum_out(1)='0' and sum_out(0)= '1' and carry_out = '0') report "Fail 0/0" severity error;
    
    a_in(0) <= '0';
    a_in(1) <= '0';
    a_in(2) <= '1';
    
    b_in(0) <= '0';
    b_in(1) <= '0';
    b_in(2) <= '0';
    
    carry_in <= '0';
    
    wait for 1 ns;
    assert(sum_out(2) = '1' and sum_out(1)='0' and sum_out(0)= '0' and carry_out = '0') report "Fail 0/0" severity error;
    
    -- 11 test cases covered by equivalence classes

    assert false report "Test done." severity note;
    wait;
  end process;
end tb;
