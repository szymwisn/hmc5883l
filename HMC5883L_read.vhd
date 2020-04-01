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
			I2C_FIFO_Empty: in STD_LOGIC
    );
			
end HMC5883L_read;

architecture Behavioral of HMC5883L_read is

   type TState is ( SInit, SPushAddress, SWrite, SWriteWait, SRead, SReadWait, SPop, SCheckEmpty, SFinish );
   signal state, nextState: TState;

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
        case state is
            when SInit =>
                nextState <= SPushAddress;
            when SPushAddress =>
                nextState <= SWrite;
            when SWrite => 
                nextState <= SWriteWait;
            when SWriteWait =>
                if I2C_Busy = '0' then 
                    nextState <= SRead;
                end if;
            when SRead =>
                nextState <= SReadWait;
            when SReadWait =>
                if I2C_Busy = '0' then 
                    nextState <= SPop;
                end if;
				when SPop => 
					nextState <= SCheckEmpty;
				when SCheckEmpty =>
					if I2C_FIFO_EMPTY = '0' then
						nextState <= SPop;
					else
						nextState <= SFinish;
					end if;
            when SFinish =>
                nextState	<= SFinish;
            when others => 
                nextState <= state;
        end case;
    end process;
        
    I2C_FIFO_DI <= X"0A"; -- when state = SPushAddress else X"00";
    I2C_FIFO_Push <= '1' when state = SPushAddress else '0';
    I2C_Go <= '1' when state = SWrite or state = SRead else '0';
    I2C_Address <= X"3C" when state = SWrite else
                   X"3D" when state = SRead else
                   X"00";
    I2C_ReadCnt <= X"1"; -- when state = SRead else X"0";
	 I2C_FIFO_POP <= '1' when state = SPop else '0';

end Behavioral;
