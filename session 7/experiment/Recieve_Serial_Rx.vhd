----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:08:48 02/13/2024 
-- Design Name: 
-- Module Name:    Recieve_Serial_Rx - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Recieve_Serial_Rx is
	port( GCLK : in std_logic;
			RX : in std_logic;
			LED : out std_logic_vector (7 downto 0));
end Recieve_Serial_Rx;

architecture Behavioral of Recieve_Serial_Rx is
	signal CLCK : std_logic;
	signal started : std_logic := '0';
begin
	
	process (GCLK)
		variable counter : integer range 0 to 200 := 0;
		variable first_time : std_logic := '1';
		
		begin
			if (falling_edge(GCLK)) then
				if started = '1' then
					if first_time = '1' then
						if counter < 87 then
							counter := counter + 1;
						else
							counter := 0;
							first_time := '0';
							CLCK <= not CLCK;
						end if;
					elsif counter < 175 then
						counter := counter + 1;
					else
						counter := 0;
						CLCK <= not CLCK;
					end if;
				else
					first_time := '1';
				end if;
			end if;
	end process;
	
	process(CLCK,started,RX)
		variable counter: integer range 0 to 10 :=0 ; 
		begin
		if (RX = '0' and started = '0') then
			started <= '1';
		elsif (falling_edge(CLCK)) then
			case counter is
					when 0 =>
						counter := counter + 1;
						LED(0) <= RX;
					when 1 =>
						counter := counter + 1;
						LED(1) <= RX;
					when 2 =>
						counter := counter + 1;
						LED(2) <= RX;
					when 3 =>
						counter := counter + 1;
						LED(3) <= RX;
					when 4 =>
						counter := counter + 1;
						LED(4) <= RX;
					when 5 =>
						counter := counter + 1;
						LED(5) <= RX;
					when 6 =>
						counter := counter + 1;
						LED(6) <= RX;
					when 7 =>
						counter := counter + 1;
						LED(7) <= RX;
					when 8 =>
						counter := counter + 1;
						started <= '0';
					when others =>
						counter := 0;
						started <= '0';
				end case;
		end if;
	end process;

end Behavioral;

