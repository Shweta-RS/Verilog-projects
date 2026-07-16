`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.07.2026 18:59:12
// Design Name: 
// Module Name: display_driver
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



module display_driver(
    input [15:0] value,
    output [6:0] HEX0,
    output [6:0] HEX1,
    output [6:0] HEX2,
    output [6:0] HEX3
);

wire [3:0] d0, d1, d2, d3;

assign d0 = value % 10;
assign d1 = (value / 10) % 10;
assign d2 = (value / 100) % 10;
assign d3 = (value / 1000) % 10;

seven_seg_decoder S0(d0, HEX0);
seven_seg_decoder S1(d1, HEX1);
seven_seg_decoder S2(d2, HEX2);
seven_seg_decoder S3(d3, HEX3);

endmodule
