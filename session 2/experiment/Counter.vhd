----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:00:34 02/12/2024 
-- Design Name: 
-- Module Name:    Counter - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Counter is
	port( gclk : in std_logic;
				seg_sel : out std_logic_vector (4 downto 0);
				seg_data : out std_logic_vector (6 downto 0));
end Counter;

architecture Behavioral of Counter is
		signal CLK10MS, TIMER1S: std_logic;
		signal seg_data_reg1,seg_data_reg2,seg_data_reg3,seg_data_reg4: std_logic_vector(6 downto 0);
		signal counterseg1sig,counterseg2sig,counterseg3sig,counterseg4sig : std_logic_vector(3 downto 0);
begin
	process(GCLK)
		variable count_div : integer range 0 to 100000 := 0;

		begin
			if (rising_edge(GCLK)) then
				if count_div < 80000 then 
					count_div := count_div + 1;
				else 
					count_div := 0;
					CLK10MS <= not CLK10MS;
				end if;
			end if;
	end process;


	process(GCLK)
		variable count_div : integer range 0 to 10000000 := 0;
		variable counterseg1,counterseg2,counterseg3,counterseg4 : std_logic_vector(3 downto 0);

		begin
			if (rising_edge(GCLK)) then
				if count_div < 8000000 then 
					count_div := count_div + 1;
				else 
					count_div := 0;
					TIMER1S <= not TIMER1S;
					if (counterseg1 < "1001") then
						counterseg1 := counterseg1 + 1;
					else
						counterseg1 := "0000";
							if (counterseg2 < "1001") then
								counterseg2 := counterseg2 + 1;
							else
								counterseg2 := "0000";
								if (counterseg3 < "1001") then
									counterseg3 := counterseg3 + 1;
								else
									counterseg3 := "0000";
									if (counterseg4 < "1001") then
										counterseg4 := counterseg4 + 1;
									else
										counterseg4 := "0000";
									end if;
								end if;
							end if;
						end if;
						
				end if;
				
				counterseg1sig <= counterseg1;
				counterseg2sig <= counterseg2;
				counterseg3sig <= counterseg3;
				counterseg4sig <= counterseg4;
				
			end if;
	end process;

	process(CLK10MS)
		variable RefreshSEG : integer range 0 to 4 := 0;
		begin
			if(rising_edge(CLK10MS)) then
				if RefreshSEG < 4 then
					RefreshSEG := RefreshSEG + 1;
				else
					RefreshSEG := 0;
				end if;
				case RefreshSEG is
					when 0 =>
						SEG_SEL(4) <='0';
						SEG_SEL(0) <='1';
						SEG_DATA <= SEG_DATA_reg1;
					when 1 =>
						SEG_SEL(0) <='0';
						SEG_SEL(1) <='1';
						SEG_DATA <= SEG_DATA_reg2;
					when 2 =>
						SEG_SEL(1) <='0';
						SEG_SEL(2) <='1';
						SEG_DATA <= SEG_DATA_reg3;
					when 3 =>
						SEG_SEL(2) <='0';
						SEG_SEL(3) <='1';
						SEG_DATA <= SEG_DATA_reg4;
					when 4 =>
						SEG_SEL(3) <='0';
						SEG_SEL(4) <='1';
						SEG_DATA <= "0000000";
					when others => null;
				end case;
			end if;
	end process;
		

	with counterseg1sig select
		seg_data_reg1 <= "0111111" when "0000",
		"0000110" when "0001",
		"1011011" when "0010",
		"1001111" when "0011",
		"1100110" when "0100",
		"1101101" when "0101",
		"1111101" when "0110",
		"0000111" when "0111",
		"1111111" when "1000",
		"1101111" when "1001",
		"0000000" when others;
		
	

	with counterseg2sig select
		seg_data_reg2 <= "0111111" when "0000",
		"0000110" when "0001",
		"1011011" when "0010",
		"1001111" when "0011",
		"1100110" when "0100",
		"1101101" when "0101",
		"1111101" when "0110",
		"0000111" when "0111",
		"1111111" when "1000",
		"1101111" when "1001",
		"0000000" when others;
		
	
	with counterseg3sig select
		seg_data_reg3 <= "0111111" when "0000",
		"0000110" when "0001",
		"1011011" when "0010",
		"1001111" when "0011",
		"1100110" when "0100",
		"1101101" when "0101",
		"1111101" when "0110",
		"0000111" when "0111",
		"1111111" when "1000",
		"1101111" when "1001",
		"0000000" when others;
		
	
	with counterseg4sig select
		seg_data_reg4 <= "0111111" when "0000",
		"0000110" when "0001",
		"1011011" when "0010",
		"1001111" when "0011",
		"1100110" when "0100",
		"1101101" when "0101",
		"1111101" when "0110",
		"0000111" when "0111",
		"1111111" when "1000",
		"1101111" when "1001",
		"0000000" when others;

end Behavioral;

