module mod_div_gate #(parameter W = 32)(
    input  [W-1:0] a, b, m,
    output reg [W-1:0] r
);

integer i;
reg [W-1:0] inv;

function [W-1:0] addmod;
    input [W-1:0] x, y, modn;
    reg [W:0] sum;
    begin
        sum = x + y;
        addmod = (sum >= modn) ? sum - modn : sum;
    end
endfunction

always @(*) begin
    inv = 0;
    for (i = 1; i < m; i = i + 1)
        if (addmod(0, (i * b) % m, m) == 1)   // find inverse
            inv = i;

    r = addmod(0, (a * inv) % m, m);          // A * inv mod M
end

endmodule
