`timescale 1ns/1ns

module hc157_tb ();

    reg [3:0] A_tb;
    reg [3:0] B_tb;
    reg       Enable_tb;
    reg       Select_tb;

    wire [3:0] Out_tb;

    hc157_mux my_mux (
        .A(A_tb), 
        .B(B_tb), 
        .Enable(Enable_tb), 
        .Select(Select_tb), 
        .Out(Out_tb)
    );

    initial begin
        $dumpfile("timing_result.vcd");
        $dumpvars(0,hc157_tb);

        A_tb = 4'b0010;
        B_tb = 4'b0001;
        Select_tb = 0;
        Enable_tb = 0;

        #25

        Select_tb = 1;

        #25

        Enable_tb = 1;

        #25

        Enable_tb = 0;

        #25

        $finish;
    end
endmodule            