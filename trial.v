module trial(); 

parameter mem_store = "solid_state.list";
integer k, j;

reg[7:0] ram[0:15];

initial begin 

  k = $fopen(mem_store, "a");
  for(j=0; j<=15; j = j + 1)begin
    if(j==0) $fwriteb($fopen(mem_store), "");

    $fwriteb(k, ram[j]);
    $fwrite(k, "\n");
  end
  $fclose(k);
 
  $readmemb(mem_store, ram);
end

endmodule