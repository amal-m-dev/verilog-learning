module learning;
`define S $stop;


reg clock, reset;

initial
    begin 
        clock = 0; 
        reset = 1; 
        #100 `S; // This will suspend the simulation at time = 100 
        #900 $finish; // This will terminate the simulation at time = 1000 
    end 

endmodule       
    

