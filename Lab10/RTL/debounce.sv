//-----------------------------------------------------------------------------
// Title         : debounce
// Project       : ECE 211 Digital Circuits 1
//-----------------------------------------------------------------------------
// File          : debounce.sv
// Author        : John Nestor  <nestorj@nestorj-mbpro-15>
// Created       : 17.10.2018
// Last modified : 17.10.2018
//-----------------------------------------------------------------------------
// Description :
// Debouncer patterned after "Debounce Logic Circuit (with VHDL example)"
// on the Digikey EEWiki
//-----------------------------------------------------------------------------
// Modification history :
// 17.10.2018 : created
//-----------------------------------------------------------------------------

module debounce(input logic clk, pb, output logic pb_debounced);
   parameter CLKFREQ = 1000;    // clock frequency in Hertz
   parameter DEBOUNCE_MS = 10;  // desired debounce delay in milliseconds
   parameter CTRBITS = $clog2(DEBOUNCE_MS*CLKFREQ/1000);
   
   logic pb_q1, pb_q2, pb_edge, carry;
   logic [CTRBITS:0] count;  // use extra bit as carry out

   assign carry = count[CTRBITS];

   always_ff @(posedge clk)
     begin
	pb_q1 <= pb;
	pb_q2 <= pb_q1;
	if (carry) pb_debounced <= pb_q2;
     end

   assign pb_edge = pb_q1 ^ pb_q2;  // rising or falling edge on pb

   always_ff @(posedge clk)
     if (pb_edge) count <= '0;
     else if (!carry) count <= count + 1;

endmodule // debounce
