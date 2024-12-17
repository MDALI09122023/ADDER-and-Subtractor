module bcd_adder_TB;
reg [3:0] a,b;reg cin;
wire[3:0] sum;
wire cout;
bcd_adder DUT(.A(a), .B(b),.Cin(cin),.S(sum),.Cout(cout));
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
a<=$random%16;
b<=$random%16;
cin<=$random%2;
#20;
i=i+1;if(i==10) $finish;
end
$monitor("%d:a=%b,b=%b,cin=%b,sum=%b,cout=%b",$time ,a,b,cin,sum,cout);
end 
endmodule
