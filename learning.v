module learning;

reg clock, reset;

initial begin
    clock=0;
    reset=1;
    #10 reset=0;
    
end

initial begin
    forever begin
    
    #5 clock<=~clock;

    end
end

initial 
    begin 
        $monitor($time, 
        " Value of signals clock = %b reset = %b", clock,reset);
        #15 $finish;
    end


endmodule       
    

