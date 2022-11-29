module clk_gen ();

reg clk, reset;

initial begin
  $monitor("RESET = %b CLOCK = %b", reset, clk);
  clk = 0;
  reset = 0;
  #2 reset = 1;
  #5 reset = 0;
  #10 $finish;
end

always #1 clk = ~clk;

endmodule // clk_gen