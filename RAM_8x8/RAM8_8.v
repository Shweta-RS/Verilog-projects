module RAM8_8(
	input clk,rst,wr_en,
	input [2:0]wr_addr,
	input [7:0]data_in,
	input [2:0]rd_addr,
	output reg [7:0]data_out);
	
	//creating internal memory
	reg [7:0] mem[7:0];
	
	integer i;
	
	//write logic and read logic
	always @(posedge clk or posedge rst)
	begin
	
	  // all memory locations=0 if rst=1 
		if(rst)
			begin
			for(i=0;i<7;i=i+1)
			   mem[i] <= 0;
			end
		
		else
			if(wr_en)
				mem[wr_addr] <= data_in;
			else
				data_out <= mem[rd_addr];
	end
endmodule
