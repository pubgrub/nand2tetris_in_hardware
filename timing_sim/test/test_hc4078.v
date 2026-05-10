`timescale 1ns/1ns

module hc4078_tb ();

    reg [7:0] A_tb;
    wire      Or_Out_tb;
    wire      Nor_Out_tb;

    hc4078_or_nor my_or_nor (
        .A(A_tb), 
        .Or_Out(Or_Out_tb),
        .Nor_Out(Nor_Out_tb)
    );

    initial begin
        $dumpfile("timing_result.vcd");
        $dumpvars(0,hc4078_tb);

        A_tb = 8'b0000_0000;

        #25

        A_tb = 8'b0000_1000;

        #25

        A_tb = 8'b1111_1111;

        #25

        $finish;
    end
endmodule            