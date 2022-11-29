module initial_fork_join ();

reg clk,reset,enable,data;

initial fork
  #1 clk = 0;
  #10 reset = 0;
  #5 enable = 0;
  #3 data = 0;
join

endmodule // initial_fork_join

/* Begin:
    clk gets 0 after 1 time unit, reset gets 0 after 10 time units, enable after 5 units,
    data after 3 units. All the statements are executed in parallel.
 */