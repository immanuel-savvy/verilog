module secrete_number;
parameter my_secret = 0;

initial begin
  $display("My secret number is %d", my_secret);
end

endmodule


module defparam_example();

defparam U0.my_secret = 11;
defparam U1.my_secret = 22;

secrete_number U0();
secrete_number U1();

endmodule
