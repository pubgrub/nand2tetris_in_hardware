`timescale 1ns/1ns

module hc283_adder (
    input wire [3:0] A,
    input wire [3:0] B,
    input wire Cin,
    output wire [3:0] Sum,
    output wire Cout
);

    wire [3:0] ideal_Sum;
    wire       ideal_Cout;

    assign {ideal_Cout, ideal_Sum} = A + B + Cin;
    
    
    // erstmal ergebnis ohne Laufzeit rechnen

    assign  {Cout,Sum} = A + B + Cin;


    // und jetzt die wirklichen timings

    assign #18 Sum[0] = ideal_Sum[0];
    assign #18 Sum[1] = ideal_Sum[1];
    assign #18 Sum[2] = ideal_Sum[2];
    // bei S3 ist Cin -> S3 der kritische Pfad
    assign #19 Sum[3] = ideal_Sum[3];

    assign #16 Cout = ideal_Cout;


endmodule
