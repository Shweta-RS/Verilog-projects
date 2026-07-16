`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.07.2026 18:41:17
// Design Name: 
// Module Name: ATM_top
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

module atm_top (
    input CLOCK_50,
    input rst,
    input [7:0] SW,
    input [2:0] Key,
    output [6:0] dig0,
    output [6:0] dig1,
    output [6:0] dig2,
    output [6:0] dig3
);

wire [15:0] display_value;
wire start_timer;
wire timer_done;

//------------------------------
// ATM FSM
//------------------------------
atm_fsm FSM (
    .clk(CLOCK_50),
    .reset(rst),
    .sw(SW),
    .key(Key),
    .timer_done(timer_done),
    .display_value(display_value),
    .start_timer(start_timer)
);

//------------------------------
// Timer
//------------------------------
timer_4sec TIMER (
    .clk(CLOCK_50),
    .reset(rst),
    .start(start_timer),
    .done(timer_done)
);

//------------------------------
// Display Driver
//------------------------------
display_driver DISP (
    .value(display_value),
    .HEX0(dig0),
    .HEX1(dig1),
    .HEX2(dig2),
    .HEX3(dig3)
);

endmodule

