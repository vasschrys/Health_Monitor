`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2018 03:29:50 PM
// Design Name: 
// Module Name: mux_16bit
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


module mux_16bit(input logic [15:0] react, pulse, input logic mode, output logic[15:0] d);

    always_comb
    case(mode)
        1'd0 : d = react; 
        1'd1 : d = pulse; 
       
        default : d = 16'd0; 
  endcase
    
endmodule
