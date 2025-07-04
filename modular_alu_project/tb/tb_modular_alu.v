`timescale 1ns / 1ps

module tb_modular_alu;

    reg [31:0] A, B, M;
    reg [3:0] op;
    wire [31:0] R;

    modular_alu_ext #(.WIDTH(32)) dut (
        .op(op),
        .A(A),
        .B(B),
        .M(M),
        .R(R)
    );

    initial begin
        $dumpfile("modular_alu.vcd");
        $dumpvars(0, tb_modular_alu);

        $monitor("%0dns\tOP=%04b\tA=%d\tB=%d\tM=%d\tR=%d", $time, op, A, B, M, R);

        // First test case
        M = 97;
        A = 45; B = 77;
        op = 4'b0000;
        repeat (12) begin
            #5;
            op = op + 1;
        end

        // Second test case
        A = 83; B = 29; M = 61;
        op = 4'b0000;
        repeat (12) begin
            #5;
            op = op + 1;
        end

        // Third test case
        A = 100; B = 10; M = 13;
        op = 4'b0000;
        repeat (12) begin
            #5;
            op = op + 1;
        end

        #5;
        $finish;
    end

endmodule
