`timescale 1ns/1ns
module tb_running_light();

wire [3:0] led_out ;
wire [3:0] led_out_reg;

wire [24:0] cnt;
wire cnt_max_flag;
 reg sys_clk ;
 reg sys_rst_n ;

 initial begin
 sys_clk = 1'b1;
 sys_rst_n <= 1'b0;
 #20
 sys_rst_n <= 1'b1;
 end


 always #10 sys_clk = ~sys_clk;

running_light
 #(
 .CNT_MAX (25'd24)
 )
 running_light_inst
 (
 .sys_clk (sys_clk ), 
 .sys_rst_n (sys_rst_n ), 
 .cnt(cnt),
 .cnt_max_flag(cnt_max_flag),
 .led_out_reg(led_out_reg),
 .led_out (led_out )
 );

 endmodule