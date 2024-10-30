module running_light
#(
parameter CNT_MAX = 25'd24_999_999
)
(
input wire sys_clk , 
input wire sys_rst_n , 
output reg [24:0] cnt,
output reg cnt_max_flag,
output reg [3:0] led_out_reg,
output wire [3:0] led_out 

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
    cnt_max_flag <= 1'b0;
     end
       else if(cnt == CNT_MAX - 1) begin
        cnt_max_flag <= 1'b1;
         end
           else begin
            cnt_max_flag <= 1'b0;
              end
end
 
 always@(posedge sys_clk or negedge sys_rst_n) begin
   if(sys_rst_n == 1'b0) begin
     led_out_reg <= 4'b0001;
	   end
        else if(cnt_max_flag == 1'b1 && led_out_reg == 4'b1000) begin
          led_out_reg <= 4'b0001;
			  end
             else if(cnt_max_flag == 1'b1) begin
               led_out_reg <= led_out_reg << 1'b1;
				    end
end 

 assign led_out = ~led_out_reg;

 endmodule