\m5_TLV_version 1d: tl-x.org
\m5
   //use(m5-1.0)   /// uncomment to use M5 macro library.
\SV

   m5_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   |declaration;
      @0
         //we first declare two signal then check if we want to perform sum or sub
         $num1[3:0] = 4;
         $num2[3:0] = 3;
         $result[5:0] = ($op[0:0] == 1) ? $num1 + $num2 :
                                          $num1 - $num2;
\SV
   endmodule
