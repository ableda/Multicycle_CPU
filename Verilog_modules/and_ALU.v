`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:31:23 10/05/2015 
// Design Name: 
// Module Name:    and_ALU 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module and_ALU(a, b, a_and_b);
	
	input a, b;
	output a_and_b;
	
	and and_a_b (a_and_b, a, b);
	
endmodule
