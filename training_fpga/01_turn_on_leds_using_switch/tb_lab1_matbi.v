//////////////////////////////////////////////////////////////////////////////////
// Company: Personal
// Engineer: Matbi / Austin
//
// Create Date:
// Design Name: tb_lab1_matbi
// Module Name: tb_lab1_matbi
// Project Name:
// Target Devices: Zybo Z7-20
// Tool Versions:
// Description: LED Test Testbench
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module tb_lab1_matbi(

    );
    
    reg [3:0] sws;
    reg [3:0] btns;
    wire [3:0] leds;
    reg [3:0] e_led;
    
    integer i;
    

    lab1_matbi dut(.led(leds),.btn(btns),.sw(sws));
 
    function [3:0] expected_led;
       input [3:0] btn;
    begin      
       expected_led[0] = btn[0];
       expected_led[1] = btn[1];
       expected_led[2] = btn[2];
       expected_led[3] = btn[3];
    end   
    endfunction   
    
    initial
    begin
		sws = 4'b1111; // All switches are on.
        for (i=0; i < 15; i=i+1)
        begin
            #50 btns=i;
            #10 e_led = expected_led(btns);
            if(leds == e_led)
                $display("LED output matched at", $time);
            else
                $display("LED output mis-matched at ",$time,": expected: %b, actual: %b", e_led, leds);
        end
    end
      
endmodule
