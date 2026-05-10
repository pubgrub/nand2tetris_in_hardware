`timescale 1ns/1ns

module hc04_not (
    input wire [5:0] In,
    output wire [5:0] Out
);

    assign #9 Out = ~In;

endmodule