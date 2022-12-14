`include "counter.v"

module counter_tb();
// Declare inputs as regs and outputs as wires
reg clock, reset, enable;
wire[3:0] counter_out;

// Initialise all variables
initial begin
  $display ("time\t clk reset enable counter");
  $monitor("%g\t %b %b %b %b", $time, clock, reset, enable, counter_out);
  clock = 1;      // initial value of clock
  reset = 0;      // initial value of reset
  enable = 0;     // initial value of enable
  #5 reset = 1;   // Assert the reset
  #10 reset = 0;  // De-assert the reset
  #5 enable = 1;  // Assert enable
  #100 enable = 0;// De-assert enable
  #10 $finish;    // Terminate simulation
end

// Clock generator
always begin
  #5 clock = ~clock;  // Toggle clock every 5 ticks
end

// Connect Design-Under-Text to test bench
counter Counter(
  clock, 
  reset, 
  enable,
  counter_out
);

endmodule