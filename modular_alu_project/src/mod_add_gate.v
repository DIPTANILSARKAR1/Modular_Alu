module mod_add_gate #(parameter W=32)(input [W-1:0] a,b,m,output [W-1:0] r);
wire [W-1:0] sum,diff;
wire borrow;
rca #(W) adder(a,b,1'b0,sum,_);
rcs #(W) sub(sum,m,diff,borrow);
genvar i;
generate
for(i=0;i<W;i=i+1) begin:sel
    assign r[i]=~borrow?diff[i]:sum[i];
end
endgenerate
endmodule