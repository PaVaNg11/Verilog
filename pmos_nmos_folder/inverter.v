`timescale 1ns/1ns


module inverter(

input a,
output y

);


supply1 vdd;
supply0 gnd;

pmos p1 (y,vdd,a);
nmos n1 (y,gnd,a);

endmodule

////////////////////////    TESTBENCH   ///////////////////////////////

module inverter_tb;

reg a;
wire y;


inverter dut(.a(a),.y(y));


initial begin
    $display("TIME\tA|Y");
    $monitor("%gns\t%b|%b",$time,a,y);
    a=0; #10;
    a=1; #10;
    a=0; #10;
    a=1; #10;
    a=0; #10;    
end


initial begin
$dumpfile("inverter_sim.vcd");
$dumpvars(0,inverter_tb);

end

endmodule









