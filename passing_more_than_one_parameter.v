module ram_sp_sr_sw(
  clk, // Clock Input
  address, // Address Input
  data, // Data bi-directional
  cs,  // Chip Select
  we,   // Write Enable/Read Enable
  oe   // Output Enable
);

parameter DATA_WIDTH = 8;
parameter ADDR_WIDTH = 8;
parameter RAM_DEPTH = 1 << ADDR_WIDTH;

// Actual code of RAM here

endmodule


module ram_controller();  // Some ports

// Controller Code

// Parameters passed in order
ram_sp_sr_sw #(16,8,256) ram (clk, address, data, cs, we, oe);

// Parameters passed by keyword naming
ram_sp_sr_sw #(
  .DATA_WIDTH(16),
  .ADDR_WIDTH(8),
  .RAM_DEPTH(256)
) ram (clk, address, data, cs, we, oe);

endmodule