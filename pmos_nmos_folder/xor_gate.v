`include "inverter.v"


// module inverter(input in, output out);
//   supply1 vdd;
//   supply0 gnd;

//   pmos p1(out, vdd, in);
//   nmos n1(out, gnd, in);
// endmodule


module xor_gate(
  input a, b,
  output y
);

supply0 gnd;
supply1 vdd;

wire a_bar, b_bar;

inverter inv1(a, a_bar);
inverter inv2(b, b_bar);

// NMOS logic
wire t1, t2;

nmos n1(y, t1, a_bar);
nmos n2(t1, gnd,b_bar);

nmos n3(y, t2, a);
nmos n4(t2, gnd,b);

// PMOS logic
wire t3, t4;

pmos p1(t3, vdd, a_bar);
pmos p2(t3, vdd, b_bar);

pmos p3(y, t3, a);
pmos p4(y, t3, b);



endmodule



module xor_tb;

reg a, b;
wire y;

xor_gate dut(.a(a), .b(b), .y(y));

initial begin
  $display("TIME\tA B | Y");
  $monitor("%gns\t%b %b | %b", $time, a, b, y);
  
  a = 0; b = 0; #10;
  a = 1; b = 0; #10;
  a = 0; b = 1; #10;
  a = 1; b = 1; #10;
  $finish;
end

initial begin
  $dumpfile("xor_sim.vcd");
  $dumpvars(0, xor_tb);
end

endmodule
