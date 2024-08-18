\m5_TLV_version 1d: tl-x.org
\m5

   //use(m5-1.0)   /// uncomment to use M5 macro library.
\SV

   m5_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   /*
		Define a 4-bit input and output signal.
		Implement a comparison to check if the input is even or odd.
		If even, multiply the input by 2 and pass it to the output; 
		If odd, subtract 1 and pass the result to the output.
	*/

   |answer;
      //remember when you look the waveform to see the result you need to look forword
      //as much the difference in stage for example the value initialized at @1 will be seen
      //in the waveform 2 steps after since the system continue to generate 
      @0
         $input[3:0] = $rand_signal[3:0];
      @1
         $new_value[4:0] = !($input % 2) ? ($input * 2)
                                   : ($input - 1);
      @2
         $output[4:0] = $new_value;
         
         
         
\SV
   endmodule
