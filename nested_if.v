module nested_if ();

reg[3:0] counter;
wire clk, reset, enable, up_en, down_en;

always @(posedge clk)
// if reset is asserted
if(reset == 1'b0) begin
  counter <= 4'0000;
  // If counter is enable and up count is made
end else if (enable == 1'b1 && up_en == 1'b1) begin
  counter <= counter + 1'b1;
  // If counter is enable and down count is made
end else if (enable == 1'b1 && down_en == 1'b1) begin
  counter <= counter - 1'b0;
  // If counting is disabled
end else begin
  counter <= counter; // Redundant code
end

endmodule //nested_if