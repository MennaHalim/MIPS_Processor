
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity mainDecoder is
    Port ( op : in  STD_LOGIC_VECTOR (5 downto 0);
           memtoreg : out  STD_LOGIC;
           memwrite : out  STD_LOGIC;
           branch : out  STD_LOGIC;
           alusrc : out  STD_LOGIC;
           regdst : out  STD_LOGIC;
	        regwrite : out  STD_LOGIC;
           jump : out  STD_LOGIC;
           alu : out  STD_LOGIC_VECTOR (1 downto 0));
end mainDecoder;

architecture Behavioral of mainDecoder is
signal control: STD_LOGIC_VECTOR (8 downto 0);
begin

process (op)

begin
case op is
when  "000000" => control <= "110000010";
when  "100011" => control <=  "101001000";
when  "101011" => control <=  "001010000";
when  "000100" => control <=  "000100001";
when  "001000" => control <=  "101000000";
when  "000010" => control <=  "000000100";
when others => control <=  "---------";
end case;


end process;

(regwrite, regdst, alusrc, branch, memwrite, memtoreg, jump, alu(1), alu(0)) <= control ;
end Behavioral;

