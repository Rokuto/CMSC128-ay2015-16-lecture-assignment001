library IEEE; 
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity st8l_adaoag_pascua_tb is

end entity st8l_adaoag_pascua_tb;

architecture st8l_adaoag_pascua_tb of st8l_adaoag_pascua_tb is
     signal in_boggis, in_bunce, in_bean, out_boggis, out_bunce, out_bean, alarm : std_logic;
     
     component st8l_adaoag_pascua is
          port ( in_boggis, in_bunce, in_bean, out_boggis, out_bunce, out_bean : in std_logic; alarm : out std_logic);
     end component st8l_adaoag_pascua;

begin
     uut: component st8l_adaoag_pascua port map(in_boggis, in_bunce, in_bean, out_boggis, out_bunce, out_bean, alarm);

process
     variable error_count: integer := 0;
     variable test_in: unsigned(5 downto 0);
     variable output: std_logic;

begin
     test_in := B"000000";
     for count in 0 to 64 loop
          in_boggis <= test_in(5);
          in_bunce <= test_in(4);
          in_bean <= test_in(3);

          out_boggis <= test_in(2);
          out_bunce <= test_in(1);
          out_bean <= test_in(0);
          wait for 10 ns;
          output := ( in_boggis or in_bunce or in_bean ) and ( out_boggis or out_bunce or out_bean );
	     assert(output=alarm) report "Err" severity error;
          if( output/= alarm ) then 
               error_count := error_count+1;
          end if;
          test_in:=test_in+1;
     end loop;
     report "Done with the test. There were " & integer'image(error_count) & "errors";
     wait;
end process;
end architecture st8l_adaoag_pascua_tb;
