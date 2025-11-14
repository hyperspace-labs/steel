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
use work.dims.all;
use work.cast.all;

entity dims_tb is
end entity;

architecture sim of dims_tb is

  signal s0: logic;

  signal line0: logics(3 downto 0) := "1111";

  constant A_LEN: usize := 2;
  constant B_LEN: usize := 4;

  signal g0: logics(A_LEN*B_LEN-1 downto 0) := (others => '0');

  signal a0: logics(A_LEN-1 downto 0) := "11";

  constant C_LEN: usize := 2;

  signal g3d: logics(A_LEN*B_LEN*C_LEN-1 downto 0) := (others => '0');

  signal b2d: logics(A_LEN*B_LEN-1 downto 0);
  signal a1d: logics(A_LEN-1 downto 0);

  signal a1d_payload: logics(A_LEN-1 downto 0) := "11";

  constant idx_b: usize := 2;
  constant idx_c: usize := 1;

begin

  -- modifying a 1-dimensional subslice in a 2-dimensional array
  g0 <= set_slice(g0, a0, 1);

  -- modifying a 1-dimensional subslice in a 3-dimensional array
  -- alternate method previously used:
  --  g3d <= set_slice(g3d, set_slice(get_slice(g3d, b2d, idx_c), a1d_payload, idx_b), idx_c);
  g3d <= set_slice(g3d, a1d_payload, (C_LEN, B_LEN), (1, 2));

  line0(2) <= '0';
  
  c1: process
    constant X_LEN: usize := 1;
    constant Y_LEN: usize := 4;

    variable grid: logics(X_LEN*Y_LEN-1 downto 0) := ('0', '0', '1', '1');
    
    variable row: logics(X_LEN-1 downto 0);
    variable col: logics(Y_LEN-1 downto 0);

    variable cs2: usize := into_index((B_LEN, A_LEN), (3, 1));

  begin
    row := get_slice(grid, row, 0);
    wait for 0 ns;

    assert row = "1" severity error;
    
    assert g0 = "00001100" report to_str(g0) severity error;
    assert get_slice(g0, a0, 1) = "11" report to_str(get_slice(g0, a0, 1)) severity error;
    
    assert cs2 = 7 report "index: " & int'image(cs2) severity error;
    
    assert g3d = "0011000000000000" report "g3d: " & to_str(g3d) severity error;
    assert g3d(into_index((C_LEN, B_LEN, A_LEN), (1, 2, 0))) = '1' severity error;
    assert g3d(into_index((C_LEN, B_LEN, A_LEN), (1, 2, 1))) = '1' severity error;
    assert g3d(into_index((C_LEN, B_LEN, A_LEN), (1, 1, 1))) = '0' severity error;
    assert g3d(into_index((C_LEN, B_LEN, A_LEN), (1, 3, 0))) = '0' severity error;
    
    assert get_slice(g3d, a1d, (C_LEN, B_LEN), (1, 2)) = "11" severity error;
    wait;
  end process;

end architecture;