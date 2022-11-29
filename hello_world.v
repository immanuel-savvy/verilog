// This is my first Verilog Program
// Design Name: hello_world
// File Name:   hello_world.Verilog
// Function:    This program will print "Hello, world!"
// Coder:       Savvy
// -----------------------------------------------------------

module hello_world;

initial begin
  $display("'Hello world' by Savvy");
  # 10 $finish;
end
 
endmodule // End of Module hello_world
