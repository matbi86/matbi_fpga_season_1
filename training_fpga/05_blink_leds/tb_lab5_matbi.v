//////////////////////////////////////////////////////////////////////////////////
// Company: Personal
// Engineer: Matbi / Austin
//
// Create Date:
// Design Name: tb_lab5_matbi
// Module Name: tb_lab5_matbi
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

module tb_lab5_matbi();
reg clk , reset_n;
reg [3:0] sw;
wire [3:0] led;
    
// clk gen
always
    #5 clk = ~clk;

integer i;

initial begin
//initialize value
$display("initialize value [%0d]", $time);
    reset_n = 1;
    clk     = 0;
	sw 	= 0;

// reset_n gen
$display("Reset! [%0d]", $time);
# 100
    reset_n = 0;
# 10
    reset_n = 1;
# 10
@(posedge clk);

$display("sw on [%0d]", $time);
sw = 4'b1111;

$display("Start! [%0d]", $time);

for (i = 0; i < 32'd400; i = i+1) begin
	@(posedge clk);
end

# 100
$display("Success Simulation!! (Matbi = gudok & joayo) [%0d]", $time);
$finish;
end


lab5_matbi u_lab5_matbi(
	.clk		(clk),
	.reset_n	(reset_n),
	.sw			(sw),  
	.led		(led)
);
 
      
endmodule
