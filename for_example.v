module for_example ();

integer i;
reg[7:0] ram[0:255];

initial begin
  for(i = 0; i <= 63; i = i + 1) begin
    #1 $display("Address = %d Data = %h", i, ram[i]);
    ram[i] <= 0; // Initialise the RAM with 0
    #1 $display("Address = %d Data = %h", i, ram[i]);
  end
  #1 $finish;
end

endmodule //for_example