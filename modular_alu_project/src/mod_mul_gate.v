module mod_mul_gate #(parameter W = 32)(
    input  [W-1:0] a, b, m,
    output [W-1:0] r
);
    reg  [W-1:0] acc, add_in;
    wire [W-1:0] add_out;
    reg  [W-1:0] a_shift;
    integer i;

    // single instance of modular adder
    mod_add_gate #(W) u_add (acc, add_in, m, add_out);

    always @(*) begin
        acc = 0;
        for (i = 0; i < W; i = i + 1) begin
            a_shift = a << i;
            add_in  = a_shift;
            if (b[i]) acc = add_out;   // accumulates modulo‑reduced sum
        end
    end
    assign r = acc;
endmodule
