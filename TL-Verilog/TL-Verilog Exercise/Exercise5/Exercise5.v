\m5_TLV_version 1d: tl-x.org
\m5
   

   //use(m5-1.0)   /// uncomment to use M5 macro library.
\SV

   m5_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   /*
   	Get the total sum every time you reach the max savable on the sum variable.
   */
   |answer;
      @0
         $input[3:0] = $rand_signal[3:0];
         $counter[3:0] = *reset ? 0
                                : >>1$counter + 1;
      @1
         $sum[7:0] = (>>1$sum != 8'hFF) ? >>1$sum + $input
                               : 0;

\SV
   endmodule
