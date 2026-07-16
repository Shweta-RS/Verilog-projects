`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.07.2026 18:49:39
// Design Name: 
// Module Name: atm_fsm
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


module atm_fsm ( 
    input clk, 
    input reset, 
    input [7:0] sw, 
    input [2:0] key, 
    input timer_done, 
    output reg [15:0] display_value, 
    output reg start_timer 
); 
parameter IDLE=0, PIN=1, VERIFY=2, SHOW_ACC=3, SHOW_BAL=4, DEPOSIT=5, LOGOUT=6; 
reg [2:0] state; 
reg [15:0] balance1 = 16'd150; 
reg [15:0] balance2 = 16'd250; 
reg [15:0] current_balance; 
reg active_user; 
 
always @ (posedge clk or posedge reset) 
begin 
    if(reset) begin 
         state <= IDLE; 
         active_user <= 0; 
         start_timer <= 0; 
    end 
    else begin 
    start_timer <= 1; 
    case(state) 
    IDLE: begin 
         display_value <= 16'h0110;   
        if(timer_done) 
             state <= PIN; 
             end 
 
    PIN: begin 
             start_timer <= 0; 
            display_value <= {12'b0, sw [4:2]}; 
              if(sw[0]) 
             state <= VERIFY; 
           end 
 
    VERIFY: begin 
         start_timer <= 0; 
         if (sw [4:2] == 3'b010) begin 
              active_user <= 0; 
              state <= SHOW_ACC; 
              start_timer <= 1; 
                   end 
        else if (sw [4:2] == 3'b101) begin 
              active_user <= 1; 
              state <= SHOW_ACC; 
              start_timer <= 1; 
         end 
         else 
              state <= IDLE; 
     end 
 
    SHOW_ACC: begin 
          start_timer <= 1; 
          if (active_user == 0) 
              display_value <= 16'h1414; 
          else 
               display_value <= 16'h1231; 
   if (timer_done) 
               state <= SHOW_BAL; 
          end 
 
    SHOW_BAL: begin 
          start_timer <= 1; 
          if(active_user == 0) 
               current_balance <= balance1; 
          else 
               current_balance <= balance2; 
           display_value <= current_balance; 
 
          if (! key [2]) 
           state <= LOGOUT; 
   else if (timer_done && sw [1]) 
           state <= DEPOSIT;    
      end 
 
    DEPOSIT: begin 
          start_timer <= 0; 
          display_value <= (sw [5] ? 100 : 0) + (sw [6] ? 200 : 0) + (sw [7] ? 500 : 0); 
          if (! key [1]) begin 
               if (active_user == 0) 
                  balance1 <= balance1 + display_value; 
               else 
                  balance2 <= balance2 + display_value; 
start_timer <= 1; 
              state <= SHOW_BAL; 
          end 
     end 
 
 LOGOUT: begin 
      start_timer <= 1; 
      display_value <= 16'h0FF0;    
     if(timer_done) 
          state <= IDLE; 
 end 
 
        endcase 
    end 
end 
endmodule
