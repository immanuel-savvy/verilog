module dff_async_reset_async_preset ();

reg clk, reset, preset, d, q;

always @ (posedge clk or posedge reset or posedge preset)
  if (reset) begin
    q <= 0;
  end else if (preset) begin
    q <= 1;
  end else begin
    q <= d;
  end

// Testbench code here
initial begin
  $monitor("CLK = %b RESET = %b PRESET = %b D = %d Q = %b", clk, reset, preset, d, q);
  clk = 0;
  #1 reset = 0;
  preset = 0;
  d = 0;
  #1 reset = 1;
  #1 reset = 0;
  #2 preset = 1;
  #2 preset = 0;
  repeat (4) begin
    #2 d = ~d;
  end

  #2 $finish;
end

always #1 clk = ~clk;

endmodule //dff_async_reset_async_preset