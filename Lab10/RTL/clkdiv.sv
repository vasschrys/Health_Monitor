//-----------------------------------------------------------------------------
// Title         : clkdiv - parameterized clock divider
// Project       : ECE 211 - Digital Circuits 1
//-----------------------------------------------------------------------------
// File          : clkdiv.sv
// Author        : John Nestor
// Created       : 09.08.2011
// Last modified : 10.16.2015
//-----------------------------------------------------------------------------
// Description :
// This module divides the 100MHz clock on the Nexys4 board down to a lower
// frequency.  Set the DIVFREQ parameter to the desired frequency in Hz.
// If a frequency lower than 1 Hz is desired, the DIVBITS bitwidth parameter
// must be increased.  If a higher frequency is used, we assume that synthesis
// will trim the unused most signficant counter bits and logic.
// To use, instantiate this module whiel setting the DIVFREQ parameter to the
//  desired frequency in Hz.
// For example, to generate a 1 Hz clock, instantiate a module as follows:
//
//  clkdiv #(.DIVFREQ(1)) U_DIV (clk, reset, sclk);
// Where:
//    clk    is the 100MHz system clock that arrives on an input pin of the FPGA
//           (see the documentation)
//    reset  is a signal that resets the clock divider counter
//           (connect it to zero if unused)
//    sclk   is the output clock - connect this to your logic
//
//-----------------------------------------------------------------------------

module clkdiv(input logic clk, input logic reset, output logic sclk);
   parameter DIVFREQ = 100;  // desired frequency in Hz (change as needed)
   parameter DIVBITS = 26;   // enough bits to divide 100MHz down to 1 Hz
   parameter CLKFREQ = 100_000_000;
   parameter DIVAMT = (CLKFREQ / DIVFREQ) / 2;

   logic [DIVBITS-1:0] q;

   always_ff @(posedge clk)
     if (reset) begin
	    q <= 0;
	    sclk <= 0;
     end
     else if (q == DIVAMT-1) begin
	    q <= 0;
	    sclk <= ~sclk;
     end
     else q <= q + 1;

endmodule // clkdiv



   
  
