`timescale 1ns/1ns

module mux_16bit_tb ();

    reg [15:0] A_tb;
    reg [15:0] B_tb;
    reg        Select_tb;
    reg        Enable_tb;

    wire [15:0] Out_tb;

    mux_16bit my_mux (
        .A(A_tb),
        .B(B_tb), 
        .Select(Select_tb), 
        .Enable(Enable_tb), 
        .Out(Out_tb)
    );

    initial begin
        $dumpfile("timing_result.vcd");
        $dumpvars(0,mux_16bit_tb);

        A_tb = 16'b0000_1111_0000_1111;
        B_tb = 16'b0101_0101_0101_0101;
        Enable_tb = 0;
        Select_tb = 0;

        #50

        Select_tb = 1;

        #50

        Enable_tb = 1;

        #50

        Select_tb = 0;
        Enable_tb = 0;

        #50

        $finish;
    end
endmodule
