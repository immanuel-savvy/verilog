/*---------------------------------------------------------------
  This is a simple adder Program
  Design Name:    adder_explicit
  File Name:      adder_explicit.v
  Function:       This program shows how adder_explicit 
                  port connections are done
  Coder:          Savvy
---------------------------------------------------------------*/
`include "add_bit.v"
`include "xor_gate.v"


module adder_explicit(
  result, // Output of the adder
  carry,  // Carry output of adder
  r1,     // first input
  r2,     // second input
  cin      // carry input
);

// Input Port Declarations
input cin;
input[3:0] r1, r2;

// Output Port Declarations
output[3:0] result;
output carry;

// Port Wires
wire[3:0] r1;
wire[3:0] r2;
wire cin;
wire[3:0] result;
wire carry;

// Internal variables
wire c1,c2,c3;

addbit u0(
  .a (r1[0]),
  .b (r2[0]),
  .c (cin),
  .o (result[0]),
  .co (c1)
);
addbit u1(
  .a (r1[1]),
  .b (r2[1]),
  .c (c1),
  .o (result[1]),
  .co (c2)
);
addbit u2(
  .a (r1[2]),
  .b (r2[2]),
  .c (c2),
  .o (result[2]),
  .co (c3)
);
addbit u3(
  .a (r1[3]),
  .b (r2[3]),
  .c (c3),
  .o (result[3]),
  .co (carry)
);

endmodule   // End of Module adder_explicit