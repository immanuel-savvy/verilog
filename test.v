module test;

initial fork
  forever #1 $display($random);

  #10 $finish;
join

endmodule // test