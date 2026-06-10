`timescale 1ns/1ns

module at28c256_15_rom #( 
    parameter ROM_FILE = ""
)(
    input logic [14:0] Address,
    output logic [7:0] Data
);

logic [7:0] memory [0:32747];

initial begin
    if (ROM_FILE != "") begin
        $readmemh(ROM_FILE, memory);
    end
end


assign #150 Data = memory[ Address];

endmodule
