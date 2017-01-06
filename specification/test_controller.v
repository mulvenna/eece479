//
// EECE 479: Project Verilog File: test_controller.v
//
// Testbench for Controller
//
// Names:   Nicholas Mulvenna & Shelby Mosbrucker
// Number:  47733100 & 12788113
//

module  test_controller;

//used as outputs for DUT
wire load;
wire add;
wire shift;
wire inbit;
wire [1:0] sel;
wire valid;

//used as inputs for DUT
reg start;
reg sign;
reg clk;
reg reset; //async reset

//////////////////////////////////////////////////////////////////////////
// Instantiate the module
//////////////////////////////////////////////////////////////////////////

controller u0(
         .load(load),
         .add(add),
         .shift(shift),
         .inbit(inbit),
         .sel(sel),
         .valid(valid),
         .start(start),
         .sign(sign),
         .clk(clk),
         .reset(reset));

// Create a clock...

`define    QTR_PERIOD    5000
always begin
   #(`QTR_PERIOD) clk = 1;
   #(`QTR_PERIOD) clk = 0;
end


//////////////////////////////////////////////////////////////////////////
// The test commands
//////////////////////////////////////////////////////////////////////////

initial begin
   test_controller("test_controller.vec");
   $finish;
end


//////////////////////////////////////////////////////////////////////////
// The code that actually runs the test
//////////////////////////////////////////////////////////////////////////


task test_controller;
  input [255:0] file;
  reg[1:9] test_vector_input[5999:0];
  reg[1:9] line;

  reg load_expected;
  reg add_expected;
  reg shift_expected;
  reg inbit_expected;
  reg valid_expected;
  reg [1:0] sel_expected;

  integer cnt, num, numpass, numfail, validfail;
  
  begin
    $readmemb(file, test_vector_input);

    // The first line of the file should specify the
    // number of entries in the file

    num = test_vector_input[0];
    $display("Number of test vectors: %d\n",num);
    numpass = 0;
    numfail = 0;
    validfail = 0;

    // pull into (async) reset
    reset = 1'b1;
    // pull out of reset
    #10 reset = 1'b0;

    // Step through each test vector

    for(cnt=0; cnt<num; cnt=cnt+1) begin
       line = test_vector_input[1+cnt];

       // Set the inputs
       @(negedge clk)
       start = line[1];
       sign  = line[2];
       load_expected  = line[3];
       add_expected   = line[4];
       shift_expected = line[5];
       inbit_expected = line[6];
       valid_expected = line[7];
       sel_expected   = line[8:9];

       // Now check if the value is correct.
       @(posedge clk)
           #10;

       if (load  === load_expected  &&
           add   === add_expected   &&
           shift === shift_expected &&
           inbit === inbit_expected &&
           valid === valid_expected &&
           sel   === sel_expected) 
         begin
           $display("Pass: load=%b, add=%b, shift=%b, inbit=%b, valid=%b, sel=%b%b", load, add, shift, inbit, valid, sel[1], sel[0]);
         end
       else
         begin
           $display("Fail:");
           $display("Got:      load=%b, add=%b, shift=%b, inbit=%b, valid=%b, sel=%b%b", load, add, shift, inbit, valid, sel[1], sel[0]);
           $display("Expected: load=%b, add=%b, shift=%b, inbit=%b, valid=%b, sel=%b%b", load_expected, add_expected, 
                                                                               shift_expected, inbit_expected, 
                                                                               valid_expected, sel_expected[1], sel_expected[0]);
           numfail = numfail + 1;
         end

    end
    $display("Number test cases that fail: %d",numfail);
    if (numfail == 0)
       $display("Good work for test cases in vector file, further testing for 'valid' next:\n");
    
    $display("Asserting start for 1 cycle then waiting 17 cycles while checking 'valid'...\n");

    start = 1;
    @(negedge clk)
    start = 0;

    for(cnt=0; cnt<17; cnt=cnt+1) begin
      if (valid == 1)
      begin
        $display("Fail: valid was not 0");
        validfail = validfail + 1;
      end
      @(negedge clk);
    end

    // Print Results for this test case
    if (valid != 1)
    begin
      $display("Fail: valid was not 1 after 17 cycles");
      validfail = validfail + 1;
    end

    if (validfail == 0)
    begin
      $display("Good work again, testing for 'valid' passed\n");
    end
    else
    begin
      $display("Fail: testing for 'valid' did not pass\n");
    end

    $display(" ");
 end
endtask
endmodule
