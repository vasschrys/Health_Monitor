`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2018 03:10:22 PM
// Design Name: 
// Module Name: time_count
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


module time_count(input logic time_clr, time_en, clk, output logic [3:0] d0, d1, d2, d3, output logic time_late);
    
    bcd_counter_top bcd_timer( .en(time_en), .rst(time_clr), .clk(clk), .time_late(time_late), .d0(d0), .d1(d1), .d2(d2), .d3(d3));

endmodule
