--Contador N-bits Digitales 
--
--Fecha 14/9/20
library IEEE;
use IEEE.std_logic_1164.all;

entity cont_Nbits is
	generic(N: natural); --Variable natural generica, el valor lo determino de manera externa
	port(
		clk: in std_logic;                      --Defino los puertos del bloque, entradas y salidas
		rst: in std_logic;				    	--Variable del standard IEEE, "0" o "1"
		ena: in std_logic;
		Q: out std_logic_vector(N-1 downto 0)   --Salida tipo vector 
	);

end;

architecture cont_Nbits_arq of cont_Nbits is  				--Defino la arquitectura dentro de la entidad 

	signal d_aux: std_logic_vector(N-1 downto 0);           --Defino variable tipo señal, para conexiones internas
	signal q_aux: std_logic_vector(N-1 downto 0);
	signal and_aux: std_logic_vector(N downto 0);

	component ffd is									--Se declara el componete a utilizar (Subsistema)
		port(
			clk: in std_logic;
			arst: in std_logic;
			srst: in std_logic;
			ena: in std_logic;
			D: in std_logic;	
			Q: out std_logic
		);
	end component;
	

	begin      								--Comienzan las sentencias

	and_aux(0) <= '1';						
	gg: for i in 0 to N-1 generate			--creo un for para formar un array de interconexiones 
    ffd_cont : ffd port map(				--mapeo de los puertos ffd component con las señales internas y las entradas del bloque 
					clk => clk,
					arst => '0',
					srst => rst,
					ena => ena,
					D => d_aux(i),
					Q => q_aux(i)				
				);	 
	d_aux(i) <= and_aux(i) xor q_aux(i);
	and_aux(i+1) <= q_aux(i) and and_aux(i);
	end generate;
	Q <= q_aux;								--Asigno a la salida del bloque los valores obtenidos por el for de cada ffd
	
end;
