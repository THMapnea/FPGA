\m5_TLV_version 1d: tl-x.org
\m5

   //use(m5-1.0)   /// uncomment to use M5 macro library.
\SV

   m5_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   |operation1;
      @0
         //we need to be careful [range of bit to use]
         $sumout[5:0] = $a[4:0] + $b[4:0];
   |operation2;
      @1
         $subout[5:0] = $d[5:0] - $c[4:0];
   |operation3;
      @2
         $mulout[12:0] = $e[4:0] * $f[4:0];
   |operation4;
      @3
         $divout[12:0] = $g[4:0] / $h[4:0];
\SV
   endmodule
