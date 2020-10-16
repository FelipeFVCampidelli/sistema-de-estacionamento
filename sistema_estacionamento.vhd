library ieee;
use ieee.std_logic_1164.all;
use work.comparador_package.all;
use work.contador_package.all;

entity sistema_estacionamento is
    port ( clk, reset : in std_logic;
			  sensor1, sensor2, check_ticket1, check_ticket2 : in std_logic;
           placa_read1, placa_read2, ticket_code1 : in std_logic_vector(15 downto 0);
           open_gate : out std_logic;
			  vagas_disponiveis : out std_logic_vector(3 downto 0);
           ticket_code2, mensagem : out std_logic_vector(15 downto 0)
        );
end sistema_estacionamento;

architecture RTL OF sistema_estacionamento is
	type FSM_States is (IDLE, WARNING, _WAIT, WAIT_PRINT_TICKET, WAIT_TICKET, 
						CHECK_TICKET, TICKET_NOK, _OPEN);
	signal current_state,next_state: FSM_States;
	signal counter_wait: std_logic_vector(31 downto 0);
begin

-- Sequential circuits
process(clk,reset_n)
begin
	 if(reset_n='0') then
		current_state <= IDLE;
	 elsif(rising_edge(clk)) then
		current_state <= next_state;
	 end if;
end process;

-- Combinational logic
process(current_state, sensor1, sensor2, placa_read1, placa_read2, counter_wait)
end RTL;