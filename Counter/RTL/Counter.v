module Counter
#(
parameter CNT_MAX = 25'd24_999_999
 )
 (
 input wire sys_clk , 
 input wire sys_rst_n , 
 output reg led_out,
 output reg [24:0] cnt
 );

  
  always@(posedge sys_clk or negedge sys_rst_n) begin
    if(sys_rst_n == 1'b0) begin
      cnt <= 25'b0;
        end
         else if(cnt == CNT_MAX) begin
          cnt <= 25'b0;
            end
              else begin
                cnt <= cnt + 1'b1;
                  end
  end


  always@(posedge sys_clk or negedge sys_rst_n) begin
    if(sys_rst_n == 1'b0) begin
       led_out <= 1'b0;
        end
          else if(cnt == CNT_MAX) begin
            led_out <= ~led_out;
              end
  end
 endmodule
