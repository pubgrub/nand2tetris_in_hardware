`timescale 1ns/1ns

module test_rom_tb ();

    logic [14:0] Address_tb;
    logic [15:0] Data_tb;
    logic [0:0]  Clk_tb;

    rom_16bit my_rom (
        .address(Address_tb),
        .data(Data_tb)
    );

    initial begin
        Clk_tb = 0;
        forever #200 Clk_tb = ~Clk_tb;
    end

    initial begin
        $dumpfile("timing_result.vcd");
        $dumpvars(0,test_rom_tb);
    
        
        Address_tb = 0;
        repeat (10) begin
            @(posedge Clk_tb);
            Address_tb = Address_tb + 15'h0001;
        end

        $finish;
    end

endmodule