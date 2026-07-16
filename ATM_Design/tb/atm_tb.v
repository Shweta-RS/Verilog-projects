`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.07.2026 19:01:46
// Design Name: 
// Module Name: atm_tb
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

`timescale 1ns/1ps

module atm_tb();

reg CLOCK_50, rst;
reg [7:0] SW;
reg [2:0] Key;

wire [6:0] dig0, dig1, dig2, dig3;

atm_top DUT (
    .CLOCK_50(CLOCK_50),
    .SW(SW),
    .rst(rst),
    .Key(Key),
    .dig0(dig0),
    .dig1(dig1),
    .dig2(dig2),
    .dig3(dig3)
);

// Clock generation
initial begin
    CLOCK_50 = 0;
    forever #10 CLOCK_50 = ~CLOCK_50;
end

// Test sequence
initial begin

    rst = 0;
    #50 rst = 1;
    #50 rst = 0;

    SW = 0;
    Key = 4'b1111;      // buttons inactive

    #100;
    $display("----- USER 0 LOGIN -----");

    // USER 0 PIN
    SW[4:2] = 3'b010;
    SW[0] = 1;
    #200;
    SW[0] = 0;

    #200;

    // Deposit mode
    SW[1] = 1;
    SW[5] = 1;      // 100
    SW[6] = 1;      // 200
    SW[7] = 0;      // 500

    #200;
    Key[1] = 0;
    #100;
    Key[1] = 1;

    SW[5] = 0;
    SW[6] = 0;

    //------------------------------------------------------
    // USER 1
    //------------------------------------------------------

    $display("----- USER 1 LOGIN -----");

    SW = 0;
    #200;

    // USER 1 PIN
    SW[4:2] = 3'b101;
    SW[0] = 1;
    #200;
    SW[0] = 0;

    #2000;

    SW[1] = 1;
    SW[7] = 1;      // 500

    #200;

    Key[1] = 0;
    #100;
    Key[1] = 1;

    SW[7] = 0;

    #2000;

    $monitor("Time=%0t | State=%0d | Display=%0d | Bal1=%0d | Bal2=%0d",
             $time,
             DUT.FSM.state,
             DUT.FSM.display_value,
             DUT.FSM.balance1,
             DUT.FSM.balance2);

    $display("Simulation Finished");
    $stop;

end

endmodule
