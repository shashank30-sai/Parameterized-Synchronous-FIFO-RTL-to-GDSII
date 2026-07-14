`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.06.2026 22:25:59
// Design Name: 
// Module Name: fifo_status
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


module fifo_status #(
    parameter DEPTH = 8,
    parameter COUNT_WIDTH = 4
)(
    input clk,
    input rst,
    input wr_en,
    input rd_en,
    output full,
    output empty
);

reg [COUNT_WIDTH-1:0] count;

always @(posedge clk or posedge rst) begin
    if (rst)
        count <= 0;
    else begin
        case ({wr_en, rd_en})
            2'b10: begin
                if (!full)
                    count <= count + 1'b1;
            end
            2'b01: begin
                if (!empty)
                    count <= count - 1'b1;
            end
            2'b11: begin
                if (full && !empty)
                    count <= count - 1'b1;
                else if (empty && !full)
                    count <= count + 1'b1;
                // else: count stays same (normal simultaneous R/W)
            end
            default: count <= count;
        endcase
    end
end

assign empty = (count == 0);
assign full  = (count == DEPTH);

endmodule
