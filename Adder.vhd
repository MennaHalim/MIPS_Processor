library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Adder is
PORT(
A:IN STD_LOGIC_VECTOR(31 DOWNTO 0);
B:IN STD_LOGIC_VECTOR(31 DOWNTO 0);
S:OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
);
end Adder;

architecture Behavioral of Adder is


begin

s<=a+b; 

end Behavioral;

