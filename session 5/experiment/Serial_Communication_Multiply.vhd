----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:52:28 02/12/2024 
-- Design Name: 
-- Module Name:    Serial_Communication_Multiply - Behavioral 
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

entity Serial_Communication_Multiply is
	port( GCLK : in std_logic;
			TX : out std_logic;
			DIP : in std_logic_vector (7 downto 0));
end Serial_Communication_Multiply;

architecture Behavioral of Serial_Communication_Multiply is
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
		variable counter : integer range  0 to 1000000:= 0 ;
		variable A : std_logic_vector(3 downto 0);
		variable B : std_logic_vector(3 downto 0);
		variable A_Integer :integer range 0 to 9;
		variable B_Integer :integer range 0 to 9;
		variable C1 :integer range 0 to 60;
		variable C2 :integer range 0 to 60;
		variable Yekan : std_logic_vector(7 downto 0);
		variable Dahgan : std_logic_vector(7 downto 0);
		
		
		variable C :integer range 0 to 81;	
 
		begin
		A := DIP(7 downto 4); 
		B := DIP(3 downto 0);
		
		A_integer := to_integer(unsigned(A));
    
		B_integer := to_integer(unsigned(B));
		
		C := A_Integer * B_Integer;
		if (c > 79) then
			C2 := 8;
			C1 := C - 80;
		elsif(c > 69) then
			c2 := 7;
			C1 := C - 70;
		elsif(c > 59) then
			c2 := 6;
			C1 := C - 60;
		elsif(c > 49) then
			c2 := 5;
			C1 := C - 50;
		elsif(c > 39) then
			c2 := 4;
			C1 := C - 40;
		elsif(c > 29) then
			c2 := 3;
			C1 := C - 30;
		elsif(c > 19) then
			c2 := 2;
			C1 := C - 20;
		elsif(c > 9) then
			c2 := 1;
			C1 := C - 10;
		else
			C2 := 0;
			C1 := C;
		end if;
		C1 := C1 + 48;
		C2 := C2 + 48;
		
		Yekan := std_logic_vector(to_unsigned(C1, 8));
		Dahgan := std_logic_vector(to_unsigned(C2, 8));
			
		if (rising_edge(CLCK)) then
			case counter is
				when 0 => --start
					TX <= '0';
					counter := 1;
				when 1 => 
					TX <= Dahgan(0);
					counter := 2;
				when 2 => 
					TX <= Dahgan(1);
					counter := 3;
				when 3 => 
					TX <= Dahgan(2);
					counter := 4;
				when 4 => 
					TX <= Dahgan(3);
					counter := 5;
				when 5 => 
					TX <= Dahgan(4);
					counter := 6;
				when 6 => 
					TX <= Dahgan(5);
					counter := 7;
				when 7 => 
					TX <= Dahgan(6);
					counter := 8;
				when 8 => 
					TX <= Dahgan(7);
					counter := 9;
				when 9 => --stop
					TX <= '0';
					counter := 10;
					
					
				when 10 => 
					TX <= '1';
					counter := 11;
				when 11 => --start
					TX <= '0';
					counter := 12;
				when 12 => 
					TX <= Yekan(0);
					counter := 13;
				when 13 => 
					TX <= Yekan(1);
					counter := 14;
				when 14 => 
					TX <= Yekan(2);
					counter := 15;
				when 15 => 
					TX <= Yekan(3);
					counter := 16;
				when 16 => 
					TX <= Yekan(4);
					counter := 17;
				when 17 => 
					TX <= Yekan(5);
					counter := 18;
				when 18 => 
					TX <= Yekan(6);
					counter := 19;
				when 19 => 
					TX <= Yekan(7);
					counter := 20;
				when 20 => --stop
					TX <= '0';
					counter := 21;
				when 21 => 
					TX <= '1';
					counter := 22;
					
				when 22 => --start Enter
					TX <= '0';
					counter := 23;
				when 23 => 
					TX <= '0';
					counter := 24;
				when 24 => 
					TX <= '1';
					counter := 25;
				when 25 => 
					TX <= '0';
					counter := 26;
				when 26 => 
					TX <= '1';
					counter := 27;
				when 27 => 
					TX <= '0';
					counter := 28;
				when 28 => 
					TX <= '0';
					counter := 29;
				when 29 => 
					TX <= '0';
					counter := 30;
				when 30 => 
					TX <= '0';
					counter := 31;
				when 31 => --stop
					TX <= '0';
					counter := 32;
				when 32 => 
					TX <= '1';
					counter := 33;
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

