\m5_TLV_version 1d: tl-x.org
\SV
   `include "sqrt32.v";
   m5_makerchip_module
\TLV

   // Stimulus
   |calc
      @0
         //the skip_ok signal will be asserted only if it wasnt asserted for three times
         //before the current cycle and four cycle before was asserted 
         //this is an example on how we can implement a pattern recognition using signal to 
         //then make something happen
         $skip_ok = ! >>1$valid && ! >>2$valid && ! >>3$valid && >>4$valid;
         //valid is asserted only if a random signal is asserted and only if another random 
         //signal is not asserted or the previous declared signal is asserted, it also need
         //for the reset signal to not be asserted on the previous cycle
         //this is another implementation condition to create a condition
         $valid = $rand_valid && (!$rand_skip || $skip_ok) && !/top>>1$reset;
         //signal that decides if we want to skip the operation
         $skip_to = $valid && $rand_skip;
         ?$valid
            //generate random numbers
            $aa[31:0] = $rand_aa[4:0];
            $bb[31:0] = $rand_bb[4:0];



   // Reset
   // Create pipesignal out of reset module input.
   //this happens in a @0 moment outside of the pipeline
!  $reset = *reset;

   // Calc pipeline that computes the distance of a singol hop
   |calc
      ?$valid
         @1
            $aa_sq[31:0] = $aa * $aa;
            $bb_sq[31:0] = $bb * $bb;
         @2
            $cc_sq[31:0] = $aa_sq + $bb_sq;
         @3
            $cc[31:0] = sqrt($cc_sq);
      
      // Total distance accumulator.
      @4
         ?$valid
            $tot_incr[31:0] = >>1$tot_dist + $cc;
      @5
         //if the signal from three cycles in the future we are basically going from 
         //@4 -> @1
         //if is true then we reset the value of the total distance with 32 bit = 0
         $tot_dist[31:0] =
             /top<<3$reset ? 32'b0 :        // reset
             $valid        ? $tot_incr     // add $cc
                           : >>1$tot_dist;  // retain






\SV
endmodule
