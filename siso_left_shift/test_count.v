module tb_count_clk();
    reg clk;
    reg rst;
    wire sig;
    wire [1:0] count;

    // Instantiate the DUT (Device Under Test)
    count_clk uut (
        .clk(clk),
        .rst(rst),
        .sig(sig),
        .count(count)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #10 clk = ~clk;  // Clock period = 10 time units
    end

    // Stimulus
    initial begin
        $monitor("Time=%0t | clk=%b | rst=%b | count=%b | sig=%b", $time, clk, rst, count, sig);
        
        rst = 1;  // Assert reset
        #10 rst = 0;  // Deassert reset

        #50 rst = 1;  // Assert reset
        #10 rst = 0;  // Deassert reset

        #100 $finish;  // End simulation
    end
endmodule
