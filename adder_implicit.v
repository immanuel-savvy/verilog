/*---------------------------------------------------------------
  This is a simple adder Program
  Design Name:    adder_implicit
  File Name:      adder_implicit.v
  Function:       This program shows how adder_implicit 
                  port connections are done
  Coder:          Savvy
---------------------------------------------------------------*/
`include "add_bit.v"

module adder_implicit(
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
  r1[0],
  r2[0],
  cin,
  result[0],
  c1
);
addbit u1(
  r1[1],
  r2[1],
  c1,
  result[1],
  c2
);
addbit u2(
  r1[2],
  r2[2],
  c2,
  result[2],
  c3
);
addbit u3(
  r1[3],
  r2[3],
  c3,
  result[3],
  carry
);

endmodule   // End of Module adder_implicit

module tb();
reg[3:0] r1,r2;
reg ci;
wire[3:0] result;
wire carry;

initial begin
  r1 = 0;
  r2 = 0;
  ci = 0;
  #10 r1 = 10;
  #10 r2 = 2;
  #10 ci = 1;
  #10 $display("+-----------------------------------------------------------------+");
  $finish;
end

// Connect the lower module
adder_implicit U(result,carry,r1,r2,ci);

// adder_implicit demo here
initial begin
  $display("+-----------------------------------------------------------------+");
  $display("| r1 | r2 | ci | u0.sum | u1.sum | u2.sum | u3.sum |");
  $display("+-----------------------------------------------------------------+");
  $monitor("| %b | %b | %b | %b | %b | %b | %b |",
            r1, r2, ci,
            tb.U.u0.o,
            tb.U.u1.o,
            tb.U.u2.o, 
            tb.U.u3.o);
end

endmodule