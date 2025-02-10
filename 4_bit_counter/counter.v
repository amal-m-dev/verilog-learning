module counter (Q, clk, rst);
    
    output reg[3:0] Q;
    input wire clk, rst;

    always@(posedge clk or negedge rst)
    begin
        if (!rst)
            Q <= 4'd0;
        else
            Q <= Q + 1'd1;
    end


endmodule