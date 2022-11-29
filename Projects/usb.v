module usb #(
  parameter DRIVESIZE=256,
  parameter BUSWIDTH=8,
  parameter DRIVEFILE="usb.mem"
)(
  read_addr,
  write_addr,
  write_data,
  we,
  data 
);

// Port Directions
input[BUSWIDTH-1:0] write_addr, read_addr, write_data;
input we;
output[BUSWIDTH-1:0] data;

// Port types
wire write_addr, read_addr, write_data;
wire we;
reg data;

// Internal Variables
integer k, j;
reg[BUSWIDTH-1:0] mem[0:DRIVESIZE-1];

initial begin
  $readmemb(DRIVEFILE, mem);
end

always @(*) begin
  if(we) begin
    mem[write_addr] = write_data;
    k = $fopen(DRIVEFILE, "a");
    for(j=0; j<=(DRIVESIZE-1); j = j + 1) begin
      if(j==0) $fwriteb($fopen(DRIVEFILE), "");

      $fwriteb(k, mem[j]);
      $fwrite(k, "\n");
    end
    $fclose(k);
  end
  
  data = mem[read_addr];
  
end

endmodule