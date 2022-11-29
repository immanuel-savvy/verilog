module initial_begin_end ();

reg clk,reset,enable,data;

initial begin
  #1 clk = 0;
  #10 reset = 0;
  #5 enable = 0;
  #3 data = 0;
end

endmodule // initial_begin_end

/* Begin:
    clk gets 0 after 1 time unit, reset gets 0 after 11 time units, enable after 16 units,
    data after 19 units. All the statements are executed in sequentially.
 */