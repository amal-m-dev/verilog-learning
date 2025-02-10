module test_count (
    
);  
    reg clk=0;
    reg rst=0;
    wire sig;
    wire[1:0] cnt;
    count_clk dut(clk, rst, sig, cnt);

    always begin
        #5 clk=~clk;
    end

    initial begin
        $monitor("clk=%b, sig=%b, count=%b", clk, sig, cnt);
        // #50 $stop();
        #20 rst=1;
        rst=0;
        #100 $finish();
    end
endmodule