`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.06.2026 22:45:52
// Design Name: 
// Module Name: fifo_top
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


module fifo_top #(
    parameter DATA_WIDTH = 8,
    parameter DEPTH = 8,
    parameter ADDR_WIDTH = 3,
    parameter COUNT_WIDTH = 4
)(
    input clk,
    input rst,

    input wr_en,
    input rd_en,

    input  [DATA_WIDTH-1:0] data_in,
    output [DATA_WIDTH-1:0] data_out,

    output full,
    output empty
);

    // Internal Signals
    wire [ADDR_WIDTH-1:0] wr_ptr;
    wire [ADDR_WIDTH-1:0] rd_ptr;

    // FIFO Status
    fifo_status #(
        .DEPTH(DEPTH),
        .COUNT_WIDTH(COUNT_WIDTH)
    ) status_inst (
        .clk(clk),
        .rst(rst),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .full(full),
        .empty(empty)
    );

    // Write Pointer
    write_pointer #(
        .ADDR_WIDTH(ADDR_WIDTH)
    ) wr_ptr_inst (
        .clk(clk),
        .rst(rst),
        .wr_en(wr_en),
        .full(full),
        .wr_ptr(wr_ptr)
    );

    // Read Pointer
    read_pointer #(
        .ADDR_WIDTH(ADDR_WIDTH)
    ) rd_ptr_inst (
        .clk(clk),
        .rst(rst),
        .rd_en(rd_en),
        .empty(empty),
        .rd_ptr(rd_ptr)
    );

    // FIFO Memory
    fifo_mem #(
        .DATA_WIDTH(DATA_WIDTH),
        .DEPTH(DEPTH),
        .ADDR_WIDTH(ADDR_WIDTH)
    ) mem_inst (
        .clk(clk),
        .rst(rst),
        .wr_en(wr_en && !full),
        .wr_ptr(wr_ptr),
        .rd_ptr(rd_ptr),
        .data_in(data_in),
        .data_out(data_out),
        .full(full),
        .empty(empty),
        .rd_en(rd_en)
    );

endmodule
