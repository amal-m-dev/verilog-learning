module example3 (
    
);
    reg [2:0] a;
    initial begin
        $monitor($time, " value of a=%b",a);
        #3 a = 3'd5;
        a <= #2 3'd0;
        a <= #10 3'd7;
    end
endmodule