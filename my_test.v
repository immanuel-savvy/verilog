module my_test();

reg a,b,d,clk;
wire c;

assign c = a | b;

initial begin
  a = 1'b0;
  b = 1'b0;
  clk = 1'b0;

  // d = c;

  $monitor("c - %b\tb - %b\ta - %b\td - %b\t\t%b", c,b,a,d, clk);
  #10 $finish;
end

always @(posedge clk) d = c;

always begin
  #1 clk = ~clk;
  b = ~b;
end

endmodule