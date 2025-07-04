module rca #(parameter W=32)(input [W-1:0] a,b,input cin,output [W-1:0] s,output cout);
wire [W:0] c;
assign c[0]=cin;
genvar i;
generate
for(i=0;i<W;i=i+1) begin:loop
    fa u(a[i],b[i],c[i],s[i],c[i+1]);
end
endgenerate
assign cout=c[W];
endmodule
