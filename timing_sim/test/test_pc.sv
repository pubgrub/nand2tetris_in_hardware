`timescale 1ns/1ns

module pc_tb();

    logic [0:0] Reset_tb;
    logic [0:0] Jmp_tb;
    logic [0:0] Clk_tb;

    logic [15:0] In_tb;
    logic [15:0] Out_tb;
    
    pc my_pc (
        .In(In_tb),
        .Load(Jmp_tb),
        .Reset(Reset_tb),
        .Clk(Clk_tb),
        .Out(Out_tb)
    );

    // Clock
    initial begin 
        Clk_tb = 0;
        forever #50 Clk_tb = ~Clk_tb;
    end

    // Test
    initial begin
        $dumpfile("timing_result.vcd");
        $dumpvars(0,pc_tb);

        #40
        Reset_tb = 1;
        Jmp_tb = 0;        
        #200
        Reset_tb = 0;

        #500

        Reset_tb = 1;
        #100

        Reset_tb = 0;
        #300

        In_tb = 16'h1234;
        #200

        @(posedge Clk_tb);
        #5
        Jmp_tb = 1;
        @(posedge Clk_tb);
        #5
        Jmp_tb = 0;

        #500
        $finish;

    end


endmodule