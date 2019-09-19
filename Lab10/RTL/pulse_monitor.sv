`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2018 02:31:45 PM
// Design Name: 
// Module Name: pulse_monitor
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


module pulse_monitor(input logic pulse_in, clk, rst, output logic [3:0] pd3, pd2, pd1, pd0);

logic pulse_enb;  
logic clear; 
logic [3:0] q0, q1, q2, q; //registers
logic [4:0] adder1; 
logic [5:0] adder2; 
logic [7:0] bpm_final; 
    assign pd3 = 4'b0;
    single_pulser pulser(.clk(clk), .din(pulse_in), .d_pulse(pulse_enb)); 
    delay_counter d_counter(.clk(clk), .delay_done(clear)); 
    pulse_counter pcounter(.enb(pulse_enb), .clk(clk), .clr(clear), .q(q));
 
 //registers 
    always_ff @ (posedge clk)
    if(rst)
        begin
            q2 <=0;  
            q1 <=0;  
            q0 <=0; 
        end
     else if(clear)
        begin
            q0 <=q1;
            q1 <=q2; 
            q2 <=q;
        end
//adders      
    always_comb
        begin
         adder1 = q0 + q1; 
         adder2 = adder1 + q2; 
        end
        
    convert_to_bpm convert(.bps(adder2), .bpm(bpm_final)); 
    binary_to_bcd binary2bcd (.b(bpm_final), .hundreds(pd2), .tens(pd1), .ones(pd0)); 
endmodule
