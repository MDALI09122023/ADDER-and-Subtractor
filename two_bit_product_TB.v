module two_bit_product_TB;
reg [1:0] a;
reg [1:0] b;
wire[3:0] out;
two_bit_product DUT1(.a(a),.b(b),.res(out));
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
// apply all possible value (0-3)
a<=$random%4;
b<=$random%4;

#20;
i=i+1;if(i==4) $finish;
end
$monitor("%d:a=%b,b=%b,res=%b",$time ,a,b,out);
end 
endmodule