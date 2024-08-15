\m5_TLV_version 1d: tl-x.org
\m5
   //use(m5-1.0)   /// uncomment to use M5 macro library.
\SV

   m5_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   |check1;
      @0
         //if do is  = 1 we pass 255 otherwise 0
         $a[8:0] = $do ? 255 : 0;
   |check2;
      @1
         $a[8:0] = $big ? 255:
                   $medium ? 126 :
                   $small ? 64 : 
                   0;
   
\SV
   endmodule
