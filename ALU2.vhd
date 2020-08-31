library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.std_logic_unsigned.All;
use IEEE.numeric_std.ALL;
entity ALU2 is
port (
A,B:in unsigned(7 downto 0);
student_id:in unsigned(3 downto 0);
OP :in unsigned(15 downto 0);
Neg:out std_logic;
R1 :out unsigned(3 downto 0);
R2:out unsigned(3 downto 0));
end ALU2;
architecture calculation of ALU2 is
signal REG1,REG2,Result: unsigned(7 downto 0):=(others => '0');
signal REG4:unsigned(0 to 7);
signal temp1, temp2, temp3, temp4 : std_logic;
begin
process(OP)
begin
case OP is
WHEN "0000000000000001"=>
REG1 <= A;
REG2<= B;
Neg<= '0';
Result <= REG1 + "00000010";

WHEN "0000000000000010"=>
REG1 <= A;
REG2<= B;
Neg<= '0';
Result <= shift_right(unsigned(REG2), 2);

WHEN "0000000000000100"=>
REG1 <= A;
REG2<= B;
Neg<= '0';
Result <= shift_right(unsigned(REG1), 4);
Result(7)<= '1';
Result(6)<= '1';
Result(5)<= '1';
Result(4)<= '1';

WHEN "0000000000001000"=>
REG1 <= A;
REG2<= B;
Neg<= '0';
if(REG1>REG2) then
Result <= REG2;
end if;
if(REG2>REG1) then
Result <= REG1;
end if;

WHEN "0000000000010000"=>
REG1 <= A;
REG2<= B;
Neg<= '0';
temp1 <= REG1(0);
temp2 <= REG1(1);
Result <= shift_right(unsigned(REG1), 2);
Result(6) <= temp1;
Result(7) <= temp2;


WHEN "0000000000100000"=>
REG1 <= A;
REG2<= B;
Neg<= '0';
temp1 <= REG2(7);
temp2 <= REG2(6);
temp3 <= REG2(5);
temp4 <= REG2(4);
Result(7) <= REG2(0);
Result(6) <= REG2(1);
Result(5) <= REG2(2);
Result(4) <= REG2(3);
Result(0)<= temp1;
Result(1)<= temp2;
Result(2)<= temp3;
Result(3)<= temp4;

WHEN "0000000001000000"=>
REG1 <= A;
REG2<= B;
Neg<= '0';
Result <= REG1 xor REG2;

WHEN "0000000010000000"=>
REG1 <= A;
REG2<= B;
Neg<= '0';

if((REG1 + REG2)>"00000100") then
Result <= REG1 + REG2 -"00000100";
end if;

if((REG1 + REG2)<"00000100") then
Neg<= '1';
Result <= not(REG1 + REG2 + "11111100") + "00000001";
end if;

WHEN "0000000100000000"=>
REG1 <= A;
REG2<= B;
Neg<= '0';
Result <= "11111111";

WHEN OTHERS =>

end case;
end process;
 R1<=Result(3 downto 0);
 R2 <= Result(7 downto 4);
 end calculation;