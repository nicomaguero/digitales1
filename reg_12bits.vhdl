--Registro 
--
--Fecha 26/9/20
library IEEE;
use IEEE.std_logic_1164.all;

entity reg_12bits is
	port(
		clk: in std_logic;
		rst: in std_logic;
		ena: in std_logic;
		D: in std_logic_vector(11 downto 0);	
		Q: out std_logic_vector(11 downto 0) 
	);
end; 

architecture reg_12bits_arq of reg_12bits is

	component ffd is
		port(
			clk: in std_logic;
			arst: in std_logic;
			srst: in std_logic;
			ena: in std_logic;
			D: in std_logic;	
			Q: out std_logic
		);
	end component;

begin

	ffd0: ffd
		port map(
			clk => clk,
			arst => '0',
			srst => rst,
			ena => ena,
			D => D(0),
			Q => Q(0)
		);
	ffd1: ffd
		port map(
			clk => clk,
			arst => '0',
			srst => rst,
			ena => ena,
			D => D(1),
			Q => Q(1)
		);
	ffd2: ffd
		port map(
			clk => clk,
			arst => '0',
			srst => rst,
			ena => ena,
			D => D(2),
			Q => Q(2)
		);
	ffd3: ffd
		port map(
			clk => clk,
			arst => '0',
			srst => rst,
			ena => ena,
			D => D(3),
			Q => Q(3)
		);
	ffd4: ffd
		port map(
			clk => clk,
			arst => '0',
			srst => rst,
			ena => ena,
			D => D(4),
			Q => Q(4)
		);
	ffd5: ffd
		port map(
			clk => clk,
			arst => '0',
			srst => rst,
			ena => ena,
			D => D(5),
			Q => Q(5)
		);
	ffd6: ffd
		port map(
			clk => clk,
			arst => '0',
			srst => rst,
			ena => ena,
			D => D(6),
			Q => Q(6)
		);
	ffd7: ffd
		port map(
			clk => clk,
			arst => '0',
			srst => rst,
			ena => ena,
			D => D(7),
			Q => Q(7)
		);
	ffd8: ffd
		port map(
			clk => clk,
			arst => '0',
			srst => rst,
			ena => ena,
			D => D(8),
			Q => Q(8)
		);
	ffd9: ffd
		port map(
			clk => clk,
			arst => '0',
			srst => rst,
			ena => ena,
			D => D(9),
			Q => Q(9)
		);
	ffd10: ffd
		port map(
			clk => clk,
			arst => '0',
			srst => rst,
			ena => ena,
			D => D(10),
			Q => Q(10)
		);
	ffd11: ffd
		port map(
			clk => clk,
			arst => '0',
			srst => rst,
			ena => ena,
			D => D(11),
			Q => Q(11)
		);
end;