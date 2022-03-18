
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ALUdecoder is
    Port ( aluop : in  STD_LOGIC_VECTOR (1 downto 0);
           funct : in  STD_LOGIC_VECTOR (5 downto 0);
           alucontrol : out  STD_LOGIC_VECTOR (2 downto 0));
end ALUdecoder;

architecture Behavioral of ALUdecoder is

begin

process (aluop, funct)
begin
case aluop is
when "00" => alucontrol <= "010";
when "01" => alucontrol <= "110";
when others => case funct is 
             when "100000" => alucontrol <= "010";
				 when "100010" => alucontrol <= "010";
				 when "100100" => alucontrol <= "010";
				 when "100101" => alucontrol <= "010";
				 when "101010" => alucontrol <= "010";
				 when others => alucontrol <= "---";
				 end case;
								  
end case;
end process;


end Behavioral;