\m5_TLV_version 1d: tl-x.org
\m5

   //use(m5-1.0)   /// uncomment to use M5 macro library.
\SV
   m5_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   |fibonacci;
      @0
         $fibonacciout[15:0] = *reset ? 1 :
                                        >>1$fibonacciout + >>2$fibonacciout;
\SV
   endmodule
