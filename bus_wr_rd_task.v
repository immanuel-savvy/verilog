module bus_wr_rd_task ();

reg clk, rd, wr, ce;
reg[7:0] addr, data_wr, data_rd;
reg[7:0] read_data;

initial begin
  clk = 0;
  read_data = 0;
  rd = 0;
  wr = 0;
  ce = 0;
  addr = 0;
  data_wr = 0;
  data_rd = 0;

  // Call the write and read tasks here
  #1 cpu_write(8'h11, 8'hAA);
  #1 cpu_read(8'h11, read_data);
  #1 cpu_write(8'h12, 8'hAB);
  #1 cpu_read(8'h12, read_data);
  #1 cpu_write(8'h13, 8'h0A);
  #1 cpu_read(8'h13, read_data);
  #10 $finish;
end

// Clock generator
always #1 clk = ~clk;

// CPU Read Task
task cpu_read;
input[7:0] address;
output[7:0] data;

begin
  $display("CPU Read task with address: %h", address);
  $display("Driving CE, RD and ADDRESS on to bus");
  @(posedge clk);
  addr = address;
  ce = 1;
  rd = 1;
  @(negedge clk);
  data = data_rd;
  @(posedge clk);
  addr = 0;
  ce = 0;
  rd = 0;
  $display("CPU Read data: %h", data);
  $display("=========================");
end
endtask

// CPU Write Task
task cpu_write;
input[7:0] address;
input[7:0] data;

begin
  $display("CPU Write task with address: %h DATA: %h", address, data);
  $display("Driving CE, WR, WR data and ADDRESS on to bus");
  @(posedge clk);
  addr = address;
  ce = 1;
  wr = 1;
  data_wr = data;
  @(posedge clk);
  addr = 0;
  ce = 0;
  wr = 0;
  $display("========================");
end
endtask

// Memory model for checking tasks
reg[7:0] mem[0:255];

always @(addr or ce or rd or wr or data_wr) begin
  if (ce) begin
    if (wr) begin
      mem[addr] = data_wr;
    end 
    if (rd) begin
      data_rd = mem[addr];
    end
  end
end

endmodule // bus_wr_rd_task