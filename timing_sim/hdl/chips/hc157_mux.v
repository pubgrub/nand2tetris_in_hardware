`timescale 1ns/1ns

module hc157_mux (
    input wire [3:0] A,
    input wire [3:0] B,
    input wire Enable,
    input wire Select,
    output wire [3:0] Out
);

    assign #12 Out = (!Enable) ? (Select ? B : A) : 4'b0000;

endmodule