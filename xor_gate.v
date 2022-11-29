module xor_gate(o, a, b);
  input a,b;
  output o;
  
  // Port Data type
  wire a,b,o;
  // Internal variables
  wire w1, w2;

  and(w1, a, ~b);
  and(w2, b, ~a);

  or(o, w1, w2);

endmodule