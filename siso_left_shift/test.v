module siso();
  
  reg [3:0]tmp; 
  
  initial begin
    $monitor("tmp0= %b, tmp1= %b, tmp2= %b, tmp3= %b", tmp[0], tmp[1], tmp[2], tmp[3]);
    #1 tmp<=4'b0000;
    #1 tmp <= tmp << 1;
    tmp[0] <= 1'b1;
    #1 tmp <= tmp << 1;
    tmp[0] <= 1'b0;
    #1 tmp <= tmp << 1;
    tmp[0] <= 1'b1;
    #1 tmp <= tmp << 1;
    tmp[0] <= 1'b0;
    #3 $finish();
  end
  
endmodule