//////////////////////////////////////////////////////////////////////////////////
// Company: Personal
// Engineer: Matbi / Austin
//
// Create Date:
// Design Name: lab1_matbi
// Module Name: lab1_matbi
// Project Name:
// Target Devices: Zybo Z7-20
// Tool Versions:
// Description: LED Test (DUT)
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module lab1_matbi(
    input [3:0] sw,
    input [3:0] btn,
    output [3:0] led
    );
    
    assign led[0] = sw[0] & btn[0];
    assign led[1] = sw[1] & btn[1];
    assign led[2] = sw[2] & btn[2];
    assign led[3] = sw[3] & btn[3];
     
endmodule
