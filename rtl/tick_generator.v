`timescale 1ns / 1ps
module tick_generator(input clk,input reset,output reg tick_1ms);
reg [$clog2(100000)-1:0] r_counter=0;
always @(posedge clk) begin
 if(reset) begin tick_1ms<=0; r_counter<=0; end
 else if(r_counter==100000-1) begin r_counter<=0; tick_1ms<=~tick_1ms; end
 else r_counter<=r_counter+1;
end
endmodule
