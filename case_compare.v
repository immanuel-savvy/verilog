module case_compare (
  sel
);

input sel;

always @(sel)
  case (sel)
    1'b0: $display("Normal: Logic 0 on sel");
    1'b1: $display("Normal: Logic 1 on sel");
    1'bx: $display("Normal: Logic x on sel");
    1'bz: $display("Normal: Logic z on sel");
  endcase

always @(sel)
  casex (sel)
    1'b0: $display("CASEX: Logic 0 on sel");
    1'b1: $display("CASEX: Logic 1 on sel");
    1'bx: $display("CASEX: Logic x on sel");
    1'bz: $display("CASEX: Logic z on sel");
  endcase

always @(sel)
  casez (sel)
    1'b0: $display("CASEZ: Logic 0 on sel");
    1'b1: $display("CASEZ: Logic 1 on sel");
    1'bx: $display("CASEZ: Logic x on sel");
    1'bz: $display("CASEZ: Logic z on sel");
  endcase

endmodule //case_compare