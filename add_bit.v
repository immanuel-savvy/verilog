module addbit(
  a,
  b,
  c,
  o,
  co
);

input a,b,c;
output o,co;

wire a,b,c,o,co;

// Internal variables
wire w1,w2,w3;

and _and(w1, a,b);
xor _xor(w2, a, b);
and __and(w3, c, w2);
xor __xor(o, w2, c);
or _or(co, w3, w1);

endmodule
