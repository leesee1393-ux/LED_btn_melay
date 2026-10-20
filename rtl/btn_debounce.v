`timescale 1ns / 1ps
module btn_debounce(input clk,input btn,input reset,output reg clean_btn);
reg [4:0] r_counter=0;
reg r_btn_prev=0;
always @(posedge clk or posedge reset) begin
 if(reset) begin r_counter<=0; r_btn_prev<=0; clean_btn<=0; end
 else if(btn!=r_btn_prev) begin r_counter<=0; r_btn_prev<=btn; end
 else if(r_counter==19) begin clean_btn<=r_btn_prev; r_counter=0; end
 else r_counter<=r_counter+1;
end
endmodule
