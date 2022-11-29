module n_out_primitive();

wire out,out0,out1,out2,out3,out_a,out_b,out_c;
wire in;

// One output Buffer gate
buf u_buf(out, in);
// Four output Buffer gate
buf u_bif1(out0, out1, out2, out3, in);
// Three output Invertor gate
not u_not(out_a, out_b, out_c, in);

endmodule