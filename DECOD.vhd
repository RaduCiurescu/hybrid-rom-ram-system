----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/23/2025 11:41:02 AM
-- Design Name: 
-- Module Name: DECOD - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DECOD is
   port (data_in_dec : in std_logic_vector (1 downto 0);
         data_out_dec : out std_logic_vector (3 downto 0));
                
end DECOD;

architecture Behavioral of DECOD is

begin
data_out_dec <= "0001" when data_in_dec = "00" else
                "0010" when data_in_dec = "01" else
                "0100" when data_in_dec = "10" else
                "1000" when data_in_dec = "11" else
            "0000";

end Behavioral;
