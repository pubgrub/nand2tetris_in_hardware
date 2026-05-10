`timescale 1ns/1ns

module hc32_or (
    input wire [3:0] A,
    input wire [3:0] B,
    output wire [3:0] Out
);

    assign #10 Out = A | B;

endmodule