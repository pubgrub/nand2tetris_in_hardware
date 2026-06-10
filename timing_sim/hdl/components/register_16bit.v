`timescale 1ns/1ns

module register_16bit (
    input wire [15:0] D,
    input wire Clk,
    input wire Enable,
    output wire [15:0] Q
);

hc377_register my_register[1:0] (
    .In(D),
    .Clk({2{Clk}}),
    .Enable({2{Enable}}),
    .Out(Q)
);

endmodule