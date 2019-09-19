`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2018 01:18:50 PM
// Design Name: 
// Module Name: Health_Monitor
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


module Health_Monitor(input logic clk_100MHz, rst, pulse_in, start, enter, mode, output logic[7:0] an_l, output logic[6:0] segs_l, output logic dp, led_r, led_g, led_b);
logic sclk, start_debounced, start_pulsed, enter_debounced, enter_pulsed, rs_en;
logic[3:0] d0, d1, d2, d3, pd0, pd1, pd2, pd3;
logic[15:0] timerOutput, monitorOutput, d;

clkdiv #(.DIVFREQ(1000)) U_CLKDIV(.clk(clk_100MHz), .reset(1'b0), .sclk(sclk));
//start
debounce debouncerSTART(.clk(sclk) , .pb(start), .pb_debounced(start_debounced)); 
single_pulser pulserSTART ( .clk(sclk), .din(start_debounced), .d_pulse(start_pulsed)); 
   //enter
debounce debouncerENTER(.clk(sclk) , .pb(enter), .pb_debounced(enter_debounced)); 
single_pulser pulserENTER ( .clk(sclk), .din(enter_debounced), .d_pulse(enter_pulsed)); 

pulse_monitor monitor(.pulse_in(pulse_in), .clk(sclk) , .rst(rst), .pd0, .pd2, .pd1, .pd3);

reaction_timer reactTime(.start(start_pulsed), .enter(enter_pulsed), .clk(sclk), .rst,  .led_r, .led_g, .led_b, .rs_en, .d0, .d1, .d2, .d3);
assign timerOutput = {d3, d2, d1, d0};
assign monitorOutput = {pd3, pd2, pd1, pd0};

mux_16bit mux(.react(timerOutput), .pulse(monitorOutput), .mode, .d);

sevenseg_control segControl(.clk(sclk), .rst, .mode, .rs_en, .d0(d[3:0]), .d1(d[7:4]), .d2(d[11:8]), .d3(d[15:12]),.d4(4'b0), .d5(4'b0), .d6(4'b0), .d7(4'b0), .an_l(an_l), .segs_l(segs_l), .dp(dp));
endmodule
