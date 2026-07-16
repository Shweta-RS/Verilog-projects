`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.07.2026 18:52:16
// Design Name: 
// Module Name: timer_4sec
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


`timescale 1ns / 1ps

module timer_4sec(
    input clk,
    input reset,
    input start,
    output reg done
);

parameter FOUR_SEC = 200_000_000;

reg [31:0] count = 0;

always @(posedge clk or posedge reset)
begin
    if (reset)
    begin
        count <= 0;
        done <= 0;
    end
    else if (start)
    begin
        if (count < FOUR_SEC)
        begin
            count <= count + 1;
            done <= 0;
        end
        else
        begin
            done <= 1;
            count <= 0;
        end
    end
    else
    begin
        count <= 0;
        done <= 0;
    end
end

endmodule
