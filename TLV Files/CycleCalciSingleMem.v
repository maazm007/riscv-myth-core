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
   
   //Cycle Calculator with Single Value Memory and Validity
   
   |calc
      @1
         $reset = *reset;
         $cnt = $reset ? 0 : >>1$cnt + 1; //Oscillator
         $valid = $reset || $cnt;
      ?$valid
         @1
            $in1[31:0] = >>2$out; //Memory Element that stores the previous result
            $in2[31:0] = $rand2[3:0];
            $sum[31:0] = $in1 + $in2;
            $diff[31:0] = $in1 - $in2;
            $prod[31:0] = $in1 * $in2;
            $quot[31:0] = $in1 / $in2;
         @2
            $op[2:0] = $rand3[2:0];
            //If performing memory operation ie op = 5, then fb the out value 2 stage back else hold the mem value
            $mem[31:0] = $reset ? 32'b0 : (($op == 3'b101) ? >>2$out : >>2$mem);
            $temp[31:0] = ($op == 3'b000) ? $sum : ($op == 3'b001) ? $diff : ($op == 3'b010) ? $prod : ($op == 3'b011) ? $quot : ($op == 3'b100) ? >>2$mem : 32'b0;
            $out[31:0] = $reset ? 32'b0 : ($valid ? $temp : $out);
   
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
