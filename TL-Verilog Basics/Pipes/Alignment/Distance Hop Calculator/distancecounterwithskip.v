\m5_TLV_version 1d: tl-x.org
\SV
   `include "sqrt32.v";
   m5_makerchip_module
\TLV
   // we are introducing speculation on our design so that we can optimize
   //the performance by doing speculations and revert back when those speculation 
   //are wrong
   // Stimulus
   |calc
      @0
         $skip_ok = ! >>1$valid && ! >>2$valid && ! >>3$valid && >>4$valid;
         $valid = $rand_valid && (!$rand_skip || $skip_ok) && !/top>>1$reset;
         $skip_to = $valid && $rand_skip;
         ?$valid
            //generate random numbers
            $aa[31:0] = $rand_aa[4:0];
            $bb[31:0] = $rand_bb[4:0];



   // Reset
!  $reset = *reset;

   // Calc pipeline that computes the distance of a singol hop
   |calc
      ?$valid
         //at the beggining we take care of correcting a miscalculation that is
         //asserted only if skip_to is asserted
         @0
           $corrected_aa[31:0] = $skip_to ? ($aa + >>4$cc) : $aa;
         //this time we calculate the square of the aa signal with the corrected
         //values from the miss hop
         @1
            $aa_sq[31:0] = $corrected_aa * $corrected_aa;
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
         $tot_dist[31:0] =
             /top<<3$reset ? 32'b0 :        // reset
             $valid        ? $tot_incr     // add $cc
             //we make sure that we reached the end of our pipeline because
             //we designed that the skip can be calculated only at the fourth
             //cycle of the design
             && ! <<4$skip_to
                           : >>1$tot_dist;  // retain






\SV
endmodule
