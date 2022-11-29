module secrete_number;
parameter my_secret = 0;

initial begin
  $display("My secret number is %d", my_secret);
end

endmodule


module param_overide_instance_example();

secrete_number #(11) U0();
secrete_number #(22) U1();

endmodule
