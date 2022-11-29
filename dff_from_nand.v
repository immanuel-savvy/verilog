module dff_from_nand();

wire Q, Q_bar;
reg D, Clk;

wire x, y;

nand U1(x, D, Clk);
nand U2(y, Clk, x);
nand U3(Q, x, Q_bar);
nand U4(Q_bar, Q, y);

// Testbench of above code
initial begin
  $monitor("CLK = %b D = %b Q = %b Q_bar = %b",
            Clk, D, Q, Q_bar);
  Clk = 0;
  D = 0;
  #3 D = 1;
  #3 D = 0;
  #3 $finish;
end

always #2 Clk = ~Clk;

endmodule