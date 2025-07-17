module dff(
  input d,clk,rst,initialize_output,
  output reg q,qbar
);

always @(posedge clk or posedge rst)
begin 
 if(rst) 
 begin
  q<=1'b0;
  qbar<=1'b1;
 end
else if (initialize_output) begin 
 q<=1'b1;
 qbar<=1'b0;
end
else begin
q<=d;
qbar<=~d;
end
end
endmodule

// main logic
module ring_counter(

input clk,rst,initialize_output,
output wire [3:0] qout,qbar
);



// wire [3:0] qout;

// assign qout[0]=qout[3];
// assign qout[1]=qout[2];
// assign qout[2]=qout[1];
// assign qout[3]=qout[0];

dff d0 (qbar[3],clk,rst,initialize_output,qout[0],qbar[0]);                 // dff(d,clk,rst,initialize_output,q,qbar)
dff d1 (qout[0],clk,rst,1'b0,qout[1],qbar[1]);
dff d2 (qout[1],clk,rst,1'b0,qout[2],qbar[2]);                            // dff d0 (qout[3]) = Ring_counter 
dff d3 (qout[2],clk,rst,1'b0,qout[3],qbar[3]);                            //  dff d0 (qbar[3]) = Jhonson_counter                      




endmodule