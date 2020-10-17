library ieee;
use ieee.std_logic_1164.all;
use work.comparador_package.all;
use work.contador_package.all;

entity sistema_estacionamento is
    port ( clk, reset : in std_logic;
			  sensor1, sensor2, check_ticket1, check_ticket2 : in std_logic;
           placa_read1, placa_read2, ticket_code1 : in std_logic_vector(15 downto 0);
           open_gat : out std_logic;
			  vagas_disponiveis : out std_logic_vector(3 downto 0);
           ticket_code2, mensagem : out std_logic_vector(15 downto 0)
        );
end sistema_estacionamento;

architecture RTL OF sistema_estacionamento is
	type FSM_States is (IDLE, WARNING, AWAIT, WAIT_PRINT_TICKET, WAIT_TICKET, 
						CHECK_TICKET, TICKET_NOK, OPEN_GATE);
	signal current_state,next_state: FSM_States;
	signal counter_wait: std_logic_vector(31 downto 0);
begin

-- Sequential circuits
process(clk,reset)
begin
	 if(reset='0') then
		current_state <= IDLE;
	 elsif(rising_edge(clk)) then
		current_state <= next_state;
	 end if;
end process;

-- Combinational logic
process(current_state, sensor1, sensor2, placa_read1, placa_read2, counter_wait)
begin
	case current_state is 
		when IDLE =>
			if(sensor1 = '1') then
				next_state <= WAIT_PRINT_TICKET;
			elsif(sensor2 = '1') then
				next_state <= WAIT_TICKET;
			elsif(sensor1 = '1' and sensor2 = '1') then
				next_state <= WARNING;
			else
				next_state <= IDLE;
			end if;
		
		when WARNING =>
			if(sensor1 = '0' or sensor2 = '0') then
				next_state <= IDLE;
			else
				next_state <= WARNING;
			end if;
		
		when AWAIT =>
			if(sensor1 = '0' and sensor2 = '0') then
				next_state <= IDLE;
			else
				next_state <= AWAIT;
			end if;
		
		when WAIT_PRINT_TICKET =>
			if(check_ticket1 = '0') then --condição correta???
				next_state <= OPEN_GATE;
			else
				next_state <= WAIT_PRINT_TICKET;
			end if;
		
		when WAIT_TICKET =>
			if(sensor2 = '0') then --condição correta???
				next_state <= IDLE;
			elsif(check_ticket1 = '0') then --condição correta???
				next_state <= CHECK_TICKET;
			else
				next_state <= WAIT_TICKET;
			end if;
		
		when CHECK_TICKET =>
			if(check_ticket1 = '1') then --condição correta???
				next_state <= OPEN_GATE;
			elsif(check_ticket1 = '0') then --condição correta???
				next_state <= TICKET_NOK;
			else
				next_state <= CHECK_TICKET;
			end if;
		
		when TICKET_NOK =>
			if(sensor2 = '0') then --condição correta???
				next_state <= WAIT_TICKET;
			else
				next_state <= TICKET_NOK;
			end if;
		
		when OPEN_GATE =>
			if(sensor1 = '1' or sensor2 = '1') then
				next_state <= AWAIT;
			else
				next_state <= OPEN_GATE;
			end if;
	end case;
end process;
end RTL;