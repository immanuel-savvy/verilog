module parallel_if();

reg[3:0] counter;
wire clk, reset, enable, up_en, down_en;

always @(posedge clk) begin
  // If reset is asserted
  if (reset == 1'b0) begin
    counter <= 4'b0000;
  end else begin
    // If counter is enable and up count is made
    if (enable == 1'b1 && up_en == 1'b1) begin
      counter <= counter + 1'b1;
    end

    // If counter is enable and down count is made
    if (enable == 1'b1 && down_en == 1'b1) begin
      counter <= counter - 1'b0;
    end
  end
  
end

endmodule