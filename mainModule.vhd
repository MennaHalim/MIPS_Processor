library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.myPackage.all;


entity mainModule is
generic (n : natural := 32);
Port (
cLk: in std_logic;
c : in  std_logic;
l : in  std_logic;
R1,R2: out std_logic_vector(n-1 downto 0));
end mainModule;

architecture Behavioral of mainModule is

signal tmp1, tmp2: std_logic_vector (n-1 DOWNTO 0);

begin
tmp1 <= (others => '1');
R1Flopr: flopr generic map (n) port map (clk,c,tmp1,tmp2);
R2Flopr: flopr generic map (n) port map (clk,not(l),tmp2,R2);
R1<= tmp2 ;

end Behavioral;

