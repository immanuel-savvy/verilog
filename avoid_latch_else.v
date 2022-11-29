/* Ways to avoid Latches
    * Cover all conditions
    * Init the veriables to zero
 */

module avoid_latch_else ();

reg q, enable, d;

always @(enable or d)
  if (enable) begin
    q = d;
  end else begin
    q = 0;
  end

initial begin
  $display("AVOIDING LATCH: ELSE GAME \n");
  $monitor("ENABLE = %b D = %b Q = %b", enable, d, q);
  #1 enable = 0;
  #1 d = 0;
  #1 enable = 1;
  #1 d = 1;
  #1 d = 0;
  #1 d = 1;
  #1 d = 0;
  #1 d = 1;
  #1 enable = 0;
  #1 $finish;
end

endmodule // avoid_latch_else


// Init the veriables to zero
module avoid_latch_init();

reg q, enable, d;

always @(enable or d)
  begin
    q = 0;
    if (enable) begin
      q = d;
    end
  end

initial begin
  $display("\n\nAVOIDING LATCH: INIT GAME\n");
  $monitor("ENABLE = %b D = %b Q = %b", enable, d, q);
  #1 enable = 0;
  #1 d = 0;
  #1 enable = 1;
  #1 d = 1;
  #1 d = 0;
  #1 d = 1;
  #1 d = 0;
  #1 d = 1;
  #1 enable = 0;
  #1 $finish;
end

endmodule