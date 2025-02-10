module counter_tb;

    reg clk, rst;

    wire [3:0] q;

    counter DUT(q, clk, rst);

    initial begin
        clk=0;
        rst=1;
        forever begin
            #5 clk=~clk;
        end
    end 

    initial begin
        $monitor("Q=%b, clk=%b, rst=%b", q, clk, rst);
        #10 rst=0;
        #5 rst=1;
        #50 rst=0;
        #5 rst=1;
        #30 rst=0;
        #5 rst=1;
    end

    initial begin
        #200 $finish();
    end
endmodule