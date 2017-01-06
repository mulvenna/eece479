//
// EECE 479: Project Verilog File: datapath.v
//
// Datapath for Divider
//
// Names:   Nicholas Mulvenna & Shelby Mosbrucker
// Number:  47733100 & 12788113
//

module datapath(remainder, 
                quotient, 
                sign,
                divisorin,
                dividendin,
                load,
                add,
                shift,
                inbit,
                sel,
                clk,
                reset);

//datapath->divider
output [6:0] remainder;
output [7:0] quotient;

//datapath->control
output sign;

//divider->datapath
input [6:0] divisorin;
input [7:0] dividendin;
input clk;
input reset; //async

//control->datapath
input load;
input add;
input shift;
input inbit;
input [1:0] sel;

reg [7:0]  adder_output;     //adder output
reg [15:0] shifter_output;   //shifter output
reg [7:0]  divisor_r;   //divisor register value
reg [15:0] mux_output;  //mux output
reg [15:0] remainder_r; //remainder register value

//divisor register
always @(posedge clk or reset)
begin
  if(reset == 1) 
    divisor_r = 8'b0;	
  else
  if(load == 1)
    divisor_r = {1'b0, divisorin};
end

//remainder register
always @(posedge clk or reset)
begin
  if(reset == 1)
    remainder_r = 16'b0;
  else
    remainder_r = shifter_output;
end

//adder/subtractor (purely combinational)
always@(add or remainder or divisor_r)
begin
  if(add == 1)
    adder_output = remainder_r[15:8] + divisor_r;
  else
    adder_output = remainder_r[15:8] - divisor_r;   
end

//mux (purely combinational)
always@(sel or remainder or adder_output or dividendin)
begin
  case(sel)
    2'b10: mux_output = {8'b0, dividendin};
    2'b01: mux_output = {adder_output, remainder_r[7:0]};
    2'b11: mux_output = remainder_r;
    default: mux_output = 0; //default case should not happen
  endcase
end

//shifter (purely combinational)
always@(shift or mux_output or inbit)
begin
  if(shift == 1)
    shifter_output = {mux_output[14:0], inbit};
  else
    shifter_output = mux_output;
end

//assign outputs
assign sign      = adder_output[7];
assign remainder = remainder_r[15:9];
assign quotient  = remainder_r[7:0];

endmodule
