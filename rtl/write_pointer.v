`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.06.2026 22:31:36
// Design Name: 
// Module Name: write_pointer
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


module write_pointer #(
    parameter ADDR_WIDTH = 3
)(
    input clk,
    input rst,
    input wr_en,
    input full,

    output reg [ADDR_WIDTH-1:0] wr_ptr
);

always @(posedge clk or posedge rst) begin
    if (rst)
        wr_ptr <= 0;

    else if (wr_en && !full)
        wr_ptr <= wr_ptr + 1'b1;
end

endmodule

