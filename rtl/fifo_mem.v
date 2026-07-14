`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.06.2026 22:33:37
// Design Name: 
// Module Name: fifo_mem
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


module fifo_mem #(
    parameter DATA_WIDTH = 8,
    parameter DEPTH = 8,
    parameter ADDR_WIDTH = 3
)(
    input clk,
    input rst,
    input wr_en,
    input [ADDR_WIDTH-1:0] wr_ptr,
    input [ADDR_WIDTH-1:0] rd_ptr,
    input [DATA_WIDTH-1:0] data_in,
    input rd_en,
input full,
input empty,
    output reg [DATA_WIDTH-1:0] data_out
);

    reg [DATA_WIDTH-1:0] mem [0:DEPTH-1];

    // Write Operation
    always @(posedge clk) begin
        if (wr_en && !full)
            mem[wr_ptr] <= data_in;
    end

    // Read Operation
always @(posedge clk or posedge rst)
begin
    if(rst)
        data_out <= 0;
    else if(rd_en && !empty)
        data_out <= mem[rd_ptr];
end


endmodule
