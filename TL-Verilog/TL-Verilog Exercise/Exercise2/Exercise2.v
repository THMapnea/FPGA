\m5_TLV_version 1d: tl-x.org
\m5

   //use(m5-1.0)   /// uncomment to use M5 macro library.
\SV

   m5_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   /*
   Define a 4-bit input signal.
	Create two pipeline stages.
	Pass the input signal through the first stage, modify it (e.g., add a constant value), and pass it to the second stage.
	In the second stage, assign the modified signal to the 5 bit output. 
   */
   |answer;
      @0
         $input[3:0] = $rand_signal[3:0];
      @1
         //we use  <<1 to account for system speed?
         $incremented_signal[4:0] = <<1$input + $increment[1:0];
      @2
         $output[4:0] = $incremented_signal;
\SV
   endmodule
