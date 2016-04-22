`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:30:28 10/05/2015 
// Design Name: 
// Module Name:    add_ALU 
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
module add_ALU(a, b, c_in, sum, c_out);
	
	
	input a, b;
	input c_in;
	output sum;
	output c_out;
	
	FA_str addr (c_out, sum, a, b, c_in);

endmodule
