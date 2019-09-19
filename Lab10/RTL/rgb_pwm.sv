`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2018 03:16:38 PM
// Design Name: 
// Module Name: rgb_pwm
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


module rgb_pwm( input logic clk, rst, input logic[2:0] color_r, color_g, color_b, output logic rgb_r, rgb_g, rgb_b);
logic[3:0] count;

//assign rgb_r = 1; 
//assign rgb_g = 1; 
//assign rgb_b = 1; 

always_ff @ (posedge clk)
begin
   if(rst) count <= 0;
   else count <= count + 1;
   rgb_r <= {1'b0, color_r} > count;
   rgb_g <= {1'b0, color_g} > count;
   rgb_b <= {1'b0, color_b} > count;
   end
endmodule
