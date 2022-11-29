module four_deep_fifo(
  clk,
  data_in,
  push,
  pop, 
  full, 
  empty,
  data_out, 
  index_out
);

integer index = 0, i = 0;

input[1:0] data_in;
input push, pop, clk;
output full, empty;
output[3:0] index_out;
output[1:0] data_out;

wire data_in;
wire push, pop;
reg full, empty, index_out;
reg data_out, requeue;

reg[1:0] queue[0:3];

initial begin
  assign index_out = index;
end

always @(posedge requeue) begin
  i = 0;
  while (i <= 2) begin
    queue[i] = queue[i+1];
    if(i == index) i = 3;
    i = i + 1;
  end
end

always @(posedge clk || pop || push) begin
  if(push == 1'b1) begin
    if(full) begin
      data_out = queue[0];
      requeue = 1;
      #1 queue[3] = data_in;
      requeue = 0;
    end else begin
      queue[index] = data_in;
      $display("Pushed %b, %b, %b", queue[index], data_in, index);
      index = index + 1;
      if(index == 4) full = 1;
    end
    empty = 0;
  end else if(pop == 1'b1) begin
    if(empty) begin
      data_out = 0;
      $display("You empty?");
    end else begin 
      $display("Popped %b from 0, index -> %b", queue[0], index);
      data_out = queue[0];
      #1 requeue = 1;
      index = index - 1;
      if(index == 0) empty = 1;
      #1 requeue = 0;
      $display("current index : %b", index);
    end
    full = 0;
    
  end
end

endmodule


module four_deep_fifo_tb();

reg clk, push, pop;
wire empty, full;
wire[3:0] index_out;
reg[1:0] data_in;
wire[1:0] data_out;

initial begin 
  clk = 0;
  push = 0;
  pop = 0;
  data_in = 0;

  $monitor("data_in - %b, data_out - %b, push - %b, pop - %b, empty - %b, full - %b\tINDEX - %g",
            data_in, data_out, push, pop, empty, full, index_out);

  #1 data_in = 2'b10;
  push = 1;
  #1 push = 0;
  #1 data_in = 2'b11;
  push = 1;
  #1 push = 0;
  #1 data_in = 2'b01;
  push = 1;
  #1 push = 0;
  #1 data_in = 2'b11;
  push = 1;
  #1 push = 0;
  #1 data_in = 2'b01;
  push = 1;
  #1 push = 0;
  #1 pop = 1;
  #1 pop = 0;

  #2 $finish;
end

four_deep_fifo F0(
  clk,
  data_in,
  push, pop,
  full, empty,
  data_out,
  index_out
);

always #1 clk = ~clk;

endmodule