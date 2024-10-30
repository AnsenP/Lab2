`timescale 1ns/1ns
module tb_Counter();

reg sys_clk;
reg sys_rst_n;

wire led_out;
wire cnt;

 initial begin
 sys_clk = 1'b1;
 sys_rst_n <= 1'b0;
 #20
 sys_rst_n <= 1'b1;
 end


 always #10 sys_clk = ~sys_clk;

 Counter
 #(
 .CNT_MAX (25'd24 ) 
 )
 Counter_inst(
 .sys_clk (sys_clk ), 
 .sys_rst_n (sys_rst_n ), 
 .led_out (led_out ) ,
 .cnt (cnt)
 );

 endmodule