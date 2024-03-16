`timescale 1ns / 1ps

module counter(

input clk,rst,
input ld,
input [3:0] ldvalue,
output  [3:0] dout

    );
    reg [3:0] temp;
    
    always@(posedge clk,posedge rst)
    begin 
      if (rst==1'b1)
        temp<=1'b0000;
      else 
        begin 
             if(ld==1'b1)
             temp<=ldvalue;  
             else 
             begin 
             temp<=temp+1;
             end
        end
    
    end
    
    assign dout=temp;
endmodule



////////////////////////// Test bench 

module counter_tb;

reg clk=0,rst=0,ld;
reg [3:0] ldvalue;
wire [3:0] dout ;
integer i=0;

initial begin 
ld=1;
ldvalue=0;
end

counter dut (clk,rst,ld,ldvalue,dout);

always #10 clk=~clk;
initial begin 
rst=1;
#50;
rst=0;
end

task cc;
begin 
@(posedge clk);
ld=1;
ldvalue=$urandom();
@(posedge clk);
ld=0;
repeat(5) @(posedge clk);
end
endtask

initial begin 
#50;
cc();
end
endmodule

















