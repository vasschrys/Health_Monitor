`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2018 01:45:23 PM
// Design Name: 
// Module Name: pulse_counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module pulse_counter(input logic enb, clk, clr, output logic [3:0] q);
    always_ff @ (posedge clk)
        if (clr) q <=0; 
        else if (enb) q<=q+1; 
        
endmodule
