module multiplexer();

reg c0, c1, c2, c3, A, B;
wire Y;

// Invert the sel signals
not(a_inv, A);
not(b_inv, B);

and(y0, c0, a_inv, b_inv);
and(y1, c1, A, b_inv);
and(y2, c2, a_inv, B);
and(y3, c3, A, B);

// 4-input OR gate
or(Y, y0, y1, y2, y3);

// Testbench Code goes here
initial begin
  $monitor("c0 = %b c1 = %b c3 = %b c4 = %b A = %b B = %b Y = %b",
            c0,c1,c2,c3,A,B,Y);

  c0 = 0;
  c1 = 0;
  c2 = 0;
  c3 = 0;
  A = 0;
  B = 0;
  #1 A = 1;
  #1 B = 1;
  #1 A = 0;
  #8 $finish;
end

always #1 c0 = ~c0;
always #2 c1 = ~c1;
always #3 c2 = ~c2;
always #4 c3 = ~c3;

endmodule