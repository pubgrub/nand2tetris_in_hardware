`timescale 1ns/1ns

module hc377_tb();

    logic [0:0] Enable_tb;
    logic [0:0] Clk_tb;
    logic [7:0] In_tb;
    logic [7:0] Out_tb;
    
    hc377_register my_register (
        .In(In_tb),
        .Out(Out_tb),
        .Enable(Enable_tb),
        .Clk(Cin_tb)
    );

    initial begin 
        Clk_tb = 0;
        forever #20 Clk_tb = ~Clk_tb;
    end

endmodule