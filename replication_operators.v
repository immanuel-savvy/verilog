module replication_operators ();

initial begin
  // Replication
  $display("{4{4'b1001}} = %b", {4{4'b1001}});
  // Replication and concatenation
  $display("{4{4'b1001, 1'bz}} = %b", {4{4'b1001, 1'bz}});
end

endmodule //replication_operators