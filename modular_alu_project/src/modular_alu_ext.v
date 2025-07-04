module modular_alu_ext #(parameter WIDTH=32)(
    input  [3:0] op,
    input  [WIDTH-1:0] A,B,M,
    output reg [WIDTH-1:0] R
);
wire [WIDTH-1:0] add_r,sub_r,mul_r,div_r;
mod_add_gate #(WIDTH) u0(A,B,M,add_r);
mod_sub_gate #(WIDTH) u1(A,B,M,sub_r);
mod_mul_gate #(WIDTH) u2(A,B,M,mul_r);
mod_div_gate #(WIDTH) u3(A,B,M,div_r);
always @(*) begin
    case(op)
        4'b0000:R=add_r;
        4'b0001:R=sub_r;
        4'b0010:R=mul_r;
        4'b0011:R=(B!=0)?A%B:0;
        4'b0100:R=(B!=0)?div_r:0;
        4'b0101:R=(B!=0)?pow(A,B,M):0;
        4'b0110:R=A&B;
        4'b0111:R=A|B;
        4'b1000:R=A^B;
        4'b1001:R=A<<B;
        4'b1010:R=A>>B;
        4'b1011:R=$signed(A)>>>B;
        default:R=0;
    endcase
end
function [WIDTH-1:0] pow;
    input [WIDTH-1:0] base,expn,mod;
    reg [WIDTH-1:0] p,res;
    integer j;
    begin
        p=base%mod;res=1;
        for(j=0;j<WIDTH;j=j+1) begin
            if(expn[j]) res=(res*p)%mod;
            p=(p*p)%mod;
        end
        pow=res;
    end
endfunction
endmodule
