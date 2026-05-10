`timescale 1ns/1ns

module and_16bit (
    input wire [15:0] A,
    input wire [15:0] B,
    output wire [15:0] Out
);

hc08_and my_and[3:0] (
    .A(A),
    .B(B),
    .Out(Out)
);

endmodule