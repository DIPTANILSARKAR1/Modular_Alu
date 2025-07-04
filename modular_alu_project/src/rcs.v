module rcs #(parameter W=32)(input [W-1:0] a,b,output [W-1:0] d,output borrow);

    wire [W-1:0] b_inv;
    assign b_inv=~b;
    wire cout;
    rca #(W) add(a,b_inv,1'b1,d,cout);
    assign borrow=~cout;
endmodule