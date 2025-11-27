----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/23/2025 10:30:54 AM
-- Design Name: 
-- Module Name: lab4 - Behavioral
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
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RAM1 is
    port    (clock : in std_logic;
             EN : in std_logic;
             address : in std_logic_vector(5 downto 0);
             data_in : in std_logic_vector (7 downto 0);
             WE : in std_logic;
             data_out : out std_logic_vector(7 downto 0));
end RAM1;

architecture Behavioral of RAM1 is
    type RW_type is array (0 to 63) of std_logic_vector (7 downto 0);
    signal RW : RW_type;
   begin

    MEMORY : process (clock)
        begin
        if(en='1') then
            if (clock'event and clock='1') then
                if (WE = '1') then
                    RW (to_integer(unsigned(address))) <= data_in;
                 else
                    data_out <= RW (to_integer(unsigned (address)));
                 end if;
           --     data_out<= ROM(to_integer(unsigned(address)));
            end if;
            elsif (en='0') then
                        data_out<="ZZZZZZZZ";
             end if;
       end process;
end Behavioral;
