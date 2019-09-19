`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2018 03:15:38 PM
// Design Name: 
// Module Name: random_wait
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


module random_wait(input logic clk, rst, start_wait, output logic wait_done);

logic[2:0] random_num, random_saved;
logic[3:0]  adder_rand;
logic[13:0] wait_cycles, delay_cycles;

always_ff @ (posedge clk)
   if(rst) random_num <= 3'd0;
   else if(start_wait)
         begin
            random_saved <= random_num;
            delay_cycles <= 14'd0;
         end
   else
         begin 
            random_num <= random_num + 1;
            delay_cycles <= delay_cycles + 1;
          end
    
always_comb
      begin
         adder_rand = random_saved + 3'd1;   
         wait_cycles = adder_rand << 10;
      end
  
assign wait_done = (delay_cycles == wait_cycles);

endmodule
