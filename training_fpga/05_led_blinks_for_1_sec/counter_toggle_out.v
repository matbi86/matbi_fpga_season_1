//////////////////////////////////////////////////////////////////////////////////
// Company: Personal
// Engineer: Matbi / Austin
//
// Create Date:
// Design Name: 32 bit counter
// Module Name: counter_toggle_out
// Project Name:
// Target Devices:
// Tool Versions:
// Description: counting 0~100M-1
//				
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
 
`timescale 1ns / 1ps
module counter_toggle_out
(
    input 			clk			,
    input 			reset_n		,
	input 			enable		,
	input [31:0]	i_cnt_th	,
    output reg		o_toggle	
);

	reg [31:0] cnt_always;  
	always @(posedge clk or negedge reset_n) begin
	    if(!reset_n) begin			 
	        cnt_always 	<= 0;  
			o_toggle	<= 0;
	    end else if (!enable) begin  // if enable is '1', count
	        cnt_always 	<= 0;  
			o_toggle	<= 0;
	    end else if (cnt_always >= i_cnt_th-1) begin
	        cnt_always 	<= 0; 
			o_toggle	<= ~o_toggle;
	    end else begin
	        cnt_always <= cnt_always + 1; 
		end
	end

endmodule
