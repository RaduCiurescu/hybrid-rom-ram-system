----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/23/2025 11:29:01 AM
-- Design Name: 
-- Module Name: CIRCUIT - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CIRCUIT is
    port( wr: in std_logic;
     signal CLK: std_logic;
          address: in std_logic_vector(7 downto 0);
          data_in : in std_logic_vector (7 downto 0);
          data_out : out std_logic_vector (7 downto 0));
end CIRCUIT;

architecture Behavioral of CIRCUIT is
component rom_128x8
port    (clock : in std_logic;
         en: in std_logic;
         address : in std_logic_vector(6 downto 0);
         data_out : out std_logic_vector(7 downto 0)); 
 end component;

component RAM1
port    (clock : in std_logic;
             en: in std_logic;
             address : in std_logic_vector(5 downto 0);
             data_in : in std_logic_vector (7 downto 0);
             WE : in std_logic;
             data_out : out std_logic_vector(7 downto 0));
    end component;
    
 component DECOD
       port (data_in_dec : in std_logic_vector (1 downto 0);
       data_out_dec: out std_logic_vector (3 downto 0));
 end component;
 
 signal ENA: std_logic_vector(3 downto 0);
 signal EN: std_logic;


begin

DECODER: DECOD port map( address(7 downto 6),ENA);
EN <= ENA(0) or ENA(1);

ROM:rom_128x8 port map(CLK,EN,address(6 downto 0),DATA_OUT);

RAM:RAM1 port map(CLK,ENA(2),address (5 downto 0), data_in,wr,DATA_OUT);

RAM2:RAM1 port map(CLK,ENA(3),address (5 downto 0), data_in,wr,DATA_OUT);

    

end Behavioral;
