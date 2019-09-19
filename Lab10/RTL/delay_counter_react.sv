`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2018 01:46:17 PM
// Design Name: 
// Module Name: delay_counter
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


module delay_counter_react(input logic clk, start_wait5, output logic delay_done);

logic [12:0] count; 
    always_ff @ (posedge clk)
    if(start_wait5)
    begin
        count <= count+1; 
        if(count == 13'd5000) 
          begin
             delay_done <= 1; 
             count <=0; 
          end
        else delay_done <= 0; 
    end
        
  
endmodule
