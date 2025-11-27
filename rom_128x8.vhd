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
-- Description: a
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

entity rom_128x8 is
    port    (clock : in std_logic;
             en: in std_logic;
             address : in std_logic_vector(6 downto 0);
             data_out : out std_logic_vector(7 downto 0)); 
             
end rom_128x8;

architecture Behavioral of rom_128x8 is
    type ROM_type is array (0 to 127) of std_logic_vector (7 downto 0);
    constant ROM : ROM_type  := (0 => x"15", others => x"00");
begin

    MEMORY : process (clock)
        begin
            if (rising_edge(clock) and en ='1') then
                data_out<= ROM(to_integer(unsigned(address)));
            elsif (en='0') then
            data_out<="ZZZZZZZZ";
            end if;
            
       end process;
end Behavioral;
