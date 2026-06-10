`timescale 1ns/1ns

module rom_16bit #(
    parameter FILE_16BIT = "data/rom_16bit.txt"
)(
    input wire [14:0] address,
    output wire [15:0] data
);

wire [7:0] data_high;
wire [7:0] data_low;

at28c256_15_rom #( .ROM_FILE("") ) rom_low (
    .Address(address),
    .Data(data_low)
);

at28c256_15_rom #( .ROM_FILE("") ) rom_high (
    .Address(address),
    .Data(data_high)
);

logic [15:0] temp_mem [ 0:32767];

initial begin
    for (int i=0; i<32768; i++) begin
        temp_mem[i] = 16'h0000;
    end

    if (FILE_16BIT !== "" ) begin
        $readmemh(FILE_16BIT,temp_mem);
    end

    for( int i = 0; i < 32767; i++) begin
        rom_high.memory[i] = temp_mem[i][15:8];
        rom_low.memory[i] = temp_mem[i][7:0];
    end
end

assign data = {data_high, data_low};

endmodule