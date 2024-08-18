\m5_TLV_version 1d: tl-x.org
\m5

   //use(m5-1.0)   /// uncomment to use M5 macro library.
\SV

   m5_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   /*
   Define an 8-bit input signal.
	Create an internal 8-bit signal.
	Assign the value of the input signal to the internal signal.
	Assign the value of the internal signal to the output signal.
   do not take in consideration to reset the values for now.
   */

   |answer;
      @0
         $input[7:0] = $rand_signal[7:0];
      @1
         $temporary[7:0] = $input;
      @2
         $output[7:0] = $temporary;
\SV
   endmodule
