module relational_operator();

initial begin
  $display("5 <= 10 = %b", (5 <= 10));
  $display("5 >= 10 = %b", (5 >= 10));
  $display("1'bx <= 10 = %b", (1'bx <= 10));
  $display("1'bz <= 10 = %b", (1'bz <= 10));
end

endmodule