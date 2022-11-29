module decrementer(load, initial_value, count, clk);

input load, clk;
input[3:0] initial_value;
output[3:0] count;

wire[3:0] initial_value = 4'b1111;
wire decrement, load, clk;
reg[3:0] count;

always @(posedge clk)begin
  if(load == 1'b1) begin 
    $display("\nLoad %b", load);
    #1 count = initial_value;
    $display("Counting: %b", count);
  end

  if(count == 4'b0000)begin
      $display("Countdown: %b", count);
      $finish;
  end else begin 
    count -= 1'b1;
    if(count > 4'b0000) $display("Counting: %b", count);
  end

end

endmodule

module decrementer_tb();

reg load, clock_reset;
reg[3:0] initial_value;
wire[3:0] count;

initial begin
  clock_reset = 1'b1;
  load = 1'b1;
  #1 load = 1'b0;
  initial_value = 4'b1111;
end

decrementer D0(
  load,
  initial_value,
  count,
  clock_reset
);

always #1 clock_reset <= ~clock_reset;

endmodule