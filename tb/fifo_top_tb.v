`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.06.2026 23:07:51
// Design Name: 
// Module Name: fifo_top_tb
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


`timescale 1ns/1ps

`timescale 1ns/1ps

module fifo_top_tb;

parameter DATA_WIDTH  = 8;
parameter DEPTH       = 8;
parameter ADDR_WIDTH  = 3;
parameter COUNT_WIDTH = 4;

reg clk;
reg rst;
reg wr_en;
reg rd_en;
reg [DATA_WIDTH-1:0] data_in;

wire [DATA_WIDTH-1:0] data_out;
wire full;
wire empty;

// DUT
fifo_top #(
    .DATA_WIDTH(DATA_WIDTH),
    .DEPTH(DEPTH),
    .ADDR_WIDTH(ADDR_WIDTH),
    .COUNT_WIDTH(COUNT_WIDTH)
) DUT (
    .clk(clk),
    .rst(rst),
    .wr_en(wr_en),
    .rd_en(rd_en),
    .data_in(data_in),
    .data_out(data_out),
    .full(full),
    .empty(empty)
);

// Clock Generation
always #5 clk = ~clk;

// Test
initial begin

    clk     = 0;
    rst     = 1;
    wr_en   = 0;
    rd_en   = 0;
    data_in = 0;

    // Reset
    #20;
    rst = 0;

    //-------------------------
    // Write Data
    //-------------------------
    @(negedge clk);
    wr_en   = 1;
    data_in = 8'h11;

    @(negedge clk);
    data_in = 8'h22;

    @(negedge clk);
    data_in = 8'h33;

    @(negedge clk);
    data_in = 8'h44;

    @(negedge clk);
    wr_en = 0;

    //-------------------------
    // Read Data
    //-------------------------
    @(negedge clk);
    rd_en = 1;

    repeat(4) begin
        @(posedge clk);
        #1;
        $display("Time=%0t  Data=%h  Empty=%b  Full=%b",
                  $time, data_out, empty, full);
    end

    @(negedge clk);
    rd_en = 0;

    #20;
    $finish;

end

endmodule