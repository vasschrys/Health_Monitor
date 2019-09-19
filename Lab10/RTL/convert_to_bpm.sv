`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2018 01:47:13 PM
// Design Name: 
// Module Name: convert_to_bpm
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


module convert_to_bpm(input logic [5:0] bps, output logic [7:0] bpm);
    
    assign bpm = bps<<2; //shift left, and fill lower bits with 0
        
endmodule
