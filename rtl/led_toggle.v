`timescale 1ns / 1ps
module led_toggle(input btn,input reset,output led);
reg r_toggle=1'b0;
always @(posedge btn or posedge reset) begin
 if(reset) r_toggle<=1'b0;
 else r_toggle<=~r_toggle;
end
assign led=r_toggle;
endmodule
