//BCD adder
`include "RCA.v"
module bcd_adder(A,B,Cin,S,Cout);
input[3:0]A,B;
input Cin;
output [3:0] S;
output Cout;
wire carry, carry1;
wire[3:0] sum,b;
wire z;
RCA R1(.S(sum),.C4(carry),.A(A),.B(B),.C0(Cin));
RCA R2(.S(S),.C4(carry1),.A(sum),.B(b),.C0(1'b0));
assign z=(sum[3]&sum[2])|(sum[3]&sum[1])|carry;
assign b={1'b0,z,z,1'b0};
assign Cout=z;
endmodule
