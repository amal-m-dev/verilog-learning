module siso(si,clk,rst,so);
  input si,clk,reset;
  output so;
  reg [3:0]q; 
  
  always@(posedge clk)
    begin
      if(~rst)
        q<=4'b0000;
      else
        q <= q<<si;
      	so=q[3];
    end
  
endmodule