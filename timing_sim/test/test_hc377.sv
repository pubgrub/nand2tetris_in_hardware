`timescale 1ns/1ns

module hc377_tb();

    logic [0:0] Enable_tb;
    logic [0:0] Clk;
    logic [7:0] D;
    logic [7:0] Q;
    
    hc377_register my_register (
        .In(D),
        .Out(Q),
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
        $dumpvars(0,hc377_tb);

        Enable_tb = 0;
        D = 8'h00;
        @(posedge Clk);
        #20

        Enable_tb = 1;
        #10

        // Test 1
        $display("Test1: Enable = 1");
        D = 8'hAA;
        @(posedge Clk);
        #20

        if (Q !== 8'h00) $display("Fehler: Register hat sich ohne Enable geändert");

        //Test 2
        $display("Test 2: Enable = 0, Daten werden geladen");
        Enable_tb = 0;
        D = 8'h55;
        @(posedge Clk);
        #20
        if (Q !== 8'h55) $display("Fehler: Wert nicht korrekt geladen");

        //Test 3
        $display("Test 3: Wert halten");
        Enable_tb = 1;
        D = 8'h66;
        @(posedge Clk);
        #20

        if(Q !== 8'h55) $display("Fehler: Ausgang hat sich geändert");
        #20

        $finish;

    end


endmodule