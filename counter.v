// ----------------------------------------------------------
// This is my second Verilog Design
// Design Name:   counter
// File Name:     counter.v
// Function:      This is a 4-bit up-counter with
//                Synchronous active high reset and
//                with active high enable signal
// ----------------------------------------------------------

module counter(
  clock,        // Clock input of the design
  reset,        // active high, synchronous Reset input
  enable,       // active high enable signal for counter
  counter_out   // 4 bit vector output of the counter
);  // End of port list
//----------------Input Ports--------------------------------
input clock, reset, enable;
//----------------Output Ports-------------------------------
output[3:0] counter_out;
//----------------Input port Data Type-----------------------
// By rule all the input ports should be wires
wire clock, reset, enable;
//----------------Output port Data Type----------------------
// Output port can be a storage element (reg) or a wire
reg[3:0] counter_out;

//----------------Code Starts Here---------------------------
// Since this counter is a positive edge trigged one,
// We trigger the below block with respect to positive
// edge of the clock.
always @(posedge clock)
  begin: COUNTER // Block Name
  // At every rising edge of  clock we check if reset is active
  // If active, we load the counter output with 4'b0000
  if(reset == 1'b1) begin
    counter_out <= 4'b0000;
  end
  // If enable is active, then we increment the counter
  else if(enable == 1'b1) begin
    counter_out <= counter_out + 1;
  end
end

endmodule // End of Module counter

