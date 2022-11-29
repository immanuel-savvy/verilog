module casex_example (
  opcode,
  a, b, c, out
);

input [3:0] opcode;
input [1:0] a,b,c;
output [1:0] out;
reg [1:0] out;

always @(opcode or a or b or c)
  casex (opcode)
    // Bit 0 is matched with "x"
    4'b1zzx: out = a; // Don't care 3:0 bits
    4'b01??: out = b; // The ? is same as z in a number
    4'b001?: out = c;
    default: $display("Error xxxx does matches 0000");
  endcase

endmodule // casex_example