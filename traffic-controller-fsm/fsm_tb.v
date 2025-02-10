module fsm_tb;
    reg clk, rst, x;
    wire [1:0] hw,cn;

    fsm dut(hw, cn, x, clk, rst);

    initial begin
        clk=0;
        rst=1;
        forever begin
            #5 clk=~clk;
        end
    end

    initial begin
        $monitor("input=%b, highway=%b, country=%b, rst=%b, clk=%b",x,hw,cn,rst, clk);
        
        #10 x=1'b1;
        #30 x=1'b0;

        // #20 rst=1;
        // #5 rst=0;
        #10 x=1'b1;
        #30 x=1'b0;

        #10 $finish();
    end
endmodule