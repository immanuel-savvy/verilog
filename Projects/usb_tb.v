`include "usb.v"


module usb_tb();

reg[7:0] write_data, write_addr, read_addr, data_reg;
reg we;
wire[7:0] data_bus;

integer i;

initial begin
  we = 1;
  write_addr = 0;
  $monitor("Write_data - %b, Write_addr - %b, Data - %b, we - %b, Read_addr - %b", write_data, write_addr, data_bus, we, read_addr);

  #1 for (i=0; i < 10; i = i+1) #1 begin
    write_addr = i+1;
    write_data = i;
  end

  #1 we = 0;
  read_addr = 8'b101;
  write_data = 5'b11011;
  #1 we = 1;
  write_addr = 0;
  #1 we = 0;
  write_data = 5'b11101;
  write_addr = 1;
  #1 we = 1;
  
end

usb u0(
  read_addr,
  write_addr,
  write_data,
  we,
  data_bus
);

endmodule