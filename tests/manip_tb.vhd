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
use ieee.numeric_std.all;

library work;
use work.types.all;
use work.manip.all;
use work.cast.all;

entity manip_tb is
end entity;

architecture tst of manip_tb is
begin

  check: process
    variable v0: logics(3 downto 0) := (others => '0');
    variable v1: logics(3 downto 0) := "0001";

    variable r0: rlogics(3 downto 0) := (others => '0');
    variable r1: rlogics(3 downto 0) := "0001";

    variable d0: logics(3 downto 0) := "0000";

    variable d0_trunc: logics(1 downto 0) := "00";
    variable d0_exten: logics(5 downto 0) := "000000";

    variable u0: logics(0 to 3) := "0000";

    variable u0_trunc: logics(0 to 1) := "00";
    variable u0_exten: logics(0 to 5) := "000000";
    
    variable d1: logics(0 downto 0) := "0";
    variable u1: logics(0 to 0) := "0";

    variable rs: logics(1 downto 0);
  begin
    rs := logics(resize(usign(d0), 2));
    -- wait;

    v0 := logics(usign(v0) + usign(v1));
    -- saves 16 characters per addition and retains explicit casting
    -- v0 := std_logic_vector(unsigned(v0) + unsigned(v1));
    
    -- report logic'image(v0(0));
    assert v0(0) = '1' severity error;
    -- v0 := logics(usign(v0) + '1');

    r0 := rlogics(usign(r0) - usign(r1));
    -- report rlogic'image(r0(0));
    assert r0(0) = '1' severity error;

    v0 := "0001";
    v0 := shift_left_logic(v0, 1);
    assert v0(1) = '1' report "v0(1) = " & logic'image(v0(1)) severity error;
    v0 := shift_right_logic(v0, 1);
    assert v0(1) = '0' report "v0(1) = " & logic'image(v0(1)) severity error;
    
    v0 := "0010";
    v0 := rotate_right(v0, 1);

    assert v0 = "0001" severity error;

    report "Testing logical shift operators...";

    u0 := "1010";
    u0 := shift_right_logic(u0, 0);
    assert u0 = "1010";

    d0 := "1010";
    d0 := shift_left_logic(d0, 0);
    assert d0 = "1010";

    u0 := "1010";
    u0 := shift_left_logic(u0, 0);
    assert u0 = "1010";

    d0 := "1000";
    d0 := shift_right_logic(d0, 1);
    assert d0 = "0100";
    d0 := shift_right_logic(d0, 2);
    assert d0 = "0001";

    u0 := "1000";
    u0 := shift_right_logic(u0, 1);
    assert u0 = "0100";
    u0 := shift_right_logic(u0, 2);
    assert u0 = "0001";

    d0 := "0001";
    d0 := shift_left_logic(d0, 1);
    assert d0 = "0010";
    d0 := shift_left_logic(d0, 2);
    assert d0 = "1000";

    u0 := "0001";
    u0 := shift_left_logic(u0, 1);
    assert u0 = "0010";
    u0 := shift_left_logic(u0, 2);
    assert u0 = "1000";

    report "Testing arithmetic shift operators...";

    d1 := "1";
    d1 := shift_left_arith(d1, 0);
    assert d1 = "1";

    d1 := "1";
    d1 := shift_left_arith(d1, 1);
    assert d1 = "0";

    u1 := "1";
    u1 := shift_left_arith(u1, 0);
    assert u1 = "1";

    u1 := "1";
    u1 := shift_left_arith(u1, 1);
    assert u1 = "1";

    d1 := "1";
    d1 := shift_right_arith(d1, 0);
    assert d1 = "1";

    d1 := "1";
    d1 := shift_right_arith(d1, 1);
    assert d1 = "1";

    u1 := "1";
    u1 := shift_right_arith(u1, 0);
    assert u1 = "1";

    u1 := "1";
    u1 := shift_right_arith(u1, 1);
    assert u1 = "0";

    d0 := "1010";
    d0 := shift_right_arith(d0, 0);
    assert d0 = "1010";

    u0 := "1010";
    u0 := shift_right_arith(u0, 0);
    assert u0 = "1010";

    d0 := "1010";
    d0 := shift_left_arith(d0, 0);
    assert d0 = "1010";

    u0 := "1010";
    u0 := shift_left_arith(u0, 0);
    assert u0 = "1010";

    d0 := "1000";
    d0 := shift_right_arith(d0, 1);
    assert d0 = "1100";
    d0 := shift_right_arith(d0, 2);
    assert d0 = "1111";

    u0 := "1000";
    u0 := shift_right_arith(u0, 1);
    assert u0 = "0100";
    u0 := shift_right_arith(u0, 2);
    assert u0 = "0001";

    d0 := "0001";
    d0 := shift_left_arith(d0, 1);
    assert d0 = "0010";
    d0 := shift_left_arith(d0, 2);
    assert d0 = "1000";

    u0 := "0001";
    u0 := shift_left_arith(u0, 1);
    assert u0 = "0011";
    u0 := shift_left_arith(u0, 2);
    assert u0 = "1111";

    report "Testing rotation operators...";

    -- rotation right

    d0 := "1001";
    d0 := rotate_right(d0, 1);
    assert d0 = "1100";

    d0 := "1100";
    d0 := rotate_right(d0, 2);
    assert d0 = "0011";

    d0 := "1100";
    d0 := rotate_right(d0, 4);
    assert d0 = "1100";

    d0 := "1100";
    d0 := rotate_right(d0, 5);
    assert d0 = "0110";

    u0 := "1001";
    u0 := rotate_right(u0, 1);
    assert u0 = "1100";

    u0 := "1100";
    u0 := rotate_right(u0, 2);
    assert u0 = "0011";

    u0 := "1100";
    u0 := rotate_right(u0, 4);
    assert u0 = "1100";

    u0 := "1100";
    u0 := rotate_right(u0, 5);
    assert u0 = "0110";

    -- rotation left

    d0 := "1001";
    d0 := rotate_left(d0, 1);
    assert d0 = "0011";

    d0 := "1100";
    d0 := rotate_left(d0, 2);
    assert d0 = "0011";

    d0 := "1100";
    d0 := rotate_left(d0, 4);
    assert d0 = "1100";

    d0 := "1100";
    d0 := rotate_left(d0, 5);
    assert d0 = "1001";

    u0 := "1001";
    u0 := rotate_left(u0, 1);
    assert u0 = "0011";

    u0 := "1100";
    u0 := rotate_left(u0, 2);
    assert u0 = "0011";

    u0 := "1100";
    u0 := rotate_left(u0, 4);
    assert u0 = "1100";

    u0 := "1100";
    u0 := rotate_left(u0, 5);
    assert u0 = "1001";

    report "Testing extension functions (downto)...";

    d0 := "1100";
    d0_trunc := zero_extend(d0, d0_trunc'length);
    assert d0_trunc = "00" report to_str(d0_trunc) severity error;

    d0_exten := zero_extend(d0, d0_exten'length);
    assert d0_exten = "001100" report to_str(d0_exten) severity error;

    d0_trunc := sign_extend(d0, d0_trunc'length);
    assert d0_trunc = "10" report to_str(d0_trunc) severity error;

    d0_exten := sign_extend(d0, d0_exten'length);
    assert d0_exten  ="111100" report to_str(d0_exten) severity error;

    d0 := "1001";
    d0_trunc := sign_extend(d0, d0_trunc'length);
    assert d0_trunc = "11" report to_str(d0_trunc) severity error;

    report "Testing extension functions (to)...";

    u0 := "1001";
    u0_trunc := zero_extend(u0, u0_trunc'length);
    assert u0_trunc = "10" report to_str(u0_trunc) severity error;

    u0_exten := zero_extend(u0, u0_exten'length);
    assert u0_exten = "100100" report to_str(u0_exten) severity error;

    u0_trunc := sign_extend(u0, u0_trunc'length);
    assert u0_trunc = "11" report to_str(u0_trunc) severity error;

    u0_exten := sign_extend(u0, u0_exten'length);
    assert u0_exten = "100111" report to_str(u0_exten) severity error;

    wait;
  end process;

end architecture;