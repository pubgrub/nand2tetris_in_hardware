`timescale 1ns/1ns

module alu_tb ();

    reg   [15:0] D_tb;
    reg   [15:0] A_tb;
    reg   [15:0] I_tb;

    wire  [15:0] Out_tb;
    wire  [0:0]  Negative_tb;
    wire  [0:0]  Zero_tb;

    alu my_alu (
        .D_in(D_tb),
        .A_in(A_tb),
        .I(I_tb),
        .Out(Out_tb),
        .Negative( Negative_tb),
        .Zero( Zero_tb)
    );

    logic signed [15:0]test_values [] = 
    '{16'sh0000,
      16'sh0001,
      16'shffff,
      16'sh7fff,
      16'sh8000
    };

    logic [5:0] op_codes [] =
    '{ 6'b101010, // 0
       6'b111111, // 1
       6'b111010, // -1
       6'b001100, // D
       6'b110000, // A
       6'b001101, // !D
       6'b110001, // !A
       6'b001111, // -D
       6'b110011, // -A
       6'b011111, // D + 1
       6'b110111, // A + 1
       6'b001110, // D - 1
       6'b110010, // A - 1
       6'b000010, // D + A
       6'b010011, // D - A
       6'b000111, // A - D
       6'b000000, // D & A
       6'b010101  // D | A
    };

    logic signed [15:0] expected;

    function logic signed [15:0] get_expected_output (logic [5:0] op_code, logic signed [15:0] D, logic signed [15:0] A);
        case (op_code)
            6'b101010: return 16'd0; // 0
            6'b111111: return 16'd1; // 1
            6'b111010: return -16'sd1; // -1
            6'b001100: return D; // D
            6'b110000: return A; // A
            6'b001101: return ~D; // !D
            6'b110001: return ~A; // !A
            6'b001111: return -D; // -D
            6'b110011: return -A; // -A
            6'b011111: return D + 1; // D + 1
            6'b110111: return A + 1; // A + 1
            6'b001110: return D - 1; // D - 1
            6'b110010: return A - 1; // A - 1
            6'b000010: return D + A; // D + A
            6'b010011: return D - A; // D - A
            6'b000111: return A - D; // A - D
            6'b000000: return D & A; // D & A
            6'b010101: return D | A; // D | A
        endcase
    endfunction
    
    initial begin
        $dumpfile("timing_result.vcd");
        $dumpvars(0,alu_tb);


        foreach (test_values[i]) begin
            foreach (test_values[j]) begin
                foreach (op_codes[k]) begin
                    D_tb = test_values[i];
                    A_tb = test_values[j];
                    I_tb = {4'b0, op_codes[k], 6'b0};

                    #200; // Wait for the output to stabilize

                    expected = get_expected_output(op_codes[k], D_tb, A_tb);
                    if (Out_tb !== expected) begin
                        $display("Test failed for D=%d, A=%d, op_code=%b: expected %d, got %d", D_tb, A_tb, op_codes[k], expected, Out_tb);
                    end else begin
                        // $display("Test passed for D=%d, A=%d, op_code=%b: got %d", D_tb, A_tb, op_codes[k], Out_tb);
                    end
                end
            end
        end

        $finish;

    end

endmodule
        