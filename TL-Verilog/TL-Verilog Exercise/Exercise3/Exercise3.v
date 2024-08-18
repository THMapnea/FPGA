\m5_TLV_version 1d: tl-x.org
\m5

   //use(m5-1.0)   /// uncomment to use M5 macro library.
\SV
   m5_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   /*
   Define two 4-bit inputs.
	Add them in the first stage and pass the result to the second stage.
	In the second stage, subtract a  value from the result.
   In the fourth stage assign it to the output.
   */
   |answer;
      @0
         $input_a[3:0] = 0001;
         $input_b[3:0] = 0001;
      @1
         $sum[4:0] = $input_a + $input_b;
      @2
         $adjusted[4:0] = $sum - $decrease[1:0];
      @3
         $output[4:0] = $adjusted;
\SV
   endmodule
