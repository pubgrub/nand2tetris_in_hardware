`timescale 1ns/1ns

module xor_16bit (
    input wire [15:0] A,
    input wire [15:0] B,
    output wire [15:0] Out
);

hc86_xor my_xor[3:0] (
    .A(A),
    .B(B),
    .Out(Out)
);

endmodule