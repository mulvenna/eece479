//
// EECE 479: Project Verilog File: divider.v
//
// This is the stub for your top-level block.  Please start with this
// template when writing your Verilog code.
//
// Names:   Nicholas Mulvenna & Shelby Mosbrucker
// Number:  47733100 & 12788113
//


module divider(
         remainder,
         quotient,
	 valid,
         divisorin,
         dividendin,
         start,
         clk,
         reset);

output [6:0] remainder;
output [7:0] quotient;
output valid;  
input [6:0] divisorin;
input [7:0] dividendin;
input start;
input clk;
input reset;

wire load;
wire add;
wire shift;
wire inbit;
wire [1:0] sel;
wire sign;

controller controller(load, add, shift, inbit, sel, valid, start, sign, clk, reset);

datapath datapath(remainder, quotient, sign, divisorin, dividendin, load, add, shift, inbit, sel, clk, reset);

endmodule
