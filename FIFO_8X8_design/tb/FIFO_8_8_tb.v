`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.05.2026 18:03:52
// Design Name: 
// Module Name: FIFO_8_8_tb
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


module FIFO_8_8_tb( );
	reg clk,rst;
	reg [7:0]data_in;
	wire [7:0]data_out;
	
	top_fifo dut(clk,rst,data_in,data_out);
	
	initial begin
		{clk,rst,data_in} = 0;
		
	end
	
	always #5 clk = ~clk;
	
	initial begin
	rst=1;
	#10 rst=0;
	
	data_in = 5;
	#10;
	data_in = 8;
	#10;
	data_in = 15;
	#100;
	$finish;
	end	
endmodule
