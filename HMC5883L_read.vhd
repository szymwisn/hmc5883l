library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity HMC5883L_read is
	port(RST : in STD_LOGIC;
			CLK : in STD_LOGIC;
			I2C_Busy : in STD_LOGIC;
         I2C_FIFO_Pop : out STD_LOGIC;
			I2C_FIFO_DO : in STD_LOGIC_VECTOR (7 downto 0);        
         I2C_Go : out STD_LOGIC;
         I2C_FIFO_Push : out STD_LOGIC;
		   I2C_Address :out STD_LOGIC_VECTOR (7 downto 0);        
         I2C_FIFO_DI : out STD_LOGIC_VECTOR (7 downto 0);
		   I2C_ReadCnt : out STD_LOGIC_VECTOR (3 downto 0);
			I2C_FIFO_Empty: in STD_LOGIC;
			I2C_FIFO_FULL: in STD_LOGIC;
			DRX : out  STD_LOGIC_VECTOR (15 downto 0);
         DRY : out  STD_LOGIC_VECTOR (15 downto 0);
         DRZ : out  STD_LOGIC_VECTOR (15 downto 0)
    );
			
end HMC5883L_read;

architecture Behavioral of HMC5883L_read is

   type TState is ( SInit,
							SPushAddressOfConfigRegA, SPushDataToConfigA, SWriteConfigRegA, SWaitConfigRegA,
							SPushAddressOfModeReg, SPushContinousMeasurementMode, SWriteMode, SWaitMode,
							SMeasureReceive, SMeasureReceiveWait,
							SMeasureGetByte, SMeasurePopByte, SMeasureIsFIFOEmpty,
							SPointToFirstDataRegister, SWaitPointToFirstDataRegister);
   signal state, nextState: TState;
	
	signal data : STD_LOGIC_VECTOR (47 downto 0);
	signal currentByte : integer range 0 to 5 := 0;

begin

	 -- czekanie po wykonaniu pomiaru przez 1/30 * 50 mln taktow
	 -- najpierw starsze potem mlodsze

    process(CLK)
    begin
        if rising_edge(CLK) then
            if RST = '1' then
                state <= SInit;
            else
                state <= nextState;
            end if;
      end if;
    end process;

    process(state, I2C_Busy)
    begin
			nextState <= state;

			case state is
				when SInit =>
					nextState <= SPushAddressOfConfigRegA;
					
				-- DATA OUTPUT RATE CONFIGURATION:
				-- push 00 to FIFO - address of Configuration Register A
				when SPushAddressOfConfigRegA =>
					nextState <= SPushDataToConfigA;
						
				-- push 00010100 to FIFO - data output rate 30 Hz				
				when SPushDataToConfigA =>
					nextState <= SWriteConfigRegA;
					
				-- write data to Configure Register A
				when SWriteConfigRegA => 
					nextState <= SWaitConfigRegA;
					
				when SWaitConfigRegA =>
					if I2C_Busy = '0' then
						nextState <= SPushAddressOfModeReg;
					end if;
					
					
				-- DATA OPERATING MODE CONFIGURATION:
				-- push 02 to FIFO - address of mode register
				when SPushAddressOfModeReg =>
					nextState <= SPushContinousMeasurementMode;
					
				-- push 00 to FIFO - continous measurement mode
				when SPushContinousMeasurementMode =>
					nextState <= SWriteMode;
					
				-- write data to Mode Register
				when SWriteMode =>
					nextState <= SWaitMode;
				
				-- wait until FIFO not busy, then continue
				when SWaitMode =>
					if I2C_Busy = '0' then
						nextState <= SPointToFirstDataRegister;
					end if;
					
				-- // loop start // -- 
				-- POINT TO Data Output X MSB Register 
				-- send 0x3C 0x03 - point to first data register with address 03
				when SPointToFirstDataRegister =>
					nextState <= SWaitPointToFirstDataRegister;
				
				when SWaitPointToFirstDataRegister =>
					if I2C_Busy = '0' then
						nextState <= SMeasureReceive;
					end if;
				
				
				-- RECEIVING MEASUREMENTS:
				-- send 0x3D 0x06 - read all 6 bytes
				when SMeasureReceive =>
					nextState <= SMeasureReceiveWait;
				
				when SMeasureReceiveWait => 
					if I2C_Busy = '0' then
						nextState <= SMeasureGetByte;
					end if;
						
						
				-- READING RECEIVED DATA:			
				-- get data from FIFO
				when SMeasureGetByte =>
					nextState <= SMeasurePopByte;
				
				-- pop byte from FIFO and increment currentByte
				when SMeasurePopByte =>
					nextState <= SMeasureIsFIFOEmpty;
					
				-- if FIFO is empty then finalize, if not - get next byte
				when SMeasureIsFIFOEmpty =>
					if I2C_FIFO_Empty = '0' then
						nextState <= SMeasureGetByte;
					else
						nextState <= SPointToFirstDataRegister;
					end if;
																	
        end case;
		end process;
		
		-- increment currentByte
		process(CLK)
		begin
			if rising_edge(CLK) then
				if RST = '1' then
					currentByte <= 0;
				end if;
				if state = SMeasurePopByte then
						if currentByte < 5 then
							currentByte <= currentByte + 1;
						else
							currentByte <= 0;
						end if;
				end if;
			end if;
		end process;

		-- load data from FIFO
		process(CLK, state)
		begin
			if rising_edge(CLK) then
				if state = SMeasureGetByte then
					case currentByte is
						-- X MSB
						when 0 =>
							data(39 downto 32) <= I2C_FIFO_DO;
							
						-- X LSB
						when 1 =>
							data(47 downto 40) <= I2C_FIFO_DO;
							
						-- Y MSB
						when 2 =>
							data(23 downto 16) <= I2C_FIFO_DO;
							
						-- Y LSB
						when 3 =>
							data(31 downto 24) <= I2C_FIFO_DO;
							
						-- Z MSB
						when 4 =>
							data(7 downto 0) <= I2C_FIFO_DO;
							
						-- Z LSB
						when 5 =>
							data(15 downto 8) <= I2C_FIFO_DO;
					end case;
				end if;
			end if;
		end process;
        
		I2C_FIFO_DI <= X"00" when state = SPushAddressOfConfigRegA or state = SPushContinousMeasurementMode
							else X"02" when state = SPushAddressOfModeReg
							else "00010100" when state = SPushDataToConfigA -- tryb 30Hz: DO2=1, DO1=0 i DO0=1
							else X"03" when state = SPointToFirstDataRegister
							else X"00";
											
		I2C_FIFO_Push <= '1' when state = SPushAddressOfConfigRegA or state = SPushAddressOfModeReg
									or state = SPushContinousMeasurementMode or state = SPushDataToConfigA
									or state = SPointToFirstDataRegister
									else '0';
		 
		I2C_Go <= '1' when state = SWriteConfigRegA or state = SWriteMode or state = SMeasureReceive
						or state = SPointToFirstDataRegister else '0';
		 
		I2C_Address <= X"3C" when state = SWriteConfigRegA or state = SWriteMode
							or state = SPointToFirstDataRegister 
							else X"3D" when state = SMeasureReceive else X"00";
												
		I2C_ReadCnt <= X"6" when state = SMeasureReceive
							else X"0";

		I2C_FIFO_POP <= '1' when state = SMeasurePopByte
								else '0';
		  
		-- convert data to output
		DRX <= data(47 downto 32);
		DRY <= data(31 downto 16);
		DRZ <= data(15 downto 0);

end Behavioral;