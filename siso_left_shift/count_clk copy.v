module count_clk(input clk, input rst, output reg sig, output reg[1:0] count);
    // reg[1:0] count;

    initial begin
        count=2'b00;
        sig=1'b1;
    end
    always @(posedge clk) begin
        if (count == 2'b11 || rst) begin
            count <= 2'b00;
            sig <= 1'b1;
        end
        
        else if(count >= 2'b01) begin
            sig <= 1'b0;
            count <= count+1'b1;   //negative for clk cycles > 2
        end
        else begin
            count <= count+1'b1;
               //positive for clk cycles <=2
        end
            
    end

endmodule