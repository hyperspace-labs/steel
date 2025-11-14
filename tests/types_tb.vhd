-- Copyright 2025 Chase Ruskin
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.types.all;

entity types_tb is
end entity;

architecture tst of types_tb is
begin

  check: process
    variable a0: i32 := 4; 
    constant soln_a0: integer := 14;

    variable vec: i32s(0 to 3) := (-10, 5, -5, 0);
    variable smalls: i8s(0 to 2) := (12, 127, -128);

    variable b: logic := '1';
    variable v: logics(3 downto 0) := "1110";

  begin
    a0 := a0 + 10;
    assert a0 = soln_a0 severity error;

    assert smalls(1) = 127 severity error;
    
    assert v(3) = b severity error;
    assert v(0) /= b severity error;

    wait;
  end process;

end architecture;
