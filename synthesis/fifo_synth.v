/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP5
// Date      : Fri Jul 10 05:20:46 2026
/////////////////////////////////////////////////////////////


module fifo_status_DEPTH8_COUNT_WIDTH4 ( clk, rst, wr_en, rd_en, full, empty
 );
  input clk, rst, wr_en, rd_en;
  output full, empty;
  wire   n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n1, n2, n3, n4, n5, n7, n9, n30, n31;
  wire   [3:0] count;

  AO222X1_RVT U15 ( .A1(n30), .A2(n10), .A3(n11), .A4(n3), .A5(count[1]), .A6(
        n12), .Y(n26) );
  AO222X1_RVT U16 ( .A1(count[2]), .A2(n13), .A3(n14), .A4(n5), .A5(n11), .A6(
        n7), .Y(n27) );
  AO221X1_RVT U18 ( .A1(n11), .A2(n16), .A3(n30), .A4(n17), .A5(n12), .Y(n13)
         );
  AO22X1_RVT U19 ( .A1(n30), .A2(n18), .A3(n1), .A4(n19), .Y(n28) );
  NAND2X0_RVT U22 ( .A1(count[2]), .A2(n5), .Y(n22) );
  NAND2X0_RVT U23 ( .A1(count[0]), .A2(count[1]), .Y(n17) );
  NAND2X0_RVT U27 ( .A1(wr_en), .A2(n31), .Y(n15) );
  NAND2X0_RVT U29 ( .A1(n1), .A2(n7), .Y(n21) );
  DFFARX2_RVT \count_reg[3]  ( .D(n28), .CLK(clk), .RSTB(n2), .Q(n1) );
  DFFARX2_RVT \count_reg[1]  ( .D(n26), .CLK(clk), .RSTB(n2), .Q(count[1]) );
  DFFARX2_RVT \count_reg[2]  ( .D(n27), .CLK(clk), .RSTB(n2), .Q(count[2]) );
  DFFARX2_RVT \count_reg[0]  ( .D(n29), .CLK(clk), .RSTB(n2), .Q(count[0]), 
        .QN(n4) );
  IBUFFX2_RVT U3 ( .A(rd_en), .Y(n31) );
  AO21X2_RVT U4 ( .A1(n25), .A2(n21), .A3(n31), .Y(n24) );
  IBUFFX2_RVT U5 ( .A(n21), .Y(full) );
  AO21X2_RVT U6 ( .A1(n9), .A2(n31), .A3(n23), .Y(n12) );
  OA222X2_RVT U7 ( .A1(full), .A2(n15), .A3(n9), .A4(n24), .A5(wr_en), .A6(
        empty), .Y(n23) );
  IBUFFX2_RVT U8 ( .A(n15), .Y(n30) );
  IBUFFX2_RVT U9 ( .A(n20), .Y(n7) );
  OR2X4_RVT U10 ( .A1(n20), .A2(n1), .Y(n25) );
  AO21X2_RVT U11 ( .A1(n11), .A2(n20), .A3(n12), .Y(n19) );
  AOI21X2_RVT U12 ( .A1(wr_en), .A2(n21), .A3(n12), .Y(n11) );
  OR2X4_RVT U13 ( .A1(n16), .A2(count[2]), .Y(n20) );
  NOR2X4_RVT U14 ( .A1(n15), .A2(count[2]), .Y(n14) );
  OR2X4_RVT U17 ( .A1(count[1]), .A2(count[0]), .Y(n16) );
  IBUFFX2_RVT U20 ( .A(rst), .Y(n2) );
  INVX0_RVT U21 ( .A(n25), .Y(empty) );
  INVX0_RVT U24 ( .A(n17), .Y(n5) );
  INVX0_RVT U25 ( .A(wr_en), .Y(n9) );
  XNOR2X1_RVT U26 ( .A1(n1), .A2(n22), .Y(n18) );
  XOR2X1_RVT U28 ( .A1(n4), .A2(count[1]), .Y(n3) );
  INVX1_RVT U30 ( .A(n3), .Y(n10) );
  XNOR2X1_RVT U31 ( .A1(count[0]), .A2(n12), .Y(n29) );
endmodule


module write_pointer_ADDR_WIDTH3 ( clk, rst, wr_en, full, wr_ptr );
  output [2:0] wr_ptr;
  input clk, rst, wr_en, full;
  wire   n1, n2, n3, n5, n6, n7, n9, n10, n11;

  NAND2X0_RVT U4 ( .A1(wr_ptr[1]), .A2(n2), .Y(n1) );
  AND2X1_RVT U6 ( .A1(wr_ptr[0]), .A2(n3), .Y(n2) );
  AND2X1_RVT U9 ( .A1(wr_en), .A2(n10), .Y(n3) );
  DFFARX2_RVT \wr_ptr_reg[0]  ( .D(n9), .CLK(clk), .RSTB(n11), .Q(wr_ptr[0])
         );
  DFFARX2_RVT \wr_ptr_reg[1]  ( .D(n7), .CLK(clk), .RSTB(n11), .Q(wr_ptr[1])
         );
  DFFARX2_RVT \wr_ptr_reg[2]  ( .D(n6), .CLK(clk), .RSTB(n11), .Q(wr_ptr[2]), 
        .QN(n5) );
  IBUFFX2_RVT U3 ( .A(rst), .Y(n11) );
  XOR2X1_RVT U5 ( .A1(n5), .A2(n1), .Y(n6) );
  INVX0_RVT U7 ( .A(full), .Y(n10) );
  XOR2X1_RVT U8 ( .A1(wr_ptr[1]), .A2(n2), .Y(n7) );
  XOR2X1_RVT U10 ( .A1(wr_ptr[0]), .A2(n3), .Y(n9) );
