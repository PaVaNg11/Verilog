`timescale 1ns / 1ps


module dff(
 input clk,din,
 output reg q,qb    
  );
  
always @(posedge clk)
begin 
q<=din;
qb<=~din;
end
  
endmodule



module tb_dff;


reg clk=0,din=0;
wire q,qb;
integer i=0;

dff dut (clk,din,q,qb);
 
always #10 clk=~clk;
always #23 din=~din;
endmodule