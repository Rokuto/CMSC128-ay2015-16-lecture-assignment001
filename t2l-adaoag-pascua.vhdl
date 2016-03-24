-- Behavioral
library IEEE;
use IEEE.std_logic_1164.all;

entity t2l_adaoag_pascua is
	port( in_boggis, in_bunce, in_bean, out_boggis, out_bunce, out_bean : in std_logic; alarm: out std_logic );
end t2l_adaoag_pascua;

architecture buzzer of t2l_adaoag_pascua is
	begin
		alarm <= ( in_boggis or in_bunce or in_bean ) and ( out_boggis or out_bunce or out_bean );
end architecture buzzer; 


