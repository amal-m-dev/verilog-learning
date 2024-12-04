module learning;

reg clock, reset;

initial
    begin 
        clock = 0; 
        reset = 1; 
        #100 $stop; // This will suspend the simulation at time = 100 
        #900 $finish; // This will terminate the simulation at time = 1000 
    end 

endmodule       
    

