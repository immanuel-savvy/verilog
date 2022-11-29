module casez_example (
  opcode,
  a, b, c, out
);

input [3:0] opcode;
input [1:0] a,b,c;
output [1:0] out;

reg [1:0] out;

always @(opcode or a or b or c)
  casez (opcode)
    // Bit 0 is matched with "x"
    4'b1zzx: out = a; // Don't care about lower 3:1 bits
    4'b01??: out = b; // The ? is same as z in a number
    4'b001?: out = c;
    default: $display("Error xxxx does matches 0000");
  endcase

endmodule // casez_example


module casez_example_tb ();

reg[1:0] a,b,c;
reg[3:0] opcode;
wire[1:0] out;

initial begin
  $monitor("Opcode = %b Out = %b", opcode, out);
  a  <= 2'b00;
  b  <= 2'b01;
  c  <= 2'b10;
  opcode <= 4'b1zzx;

  #1 opcode = 4'b01??;
  #1 opcode = 4'b001?;
  #1 $finish;
end

casez_example C0(opcode, a,b,c,out);

endmodule //casez_example