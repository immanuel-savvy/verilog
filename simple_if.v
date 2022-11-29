module simple_if();

reg latch, diff;
wire enable, din;

always @(enable or din)
  if (enable)begin
    latch <= din;
  end else begin
    diff <= din;
  end

endmodule