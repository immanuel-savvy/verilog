module shift_operators();

initial begin
  // Left Shift
  $display("4'b1001 << 1 = %b", (4'b1001 << 1));
  $display("4'b1001 << 2 = %b", (4'b1001 << 2));
  $display("4'b10x1 << 1 = %b", (4'b10x1 << 1));
  $display("4'b10z1 << 1 = %b", (4'b10z1 << 1));
   // Right Shift
  $display("4'b1001 >> 1 = %b", (4'b1001 >> 1));
  $display("4'b1001 >> 2 = %b", (4'b1001 >> 2));
  $display("4'b10x1 >> 1 = %b", (4'b10x1 >> 1));
  $display("4'b10z1 >> 1 = %b", (4'b10z1 >> 1));
end

endmodule