endmodule


module read_pointer_ADDR_WIDTH3 ( clk, rst, rd_en, empty, rd_ptr );
  output [2:0] rd_ptr;
  input clk, rst, rd_en, empty;
  wire   n1, n2, n3, n5, n6, n7, n9, n8, n10;

  NAND2X0_RVT U4 ( .A1(rd_ptr[1]), .A2(n2), .Y(n1) );
  AND2X1_RVT U6 ( .A1(rd_ptr[0]), .A2(n3), .Y(n2) );
  AND2X1_RVT U9 ( .A1(rd_en), .A2(n8), .Y(n3) );
  DFFARX2_RVT \rd_ptr_reg[0]  ( .D(n9), .CLK(clk), .RSTB(n10), .Q(rd_ptr[0])
         );
  DFFARX2_RVT \rd_ptr_reg[2]  ( .D(n6), .CLK(clk), .RSTB(n10), .Q(rd_ptr[2]), 
        .QN(n5) );
  DFFARX2_RVT \rd_ptr_reg[1]  ( .D(n7), .CLK(clk), .RSTB(n10), .Q(rd_ptr[1])
         );
  IBUFFX2_RVT U3 ( .A(rst), .Y(n10) );
  XOR2X1_RVT U5 ( .A1(n5), .A2(n1), .Y(n6) );
  INVX0_RVT U7 ( .A(empty), .Y(n8) );
  XOR2X1_RVT U8 ( .A1(rd_ptr[1]), .A2(n2), .Y(n7) );
  XOR2X1_RVT U10 ( .A1(rd_ptr[0]), .A2(n3), .Y(n9) );
endmodule


