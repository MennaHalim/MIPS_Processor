
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Signext is
PORT (
a : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
y : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) );
end Signext;

architecture Behavioral of Signext is

begin

y <= X"ffff" & a WHEN a(15) = '1' ELSE
X"0000" & a;

end Behavioral;

