`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2018 03:16:18 PM
// Design Name: 
// Module Name: reaction_fsm
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


module reaction_fsm(input logic start, enter, rwait_done, wait5_done, time_late, rst, clk, 
                    output logic start_rwait, start_wait5, time_clr, time_en, rs_en, 
                    output logic [2:0] color_r, color_g, color_b );
                    
typedef enum logic [2:0] {
    IDLE = 3'b000, RWAIT = 3'b001, EARLY = 3'b010, TIME= 3'b011, DISPLAY = 3'b100, LATE = 3'b101
    }state_t; 
    
    state_t state, next; 
    
    always_ff @(posedge clk)
        if(rst) state <= IDLE; 
        else state <= next; 
     localparam logic [2:0] OFF = 3'b000, ON=3'b011; 
     
     always_comb 
        begin 
            color_r = OFF; 
            color_g = OFF; 
            color_b = OFF; 
            start_rwait = 0; 
            start_wait5 = 0; 
            rs_en = 0; 
            time_clr = 0;
            time_en = 0; 
            next = IDLE; 
            case(state)
                IDLE: 
                    begin
                        rs_en = 0;
                        color_r = OFF; 
                        color_g = OFF; 
                        color_b = OFF; 
                        if(start) 
                          begin
                            start_rwait = 1;
                            next <=RWAIT;
                          end 
                        else  next <=IDLE; 
                    end
               RWAIT:
                   begin 
                        color_r = OFF; 
                        color_g = OFF; 
                        color_b = OFF; 
                        rs_en = 0;
                        time_clr = 1; 
                        if (~enter && ~rwait_done) next <= RWAIT; 
                        else if(enter && ~rwait_done) next <= EARLY; 
                        else if(rwait_done)
                         begin
                           time_en = 1; 
                           next <= TIME; 
                         end
                   end
              EARLY:
                    begin 
                        start_wait5 = 1; 
                        color_r = ON; 
                        color_g = OFF; 
                        color_b = OFF;
                        if(wait5_done) next <= IDLE; 
                        else next <= EARLY; 
                    end
            TIME:
                    begin 
                        color_r = OFF; 
                        color_g = ON; 
                        color_b = OFF;
                        time_en = 1; 
                        if(time_late)  next <= LATE; 
                        else if(enter)
                            begin 
                                time_en =0; 
                                
                                next <= DISPLAY; 
                            end         
                        else 
                         next <= TIME; 
                         
                    end
            LATE:
                    begin 
                        start_wait5 =1; 
                        color_g = ON; 
                        color_b = OFF; 
                        color_r = ON;
                        if(wait5_done) next<= IDLE; 
                        else next <= LATE; 
                    end
            DISPLAY: 
                    begin 
                        color_r = OFF; 
                        color_g = ON; 
                        color_b = OFF;
                        start_wait5 = 1; 
                        rs_en = 1; 
                        if(wait5_done) next <= RWAIT; 
                        if(start) next <= RWAIT; 
                        else next <= DISPLAY; 
                    end
     endcase
   end         
endmodule
