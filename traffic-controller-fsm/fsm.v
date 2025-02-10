`define TRUE 1'b1
`define FALSE 1'b0

`define y2rdel 3 
`define r2gdel 2

module fsm(
    hw, cn, X, clk, rst
);
    
    output reg [1:0] hw, cn;
    input X, clk, rst;
    parameter  RED=2'd0, YELLOW=2'd1, GREEN=2'd2;

    parameter s0=3'd0, s1=3'd1, s2=3'd2, s3=3'd3, s4=3'd4;

    reg [2:0] state;
    reg [2:0] next_state;

    always @(posedge clk) begin
        if(rst)
            state <= s0;
        else
            state <= next_state;
    end


    always @(state) 
    begin
        hw=GREEN;
        cn=RED;
        case (state)
            s0:;
            s1:hw=YELLOW;
            s2:hw=RED;
            s3:begin
                hw=RED;
                cn=GREEN;
            end
            s4:begin
                hw=RED;
                cn=YELLOW;
            end 
        endcase
    end

    always @(state or X) begin
        case (state)
            s0: if(X)
                next_state = s1;
            else
                next_state = s0;
            s1: begin
                repeat(`y2rdel) @(posedge clk)
                next_state = s2;
                end
            s2: begin
                repeat(`r2gdel) @(posedge clk)
                next_state = s3;
                end
            s3: if(X)
                    next_state = s3;
                else
                    next_state = s4;
            s4: begin
                repeat(`y2rdel) @(posedge clk)
                next_state = s0;
                end
            default: next_state = s0; 
        endcase
    end




endmodule