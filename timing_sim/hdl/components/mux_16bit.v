`timescale 1ns/1ns

module mux_16bit (
    input wire [15:0] A,
    input wire [15:0] B,
    input wire Select,
    input wire Enable,
    output wire [15:0] Out
);

hc157_mux my_mpx[3:0] (
    .A(A),
    .B(B),
    .Select(Select),
    .Enable(Enable),
    .Out(Out)
);

endmodule