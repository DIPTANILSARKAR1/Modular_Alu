module mod_sub_gate #(parameter W=32)(input [W-1:0] a,b,m,output [W-1:0] r);
wire [W-1:0] d1,s1,d2;
wire b1;
rcs #(W) sub1(a,b,d1,b1);
rca #(W) add1(a,m,1'b0,s1,_);
rcs #(W) sub2(s1,b,d2,_);
genvar i;
generate
for(i=0;i<W;i=i+1) begin:sel
    assign r[i]=~b1?d1[i]:d2[i];
end
endgenerate
endmodule