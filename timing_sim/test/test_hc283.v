`timescale 1ns/1ns

module hc283_tb ();

    reg  [3:0] A_tb;
    reg  [3:0] B_tb;
    reg        Cin_tb;

    wire [3:0] Sum_tb;
    wire       Cout_tb;

    hc283_adder my_adder (
        .A(A_tb), .B(B_tb), .Cin(Cin_tb), .Sum(Sum_tb), .Cout(Cout_tb)
    );


    
    initial begin
        $dumpfile("timing_result.vcd");
        $dumpvars(0, hc283_tb);

        A_tb = 4'b0001;
        B_tb = 4'b0010;
        Cin_tb = 0;

        #50;

        A_tb = 4'b1111;
        B_tb = 4'b0001;
        Cin_tb = 0;

        #50

        $finish;


    end

endmodule