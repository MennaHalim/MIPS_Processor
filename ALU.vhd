
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity ALU is
port(
A, B: in STD_LOGIC_VECTOR(31 downto 0);
F: in STD_LOGIC_VECTOR(2 downto 0);
Y: out STD_LOGIC_VECTOR(31 downto 0);
Zero : out  STD_LOGIC);
end ALU;

architecture Behavioral of ALU is

signal S, BB: STD_LOGIC_VECTOR(31 downto 0);

begin

BB <= (not B) when (F(2) = '1')else B;
S <= A + BB + F(2);
Y <= A and BB when F(1 downto 0) ="00" ELSE
A or BB when F(1 downto 0) ="01" ELSE
S when F(1 downto 0) ="10" ELSE
("0000000000000000000000000000000"& S(31)) when F(1 downto 0) = "11" ELSE
 X"00000000";

Zero <= '1' when A=BB else '0';
end Behavioral;

