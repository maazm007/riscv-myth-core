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
   |comp
      @1
         $err1 = $bad_input || $illegal_output;
      @3
         $err2 = $over_flow || $err1;
      @6
         $err3 = $div_by_zero || $err2;
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
