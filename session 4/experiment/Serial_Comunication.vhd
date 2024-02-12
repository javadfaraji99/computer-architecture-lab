----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:22:27 02/12/2024 
-- Design Name: 
-- Module Name:    Serial_Comunication - Behavioral 
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Serial_Comunication is
	port( GCLK : in std_logic;
			TX : out std_logic;
			DIP : in std_logic_vector (7 downto 0));
end Serial_Comunication;


architecture Behavioral of Serial_Comunication is
	signal CLCK : std_logic;

begin
	process (GCLK)
		variable counter : integer range 0 to 200 := 0;
		
		begin
			if (rising_edge(GCLK)) then
				if counter < 175 then
					counter := counter + 1;
				else
					counter := 0;
					CLCK <= not CLCK;
				end if;
			end if;
	end process;
	
	process(CLCK)
		variable counter : integer range  0 to 80000 := 0;
		
		begin
		if (rising_edge(CLCK)) then
			case counter is
				when 0 =>
					TX <= '0';
					counter := 1;
				when 1 => 
					TX <= DIP(0);
					counter := 2;
				when 2 => 
					TX <= DIP(1);
					counter := 3;
				when 3 => 
					TX <= DIP(2);
					counter := 4;
				when 4 => 
					TX <= DIP(3);
					counter := 5;
				when 5 => 
					TX <= DIP(4);
					counter := 6;
				when 6 => 
					TX <= DIP(5);
					counter := 7;
				when 7 => 
					TX <= DIP(6);
					counter := 8;
				when 8 => 
					TX <= DIP(7);
					counter := 9;
				when 9 => 
					TX <= '0';
					counter := 10;
				when 80000 => 
					TX <= '1';
					counter := 0;
				when others =>
					TX <= '1';				
					counter := counter + 1;
					
			end case;
			end if ;
			
	end process;
end Behavioral;
