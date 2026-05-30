`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.05.2026 19:47:05
// Design Name: 
// Module Name: mod_b
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


module mod_b(input clk,rst,
    input [7:0]data_in,
    output reg [7:0]data_out,
    output reg rd_en
 );
 parameter idle = 2'b00;
 parameter s1 = 2'b01;
 parameter data_phase = 2'b10;
 
 reg [1:0] ps,ns;
 
 always@(posedge clk)
 begin
    if(rst)
        ps <= idle;
    else
        ps <= ns;
  end
  
  always@(*)
  begin
    case(ps)
        idle: begin ns = s1; rd_en = 0; end
        s1 :  ns = data_phase;
        data_phase :begin ns = idle; rd_en = 1; data_out = data_in; end
    endcase
  end
 endmodule
