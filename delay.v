module D(out, a, b, c);

    input a, b, c;
    output out;

    wire e;

    and #(5) a1(e, a, b);
    and #(4) o1(out, e, c);

endmodule       
    


