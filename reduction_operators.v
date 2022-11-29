module reduction_operators();

initial begin
  // Bit Wise AND reduction
  $display("& 4'b1101 = %b", (& 4'b1101));
  $display("& 4'bx111 = %b", (& 4'bx111));
  $display("& 4'bz111 = %b", (& 4'bz111));
  // Bit Wise NAND reduction
  $display("~& 4'b1101 = %b", (~& 4'b1101));
  $display("~& 4'bx111 = %b", (~& 4'bx111));
  $display("~& 4'bz111 = %b", (~& 4'bz111));
  // Bit Wise OR reduction
  $display("| 4'b1101 = %b", (| 4'b1101));
  $display("| 4'bx111 = %b", (| 4'bx111));
  $display("| 4'bz111 = %b", (| 4'bz111));
  // Bit Wise NOR reduction
  $display("~| 4'b1101 = %b", (~| 4'b1101));
  $display("~| 4'bx111 = %b", (~| 4'bx111));
  $display("~| 4'bz111 = %b", (~| 4'bz111));
  // Bit Wise XOR reduction
  $display("^ 4'b1101 = %b", (^ 4'b1101));
  $display("^ 4'bx111 = %b", (^ 4'bx111));
  $display("^ 4'bz111 = %b", (^ 4'bz111));
  // Bit Wise XNOR reduction
  $display("~^ 4'b1101 = %b", (~^ 4'b1101));
  $display("~^ 4'bx111 = %b", (~^ 4'bx111));
  $display("~^ 4'bz111 = %b", (~^ 4'bz111));

end

endmodule