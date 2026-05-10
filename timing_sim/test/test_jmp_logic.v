`timescale 1ns/1ns

module jmp_logic_tb ();

    reg [0:0] Zero_tb;
    reg [0:0] Negative_tb;
    reg [15:0] Instruction_tb;

    wire [0:0] Jmp_tb;

    jmp_logic my_jmp_logic (
        .Zero(Zero_tb),
        .Negative(Negative_tb),
        .Instruction(Instruction_tb),
        .Jmp(Jmp_tb)
    );

    initial begin
        $dumpfile("timing_result.vcd");
        $dumpvars(0,jmp_logic_tb);

        // positive 

        Zero_tb = 0;
        Negative_tb = 0;
        
        Instruction_tb = 16'b1000_0000_0000_0000;
        #100
        Instruction_tb = 16'b1000_0000_0000_0001;
        #100
        Instruction_tb = 16'b1000_0000_0000_0010;
        #100
        Instruction_tb = 16'b1000_0000_0000_0100;
        #100
        
        Zero_tb = 0;
        Negative_tb = 1;
        
        Instruction_tb = 16'b1000_0000_0000_0000;
        #100
        Instruction_tb = 16'b1000_0000_0000_0001;
        #100
        Instruction_tb = 16'b1000_0000_0000_0010;
        #100
        Instruction_tb = 16'b1000_0000_0000_0100;
        #100
        
        Zero_tb = 1;
        Negative_tb = 0;
        
        Instruction_tb = 16'b1000_0000_0000_0000;
        #100
        Instruction_tb = 16'b1000_0000_0000_0001;
        #100
        Instruction_tb = 16'b1000_0000_0000_0010;
        #100
        Instruction_tb = 16'b1000_0000_0000_0100;
        #100
        
        $finish;

    end
endmodule