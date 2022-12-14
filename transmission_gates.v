module transmission_gates();

reg data_enable_low, in;
wire data_bus, out1, out2;

bufif0 U1(data_bus, in, data_enable_low);
buf U2(out1, in);
not U3(out2, in);

initial begin
  $monitor("in = %b data_enable_low = %b out1 = %b out2 = %b",
  in, data_enable_low, out1, out2);
  data_enable_low = 0;
  in = 0;
  #4 data_enable_low = 1;
  #8 $finish;
end

always #2 in = ~in;

endmodule