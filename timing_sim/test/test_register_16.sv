`timescale 1ns/1ns

module register_tb();

    logic [0:0] Enable_tb;
    logic [0:0] Clk;
    logic [15:0] D;
    logic [15:0] Q;
    
    register_16bit my_register (
        .D(D),
        .Q(Q),
        .Enable(Enable_tb),
        .Clk(Clk)
    );

    // Clock
    initial begin 
        Clk = 0;
        forever #20 Clk = ~Clk;
    end

    // Test
    initial begin
        $dumpfile("timing_result.vcd");
        $dumpvars(0,register_tb);

        Enable_tb = 0;
        D = 16'h0000;
        @(posedge Clk);
        #20

        Enable_tb = 1;
        #10

        // Test 1
        $display("Test1: Enable = 1");
        D = 16'hAA00;
        @(posedge Clk);
        #20

        if (Q !== 16'h0000) $display("Fehler: Register hat sich ohne Enable geändert");

        //Test 2
        $display("Test 2: Enable = 0, Daten werden geladen");
        Enable_tb = 0;
        D = 16'h5500;
        @(posedge Clk);
        #20
        if (Q !== 16'h5500) $display("Fehler: Wert nicht korrekt geladen");

        //Test 3
        $display("Test 3: Wert halten");
        Enable_tb = 1;
        D = 16'h6600;
        @(posedge Clk);
        #20

        if(Q !== 16'h5500) $display("Fehler: Ausgang hat sich geändert");
        #20

        $finish;

    end


endmodule