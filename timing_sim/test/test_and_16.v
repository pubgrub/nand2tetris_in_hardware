`timescale 1ns/1ns

module and_16bit_tb ();

    reg [15:0] A_tb;
    reg [15:0] B_tb;

    wire [15:0] Out_tb;

    and_16bit my_and (
        .A(A_tb),
        .B(B_tb), 
        .Out(Out_tb)
    );

    initial begin
        $dumpfile("timing_result.vcd");
        $dumpvars(0,and_16bit_tb);

        A_tb = 16'b0000_1100_0000_0011;
        B_tb = 16'b0101_0101_0101_0101;

        #25

        B_tb = 16'b0000_0000_0000_0000;

        #25

        B_tb = 16'b1111_1111_1111_1111;

        #25

        $finish;
    end
endmodule
