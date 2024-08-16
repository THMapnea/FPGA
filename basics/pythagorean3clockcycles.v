\m5_TLV_version 1d: tl-x.org
\m5
   

   //use(m5-1.0)   /// uncomment to use M5 macro library.
\SV
	`include "sqrt32.v";
   m5_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   |square;
      @1
         $aa[7:0] = $a[3:0] ** 2;
         $bb[7:0] = $b[3:0] ** 2;
      @2
         $cc[8:0] = $aa + $bb;
      @3
         $sqrt_cc[4:0] = sqrt($cc);
\SV
   endmodule
