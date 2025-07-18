`timescale 1ns/1ns


module tff (
input clk,rst,t_in,
output reg q,qbar

);

always @(posedge clk or posedge rst ) begin

if(rst)
begin
    q<=1'b0;
    qbar<=1'b1;
end
else begin
    if(t_in) begin 
        q<=~q;
        qbar<=q;
    end
    else begin 
        q<=q;
        qbar<=qbar;
    end
end
    
end

endmodule


module up_asynch(
input clk,rst,t_in,
output [3:0] q,qbar

);

// up counting         // for Down counting just replace .clk(qbar[]) -->.clk(q[])


// tff t1 (.clk(clk), .rst(rst), .t_in(t_in), .q(q[0]), .qbar(qbar[0]));
// tff t2 (.clk(qbar[0]), .rst(rst), .t_in(t_in), .q(q[1]), .qbar(qbar[1]));  
// tff t3 (.clk(qbar[1]), .rst(rst), .t_in(t_in), .q(q[2]), .qbar(qbar[2]));
// tff t4 (.clk(qbar[2]), .rst(rst), .t_in(t_in), .q(q[3]), .qbar(qbar[3]));


//Down counting

tff t1 (.clk(clk), .rst(rst), .t_in(t_in), .q(q[0]), .qbar(qbar[0]));
tff t2 (.clk(q[0]), .rst(rst), .t_in(t_in), .q(q[1]), .qbar(qbar[1]));  
tff t3 (.clk(q[1]), .rst(rst), .t_in(t_in), .q(q[2]), .qbar(qbar[2]));
tff t4 (.clk(q[2]), .rst(rst), .t_in(t_in), .q(q[3]), .qbar(qbar[3]));


endmodule


////////////////////////////////  TESTBENCH ////////////////////////////////////////

module up_asynch_tb;

reg clk,rst,t_in;
wire [3:0] q,qbar;


up_asynch dut (
    .clk(clk),
    .rst(rst),
    .t_in(t_in),
    .q(q),
    .qbar(qbar)
);

always #5 clk=~clk;



initial begin 
$display("TIME\tQ:");
$monitor("%gns\tQ:%d",$time,q);
end

initial begin
clk=1'b1;
t_in=1'b1;
rst=1'b1;
#10;
rst=1'b0;
#320;$finish;
end

initial begin
$dumpfile("up_asynch_sim.vcd");
$dumpvars(0,up_asynch_tb);
end
endmodule



