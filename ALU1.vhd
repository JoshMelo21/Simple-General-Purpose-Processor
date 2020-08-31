library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.std_logic_unsigned.All;
use IEEE.numeric_std.ALL;
entity ALU1 is
port (
A,B:in unsigned(7 downto 0);
student_id:in unsigned(3 downto 0);
OP :in unsigned(15 downto 0);
Neg:out std_logic;
YorN: out unsigned(6 downto 0);
R1 :out unsigned(3 downto 0);
R2:out unsigned(3 downto 0));
end ALU1;
architecture calculation of ALU1 is
signal REG1,REG2,Result: unsigned(7 downto 0):=(others => '0');
begin
REG1 <= A;
REG2<= B;
process(OP)
begin
case OP is
WHEN "0000000000000001"=>
Neg<= '0';
Result <= REG1 + REG2;

WHEN "0000000000000010"=>
if(REG1>REG2) then
Neg<= '0';
Result <=  REG1 + ((not REG2)+1);
end if;
if REG2>REG1 then
Result <= not(REG1 + ((not REG2)+1)) + "00000001";
Neg <= '1';
end if;

WHEN "0000000000000100"=>
Neg<= '0';
Result <= not REG1;

WHEN "0000000000001000"=>
Neg<= '0';
Result <= not(REG1 and REG2);

WHEN "0000000000010000"=>
Neg<= '0';
Result <= not(REG1 or REG2);

WHEN "0000000000100000"=>
Neg<= '0';
Result <= REG1 and REG2;

WHEN "0000000001000000"=>
Neg<= '0';
Result <= REG1 xor REG2;

WHEN "0000000010000000"=>
Neg<= '0';

Result <= REG1 or REG2;

WHEN "0000000100000000"=>
Neg<= '0';
Result <= not(REG1 xor REG2);

WHEN OTHERS =>

end case;
YorN<= "1101010";
if student_id(0) = '1' then
YorN<= "1000100";
end if;
end process;

 R1<=Result(3 downto 0);
 R2 <= Result(7 downto 4);
 end calculation;