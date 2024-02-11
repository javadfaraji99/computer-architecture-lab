--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : full_adder.vhf
-- /___/   /\     Timestamp : 02/07/2024 00:03:08
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family artix7 -flat -suppress -vhdl "/home/ise/Desktop/session 1/experiment1/full_adder.vhf" -w "/home/ise/Desktop/session 1/experiment1/full_adder.sch"
--Design Name: full_adder
--Device: artix7
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity full_adder is
   port ( A    : in    std_logic; 
          B    : in    std_logic; 
          Cin  : in    std_logic; 
          Cout : out   std_logic; 
          S    : out   std_logic);
end full_adder;

architecture BEHAVIORAL of full_adder is
   attribute BOX_TYPE   : string ;
   signal XLXN_10 : std_logic;
   signal XLXN_11 : std_logic;
   signal XLXN_12 : std_logic;
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component XOR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of XOR2 : component is "BLACK_BOX";
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
begin
   XLXI_3 : AND2
      port map (I0=>B,
                I1=>A,
                O=>XLXN_10);
   
   XLXI_4 : AND2
      port map (I0=>Cin,
                I1=>XLXN_12,
                O=>XLXN_11);
   
   XLXI_5 : XOR2
      port map (I0=>B,
                I1=>A,
                O=>XLXN_12);
   
   XLXI_6 : XOR2
      port map (I0=>Cin,
                I1=>XLXN_12,
                O=>S);
   
   XLXI_7 : OR2
      port map (I0=>XLXN_10,
                I1=>XLXN_11,
                O=>Cout);
   
end BEHAVIORAL;


