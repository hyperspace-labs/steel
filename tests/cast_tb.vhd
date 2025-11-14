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
use work.cast.all;

entity cast_tb is
end entity;

architecture tst of cast_tb is

  signal b0: logic := '1';
  signal v0: logics(3 downto 0) := "1010";
  signal v1: logics(5 downto 0) := (others => '0');

  signal op: logics(1 downto 0) := "00";

begin

  v1 <= logics(usign(logics(op & v0)));

  check: process
    variable vv0: logics(3 downto 0) := "0W-0";

    constant c_p: psize := 10;
    constant c_u: usize := 0;
    constant c_i: isize := -14;

    variable rr0: std_logic_vector(1 downto 0) := "10";
    variable rr1: std_logic := '1';
  begin
    -- passing a rlogics type into a logics parameter
    assert to_str(logics(rr0)) = "10" severity error;
    assert to_str(rr1) = "1" severity error;

    assert to_str(c_p) = "10" severity error;
    assert to_str(c_u) = "0" severity error;
    assert to_str(c_i) = "-14" severity error;
    
    assert to_str(v0) = "1010" severity error;
    assert to_str(b0) = "1" severity error;

    assert to_str(to_int(isign(v0))) = "-6" severity error;
    assert to_str(to_int(usign(v0))) = "10" severity error;

    assert to_str(to_logic('a')) = "0" severity error;

    assert to_str(vv0) = "0W-0" report "vv0 = " & to_str(vv0) severity error;

    vv0 := logics(to_usign(16, vv0'length));
    assert to_str(vv0) = "0000" report "vv0 = " & to_str(vv0) severity error;
    
    assert to_str(now) = "0 ps" severity error;

    assert to_logics(b0) = "1" severity error;

    assert to_int(str'("102")) = 102 severity error;

    assert to_int(str'("-257")) = -257 severity error;

    assert to_int(str'("72")) = 72 severity error;

    wait;
  end process;

end architecture;
