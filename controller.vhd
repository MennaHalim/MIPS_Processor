
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use work.myPackage.all;

entity controller is
    Port ( op : in  STD_LOGIC_VECTOR (5 downto 0);
           funct : in  STD_LOGIC_VECTOR (5 downto 0);
           zero : in  STD_LOGIC;
           memtoreg : out  STD_LOGIC;
           memwrite : out  STD_LOGIC;
           pcsrc : out  STD_LOGIC;
           aluscr : out  STD_LOGIC;
           regdst : out  STD_LOGIC;
           rewrite : out  STD_LOGIC;
           jump : out  STD_LOGIC;
           alucontrol : out  STD_LOGIC_VECTOR (2 downto 0));
end controller;

architecture Behavioral of controller is

signal aluop:  STD_LOGIC_VECTOR (1 downto 0);
signal branch: STD_LOGIC;

begin

mainDecoderObj: mainDecoder port map (op,memtoreg,memwrite, branch,aluscr,regdst ,rewrite ,jump, aluop );
ALUdecoderObj: ALUdecoder port map (aluop, funct, alucontrol);
pcsrc <= zero and branch;
end Behavioral;

