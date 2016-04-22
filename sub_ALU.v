`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:30:43 10/05/2015 
// Design Name: 
// Module Name:    sub_ALU 
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
module sub_ALU(a, b, c_in, diff, c_out);

	input a, b;
	input c_in;
	output diff;
	output c_out;
	
	wire b_not;
	
	not_ALU
	notb
	(
		.in(b),
		.out(b_not)
	);
	
	FA_str subt (c_out, diff, a, b_not, c_in);

endmodule
