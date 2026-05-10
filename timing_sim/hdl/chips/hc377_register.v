`timescale 1ns/1ns

module hc377_register (
    input wire [7:0] In,
    input wire Enable,
    input wire Clk,
    output logic [7:0] Out
);

    always @(posedge Clk) begin
        if (!Enable) begin
            Out <= In;
        end
    end 


endmodule