-- Vhdl test bench created from schematic /home/szymon/Pulpit/UCISW2_P/Magnetometr/Magnetometr.sch - Tue Mar 24 23:10:30 2020
--
-- Notes: 
-- 1) This testbench template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the unit under test.
-- Xilinx recommends that these types always be used for the top-level
-- I/O of a design in order to guarantee that the testbench will bind
-- correctly to the timing (post-route) simulation model.
-- 2) To use this template as your testbench, change the filename to any
-- name of your choice with the extension .vhd, and use the "Source->Add"
-- menu in Project Navigator to import the testbench. Then
-- edit the user defined section below, adding code to generate the 
-- stimulus for your design.
--
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;
ENTITY Magnetometr_Magnetometr_sch_tb IS
END Magnetometr_Magnetometr_sch_tb;
ARCHITECTURE behavioral OF Magnetometr_Magnetometr_sch_tb IS 

   COMPONENT Magnetometr
   PORT( RST	:	IN	STD_LOGIC; 
          CLK	:	IN	STD_LOGIC; 
          SDA	:	INOUT	STD_LOGIC; 
          SCL	:	INOUT	STD_LOGIC; 
          FIFO_Full	:	OUT	STD_LOGIC; 
          NACK	:	OUT	STD_LOGIC);
   END COMPONENT;

   SIGNAL RST	:	STD_LOGIC;
   SIGNAL CLK	:	STD_LOGIC;
   SIGNAL SDA	:	STD_LOGIC;
   SIGNAL SCL	:	STD_LOGIC;
   SIGNAL FIFO_Full	:	STD_LOGIC;
   SIGNAL NACK	:	STD_LOGIC;
	
	constant CLK_period : time := 100 ns;

BEGIN

   UUT: Magnetometr PORT MAP(
		RST => RST, 
		CLK => CLK, 
		SDA => SDA, 
		SCL => SCL, 
		FIFO_Full => FIFO_Full, 
		NACK => NACK
   );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
	
      RST <= '1';
		wait for 100ns;
		
		RST <= '0';
		
		wait;
   end process;

END;
