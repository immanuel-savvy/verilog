/*---------------------------------------------------------------
  This is a simple parity Program
  Design Name:    parity
  File Name:      parity.v
  Function:       This program shows how a Verilog
                  primitive / module port connection
                  are done
  Coder:          Savvy
*/---------------------------------------------------------------

module parity(
  a,  // First input
  b,  // Second input
  c,  // Third input
  d,  // Fourth input
  y,  // Parity output
);

// Input Declaration
input a,b,c,d;
// Output Declaration
output y;

// Port Data types
wire a,b,c,d,y;

// Internal variables
wire w1,w2;

xor u0(w1, a, b);
xor u1(w2, c, d);

xor(y, w1, w2);

endmodule   // parity