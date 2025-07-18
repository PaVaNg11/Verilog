module sized_number;

reg [63:0] a,b,c;
reg [8*20:0] str;

reg [7:0] mem [0:1023];         // [size] mem [Depth]
integer i,j;

initial begin
    a[31:0]='Hxabc1;
    b[31:0]='hzef;
    c=16'hz45;
    $display("a=%h | b=%h | c=%h",a,b,c);
    a[63:32]='hz1234;
    str="HELLO123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    $display("a=%h | b=%h | c=%h",a,b,c);
    $display("%s",str);
    
    for(i=0;i<1024;i=i+1) begin
        mem[i]=~1'b0;
        mem[i][0]=1'b0;
        $display("VALUE:%b",mem[i]);
    end




end





endmodule










