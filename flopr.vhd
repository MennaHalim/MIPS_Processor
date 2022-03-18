library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity flopr is
generic (n : natural := 32);
port(
clk, reset: in std_logic;
d: in std_logic_vector(n-1 downto 0);
q: out std_logic_vector(n-1 downto 0));
end flopr;

architecture Behavioral of flopr is

begin

process(clk, reset)
begin
if reset = '1' then q <= (others => '0');
Elsif rising_edge(clk) then q <= d;
end if;
end process;

end Behavioral;

