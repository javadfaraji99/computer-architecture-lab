----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:27:20 02/13/2024 
-- Design Name: 
-- Module Name:    Light_Config - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Light_Config is
	port( GCLK : in std_logic;
			RX : in std_logic;
			LED : out std_logic_vector (7 downto 0));
end Light_Config;

architecture Behavioral of Light_Config is
	signal CLCK : std_logic;
	signal started : std_logic := '0';
	signal density1: std_logic_vector(7 downto 0);
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
		variable density: std_logic_vector(7 downto 0);
		begin
		if (RX = '0' and started = '0') then
			started <= '1';
		elsif (falling_edge(CLCK)) then
			case counter is
					when 0 =>
						counter := counter + 1;
						density(0) := RX;
					when 1 =>
						counter := counter + 1;
						density(1) := RX;
					when 2 =>
						counter := counter + 1;
						density(2) := RX;
					when 3 =>
						counter := counter + 1;
						density(3) := RX;
					when 4 =>
						counter := counter + 1;
						density(4) := RX;
					when 5 =>
						counter := counter + 1;
						density(5) := RX;
					when 6 =>
						counter := counter + 1;
						density(6) := RX;
					when 7 =>
						counter := counter + 1;
						density(7) := RX;
					when 8 =>
						counter := counter + 1;
						started <= '0';
					when others =>
						counter := 0;
						started <= '0';
				end case;
		end if;
		
		density1 <= density;

			
	end process;
	
	process(GCLK)
	variable duty: std_logic_vector(7 downto 0) := "00000000";
	begin	
		if (falling_edge(GCLK))	then
			if (density1 > duty) then
				duty := duty + '1';
				LED <= "11111111";
			elsif (duty < "1111111") then
				LED <= "00000000";
				duty := duty + '1';
			else
				duty := "00000000";
				LED <= "00000000";
			end if;
		end if;
		
	end process;					
end Behavioral;

