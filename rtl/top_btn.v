`timescale 1ns / 1ps
module top_btn(input clk,input reset,input btnU,input btnD,input sel,output [0:2] led);
wire w_btn,w_tick,w_clean_btn,w_led;
assign w_btn=(sel==1'b0)?btnD:btnU;
led_toggle u_led_toggle(.btn(w_clean_btn),.reset(reset),.led(w_led));
tick_generator u_tick_generator(.clk(clk),.reset(reset),.tick_1ms(w_tick));
btn_debounce u_btn_debounce(.clk(w_tick),.btn(w_btn),.reset(reset),.clean_btn(w_clean_btn));
assign led[0]=w_clean_btn;
assign led[1]=1'b0;
assign led[2]=w_led;
endmodule
