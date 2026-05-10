`timescale 1ns/1ns

module hc86_xor (
    input wire [3:0] A,
    input wire [3:0] B,
    output wire [3:0] Out
);

    assign #11 Out = A ^ B;

endmodule