--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:34:32 03/24/2020
-- Design Name:   
-- Module Name:   /home/szymon/Pulpit/UCISW2_P/Magnetometr/HMC5883L_read_TB.vhd
-- Project Name:  Magnetometr
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: HMC5883L_read
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
 
ENTITY HMC5883L_read_TB IS
END HMC5883L_read_TB;
 
ARCHITECTURE behavior OF HMC5883L_read_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT HMC5883L_read
    PORT(
         RST : IN  std_logic;
         CLK : IN  std_logic;
         I2C_Busy : IN  std_logic;
         I2C_FIFO_Pop : OUT  std_logic;
         I2C_FIFO_DO : IN  std_logic_vector(7 downto 0);
         I2C_Go : OUT  std_logic;
         I2C_FIFO_Push : OUT  std_logic;
         I2C_Address : OUT  std_logic_vector(7 downto 0);
         I2C_FIFO_DI : OUT  std_logic_vector(7 downto 0);
         I2C_ReadCnt : OUT  std_logic_vector(3 downto 0);
			I2C_FIFO_Empty: in STD_LOGIC
        );
    END COMPONENT;
    

   --Inputs
   signal RST : std_logic := '0';
   signal CLK : std_logic := '0';
   signal I2C_Busy : std_logic := '0';
   signal I2C_FIFO_DO : std_logic_vector(7 downto 0) := (others => '0');
	signal I2C_FIFO_Empty: STD_LOGIC := '1';

 	--Outputs
   signal I2C_FIFO_Pop : std_logic;
   signal I2C_Go : std_logic;
   signal I2C_FIFO_Push : std_logic;
   signal I2C_Address : std_logic_vector(7 downto 0);
   signal I2C_FIFO_DI : std_logic_vector(7 downto 0);
   signal I2C_ReadCnt : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: HMC5883L_read PORT MAP (
          RST => RST,
          CLK => CLK,
          I2C_Busy => I2C_Busy,
          I2C_FIFO_Pop => I2C_FIFO_Pop,
          I2C_FIFO_DO => I2C_FIFO_DO,
          I2C_Go => I2C_Go,
          I2C_FIFO_Push => I2C_FIFO_Push,
          I2C_Address => I2C_Address,
          I2C_FIFO_DI => I2C_FIFO_DI,
          I2C_ReadCnt => I2C_ReadCnt,
			 I2C_FIFO_Empty => I2C_FIFO_Empty
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
