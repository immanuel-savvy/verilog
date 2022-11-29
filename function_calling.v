module function_calling (
  a,b,c,d,e,f
);

input a,b,c,d,e;
output f;

wire f;

`include "simple_function.v"

assign f = (my_function(a,b,c,d) ? e : 0);

endmodule // function_calling