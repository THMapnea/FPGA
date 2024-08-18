\m5_TLV_version 1d: tl-x.org
\m5

   //use(m5-1.0)   /// uncomment to use M5 macro library.
\SV
   `include "sqrt32.v";
   `include "makerchip_module.v" //semicolon is not required 
\TLV
   //stimulus
   |calc;
      @0
         $valid = & $rand_valid[1:0]; //this is 1 only 1/4th of time over 2 bit
   
   
   
   |calc;
      ?$valid;
         @1
            $aa_sq[7:0] = $aa[3:0] ** 2;
            $bb_sq[7:0] = $bb[3:0] ** 2;
         @2
            $cc_sq[8:0] = $aa_sq + $bb_sq;
         @3
            $cc_root[4:0] = sqrt($cc_sq);

\SV
   endmodule
