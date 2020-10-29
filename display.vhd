library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity display is
    port (
        clk           : in  std_logic;
        rst           : in  std_logic;
        visor         : in  std_logic_vector(3 downto 0);
        LED           : out std_logic_vector(15 downto 0)
    );
end display;

architecture arch of display is
    
begin
    p : process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then 
                LED <= (others => '0');
            else
					 LED(15 downto 14) <= "00";
					 LED(13 downto 7) <= "0000001";
                case to_integer(unsigned(visor)) is
                    when 1   => LED(6 downto 0)  <= "1001111";          --display 1 led verde
                    when 2   => LED(6 downto 0)  <= "0010010";          --display 2 led verde
                    when 3   => LED(6 downto 0)  <= "0000110";          --display 3 led verde
                    when 4   => LED(6 downto 0)  <= "1001100";          --display 4 led verde
                    when 5   => LED(6 downto 0)  <= "0100100";          --display 5 led verde
                    when 6   => LED(6 downto 0)  <= "0100000";          --display 6 led verde
                    when 7   => LED(6 downto 0)  <= "0001111";          --display 7 led verde
                    when 8   => LED(6 downto 0)  <= "0000000";          --display 8 led verde
                    when 9   => LED(6 downto 0)  <= "0000100";          --display 9 led verde
						  when 10  => LED(13 downto 0) <= "10011110000001";   --display 10 led verde  
                    when 11  => LED(13 downto 0) <= "10011111001111";   --display 11 led verde
                    when 12  => LED(13 downto 0) <= "10011110010010";   --display 12 led verde
                    when 13  => LED(14 downto 0) <= "110011110000110";  --display 13 led verde
                    when 14  => LED(14 downto 0) <= "110011111001100";  --display 14 led amarelo
                    when 15  => LED(15 downto 0) <= "1110011110100100"; --display 15 led vermelho
						  when others => LED <= "0000000010000001";           --display 0 led verde
                end case;
            end if;
        end if;
    end process;
end arch;

