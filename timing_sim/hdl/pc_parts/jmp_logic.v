`timescale 1ns/1ns

module jmp_logic (
    input wire [0:0] Zero,
    input wire [0:0] Negative,
    input wire [15:0] Instruction,

    output wire [0:0] Jmp
    );

wire [3:0] and_a_in;
wire [3:0] and_b_in;
wire [3:0] and_out;
wire [3:0] or_a_in;
wire [3:0] or_b_in;
wire [3:0] or_out;
wire [5:0] not_in;
wire [5:0] not_out;


hc08_and my_and (
.A(and_a_in),
.B(and_b_in),
.Out(and_out)
);   

hc32_or my_or (
.A(or_a_in),
.B(or_b_in),
.Out(or_out)
);

hc04_not my_not (
.In(not_in),
.Out(not_out)
);

// jmp zero

assign and_a_in[0] = Zero;
assign and_b_in[0] = Instruction[1];

// jmp negative

assign and_a_in[1] = Negative;
assign and_b_in[1] = Instruction[2];

// jmp positive

assign or_a_in[0] = Zero;
assign or_b_in[0] = Negative;

assign not_in[0] = or_out[0];

assign and_a_in[2] = not_out[0];
assign and_b_in[2] = Instruction[0];

// alles or-en

assign or_a_in[1] = and_out[0];
assign or_b_in[1] = and_out[1];

assign or_a_in[2] = or_out[1];
assign or_b_in[2] = and_out[2];

// nur wenn C-Instruction

assign and_a_in[3] = or_out[2];
assign and_b_in[3] = Instruction[15];

assign Jmp = and_out[3];


endmodule