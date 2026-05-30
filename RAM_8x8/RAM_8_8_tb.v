module RAM_8_8_tb;
	reg clk,rst,wr_en;
	reg [2:0]wr_addr;
	reg [7:0]data_in;
	reg [2:0]rd_addr;
	wire [7:0]data_out;
	
	RAM8_8 dut(clk,rst,wr_en,wr_addr,data_in,rd_addr,data_out);
	
	initial begin
		{clk,rst,wr_en,wr_addr,data_in,rd_addr} = 0;
		
	end
	
	always #5 clk = ~clk;
	
	initial begin
	rst=1;
	#10 rst=0;
	
	wr_en = 1;
	wr_addr = 3'b010;
	data_in = 5;
	
	#10;
	wr_en = 1;
	wr_addr = 3'b011;
	data_in = 8;
	
	#10;
	wr_en = 0;
	rd_addr = 3'b010;
	
	#10;
	wr_en = 0;
	rd_addr = 3'b011;
	#100;
	
	$finish;
	
	end
endmodule
	