module fifo_mem_DATA_WIDTH8_DEPTH8_ADDR_WIDTH3 ( clk, rst, wr_en, wr_ptr, 
        rd_ptr, data_in, rd_en, full, empty, data_out );
  input [2:0] wr_ptr;
  input [2:0] rd_ptr;
  input [7:0] data_in;
  output [7:0] data_out;
  input clk, rst, wr_en, rd_en, full, empty;
  wire   N9, N10, N11, \mem[0][7] , \mem[0][6] , \mem[0][5] , \mem[0][4] ,
         \mem[0][3] , \mem[0][2] , \mem[0][1] , \mem[0][0] , \mem[1][7] ,
         \mem[1][6] , \mem[1][5] , \mem[1][4] , \mem[1][3] , \mem[1][2] ,
         \mem[1][1] , \mem[1][0] , \mem[2][7] , \mem[2][6] , \mem[2][5] ,
         \mem[2][4] , \mem[2][3] , \mem[2][2] , \mem[2][1] , \mem[2][0] ,
         \mem[3][7] , \mem[3][6] , \mem[3][5] , \mem[3][4] , \mem[3][3] ,
         \mem[3][2] , \mem[3][1] , \mem[3][0] , \mem[4][7] , \mem[4][6] ,
         \mem[4][5] , \mem[4][4] , \mem[4][3] , \mem[4][2] , \mem[4][1] ,
         \mem[4][0] , \mem[5][7] , \mem[5][6] , \mem[5][5] , \mem[5][4] ,
         \mem[5][3] , \mem[5][2] , \mem[5][1] , \mem[5][0] , \mem[6][7] ,
         \mem[6][6] , \mem[6][5] , \mem[6][4] , \mem[6][3] , \mem[6][2] ,
         \mem[6][1] , \mem[6][0] , \mem[7][7] , \mem[7][6] , \mem[7][5] ,
         \mem[7][4] , \mem[7][3] , \mem[7][2] , \mem[7][1] , \mem[7][0] , N31,
         N32, N33, N34, N35, N36, N37, N38, n1, n4, n6, n7, n10, n13, n16, n18,
         n19, n21, n23, n26, n27, n28, n29, n30, n31, n32, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93,
         n94, n95, n96, n97, n98, n2, n3, n5, n8, n9, n11, n12, n14, n15, n17,
         n20, n22, n24, n25, n33, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169;
  assign N9 = rd_ptr[0];
  assign N10 = rd_ptr[1];
  assign N11 = rd_ptr[2];

  DFFX1_RVT \mem_reg[0][7]  ( .D(n98), .CLK(clk), .Q(\mem[0][7] ) );
  DFFX1_RVT \mem_reg[0][6]  ( .D(n97), .CLK(clk), .Q(\mem[0][6] ) );
  DFFX1_RVT \mem_reg[0][5]  ( .D(n96), .CLK(clk), .Q(\mem[0][5] ) );
  DFFX1_RVT \mem_reg[0][4]  ( .D(n95), .CLK(clk), .Q(\mem[0][4] ) );
  DFFX1_RVT \mem_reg[0][3]  ( .D(n94), .CLK(clk), .Q(\mem[0][3] ) );
  DFFX1_RVT \mem_reg[0][2]  ( .D(n93), .CLK(clk), .Q(\mem[0][2] ) );
  DFFX1_RVT \mem_reg[0][1]  ( .D(n92), .CLK(clk), .Q(\mem[0][1] ) );
  DFFX1_RVT \mem_reg[0][0]  ( .D(n91), .CLK(clk), .Q(\mem[0][0] ) );
  DFFX1_RVT \mem_reg[1][7]  ( .D(n90), .CLK(clk), .Q(\mem[1][7] ) );
  DFFX1_RVT \mem_reg[1][6]  ( .D(n89), .CLK(clk), .Q(\mem[1][6] ) );
  DFFX1_RVT \mem_reg[1][5]  ( .D(n88), .CLK(clk), .Q(\mem[1][5] ) );
  DFFX1_RVT \mem_reg[1][4]  ( .D(n87), .CLK(clk), .Q(\mem[1][4] ) );
  DFFX1_RVT \mem_reg[1][3]  ( .D(n86), .CLK(clk), .Q(\mem[1][3] ) );
  DFFX1_RVT \mem_reg[1][2]  ( .D(n85), .CLK(clk), .Q(\mem[1][2] ) );
  DFFX1_RVT \mem_reg[1][1]  ( .D(n84), .CLK(clk), .Q(\mem[1][1] ) );
  DFFX1_RVT \mem_reg[1][0]  ( .D(n83), .CLK(clk), .Q(\mem[1][0] ) );
  DFFX1_RVT \mem_reg[2][7]  ( .D(n82), .CLK(clk), .Q(\mem[2][7] ) );
  DFFX1_RVT \mem_reg[2][6]  ( .D(n81), .CLK(clk), .Q(\mem[2][6] ) );
  DFFX1_RVT \mem_reg[2][5]  ( .D(n80), .CLK(clk), .Q(\mem[2][5] ) );
  DFFX1_RVT \mem_reg[2][4]  ( .D(n79), .CLK(clk), .Q(\mem[2][4] ) );
  DFFX1_RVT \mem_reg[2][3]  ( .D(n78), .CLK(clk), .Q(\mem[2][3] ) );
  DFFX1_RVT \mem_reg[2][2]  ( .D(n77), .CLK(clk), .Q(\mem[2][2] ) );
  DFFX1_RVT \mem_reg[2][1]  ( .D(n76), .CLK(clk), .Q(\mem[2][1] ) );
  DFFX1_RVT \mem_reg[2][0]  ( .D(n75), .CLK(clk), .Q(\mem[2][0] ) );
  DFFX1_RVT \mem_reg[3][7]  ( .D(n74), .CLK(clk), .Q(\mem[3][7] ) );
  DFFX1_RVT \mem_reg[3][6]  ( .D(n73), .CLK(clk), .Q(\mem[3][6] ) );
  DFFX1_RVT \mem_reg[3][5]  ( .D(n72), .CLK(clk), .Q(\mem[3][5] ) );
  DFFX1_RVT \mem_reg[3][4]  ( .D(n71), .CLK(clk), .Q(\mem[3][4] ) );
  DFFX1_RVT \mem_reg[3][3]  ( .D(n70), .CLK(clk), .Q(\mem[3][3] ) );
  DFFX1_RVT \mem_reg[3][2]  ( .D(n69), .CLK(clk), .Q(\mem[3][2] ) );
  DFFX1_RVT \mem_reg[3][1]  ( .D(n68), .CLK(clk), .Q(\mem[3][1] ) );
  DFFX1_RVT \mem_reg[3][0]  ( .D(n67), .CLK(clk), .Q(\mem[3][0] ) );
  DFFX1_RVT \mem_reg[4][7]  ( .D(n66), .CLK(clk), .Q(\mem[4][7] ) );
  DFFX1_RVT \mem_reg[4][6]  ( .D(n65), .CLK(clk), .Q(\mem[4][6] ) );
  DFFX1_RVT \mem_reg[4][5]  ( .D(n64), .CLK(clk), .Q(\mem[4][5] ) );
  DFFX1_RVT \mem_reg[4][4]  ( .D(n63), .CLK(clk), .Q(\mem[4][4] ) );
  DFFX1_RVT \mem_reg[4][3]  ( .D(n62), .CLK(clk), .Q(\mem[4][3] ) );
  DFFX1_RVT \mem_reg[4][2]  ( .D(n61), .CLK(clk), .Q(\mem[4][2] ) );
  DFFX1_RVT \mem_reg[4][1]  ( .D(n60), .CLK(clk), .Q(\mem[4][1] ) );
  DFFX1_RVT \mem_reg[4][0]  ( .D(n59), .CLK(clk), .Q(\mem[4][0] ) );
  DFFX1_RVT \mem_reg[5][7]  ( .D(n58), .CLK(clk), .Q(\mem[5][7] ) );
  DFFX1_RVT \mem_reg[5][6]  ( .D(n57), .CLK(clk), .Q(\mem[5][6] ) );
  DFFX1_RVT \mem_reg[5][5]  ( .D(n56), .CLK(clk), .Q(\mem[5][5] ) );
  DFFX1_RVT \mem_reg[5][4]  ( .D(n55), .CLK(clk), .Q(\mem[5][4] ) );
  DFFX1_RVT \mem_reg[5][3]  ( .D(n54), .CLK(clk), .Q(\mem[5][3] ) );
  DFFX1_RVT \mem_reg[5][2]  ( .D(n53), .CLK(clk), .Q(\mem[5][2] ) );
  DFFX1_RVT \mem_reg[5][1]  ( .D(n52), .CLK(clk), .Q(\mem[5][1] ) );
  DFFX1_RVT \mem_reg[5][0]  ( .D(n51), .CLK(clk), .Q(\mem[5][0] ) );
  DFFX1_RVT \mem_reg[6][7]  ( .D(n50), .CLK(clk), .Q(\mem[6][7] ) );
  DFFX1_RVT \mem_reg[6][6]  ( .D(n49), .CLK(clk), .Q(\mem[6][6] ) );
  DFFX1_RVT \mem_reg[6][5]  ( .D(n48), .CLK(clk), .Q(\mem[6][5] ) );
  DFFX1_RVT \mem_reg[6][4]  ( .D(n47), .CLK(clk), .Q(\mem[6][4] ) );
  DFFX1_RVT \mem_reg[6][3]  ( .D(n46), .CLK(clk), .Q(\mem[6][3] ) );
  DFFX1_RVT \mem_reg[6][2]  ( .D(n45), .CLK(clk), .Q(\mem[6][2] ) );
  DFFX1_RVT \mem_reg[6][1]  ( .D(n44), .CLK(clk), .Q(\mem[6][1] ) );
  DFFX1_RVT \mem_reg[6][0]  ( .D(n43), .CLK(clk), .Q(\mem[6][0] ) );
  DFFX1_RVT \mem_reg[7][7]  ( .D(n42), .CLK(clk), .Q(\mem[7][7] ) );
  DFFX1_RVT \mem_reg[7][6]  ( .D(n41), .CLK(clk), .Q(\mem[7][6] ) );
  DFFX1_RVT \mem_reg[7][5]  ( .D(n40), .CLK(clk), .Q(\mem[7][5] ) );
  DFFX1_RVT \mem_reg[7][4]  ( .D(n39), .CLK(clk), .Q(\mem[7][4] ) );
  DFFX1_RVT \mem_reg[7][3]  ( .D(n38), .CLK(clk), .Q(\mem[7][3] ) );
  DFFX1_RVT \mem_reg[7][2]  ( .D(n37), .CLK(clk), .Q(\mem[7][2] ) );
  DFFX1_RVT \mem_reg[7][1]  ( .D(n36), .CLK(clk), .Q(\mem[7][1] ) );
  DFFX1_RVT \mem_reg[7][0]  ( .D(n35), .CLK(clk), .Q(\mem[7][0] ) );
  DFFARX1_RVT \data_out_reg[7]  ( .D(n34), .CLK(clk), .RSTB(n124), .Q(
        data_out[7]) );
  DFFARX1_RVT \data_out_reg[6]  ( .D(n32), .CLK(clk), .RSTB(n124), .Q(
        data_out[6]) );
  DFFARX1_RVT \data_out_reg[5]  ( .D(n31), .CLK(clk), .RSTB(n124), .Q(
        data_out[5]) );
  DFFARX1_RVT \data_out_reg[4]  ( .D(n30), .CLK(clk), .RSTB(n124), .Q(
        data_out[4]) );
  DFFARX1_RVT \data_out_reg[3]  ( .D(n29), .CLK(clk), .RSTB(n124), .Q(
        data_out[3]) );
  DFFARX1_RVT \data_out_reg[2]  ( .D(n28), .CLK(clk), .RSTB(n124), .Q(
        data_out[2]) );
  DFFARX1_RVT \data_out_reg[1]  ( .D(n27), .CLK(clk), .RSTB(n124), .Q(
        data_out[1]) );
  DFFARX1_RVT \data_out_reg[0]  ( .D(n26), .CLK(clk), .RSTB(n124), .Q(
        data_out[0]) );
  AO22X1_RVT U2 ( .A1(n1), .A2(data_out[0]), .A3(N38), .A4(n122), .Y(n26) );
  AO22X1_RVT U3 ( .A1(n1), .A2(data_out[1]), .A3(N37), .A4(n121), .Y(n27) );
  AO22X1_RVT U4 ( .A1(n120), .A2(data_out[2]), .A3(N36), .A4(n121), .Y(n28) );
  AO22X1_RVT U5 ( .A1(n120), .A2(data_out[3]), .A3(N35), .A4(n122), .Y(n29) );
  AO22X1_RVT U6 ( .A1(n1), .A2(data_out[4]), .A3(N34), .A4(n121), .Y(n30) );
  AO22X1_RVT U7 ( .A1(n1), .A2(data_out[5]), .A3(N33), .A4(n122), .Y(n31) );
  AO22X1_RVT U8 ( .A1(n120), .A2(data_out[6]), .A3(N32), .A4(n122), .Y(n32) );
  AO22X1_RVT U10 ( .A1(n1), .A2(data_out[7]), .A3(N31), .A4(n121), .Y(n34) );
  AO22X1_RVT U14 ( .A1(n4), .A2(\mem[7][0] ), .A3(data_in[0]), .A4(n118), .Y(
        n35) );
  AO22X1_RVT U15 ( .A1(n4), .A2(\mem[7][1] ), .A3(data_in[1]), .A4(n117), .Y(
        n36) );
  AO22X1_RVT U16 ( .A1(n116), .A2(\mem[7][2] ), .A3(data_in[2]), .A4(n117), 
        .Y(n37) );
  AO22X1_RVT U17 ( .A1(n4), .A2(\mem[7][3] ), .A3(data_in[3]), .A4(n118), .Y(
        n38) );
  AO22X1_RVT U18 ( .A1(n4), .A2(\mem[7][4] ), .A3(data_in[4]), .A4(n117), .Y(
        n39) );
  AO22X1_RVT U19 ( .A1(n4), .A2(\mem[7][5] ), .A3(data_in[5]), .A4(n118), .Y(
        n40) );
  AO22X1_RVT U20 ( .A1(n4), .A2(\mem[7][6] ), .A3(data_in[6]), .A4(n118), .Y(
        n41) );
  AO22X1_RVT U21 ( .A1(n4), .A2(\mem[7][7] ), .A3(data_in[7]), .A4(n117), .Y(
        n42) );
  AO22X1_RVT U24 ( .A1(n7), .A2(\mem[6][0] ), .A3(n109), .A4(data_in[0]), .Y(
        n43) );
  AO22X1_RVT U25 ( .A1(n7), .A2(\mem[6][1] ), .A3(n108), .A4(data_in[1]), .Y(
        n44) );
  AO22X1_RVT U26 ( .A1(n107), .A2(\mem[6][2] ), .A3(n108), .A4(data_in[2]), 
        .Y(n45) );
  AO22X1_RVT U27 ( .A1(n7), .A2(\mem[6][3] ), .A3(n109), .A4(data_in[3]), .Y(
        n46) );
  AO22X1_RVT U28 ( .A1(n7), .A2(\mem[6][4] ), .A3(n108), .A4(data_in[4]), .Y(
        n47) );
  AO22X1_RVT U29 ( .A1(n7), .A2(\mem[6][5] ), .A3(n109), .A4(data_in[5]), .Y(
        n48) );
  AO22X1_RVT U30 ( .A1(n7), .A2(\mem[6][6] ), .A3(n109), .A4(data_in[6]), .Y(
        n49) );
  AO22X1_RVT U31 ( .A1(n7), .A2(\mem[6][7] ), .A3(n108), .A4(data_in[7]), .Y(
        n50) );
  AO22X1_RVT U34 ( .A1(n10), .A2(\mem[5][0] ), .A3(n113), .A4(data_in[0]), .Y(
        n51) );
  AO22X1_RVT U35 ( .A1(n10), .A2(\mem[5][1] ), .A3(n112), .A4(data_in[1]), .Y(
        n52) );
  AO22X1_RVT U36 ( .A1(n111), .A2(\mem[5][2] ), .A3(n112), .A4(data_in[2]), 
        .Y(n53) );
  AO22X1_RVT U37 ( .A1(n10), .A2(\mem[5][3] ), .A3(n113), .A4(data_in[3]), .Y(
        n54) );
  AO22X1_RVT U38 ( .A1(n10), .A2(\mem[5][4] ), .A3(n112), .A4(data_in[4]), .Y(
        n55) );
  AO22X1_RVT U39 ( .A1(n10), .A2(\mem[5][5] ), .A3(n113), .A4(data_in[5]), .Y(
        n56) );
  AO22X1_RVT U40 ( .A1(n10), .A2(\mem[5][6] ), .A3(n113), .A4(data_in[6]), .Y(
        n57) );
  AO22X1_RVT U41 ( .A1(n10), .A2(\mem[5][7] ), .A3(n112), .A4(data_in[7]), .Y(
        n58) );
  AO22X1_RVT U44 ( .A1(n13), .A2(\mem[4][0] ), .A3(n17), .A4(data_in[0]), .Y(
        n59) );
  AO22X1_RVT U45 ( .A1(n13), .A2(\mem[4][1] ), .A3(n15), .A4(data_in[1]), .Y(
        n60) );
  AO22X1_RVT U46 ( .A1(n14), .A2(\mem[4][2] ), .A3(n15), .A4(data_in[2]), .Y(
        n61) );
  AO22X1_RVT U47 ( .A1(n13), .A2(\mem[4][3] ), .A3(n17), .A4(data_in[3]), .Y(
        n62) );
  AO22X1_RVT U48 ( .A1(n13), .A2(\mem[4][4] ), .A3(n15), .A4(data_in[4]), .Y(
        n63) );
  AO22X1_RVT U49 ( .A1(n13), .A2(\mem[4][5] ), .A3(n17), .A4(data_in[5]), .Y(
        n64) );
  AO22X1_RVT U50 ( .A1(n13), .A2(\mem[4][6] ), .A3(n17), .A4(data_in[6]), .Y(
        n65) );
  AO22X1_RVT U51 ( .A1(n13), .A2(\mem[4][7] ), .A3(n15), .A4(data_in[7]), .Y(
        n66) );
  AND3X1_RVT U54 ( .A1(wr_en), .A2(n168), .A3(wr_ptr[2]), .Y(n6) );
  AO22X1_RVT U55 ( .A1(n16), .A2(\mem[3][0] ), .A3(n101), .A4(data_in[0]), .Y(
        n67) );
  AO22X1_RVT U56 ( .A1(n16), .A2(\mem[3][1] ), .A3(n100), .A4(data_in[1]), .Y(
        n68) );
  AO22X1_RVT U57 ( .A1(n99), .A2(\mem[3][2] ), .A3(n100), .A4(data_in[2]), .Y(
        n69) );
  AO22X1_RVT U58 ( .A1(n16), .A2(\mem[3][3] ), .A3(n101), .A4(data_in[3]), .Y(
        n70) );
  AO22X1_RVT U59 ( .A1(n16), .A2(\mem[3][4] ), .A3(n100), .A4(data_in[4]), .Y(
        n71) );
  AO22X1_RVT U60 ( .A1(n16), .A2(\mem[3][5] ), .A3(n101), .A4(data_in[5]), .Y(
        n72) );
  AO22X1_RVT U61 ( .A1(n16), .A2(\mem[3][6] ), .A3(n101), .A4(data_in[6]), .Y(
        n73) );
  AO22X1_RVT U62 ( .A1(n16), .A2(\mem[3][7] ), .A3(n100), .A4(data_in[7]), .Y(
        n74) );
  AO22X1_RVT U65 ( .A1(n19), .A2(\mem[2][0] ), .A3(n105), .A4(data_in[0]), .Y(
        n75) );
  AO22X1_RVT U66 ( .A1(n19), .A2(\mem[2][1] ), .A3(n104), .A4(data_in[1]), .Y(
        n76) );
  AO22X1_RVT U67 ( .A1(n103), .A2(\mem[2][2] ), .A3(n104), .A4(data_in[2]), 
        .Y(n77) );
  AO22X1_RVT U68 ( .A1(n19), .A2(\mem[2][3] ), .A3(n105), .A4(data_in[3]), .Y(
        n78) );
  AO22X1_RVT U69 ( .A1(n19), .A2(\mem[2][4] ), .A3(n104), .A4(data_in[4]), .Y(
        n79) );
  AO22X1_RVT U70 ( .A1(n19), .A2(\mem[2][5] ), .A3(n105), .A4(data_in[5]), .Y(
        n80) );
  AO22X1_RVT U71 ( .A1(n19), .A2(\mem[2][6] ), .A3(n105), .A4(data_in[6]), .Y(
        n81) );
  AO22X1_RVT U72 ( .A1(n19), .A2(\mem[2][7] ), .A3(n104), .A4(data_in[7]), .Y(
        n82) );
  AO22X1_RVT U75 ( .A1(n21), .A2(\mem[1][0] ), .A3(n25), .A4(data_in[0]), .Y(
        n83) );
  AO22X1_RVT U76 ( .A1(n21), .A2(\mem[1][1] ), .A3(n24), .A4(data_in[1]), .Y(
        n84) );
  AO22X1_RVT U77 ( .A1(n22), .A2(\mem[1][2] ), .A3(n24), .A4(data_in[2]), .Y(
        n85) );
  AO22X1_RVT U78 ( .A1(n21), .A2(\mem[1][3] ), .A3(n25), .A4(data_in[3]), .Y(
        n86) );
  AO22X1_RVT U79 ( .A1(n21), .A2(\mem[1][4] ), .A3(n24), .A4(data_in[4]), .Y(
        n87) );
  AO22X1_RVT U80 ( .A1(n21), .A2(\mem[1][5] ), .A3(n25), .A4(data_in[5]), .Y(
        n88) );
  AO22X1_RVT U81 ( .A1(n21), .A2(\mem[1][6] ), .A3(n25), .A4(data_in[6]), .Y(
        n89) );
  AO22X1_RVT U82 ( .A1(n21), .A2(\mem[1][7] ), .A3(n24), .A4(data_in[7]), .Y(
        n90) );
  AO22X1_RVT U85 ( .A1(n23), .A2(\mem[0][0] ), .A3(n11), .A4(data_in[0]), .Y(
        n91) );
  AO22X1_RVT U86 ( .A1(n23), .A2(\mem[0][1] ), .A3(n9), .A4(data_in[1]), .Y(
        n92) );
  AO22X1_RVT U87 ( .A1(n8), .A2(\mem[0][2] ), .A3(n9), .A4(data_in[2]), .Y(n93) );
  AO22X1_RVT U88 ( .A1(n23), .A2(\mem[0][3] ), .A3(n11), .A4(data_in[3]), .Y(
        n94) );
  AO22X1_RVT U89 ( .A1(n23), .A2(\mem[0][4] ), .A3(n9), .A4(data_in[4]), .Y(
        n95) );
  AO22X1_RVT U90 ( .A1(n23), .A2(\mem[0][5] ), .A3(n11), .A4(data_in[5]), .Y(
        n96) );
  AO22X1_RVT U91 ( .A1(n23), .A2(\mem[0][6] ), .A3(n11), .A4(data_in[6]), .Y(
        n97) );
  AO22X1_RVT U92 ( .A1(n23), .A2(\mem[0][7] ), .A3(n9), .A4(data_in[7]), .Y(
        n98) );
  AND3X1_RVT U95 ( .A1(n168), .A2(n167), .A3(wr_en), .Y(n18) );
  AND2X1_RVT U9 ( .A1(N11), .A2(N10), .Y(n2) );
  NAND2X0_RVT U11 ( .A1(N11), .A2(n164), .Y(n3) );
  NAND2X0_RVT U12 ( .A1(n164), .A2(n163), .Y(n5) );
  IBUFFX2_RVT U13 ( .A(wr_ptr[0]), .Y(n165) );
  IBUFFX2_RVT U22 ( .A(wr_ptr[1]), .Y(n166) );
  IBUFFX2_RVT U23 ( .A(N10), .Y(n164) );
  IBUFFX2_RVT U32 ( .A(n12), .Y(n8) );
  IBUFFX2_RVT U33 ( .A(n8), .Y(n9) );
  IBUFFX2_RVT U42 ( .A(n8), .Y(n11) );
  IBUFFX2_RVT U43 ( .A(n23), .Y(n12) );
  IBUFFX2_RVT U52 ( .A(n20), .Y(n14) );
  IBUFFX2_RVT U53 ( .A(n14), .Y(n15) );
  IBUFFX2_RVT U63 ( .A(n14), .Y(n17) );
  IBUFFX2_RVT U64 ( .A(n13), .Y(n20) );
  IBUFFX2_RVT U73 ( .A(n33), .Y(n22) );
  IBUFFX2_RVT U74 ( .A(n22), .Y(n24) );
  IBUFFX2_RVT U83 ( .A(n22), .Y(n25) );
  IBUFFX2_RVT U84 ( .A(n21), .Y(n33) );
  IBUFFX2_RVT U93 ( .A(n102), .Y(n99) );
  IBUFFX2_RVT U94 ( .A(n99), .Y(n100) );
  IBUFFX2_RVT U96 ( .A(n99), .Y(n101) );
  IBUFFX2_RVT U97 ( .A(n16), .Y(n102) );
  IBUFFX2_RVT U98 ( .A(n106), .Y(n103) );
  IBUFFX2_RVT U99 ( .A(n103), .Y(n104) );
  IBUFFX2_RVT U100 ( .A(n103), .Y(n105) );
  IBUFFX2_RVT U101 ( .A(n19), .Y(n106) );
  IBUFFX2_RVT U102 ( .A(n110), .Y(n107) );
  IBUFFX2_RVT U103 ( .A(n107), .Y(n108) );
  IBUFFX2_RVT U104 ( .A(n107), .Y(n109) );
  IBUFFX2_RVT U105 ( .A(n7), .Y(n110) );
  IBUFFX2_RVT U106 ( .A(n114), .Y(n111) );
  IBUFFX2_RVT U107 ( .A(n111), .Y(n112) );
  IBUFFX2_RVT U108 ( .A(n111), .Y(n113) );
  IBUFFX2_RVT U109 ( .A(n10), .Y(n114) );
  IBUFFX2_RVT U110 ( .A(N9), .Y(n115) );
  IBUFFX2_RVT U111 ( .A(n119), .Y(n116) );
  IBUFFX2_RVT U112 ( .A(n116), .Y(n117) );
  IBUFFX2_RVT U113 ( .A(n116), .Y(n118) );
  IBUFFX2_RVT U114 ( .A(n4), .Y(n119) );
  IBUFFX2_RVT U115 ( .A(n123), .Y(n120) );
  IBUFFX2_RVT U116 ( .A(n120), .Y(n121) );
  IBUFFX2_RVT U117 ( .A(n120), .Y(n122) );
  IBUFFX2_RVT U118 ( .A(n1), .Y(n123) );
  NAND3X2_RVT U119 ( .A1(n165), .A2(n166), .A3(n18), .Y(n23) );
  NAND3X2_RVT U120 ( .A1(n165), .A2(n166), .A3(n6), .Y(n13) );
  IBUFFX2_RVT U121 ( .A(rst), .Y(n124) );
  IBUFFX2_RVT U122 ( .A(n5), .Y(n125) );
  IBUFFX2_RVT U123 ( .A(n5), .Y(n126) );
  IBUFFX2_RVT U124 ( .A(n3), .Y(n127) );
  IBUFFX2_RVT U125 ( .A(n3), .Y(n128) );
  IBUFFX2_RVT U126 ( .A(n160), .Y(n129) );
  NAND2X0_RVT U127 ( .A1(N10), .A2(n163), .Y(n160) );
  INVX0_RVT U128 ( .A(full), .Y(n168) );
  INVX0_RVT U129 ( .A(wr_ptr[2]), .Y(n167) );
  NAND2X0_RVT U130 ( .A1(rd_en), .A2(n169), .Y(n1) );
  INVX0_RVT U131 ( .A(empty), .Y(n169) );
  INVX0_RVT U132 ( .A(N11), .Y(n163) );
  AO22X1_RVT U133 ( .A1(\mem[7][0] ), .A2(n2), .A3(\mem[5][0] ), .A4(n127), 
        .Y(n130) );
  AO221X1_RVT U134 ( .A1(\mem[1][0] ), .A2(n125), .A3(\mem[3][0] ), .A4(n129), 
        .A5(n130), .Y(n133) );
  AO22X1_RVT U135 ( .A1(\mem[6][0] ), .A2(n2), .A3(\mem[4][0] ), .A4(n127), 
        .Y(n131) );
  AO221X1_RVT U136 ( .A1(\mem[0][0] ), .A2(n125), .A3(\mem[2][0] ), .A4(n129), 
        .A5(n131), .Y(n132) );
  AO22X1_RVT U137 ( .A1(n133), .A2(N9), .A3(n132), .A4(n115), .Y(N38) );
  AO22X1_RVT U138 ( .A1(\mem[7][1] ), .A2(n2), .A3(\mem[5][1] ), .A4(n128), 
        .Y(n134) );
  AO221X1_RVT U139 ( .A1(\mem[1][1] ), .A2(n126), .A3(\mem[3][1] ), .A4(n129), 
        .A5(n134), .Y(n137) );
  AO22X1_RVT U140 ( .A1(\mem[6][1] ), .A2(n2), .A3(\mem[4][1] ), .A4(n128), 
        .Y(n135) );
  AO221X1_RVT U141 ( .A1(\mem[0][1] ), .A2(n126), .A3(\mem[2][1] ), .A4(n129), 
        .A5(n135), .Y(n136) );
  AO22X1_RVT U142 ( .A1(n137), .A2(N9), .A3(n136), .A4(n115), .Y(N37) );
  AO22X1_RVT U143 ( .A1(\mem[7][2] ), .A2(n2), .A3(\mem[5][2] ), .A4(n128), 
        .Y(n138) );
  AO221X1_RVT U144 ( .A1(\mem[1][2] ), .A2(n126), .A3(\mem[3][2] ), .A4(n129), 
        .A5(n138), .Y(n141) );
  AO22X1_RVT U145 ( .A1(\mem[6][2] ), .A2(n2), .A3(\mem[4][2] ), .A4(n128), 
        .Y(n139) );
  AO221X1_RVT U146 ( .A1(\mem[0][2] ), .A2(n126), .A3(\mem[2][2] ), .A4(n129), 
        .A5(n139), .Y(n140) );
  AO22X1_RVT U147 ( .A1(n141), .A2(N9), .A3(n140), .A4(n115), .Y(N36) );
  AO22X1_RVT U148 ( .A1(\mem[7][3] ), .A2(n2), .A3(\mem[5][3] ), .A4(n127), 
        .Y(n142) );
  AO221X1_RVT U149 ( .A1(\mem[1][3] ), .A2(n125), .A3(\mem[3][3] ), .A4(n129), 
        .A5(n142), .Y(n145) );
  AO22X1_RVT U150 ( .A1(\mem[6][3] ), .A2(n2), .A3(\mem[4][3] ), .A4(n127), 
        .Y(n143) );
  AO221X1_RVT U151 ( .A1(\mem[0][3] ), .A2(n125), .A3(\mem[2][3] ), .A4(n129), 
        .A5(n143), .Y(n144) );
  AO22X1_RVT U152 ( .A1(n145), .A2(N9), .A3(n144), .A4(n115), .Y(N35) );
  AO22X1_RVT U153 ( .A1(\mem[7][4] ), .A2(n2), .A3(\mem[5][4] ), .A4(n127), 
        .Y(n146) );
  AO221X1_RVT U154 ( .A1(\mem[1][4] ), .A2(n125), .A3(\mem[3][4] ), .A4(n129), 
        .A5(n146), .Y(n149) );
  AO22X1_RVT U155 ( .A1(\mem[6][4] ), .A2(n2), .A3(\mem[4][4] ), .A4(n127), 
        .Y(n147) );
  AO221X1_RVT U156 ( .A1(\mem[0][4] ), .A2(n125), .A3(\mem[2][4] ), .A4(n129), 
        .A5(n147), .Y(n148) );
  AO22X1_RVT U157 ( .A1(n149), .A2(N9), .A3(n148), .A4(n115), .Y(N34) );
  AO22X1_RVT U158 ( .A1(\mem[7][5] ), .A2(n2), .A3(\mem[5][5] ), .A4(n128), 
        .Y(n150) );
  AO221X1_RVT U159 ( .A1(\mem[1][5] ), .A2(n125), .A3(\mem[3][5] ), .A4(n129), 
        .A5(n150), .Y(n153) );
  AO22X1_RVT U160 ( .A1(\mem[6][5] ), .A2(n2), .A3(\mem[4][5] ), .A4(n128), 
        .Y(n151) );
  AO221X1_RVT U161 ( .A1(\mem[0][5] ), .A2(n125), .A3(\mem[2][5] ), .A4(n129), 
        .A5(n151), .Y(n152) );
  AO22X1_RVT U162 ( .A1(n153), .A2(N9), .A3(n152), .A4(n115), .Y(N33) );
  AO22X1_RVT U163 ( .A1(\mem[7][6] ), .A2(n2), .A3(\mem[5][6] ), .A4(n127), 
        .Y(n154) );
  AO221X1_RVT U164 ( .A1(\mem[1][6] ), .A2(n126), .A3(\mem[3][6] ), .A4(n129), 
        .A5(n154), .Y(n157) );
  AO22X1_RVT U165 ( .A1(\mem[6][6] ), .A2(n2), .A3(\mem[4][6] ), .A4(n127), 
        .Y(n155) );
  AO221X1_RVT U166 ( .A1(\mem[0][6] ), .A2(n126), .A3(\mem[2][6] ), .A4(n129), 
        .A5(n155), .Y(n156) );
  AO22X1_RVT U167 ( .A1(n157), .A2(N9), .A3(n156), .A4(n115), .Y(N32) );
  AO22X1_RVT U168 ( .A1(\mem[7][7] ), .A2(n2), .A3(\mem[5][7] ), .A4(n128), 
        .Y(n158) );
  AO221X1_RVT U169 ( .A1(\mem[1][7] ), .A2(n126), .A3(\mem[3][7] ), .A4(n129), 
        .A5(n158), .Y(n162) );
  AO22X1_RVT U170 ( .A1(\mem[6][7] ), .A2(n2), .A3(\mem[4][7] ), .A4(n128), 
        .Y(n159) );
  AO221X1_RVT U171 ( .A1(\mem[0][7] ), .A2(n126), .A3(\mem[2][7] ), .A4(n129), 
        .A5(n159), .Y(n161) );
  AO22X1_RVT U172 ( .A1(N9), .A2(n162), .A3(n161), .A4(n115), .Y(N31) );
  NAND3X2_RVT U173 ( .A1(wr_ptr[0]), .A2(n166), .A3(n18), .Y(n21) );
  NAND3X2_RVT U174 ( .A1(wr_ptr[1]), .A2(n165), .A3(n18), .Y(n19) );
  NAND3X2_RVT U175 ( .A1(wr_ptr[1]), .A2(wr_ptr[0]), .A3(n18), .Y(n16) );
  NAND3X2_RVT U176 ( .A1(n6), .A2(n166), .A3(wr_ptr[0]), .Y(n10) );
  NAND3X2_RVT U177 ( .A1(n6), .A2(n165), .A3(wr_ptr[1]), .Y(n7) );
  NAND3X2_RVT U178 ( .A1(wr_ptr[0]), .A2(n6), .A3(wr_ptr[1]), .Y(n4) );
