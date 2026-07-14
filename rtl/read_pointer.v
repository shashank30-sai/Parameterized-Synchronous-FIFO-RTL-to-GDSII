`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.06.2026 22:30:12
// Design Name: 
// Module Name: read_pointer
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module read_pointer #(
    parameter ADDR_WIDTH = 3
)(
    input clk,
    input rst,
    input rd_en,
    input empty,

    output reg [ADDR_WIDTH-1:0] rd_ptr
);

always @(posedge clk or posedge rst) begin
    if (rst)
        rd_ptr <= 0;

    else if (rd_en && !empty)
        rd_ptr <= rd_ptr + 1'b1;
end

endmodule

