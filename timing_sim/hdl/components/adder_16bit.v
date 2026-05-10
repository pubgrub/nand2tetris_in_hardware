`timescale 1ns/1ns

module adder_16bit (
    input wire [15:0] A,
    input wire [15:0] B,
    input wire Cin,
    output wire [15:0] Sum,
    output wire Cout
);


wire [4:0] C;

assign C[0] = Cin;
assign Cout = C[4];

hc283_adder my_adder[3:0] (
    .A(A),
    .B(B),
    .Cin(C[3:0]),
    .Sum(Sum),
    .Cout(C[4:1])
);

endmodule