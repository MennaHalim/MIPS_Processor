
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.myPackage.all;


entity processor is
port(
clk, reset: in STD_LOGIC;
instr, readdata: in STD_LOGIC_VECTOR(31 downto 0);
aluout, writedata: out STD_LOGIC_VECTOR(31 downto 0);
pc: out STD_LOGIC_VECTOR(31 downto 0);
memwrite: out STD_LOGIC); --memwrite
end processor;

architecture Behavioral of processor is

signal  zero, 
           memtoreg ,
           pcsrc ,
           aluscr,
           regdst ,
           rewrite, 
           jump : STD_LOGIC;
signal alucontrol: STD_LOGIC_VECTOR( 2 downto 0);

begin

controllerObj: controller port map(instr (31 downto 26), instr(5 downto 0), zero, 
           memtoreg ,
           memwrite, 
           pcsrc ,
           aluscr,
           regdst ,
           rewrite, 
           jump,alucontrol);
dataBathObj: dataBath port map (clk,
           reset,
           jump,
           readdata, 
           instr,
           memtoreg, 
           pcsrc, 
           aluscr,
           rewrite,
           regdst, 
           alucontrol,
           zero,
           pc,
           aluout, 
           writedata);

end Behavioral;

