\m5_TLV_version 1d: tl-x.org
\m5

   //use(m5-1.0)   /// uncomment to use M5 macro library.
\SV
   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   |halfadder1;
      @0
         $sumout1 = $in1 ^ $in2;
         $carryout = $in1 & $in2;
   
   |halfadder2;
      @1
         $sum = $sumout1 ^ $carryout;
         $carry = $sumout1 & $carryout;

\SV
   endmodule
