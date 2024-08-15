\m5_TLV_version 1d: tl-x.org
\m5

   //use(m5-1.0)   /// uncomment to use M5 macro library.
\SV
   m5_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   $reset = *reset;
   
   $sumout = $in1 ^ $in2;
   $carryout = $in1 & $in2;
   
   //...  
   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
