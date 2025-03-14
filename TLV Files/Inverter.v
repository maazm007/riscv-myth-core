\m5_TLV_version 1d: tl-x.org
\m5
   
   // =================================================
   // Welcome!  New to Makerchip? Try the "Learn" menu.
   // =================================================
   
   //use(m5-1.0)   /// uncomment to use M5 macro library.
\SV
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m5_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   $reset = *reset;
   //Calculator
   $in1[3:0] = $rand1[3:0];
   $in2[3:0] = $rand2[3:0];
   $sel[1:0] = $rand3[1:0];
   $sum[6:0] = $in1 + $in2;
   $diff[6:0] = $in1 - $in2;
   $prod[6:0] = $in1 * $in2;
   $quot[6:0] = $in1 / $in2;
   $op[6:0] = (($sel == 2'b00) ? $sum : ($sel == 2'b01) ? $diff : ($sel == 2'b10) ? $prod : $quot);
   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
