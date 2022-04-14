library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;



entity lab15_p5 is
    Port ( 
        sw : in STD_LOGIC_VECTOR (2 downto 0);
        led : out STD_LOGIC_VECTOR (5 downto 0)
    );
end lab15_p5;

architecture Behavioral of lab15_p5 is
    signal A, B, C, Y, F, G : STD_LOGIC;
    component lab15_p4a
        Port ( a_A, a_B, a_C : in STD_LOGIC;
               a_Y : out STD_LOGIC);        
    end component;
    component lab15_p4b is
        Port ( b_A, b_B, b_C : in STD_LOGIC;
               b_F : out STD_LOGIC);
    end component;
    component lab15_p4c is
        Port ( c_A, c_B, c_C : in STD_LOGIC;
               c_G : out STD_LOGIC);
    end component;

begin
    A <= sw(0);
    B <= sw(1);
    C <= sw(2);
    lab15_p4a1:  lab15_p4a port map (a_A => A, a_B => B, a_C => C, a_Y => Y);
    lab15_p4b1:  lab15_p4b port map (b_A => A, b_B => B, b_C => C, b_F => F);
    lab15_p4c1:  lab15_p4c port map (c_A => A, c_B => c_B, c_C => C, c_G => G);
    led(0) <= A;
    led(1) <= B;
    led(2) <= C;
    led(3) <= Y;
    led(4) <= F;
    led(5) <= G;
   
end Behavioral;

Now for the lower level design modules referenced in the top level module.


----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/06/2016 04:36:40 PM
-- Design Name: 
-- Module Name: lab_14a - Behavioral
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

entity lab15_p4a is
    Port ( a_A, a_B, a_C : in STD_LOGIC;
           a_Y : out STD_LOGIC);
end lab15_p4a;

architecture Behavioral of lab15_p4a is
begin
    a_Y <= ((not a_A) and a_C) or (a_A and (not a_B) and (not a_C));
end Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/06/2016 07:34:59 PM
-- Design Name: 
-- Module Name: lab15_p4b - Behavioral
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

entity lab15_p4b is
    Port ( b_A : in STD_LOGIC;
           b_B : in STD_LOGIC;
           b_C : in STD_LOGIC;
           b_F : out STD_LOGIC);
end lab15_p4b;

architecture Behavioral of lab15_p4b is
begin
    b_F <= (b_B or (not b_C)) or (b_A and (not b_B) and b_C) or ((not b_A) and (not b_C));
end Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/06/2016 07:34:59 PM
-- Design Name: 
-- Module Name: lab15_p4c - Behavioral
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

entity lab15_p4c is
    Port ( c_A, c_B, c_C : in STD_LOGIC; 
           c_G : out STD_LOGIC);
end lab15_p4c;

architecture Behavioral of lab15_p4c is
begin
    c_G <= (c_A or c_B or c_C) and ((not c_A) or (not c_C)) and ((not c_B) or (not c_C));
end Behavioral;