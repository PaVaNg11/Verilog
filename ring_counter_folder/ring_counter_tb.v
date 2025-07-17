`timescale 1ns/1ns
`include "ring_counter.v"




module ring_counter_tb;

reg clk,rst,initialize_output;
wire [3:0] qout,qbar;


ring_counter dut (.clk(clk),.rst(rst),.initialize_output(initialize_output),.qout(qout),.qbar(qbar));




initial begin 
clk=1;
rst=0;
initialize_output=0;
end

always #5 clk=~clk;

initial begin 
$display("TIME \t QOUT");
$monitor("%g ns\t %b",$time,qout);

rst=1'b1;                       // reset to get zero
#10;
rst=1'b0;

#10;
initialize_output=1'b1;
#10;                                 // Initialize a flip flop output to 1
initialize_output=1'b0;

#100;                                   // run for 100 ns 

rst=1'b1;              // again reset
#10;
rst=1'b0;

#100; $finish;

end

initial 
begin
$dumpfile("ring_counter_sim.vcd");
$dumpvars(0,ring_counter_tb);
end



endmodule



