--Multiplexor 8x1 vectores Digitales 
--
--Fecha 28/9/20

library IEEE;
use IEEE.std_logic_1164.all;

entity 	mux_8x1_Nvec is
	generic(N: natural);
	port(
		I0: in std_logic_vector(N-1 downto 0);
		I1: in std_logic_vector(N-1 downto 0);
		I2: in std_logic_vector(N-1 downto 0);
		I3: in std_logic_vector(N-1 downto 0);
		I4: in std_logic_vector(N-1 downto 0);
		I5: in std_logic_vector(N-1 downto 0);
		I6: in std_logic_vector(N-1 downto 0);
		I7: in std_logic_vector(N-1 downto 0);
		S: in std_logic_vector(2 downto 0);
		Y: out std_logic_vector(N-1 downto 0)
	);
end;

architecture mux_8x1_Nvec_arq of mux_8x1_Nvec is
	
	component mux_2x1_Nvec is
		generic(N: natural);
		port(
			A: in std_logic_vector(N-1 downto 0);
			B: in std_logic_vector(N-1 downto 0);
			S: in std_logic;
			Y: out std_logic_vector(N-1 downto 0)
		);
	end component;
	
	constant N_t: natural := 6; --6 entradas 
	signal y0_aux: std_logic_vector(N-1 downto 0);
	signal y1_aux: std_logic_vector(N-1 downto 0);
	signal y2_aux: std_logic_vector(N-1 downto 0);
	signal y3_aux: std_logic_vector(N-1 downto 0);
	signal y4_aux: std_logic_vector(N-1 downto 0);
	signal y5_aux: std_logic_vector(N-1 downto 0);
	signal Y_aux: std_logic_vector(N-1 downto 0);
	signal S0_aux: std_logic;
	signal S1_aux: std_logic;
	signal S2_aux: std_logic;
	signal I0_aux: std_logic_vector(N-1 downto 0);
	signal I1_aux: std_logic_vector(N-1 downto 0);
	signal I2_aux: std_logic_vector(N-1 downto 0);
	signal I3_aux: std_logic_vector(N-1 downto 0);
	signal I4_aux: std_logic_vector(N-1 downto 0);
	signal I5_aux: std_logic_vector(N-1 downto 0);
	signal I6_aux: std_logic_vector(N-1 downto 0);
	signal I7_aux: std_logic_vector(N-1 downto 0);
	signal etapa3_aux: std_logic;
	
	
begin
	
	S0_aux <= S(0);
	S1_aux <= S(1);
	S2_aux <= S(2);
	
	I0_aux <= I0;
	I1_aux <= I1;
	I2_aux <= I2;
	I3_aux <= I3;
	I4_aux <= I4;
	I5_aux <= I5;
	I6_aux <= I6;
	I7_aux <= I7;
	
	Y <= Y_aux;
	
	-- Primera Etapa
	mux0: mux_2x1_Nvec
		generic map(N => N_t)
		port map(
			A => I0_aux,
			B => I1_aux,
			S => S0_aux,
			Y => y0_aux
		);
	
	mux1: mux_2x1_Nvec
		generic map(N => N_t)
		port map(
			A => I2_aux,
			B => I3_aux,
			S => S0_aux,
			Y => y1_aux
		);
	
	mux2: mux_2x1_Nvec
		generic map(N => N_t)
		port map(
			A => I4_aux,
			B => I5_aux,
			S => S0_aux,
			Y => y2_aux
		);
	
	mux3: mux_2x1_Nvec
		generic map(N => N_t)
		port map(
			A => I6_aux,
			B => I7_aux,
			S => S0_aux,
			Y => y3_aux
		);
		
	-- Segunda Etapa
	mux4: mux_2x1_Nvec
		generic map(N => N_t)
		port map(
			A => y0_aux,
			B => y1_aux,
			S => S1_aux,
			Y => y4_aux
		);

	mux5: mux_2x1_Nvec
		generic map(N => N_t)
		port map(
			A => y2_aux,
			B => y3_aux,
			S => S1_aux,
			Y => y5_aux
		);	
	
	-- Tercera Etapa
	mux6: mux_2x1_Nvec
		generic map(N => N_t)
		port map(
			A => y4_aux,
			B => y5_aux,
			S => S2_aux,
			Y => Y_aux
		);
	
end;