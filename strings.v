/*---------------------------------------------------------------
  Design Name:    strings
  File Name:      strings.v
  Function:       This program shows how string
                  can be stored in reg
  Coder:          Savvy
---------------------------------------------------------------*/

module strings();
// Declare a register variable that is 21 bytes
reg[8*21:0] string;

initial begin
  string = "I am a boy.";
  $display("%s \n", string);
end

endmodule