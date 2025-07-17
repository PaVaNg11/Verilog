`timescale 1ns/1ns
`include "adder_test.v"



module adder_test_tb;

reg a,b;
wire s,c;

adder_test dut(.a(a),.b(b),.s(s),.c(c)) ;


initial begin 
$display("TIME \t A B | S C");
$monitor("%gns\t %b %b | %b %b",$time,a,b,s,c);




a=1'b1;
b=1'b0; #10;
a=1'b1;
b=1'b1; #10;
a=1'b0;
b=1'b1; #10;
a=1'b0;
b=1'b0; #10;

#10; $finish;

end


initial begin

$dumpfile("adder_sim.vcd");
$dumpvars(0,adder_test_tb);
end

endmodule
