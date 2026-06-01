`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.05.2026 10:47:10
// Design Name: 
// Module Name: RAM_8X8
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


module RAM_8X8(
   input clk,rst,wr_en,out_en,cs,
   input [2:0]addr,
   inout [7:0]data
    );
    
    reg [7:0] mem[7:0];
    reg [7:0]data_temp;
    integer i;
    
    always@(posedge clk)
    begin 
        if(rst)
        for(i=0;i<=7;i=i+1)
            mem[i]<=0;
        else if(wr_en && cs)
            mem[addr]<=data;
        else if(!wr_en && out_en && cs)
            data_temp <= mem[addr];
     end  
     assign data = (!wr_en && out_en && cs)? data_temp : 'bz;
          
endmodule
