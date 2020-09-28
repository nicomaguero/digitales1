--Multiplexor 2x1 vectores Digitales 
--
--Fecha 28/9/20

library IEEE;
use IEEE.std_logic_1164.all;

entity 	mux_2x1_Nvec is
	generic(N: natural);
	port(
		A: in std_logic_vector(N-1 downto 0);
		B: in std_logic_vector(N-1 downto 0);
		S: in std_logic;
		Y: out std_logic_vector(N-1 downto 0)
	);
end;

architecture mux_2x1_Nvec_arq of mux_2x1_Nvec is
	
	component mux_2x1 is
		port(
			A: in std_logic;
			B: in std_logic;
			S: in std_logic;
			Y: out std_logic
		);	
	end component;
	
	signal A_aux: std_logic_vector(N-1 downto 0);
	signal B_aux: std_logic_vector(N-1 downto 0);
	signal S_aux: std_logic;
	signal Y_aux: std_logic_vector(N-1 downto 0);
	
begin
	
	A_aux <= A;
	B_aux <= B;
	S_aux <= S;
	Y <= Y_aux; --Cargo Y_aux con la salida Y

	nn: for i in 0 to N-1 generate
    mux_2x1_inst : mux_2x1 port map(
					A => A_aux(i),
					B => B_aux(i),
					S => S_aux,
					Y => Y_aux(i)
				);	 
	end generate;

end;