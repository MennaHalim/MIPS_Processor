--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:15:34 05/07/2021
-- Design Name:   
-- Module Name:   D:/Arch labs h/Lab4/test.vhd
-- Project Name:  Lab4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mainModule
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test IS
END test;
 
ARCHITECTURE behavior OF test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mainModule
    PORT(
         cLk : IN  std_logic;
         c : IN  std_logic;
         l : IN  std_logic;
         R1 : OUT  std_logic_vector(31 downto 0);
         R2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal cLk : std_logic := '0';
   signal c : std_logic := '0';
   signal l : std_logic := '0';

 	--Outputs
   signal R1 : std_logic_vector(31 downto 0);
   signal R2 : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant cLk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mainModule PORT MAP (
          cLk => cLk,
          c => c,
          l => l,
          R1 => R1,
          R2 => R2
        );

   -- Clock process definitions
   cLk_process :process
   begin
		cLk <= '0';
		wait for cLk_period/2;
		cLk <= '1';
		wait for cLk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for cLk_period*10;

      -- insert stimulus here
		l<= '1';
		wait for clk_period;
		c <= '1';
		wait for clk_period*3;
		c <= '0';
		l <= '1';

      wait;
   end process;

END;
