`timescale 1ns/1ns

module alu (
    input wire [15:0] D_in,
    input wire [15:0] A_in,
    input wire [15:0] I, // instruction

    output wire [15:0] Out,
    output wire [0:0]  Negative,
    output wire [0:0]  Zero    
);

    wire [15:0] D_zero_out;
    wire [15:0] D_neg_out;
    wire [15:0] A_zero_out;
    wire [15:0] A_neg_out;
    wire [15:0] Func_and_out;
    wire [15:0] Func_add_out;
    wire [15:0] Func_out;
    wire [15:0] Func_neg_out;
    wire [0:0]  Zero_Nor_Out_1;
    wire [0:0]  Zero_Nor_Out_2;
    wire [3:0]  Func_zero_and_out;


    

// Path correlation in Logisim

// x -> D-Register -> Path D
// y -> A-Register -> Path A


// Path D

mux_16bit mux_D_zero (
    .A(D_in),
    .B({16{1'b0}}),
    .Select(1'b0),
    .Enable(I[11]),
    .Out(D_zero_out)
);

xor_16bit xor_D_neg (
    .A(D_zero_out),
    .B({16{I[10]}}),
    .Out(D_neg_out)
);


// Path A

mux_16bit mux_A_zero (
    .A(A_in),
    .B({16{1'b0}}),
    .Select(1'b0),
    .Enable(I[9]),
    .Out(A_zero_out)
);

xor_16bit xor_A_neg (
    .A(A_zero_out),
    .B({16{I[8]}}),
    .Out(A_neg_out)
);

// function AND / ADDER

and_16bit and_ab (
    .A(D_neg_out),
    .B(A_neg_out),
    .Out(Func_and_out)
);

adder_16bit add_ab (
    .A(D_neg_out),
    .B(A_neg_out),
    .Cin(1'b0),
    .Sum(Func_add_out)
);

mux_16bit func_add_and(
    .A      (Func_and_out),
    .B      (Func_add_out),
    .Select (I[7]),
    .Enable (1'b0),
    .Out    (Func_out)
);

xor_16bit func_neg_xor(
    .A   (Func_out),
    .B   ({16{I[6]}}),
    .Out (Func_neg_out)
);

// zero calc

hc4078_or_nor func_zero_nor_1(
    .A       (Func_neg_out[7:0]),
    .Nor_Out (Zero_Nor_Out_1)
);

hc4078_or_nor func_zero_nor_2(
    .A       (Func_neg_out[15:8]),
    .Nor_Out (Zero_Nor_Out_2)
);

hc08_and func_zero_and(
    .A   ({3'b0, Zero_Nor_Out_1}),
    .B   ({3'b0, Zero_Nor_Out_2}),
    .Out (Func_zero_and_out)
);



assign Out = Func_neg_out;
assign Zero = Func_zero_and_out[0];
assign Negative = Out[15];

endmodule
