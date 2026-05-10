`timescale 1ns/1ns

module adder_16bit_tb ();

    reg [15:0] A_tb;
    reg [15:0] B_tb;
    reg        Cin_tb;

    wire [15:0] Sum_tb;
    wire        Cout_tb;

    adder_16bit my_adder (
        .A(A_tb), .B(B_tb), .Cin(Cin_tb), .Sum(Sum_tb), .Cout(Cout_tb)
    );

    initial begin
        $dumpfile("timing_result.vcd");
        $dumpvars(0,adder_16bit_tb);

        A_tb = 16'd20000;
        B_tb = 16'd356;
        Cin_tb = 0;

        #500

        $finish;
    end
endmodule
