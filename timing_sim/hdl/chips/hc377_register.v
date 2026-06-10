`timescale 1ns/1ns

module hc377_register (
    input logic [7:0] In,
    input logic [0:0] Enable,
    input logic [0:0] Clk,
    output logic [7:0] Out
);

    always @(posedge Clk) begin
        if (!Enable) begin
            Out <= #15 In;
        end
    end 

    specify
        $setup(Enable, posedge Clk, 2);
        $setup(In, posedge Clk, 5);
        $hold(posedge Clk, In, 3);
    endspecify


endmodule