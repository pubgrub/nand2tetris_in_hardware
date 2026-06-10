`timescale 1ns/1ns

module pc (
    input logic [15:0] In,
    input logic [0:0] Load,
    input logic [0:0] Reset,
    input logic [0:0] Clk,
    
    output logic [15:0] Out
);


    wire [15:0] Register_In;
    wire [15:0] Register_Out;
    wire [15:0] Inc_Out;

register_16bit my_register (
    .D(Register_In),
    .Q(Register_Out),
    .Enable(1'b0),
    .Clk(Clk)
);

adder_16bit inc (
    .A(Register_Out),
    .B(16'b1),
    .Cin(1'b0),
    .Sum(Inc_Out)
);

mux_16bit mux (
    .A(Inc_Out),
    .B(In),
    .Select(Load),
    .Enable(Reset),
    .Out(Register_In)
);

assign Out = Register_Out;


endmodule