`timescale 1ns/1ns

module hc86_tb ();

    reg [3:0] A_tb;
    reg [3:0] B_tb;
    wire [3:0] Out_tb;

    hc86_xor my_xor (
        .A(A_tb), 
        .B(B_tb), 
        .Out(Out_tb)
    );

    initial begin
        $dumpfile("timing_result.vcd");
        $dumpvars(0,hc86_tb);

        A_tb = 4'b0110;
        B_tb = 4'b0011;

        #25

        B_tb = {4{1'b0}};

        #25

        B_tb = {4{1'b1}};

        #25

        $finish;
    end
endmodule            