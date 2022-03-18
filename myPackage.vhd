library IEEE;
use IEEE.STD_LOGIC_1164.all;

package myPackage is

component flopr is
generic (n : natural := 32);
port(
clk, reset: in std_logic;
d: in std_logic_vector(n-1 downto 0);
q: out std_logic_vector(n-1 downto 0));
end component;

component Adder is
PORT(
A:IN STD_LOGIC_VECTOR(31 DOWNTO 0);
B:IN STD_LOGIC_VECTOR(31 DOWNTO 0);
S:OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
end component;

component ALU is
port(
A, B: in STD_LOGIC_VECTOR(31 downto 0);
F: in STD_LOGIC_VECTOR(2 downto 0);
Y: out STD_LOGIC_VECTOR(31 downto 0);
Zero : out  STD_LOGIC);
end component;

component MUX2 is
Generic (n: integer:= 8); 
PORT(
I0,I1: IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
S:IN STD_LOGIC ;
y:OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0)); 
end component;

component Signext is
PORT (
a : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
y : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) );
end component;

component SL2 is
    Port ( a : in  STD_LOGIC_VECTOR (31 downto 0);
           y : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component regfile
port(clk: in STD_LOGIC;
we3: in STD_LOGIC;
ra1, ra2, wa3: in STD_LOGIC_VECTOR(4 downto 0);
wd3: in STD_LOGIC_VECTOR(31 downto 0);
rd1, rd2: out STD_LOGIC_VECTOR(31 downto 0));
end component;

component mainDecoder is
    Port ( op : in  STD_LOGIC_VECTOR (5 downto 0);
           memtoreg : out  STD_LOGIC;
           memwrite : out  STD_LOGIC;
           branch : out  STD_LOGIC;
           alusrc : out  STD_LOGIC;
           regdst : out  STD_LOGIC;
	        regwrite : out  STD_LOGIC;
           jump : out  STD_LOGIC;
           alu : out  STD_LOGIC_VECTOR (1 downto 0));
end component;

component ALUdecoder is
    Port ( aluop : in  STD_LOGIC_VECTOR (1 downto 0);
           funct : in  STD_LOGIC_VECTOR (5 downto 0);
           alucontrol : out  STD_LOGIC_VECTOR (2 downto 0));
end component;

component controller is
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
end component;

component dataBath is
port(clk, reset, jump: in STD_LOGIC;
readdata, instr: in STD_LOGIC_VECTOR(31 downto 0);
memtoreg, pcsrc,alusrc,regwrite, regdst: in STD_LOGIC;
aluoperation: in STD_LOGIC_VECTOR(2 downto 0);
zero: out STD_LOGIC;
pc: buffer STD_LOGIC_VECTOR(31 downto 0); -- buffer and signal
aluout, writedata: buffer STD_LOGIC_VECTOR(31 downto 0));

end component;

end myPackage;

