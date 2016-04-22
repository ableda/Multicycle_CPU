`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:30:55 10/05/2015 
// Design Name: 
// Module Name:    or_ALU 
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
module or_ALU(a, b, a_or_b);
	
	input a, b;
	output a_or_b;
	
	or or_a_b(a_or_b, a, b);
	
endmodule
