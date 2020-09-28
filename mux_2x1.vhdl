--Multiplexor 2x1 Digitales 
--
--Fecha 28/9/20

library IEEE;
use IEEE.std_logic_1164.all;

entity 	mux_2x1 is
	port(
		A: in std_logic;
		B: in std_logic;
		S: in std_logic;
		Y: out std_logic
	);
end;

architecture mux_2x1_arq of mux_2x1 is
	
	signal A_aux: std_logic;
	signal B_aux: std_logic;
	signal S_aux: std_logic;
	signal Y_aux: std_logic;
	
begin
	
	
	A_aux <= A;
	B_aux <= B;
	S_aux <= S;
	
	Y <= (
		(A_aux and not(S_aux)) or
		(B_aux and S_aux) or
		(A_aux and B_aux)
	);

end;