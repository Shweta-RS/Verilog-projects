`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.05.2026 11:22:57
// Design Name: 
// Module Name: RAM_tb
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


module RAM_tb();
    reg clk, rst,wr_en,out_en;
    reg [2:0]addr;
    wire [7:0]data;
    reg [7:0]temp_data;
    
    top_module dut(clk,rst,wr_en,out_en,addr,data);
    
    initial 
    begin
    {clk,rst, wr_en, out_en, addr,temp_data}=0;
    end
    
    always #5 clk = ~clk;
    
    initial begin
    rst = 1'b1;
    #10;
    rst = 1'b0;
   
    #10;
    
    wr_en=1;
    out_en = 0;
    addr = 3'b101;
    temp_data = 12;
    
    #10;
    
    wr_en=1;
    out_en = 0;
    addr = 3'b011;
    temp_data = 5;
    
    #20;
    wr_en=0;
    out_en = 1;
    addr = 3'b011;
    
    #20;
    wr_en=0;
    out_en = 1;
    addr = 3'b101;
    
    #100;
    
    $finish;
   end
   assign data = (wr_en) ? temp_data : 8'bz;
endmodule
