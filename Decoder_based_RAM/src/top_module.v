`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.05.2026 11:05:12
// Design Name: 
// Module Name: top_module
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


module top_module(
    input clk, rst,wr_en,out_en,
    input [2:0]addr,
    inout [7:0]data
);

reg cs1,cs2,cs3,cs4;

always@(*)
begin   
    if(addr[2:1] == 2'b00)
        begin  cs1=1'b1;cs2=1'b0;cs3=1'b0;cs4=1'b0; end
    else if(addr[2:1] == 2'b01)
        begin  cs1=1'b0;cs2=1'b1;cs3=1'b0;cs4=1'b0; end
    else if(addr[2:1] == 2'b10)
        begin  cs1=1'b0;cs2=1'b0;cs3=1'b1;cs4=1'b0; end
    else if(addr[2:1] == 2'b11)
        begin  cs1=1'b0;cs2=1'b0;cs3=1'b0;cs4=1'b1; end
end
RAM_8X8 RAM1(clk,rst,wr_en,out_en,cs1,addr,data);
RAM_8X8 RAM2(clk,rst,wr_en,out_en,cs2,addr,data);
RAM_8X8 RAM3(clk,rst,wr_en,out_en,cs3,addr,data);
RAM_8X8 RAM4(clk,rst,wr_en,out_en,cs4,addr,data);

endmodule
