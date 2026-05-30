`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.05.2026 20:08:17
// Design Name: 
// Module Name: top_fifo
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


module top_fifo(input clk,rst,
input [7:0]data_in_top, output [7:0]data_out_top);

wire [7:0]data_out_temp;
wire wr_en, rd_en,full,empty;
wire [7:0]data_out_fifo;
mod_a mod1(clk,rst,data_in_top,wr_en,data_out_temp);
FIFO_8_8 fifo8_8(clk,rst,wr_en,rd_en,data_out_temp,data_out_fifo,full,empty);
mod_b mod2(clk,rst,data_out_fifo,data_out_top,rd_en);



endmodule
