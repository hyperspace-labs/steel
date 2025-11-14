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

-- Type renaming and additional types.
package types is

  -- An unresolved logic type.
  subtype logic is std_ulogic;

  -- A fixed-size array of `logic` element types.
  subtype logics is std_ulogic_vector;

  -- A resolved logic type.
  subtype rlogic is std_logic;

  -- A fixed-size array of `rlogic` element types.
  subtype rlogics is std_logic_vector;

  -- The 8-bit signed integer type.
  subtype i8 is integer range -128 to 127;

  -- The 16-bit signed integer type.
  subtype i16 is integer range -32768 to 32767;

  -- The 32-bit signed integer type.
  subtype i32 is integer range -2147483647 to 2147483647;

  -- The 8-bit unsigned integer type.
  subtype u8 is natural range 0 to 255;

  -- The 16-bit unsigned integer type.
  subtype u16 is natural range 0 to 65535;

  -- The 32-bit unsigned integer type.
  subtype u32 is natural range 0 to 2147483647;

  -- The 8-bit positive integer type.
  subtype p8 is positive range 1 to 256;

  -- The 16-bit positive integer type.
  subtype p16 is positive range 1 to 65536;

  -- The 32-bit positive integer type.
  subtype p32 is positive range 1 to 2147483647;

  -- The compiler-sized signed integer type.
  subtype isize is integer;

  -- The compiler-sized unsigned integer type.
  subtype usize is natural;

  -- The compiler-sized positive integer type.
  subtype psize is positive;

  -- The compiler-sized signed integer type.
  subtype int is integer;

  -- The compiler-sized unsigned integer type.
  subtype uint is natural;

  -- The compiler-sized positive integer type.
  subtype pint is positive;

  -- A fixed-size array of `i8` element types.
  type i8s is array(natural range<>) of i8;

  -- A fixed-size array of `i16` element types.
  type i16s is array(natural range<>) of i16;

  -- A fixed-size array of `i32` element types.
  type i32s is array(natural range<>) of i32;

  -- A fixed-size array of `u8` element types.
  type u8s is array(natural range<>) of u8;

  -- A fixed-size array of `u16` element types.
  type u16s is array(natural range<>) of u16;

  -- A fixed-size array of `u32` element types.
  type u32s is array(natural range<>) of u32;

  -- A fixed-size array of `p8` element types.
  type p8s is array(natural range<>) of p8;

  -- A fixed-size array of `p16` element types.
  type p16s is array(natural range<>) of p16;

  -- A fixed-size array of `p32` element types.
  type p32s is array(natural range<>) of p32;

  -- A fixed-size array of `isize` element types.
  type isizes is array(natural range<>) of isize;

  -- A fixed-size array of `usize` element types.
  type usizes is array(natural range<>) of usize;

  -- A fixed-size array of `psize` element types.
  type psizes is array(natural range<>) of psize;

  -- A fixed-size array of `int` element types.
  type ints is array(natural range<>) of int;

  -- A fixed-size array of `uint` element types.
  type uints is array(natural range<>) of uint;
  
  -- A fixed-size array of `pint` element types.
  type pints is array(natural range<>) of pint;

  -- The unsigned logic type.
  subtype usign is unsigned;

  -- The signed logic type.
  subtype isign is signed;

  -- A fixed-size array of `usign` element types.
  type usigns is array(natural range<>) of usign;

  -- A fixed-size array of `isign` element types.
  type isigns is array(natural range<>) of isign;

  -- The boolean type.
  subtype bool is boolean;
  
  -- A fixed-size array of `bool` element types.
  type bools is array(natural range<>) of bool;
  
  -- A character type.
  subtype char is character;

  -- A fixed-size array of `char` element types.
  subtype str is string;

  -- A fixed-size array of `char` element types.
  type chars is array(natural range<>) of char;

  -- A fixed-size array of `str` element types.
  type strs is array(natural range<>) of str;

  -- A fixed-size array of `bit` element types.
  subtype bits is bit_vector;

  -- A severity level type.
  subtype sevel is severity_level;

  -- An empty type.
  type void is (none);

  -- A fixed-size array of `void` element types.
  type voids is array(natural range<>) of void;

end package;
