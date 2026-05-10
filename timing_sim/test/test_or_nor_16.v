`timescale 1ns/1ns

module or_nor_16bit_tb ();

    reg [15:0] A_tb;
    wire      Or_Out_tb;
    wire      Nor_Out_tb;

    or_nor_16bit my_or_nor (
        .A(A_tb), 
        .Or_Out(Out_tb),
        .Nor_Out(Nor_Out_tb)
    );

    initial begin
        $dumpfile("timing_result.vcd");
        $dumpvars(0,or_nor_16bit_tb);

        A_tb = {16{1'b0}};

        #25

        A_tb = 16'b0000_0000_1000_0000;

        #25

        A_tb = {16{1'b1}};

        #25

        $finish;
    end
endmodule            