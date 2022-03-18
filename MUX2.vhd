
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity MUX2 is
Generic (n: integer:= 8); 
PORT(
I0,I1: IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
S:IN STD_LOGIC ;
y:OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0)); 
end MUX2;

architecture Behavioral of MUX2 is

begin

y <=I1 WHEN S = '1' ELSE I0; 

end Behavioral;

