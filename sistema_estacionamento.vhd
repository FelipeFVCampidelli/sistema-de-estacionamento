library ieee;
use ieee.std_logic_1164.all;
use work.comparador_package.all;
use work.contador_package.all;

entity sistema_estacionamento is
    port ( sensor1, sensor2, check_ticket1, check_ticket2 : in std_logic;
           placa_read1, placa_read2, ticket_code1 : in std_logic_vector(15 downto 0);
           open_gate : out std_logic;
			  vagas_disponiveis : out std_logic_vector(3 downto 0);
           ticket_code2, mensagem : out std_logic_vector(15 downto 0);
        );
end sistema_estacionamento;

architecture RTL OF sistema_estacionamento is

begin

end RTL;