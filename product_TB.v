module product_TB;
reg [2:0] a;
reg [3:0] b;
wire[6:0] out;
product ali(.a(a),.b(b),.res(out));
reg clk;
reg rst;
initial 
begin 
clk=0;
rst=1;
#20;
rst=0;end
//clock generator
always
begin
#10 clk=~clk;
end
//test sequence
reg[3:0] i;
always @(posedge clk,posedge rst)
begin
if(rst)
begin
i=0;

end
else
begin
// apply all possible value (0-9)
a<=$random%8;
b<=$random%16;

#20;
i=i+1;if(i==10) $finish;
end
$monitor("%d:a=%b,b=%b,res=%b",$time ,a,b,out);
end 
endmodule