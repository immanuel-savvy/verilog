module mux_using_assign ();

reg data_in_0, data_in_1, sel;
wire data_out;

assign data_out = sel ? data_in_1 : data_in_0;

// Testbench code here
initial begin
  $monitor("TIME = %d SEL = %b DATA0 = %b DATA1 = %b OUT = %b", 
            $time, sel, data_in_0, data_in_1, data_out);
  data_in_0 = 0;
  data_in_1 = 0;
  sel = 0;
  #10 sel = 1;
  #10 $finish;
end

// Toggle data_in_0 at #1
always #1 data_in_0 = ~data_in_0;

// Toggle data_in_1 at #1.5
always #1.5 data_in_1 = ~data_in_1;

endmodule // mux_using_assign