endmodule


module fifo_top ( clk, rst, wr_en, rd_en, data_in, data_out, full, empty );
  input [7:0] data_in;
  output [7:0] data_out;
  input clk, rst, wr_en, rd_en;
  output full, empty;
  wire   _0_net_, n2;
  wire   [2:0] wr_ptr;
  wire   [2:0] rd_ptr;

  AND2X1_RVT U2 ( .A1(wr_en), .A2(n2), .Y(_0_net_) );
  fifo_status_DEPTH8_COUNT_WIDTH4 status_inst ( .clk(clk), .rst(rst), .wr_en(
        wr_en), .rd_en(rd_en), .full(full), .empty(empty) );
  write_pointer_ADDR_WIDTH3 wr_ptr_inst ( .clk(clk), .rst(rst), .wr_en(wr_en), 
        .full(full), .wr_ptr(wr_ptr) );
  read_pointer_ADDR_WIDTH3 rd_ptr_inst ( .clk(clk), .rst(rst), .rd_en(rd_en), 
        .empty(empty), .rd_ptr(rd_ptr) );
  fifo_mem_DATA_WIDTH8_DEPTH8_ADDR_WIDTH3 mem_inst ( .clk(clk), .rst(rst), 
        .wr_en(_0_net_), .wr_ptr(wr_ptr), .rd_ptr(rd_ptr), .data_in(data_in), 
        .rd_en(rd_en), .full(full), .empty(empty), .data_out(data_out) );
  INVX0_RVT U3 ( .A(full), .Y(n2) );
endmodule

