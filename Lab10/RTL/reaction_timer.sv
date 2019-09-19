`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2018 03:11:23 PM
// Design Name: 
// Module Name: reaction_timer
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


module reaction_timer( input logic start, enter, clk, rst, output logic led_r, led_g, led_b, rs_en, output logic[3:0] d0, d1, d2, d3);
    //rgb_r, rgb_g, rgb_b
    logic rwait_done, wait5_done, start_rwait, start_wait5, time_late, time_clr, time_en;
    logic [2:0] color_r, color_g, color_b;
    reaction_fsm reactionControl(.start, .enter, .rwait_done, .wait5_done, .time_late, .rst, .clk, 
                         .start_rwait, .start_wait5, .time_clr, .time_en, .rs_en, 
                          .color_r, .color_g, .color_b );
    random_wait rwait(.clk,.rst, .start_wait(start_rwait), .wait_done(rwait_done));
    delay_counter_react delayCount(.clk, .start_wait5, .delay_done(wait5_done));
    time_count timer(.time_clr, .time_en, .clk, .d0, .d1, .d2, .d3, .time_late);
    rgb_pwm ledControl(.clk, .rst, .color_r, .color_g, .color_b, .rgb_r(led_r), .rgb_g(led_g), .rgb_b(led_b));
    
endmodule
