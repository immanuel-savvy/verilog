// This code shows how User Defined Primitives body looks like

primitive udp_body(
  a, // Port a
  b, // Port b
  c  // Port c
);

output a;
input b,c;

// UDP function code here
// a = b | c;
table
// b c : a
? 1 : 1;
1 ? : 1;
0 0 : 1;

endtable

endprimitive