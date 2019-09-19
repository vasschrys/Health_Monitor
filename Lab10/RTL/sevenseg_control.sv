`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2018 01:51:07 PM
// Design Name: 
// Module Name: sevenseg_control
// 
//////////////////////////////////////////////////////////////////////////////////


module sevenseg_control(input logic clk, rst, rs_en, mode, input logic [3:0] d0, d1, d2, d3, d4, d5, d6, d7, 
                        output logic [7:0] an_l, output logic [6:0] segs_l, output logic dp);
          logic [2:0]sel; 
          logic [3:0] y_2_data;
          
          always_comb
          if(sel ==3'd3 && ~mode) dp =0; 
            else dp =1; 
        
           
           
           count_3bit counter (.clk(clk), .rst(rst), .q(sel)); 
           dec_3_8 decoder (.mode(mode), .rs_en(rs_en), .a(sel), .an_l(an_l)); 
           mux_4bit mux (.d0(d0), .d1(d1), .d2(d2), .d3(d3), .d4(d4), .d5(d5), .d6(d6), .d7(d7), .s(sel), .y(y_2_data)); 
           sevenseg_hex sevenseg (.data(y_2_data), .segs_l(segs_l)); 

           
           
endmodule
