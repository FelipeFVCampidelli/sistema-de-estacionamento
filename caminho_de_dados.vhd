library ieee;
use ieee.std_logic_1164.all;
use work.comparador_package.all;
use work.contador_package.all;
use work.display_package.all;

entity caminho_de_dados is
	port( clk, reset : in std_logic;
			entrada, saida : in std_logic;
			placa1, placa2, codigo_ticket : in std_logic_vector(15 downto 0);
	      ticket_ok, lotado : out std_logic;
			display_vagas_ocupadas, codigo_ticket_impresso : out std_logic_vector(15 downto 0)
	    );
	
end caminho_de_dados;

architecture arch of caminho_de_dados is

	signal igual, maior, menor : std_logic_vector(1 downto 0);
	signal vagas_ocupadas : std_logic_vector(15 downto 0) := "0000000000000000";

	
begin

	codigo_ticket_impresso <= placa1;

	cont  : contador port map (clk, reset, entrada, saida, vagas_ocupadas(3 downto 0));
	lotado <= '1' when vagas_ocupadas(3 downto 0) = "1111"
					  else '0';
	comp1 : comparador port map (vagas_ocupadas, "0000000000001111", igual(0), maior(0), menor(0));
	comp2 : comparador port map (placa2, codigo_ticket, igual(1), maior(1), menor(1));
	ticket_ok <= '1' when igual(1) = '1'
					  else '0';
	disp  : display port map (clk, reset, vagas_ocupadas(3 downto 0), display_vagas_ocupadas);
	
	
end arch;