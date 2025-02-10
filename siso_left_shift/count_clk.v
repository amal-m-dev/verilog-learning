module count_clk(
    input clk,
    input rst,
    output reg sig,
    output reg [1:0] count
);

    initial begin
        count=2'b00;
        sig=1'b1;
    end
    // Synchronous block for clock edge
    always @(posedge clk or posedge rst) begin  // Synchronous rst
        if (rst) begin
            count <= 2'b00;  // Reset count
            sig <= 1'b1;     // Reset signal
        end else if (count == 2'b11) begin
            count <= 2'b00;  // Reset count after 4 cycles
            sig <= 1'b1;     // Signal goes high after reset
        end else begin
            count <= count + 1'b1;  // Increment count
            sig <= (count < 2'b01) ? 1'b1 : 1'b0;  // Signal logic
        end
    end
endmodule
