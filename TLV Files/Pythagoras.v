\m4_TLV_version 1d: tl-x.org
\SV
   `include "sqrt32.v";
   m4_makerchip_module
\TLV
   |calc
      @1
         $a_sq[7:0] = $a[3:0] * $a[3:0];
         $b_sq[7:0] = $b[3:0] * $b[3:0];
      @2
         $c_sq[7:0] = $a_sq + $b_sq;
      @3
         $out[4:0] = sqrt($c_sq);
         
   *passed = *cyc_cnt > 40;
\SV
   endmodule
