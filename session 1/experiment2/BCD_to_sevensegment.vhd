----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:57:18 02/11/2024 
-- Design Name: 
-- Module Name:    BCD_to_sevensegment - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BCD_to_sevensegment is
	port(
		seg_btn : in std_logic_vector (3 downto 0); -- BCD number
		seg_data : out std_logic_vector (6 downto 0); -- 7segment number
		seg_sel : out bit -- selector
	);
end BCD_to_sevensegment;

architecture Behavioral of BCD_to_sevensegment is

begin

   process(seg_btn)
    begin
		  seg_sel <= '1';
        case seg_btn is
            when "0001" => seg_data <= "0000110";  -- Number 1
            when "0010" => seg_data <= "1011011";  -- Number 2
            when "0011" => seg_data <= "1001111";  -- Number 3
            when "0100" => seg_data <= "1100110";  -- Number 4
            when "0101" => seg_data <= "1101101";  -- Number 5
            when "0110" => seg_data <= "1111101";  -- Number 6
            when "0111" => seg_data <= "0000111";  -- Number 7
            when "1000" => seg_data <= "1111111";  -- Number 8
            when "1001" => seg_data <= "1101111";  -- Number 9
            when others => seg_data <= "0000000";  
        end case;
    end process;

end Behavioral;

 