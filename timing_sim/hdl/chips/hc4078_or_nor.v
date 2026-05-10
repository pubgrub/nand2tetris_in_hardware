`timescale 1ns/1ns

module hc4078_or_nor (
    input wire [7:0] A,
    output wire  Or_Out,
    output wire  Nor_Out
);

    assign #12 Or_Out = |A;
    assign #12 Nor_Out = ~(|A);

endmodule