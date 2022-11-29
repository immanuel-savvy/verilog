module sequential_memory(addr, w, clk, data, out);

input w, clk;
input[7:0] addr, data;

output[7:0] out;

wire w, clk, addr, data;
reg out;

integer i;
reg[7:0] mem[0:255];

always @(posedge clk) begin
  for(i = 0; i <= 255; i = i + 1) begin
    if(i == addr) begin
      if(w == 1'b1) begin
        mem[i] <= data;
      end else begin
        out <= mem[i];
      end
      // Break
    end
  end
end

endmodule

module memory_tb();

reg w, clk;
reg[7:0] addr, data;
wire[7:0] out;

initial begin
  $monitor("Addr (%b) -> Out %b ---Data:(%b) w-%b", addr, out, data, w);
  clk = 0;
  w = 0;
  #1
  addr = 8'b01010101;
  w = 1;
  data = 8'b01010110;
  #1 w = 0;
  data = 8'b11110110;

  #1 $finish;
end

sequential_memory SM0(
  addr,
  w,
  clk,
  data,
  out
);

always #1 clk = ~clk;

endmodule