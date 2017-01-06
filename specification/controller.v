//
// EECE 479: Project Verilog File: controller.v
//
// Controller block for Divider
//
// Names:   Nicholas Mulvenna & Shelby Mosbrucker
// Number:  47733100 & 12788113
//

module controller(load,
                   add,
                   shift,
                   inbit,
                   sel,
		   valid,
                   start,
                   sign, 
                   clk,
                   reset);
output load;
output add;
output shift;
output inbit;
output [1:0] sel;
output valid;   
input start;
input sign;
input clk;
input reset;

reg load;
reg add;
reg shift;
reg inbit;
reg [1:0] sel;
reg valid;

reg [1:0] curr_state;
reg [1:0] next_state;

reg [4:0] count; //for counting cycles after "start" to set valid

`define STATE_A 2'b00 //"starting" state
`define STATE_B 2'b01 //"middle" state (after "start" state")
`define STATE_C 2'b10 //state after "middle" state when sign is 1
`define STATE_D 2'b11 //state after "middle" when sign is 0

//next state logic (purely combinational)
//reset is async so it is not used here
always @(curr_state or start or sign)
begin
    if (start == 1)
        next_state = `STATE_A;
    else
        case (curr_state)
           `STATE_A: next_state = `STATE_B;
           `STATE_B: if (sign == 1) next_state = `STATE_C;
                     else next_state = `STATE_D;
           `STATE_C: next_state = `STATE_B;
           `STATE_D: next_state = `STATE_B;
           default:  next_state = `STATE_A;
        endcase
end

//state change logic (has memory)
//reset is async
always @(posedge clk or reset)
	if (reset) curr_state <= `STATE_A;
        else       curr_state <= next_state;

//state output logic (purely combinational)
always @(curr_state)
begin
   case (curr_state)
      `STATE_A: begin
                    load  = 1'b1;
                    sel   = 2'b10;
                    shift = 1'b1;
                    inbit = 1'b0;
                    add   = 1'bX; //don't care
                end
      `STATE_B: begin
                     load  = 1'b0;
                     sel   = 2'b01;
                     shift = 1'b0;
                     inbit = 1'bX; //don't care
                     add   = 1'b0;
                end
      `STATE_C: begin
                     load  = 1'b0;
                     sel   = 2'b01;
                     shift = 1'b1;
                     inbit = 1'b0;
                     add   = 1'b1;
                end
      `STATE_D: begin
                     load  = 1'b0;
                     sel   = 2'b11;
                     shift = 1'b1;
                     inbit = 1'b1;
                     add   = 1'bX; //don't care
                end
      default: begin
                     load  = 1'bX;
                     sel   = 2'bXX;
                     shift = 1'bX;
                     inbit = 1'bX;
                     add   = 1'bX;
                end
   endcase
end

//counter - counts cycles after start (has memory)
always @(posedge clk or start or reset)
begin
  if (reset)
    count = 5'b00000;
  else 
    if (clk)
        if (start)
          count = 5'b00000;
        else
          count = count + 1;
end

//count output logic (purely combinational)
always @(count)
begin
  case (count)
    17:      valid = 1'b1; //TODO check whether this is the right cycle
    default: valid = 1'b0;
  endcase
end

endmodule
