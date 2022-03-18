
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.myPackage.all;



entity dataBath is
port(clk, reset, jump: in STD_LOGIC;
readdata, instr: in STD_LOGIC_VECTOR(31 downto 0);
memtoreg, pcsrc,alusrc,regwrite, regdst: in STD_LOGIC;
aluoperation: in STD_LOGIC_VECTOR(2 downto 0);
zero: out STD_LOGIC;
pc: buffer STD_LOGIC_VECTOR(31 downto 0); -- buffer and signal
aluout, writedata: buffer STD_LOGIC_VECTOR(31 downto 0));

end dataBath;

architecture Behavioral of dataBath is

signal pcnext, pcplus4, pcbranch,
sllin, sllout, regout1, regout2, signexout, aluin: STD_LOGIC_VECTOR(31 downto 0);
signal writereg: STD_LOGIC_VECTOR (4 downto 0);
signal jumbinstr: STD_LOGIC_VECTOR (31 downto 0);
signal muxout, wdata: STD_LOGIC_VECTOR(31 downto 0);

begin

jumbinstr <= pcplus4(31 downto 28)& "00" & instr (25 downto 0);

pcreg: flopr generic map(32) port map (clk, reset, pcnext,  pc);
pcadder: Adder port map( pc, X"00000004", pcplus4); --cin,cout
sl: SL2 port map ( sllin, sllout); 
Alubr: adder port map ( pcplus4, sllout, pcbranch);
bcbrmux: MUX2 generic map (32) port map (pcplus4, pcbranch, pcsrc, muxout);
jumpMux: MUX2 generic map (32) port map (muxout,jumbinstr,jump ,pcnext);

resMux: MUX2 generic map (32) port map (aluout, readdata, memtoreg, wdata ); 
instrmux: MUX2 generic map(5) port map (instr (20 downto 16), instr (15 downto 11), regdst, writereg);
registerFile: regfile port map(clk, regwrite, instr(25 downto 21), instr(20 downto 16), writereg, wdata, regout1, writedata);
signex:Signext port map ( instr (15 downto 0 ), signexout);
 
alumux: MUX2 generic map (32) port map(writedata, signexout, alusrc, aluin);
AluObj: ALU port map (regout1, aluin, aluoperation, aluout, zero);

end Behavioral;

