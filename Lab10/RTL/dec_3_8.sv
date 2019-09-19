`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////



module dec_3_8(input logic mode, rs_en, input logic [2:0] a, output logic [7:0] an_l);

always_comb
//pulse monitor
   if(mode)
   begin
    case(a)
        3'd0: an_l = 8'b11111110;
        3'd1: an_l = 8'b11111101;
        3'd2: an_l = 8'b11111011;
        //3'd3: an_l = 8'b11110111;
//        3'd4: an_l = 8'b11101111;
//        3'd5: an_l = 8'b11011111;
//        3'd6: an_l = 8'b10111111;
//        3'd7: an_l = 8'b01111111;

        default: an_l = 8'b11111111;
     endcase
    end
   //reaction timer
   else
   begin
      case(a)
         3'd0: an_l = 8'b11111110;
         3'd1: an_l = 8'b11111101;
         3'd2: an_l = 8'b11111011;
         3'd3: an_l = 8'b11110111;
         default: an_l = 8'b11111111;
      endcase
    if(~rs_en) an_l = 8'b11111111;
   end
        
endmodule
