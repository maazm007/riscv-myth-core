\m5_TLV_version 1d: tl-x.org
\m5
   
   // =================================================
   // Welcome!  New to Makerchip? Try the "Learn" menu.
   // =================================================
   
   //use(m5-1.0)   /// uncomment to use M5 macro library.
\SV
	`include "sqrt32.v";
   m5_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   |calc
      @1
         $reset = *reset;
      ?$valid
         @1
            $a_sq[31:0] = $a[3:0] * $a;
            $b_sq[31:0] = $b[3:0] * $b;
         @2
            $c_sq[31:0] = $a_sq + $b_sq;
         @3
            $c[31:0] = sqrt($c_sq);
      @4
         $tot_dist[31:0] = $reset ? 32'b0 : ($valid ? >>1$tot_dist + $c : $tot_dist);

   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
   
\SV
   endmodule
