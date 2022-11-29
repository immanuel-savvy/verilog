module simple_memory;

reg [7:0] my_memory [0:255];
integer i, handle;

initial begin
  $readmemb("memory.list", my_memory, 3'b101);  // memory list, volatile mymeory_array, start address, stop address
  
  for (i = 0; i < 256; i = i + 1) $display(my_memory[i]);

  // # 10 handle = $fopen("memory.list");
  // #1 $fdisplay(handle, "%b\n", 8'b11110010);
end

endmodule // simple_memory