module sized_number;

reg [63:0] a,b,c;
reg [8*20:0] str;


initial begin
    a[31:0]='Hxab   c1;
    b[31:0]='hzef;
    c=16'hz45;
    $display("a=%h | b=%h | c=%h",a,b,c);
    a[63:32]='hz1234;
    str="HELLO123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    $display("a=%h | b=%h | c=%h",a,b,c);
    $display("%s",str);
end


endmodule










