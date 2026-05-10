`timescale 1ns/1ns

module alu_tb ();

    reg   [15:0] D_tb;
    reg   [15:0] A_tb;
    reg   [15:0] I_tb;

    wire  [15:0] Out_tb;
    wire  [0:0]  Negative_tb;
    wire  [0:0]  Zero_tb;

    alu my_alu (
        .D_in(D_tb),
        .A_in(A_tb),
        .I(I_tb),
        .Out(Out_tb),
        .Negative( Negative_tb),
        .Zero( Zero_tb)
    );



    initial begin
        $dumpfile("timing_result.vcd");
        $dumpvars(0,alu_tb);

        D_tb = 16'd200;
        A_tb = 16'd10;

        // D + A
        I_tb = 16'b111_0_000010_000_000;

        #300

        // !D
        I_tb = 16'b111_0_110001_000_000;

        #300

        $finish;

    end

endmodule
        