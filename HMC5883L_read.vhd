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
			DRX : out  STD_LOGIC_VECTOR (11 downto 0);
         DRY : out  STD_LOGIC_VECTOR (11 downto 0);
         DRZ : out  STD_LOGIC_VECTOR (11 downto 0)
    );
			
end HMC5883L_read;

architecture Behavioral of HMC5883L_read is

   type TState is ( SInit, SPushAddress, SWrite, SWriteWait, SRead, SReadWait,
										SMeasureRead, SMeasureReadWait, SMeasureGetByte, SMeasurePopByte, SMeasureIsFIFOEmpty,
										SFinish);
   signal state, nextState: TState;
	
	signal data : STD_LOGIC_VECTOR (47 downto 0);
	signal currentByte : integer range 0 to 5 := 0;

begin

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
                nextState <= SMeasureRead;
					 
--            when SPushAddress =>
--                nextState <= SMeasureRead;
--					 
--            when SWrite => 
--                nextState <= SWriteWait;
--					 
--            when SWriteWait =>
--                if I2C_Busy = '0' then 
--                    nextState <= SRead;
--                end if;
--					 
--            when SRead =>
--                nextState <= SReadWait;
--					 
--            when SReadWait =>
--                if I2C_Busy = '0' then 
--                    nextState <= SFinish;
--                end if;
					 
				-- read data from magnetometer
				when SMeasureRead =>
					nextState <= SMeasureReadWait;
					
				when SMeasureReadWait =>
					if I2C_Busy = '0' then
						nextState <= SMeasureGetByte;
					end if;
					
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
						nextState <= SFinish;
					end if;
								
            when SFinish =>
                nextState	<= SFinish;
					 
				when others =>
					nextState <= SFinish;
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
							data(47 downto 40) <= I2C_FIFO_DO;
							
						-- X LSB
						when 1 =>
							data(39 downto 32) <= I2C_FIFO_DO;
							
						-- Y MSB
						when 2 =>
							data(31 downto 24) <= I2C_FIFO_DO;
							
						-- Y LSB
						when 3 =>
							data(23 downto 16) <= I2C_FIFO_DO;
							
						-- Z MSB
						when 4 =>
							data(15 downto 8) <= I2C_FIFO_DO;
							
						-- Z LSB
						when 5 =>
							data(7 downto 0) <= I2C_FIFO_DO;
					end case;
				end if;
			end if;
		end process;
        
		I2C_FIFO_DI <= X"0A" when state = SRead else
											X"00";
											
		I2C_FIFO_Push <= '1' when state = SPushAddress else 
													'0';
		 
		I2C_Go <= '1' when state = SWrite or state = SRead or state = SMeasureRead
									else '0';
		 
		I2C_Address <= X"3C" when state = SWrite else
												X"3D" when state = SRead or state = SMeasureRead else
												X"00";
												
		I2C_ReadCnt <= X"1" when state = SRead else 
												X"6" when state = SMeasureRead else
												X"0";

		I2C_FIFO_POP <= '1' when state = SMeasurePopByte else 
												'0';
		  
		-- convert data to output
		DRX <= data(43 downto 32);
		DRY <= data(27 downto 16);
		DRZ <= data(11 downto 0);

end Behavioral;
