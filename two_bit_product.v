

module HA(S,C,a,b);
input a,b;
output S,C;
assign S=a^b;
assign C=a&b;
endmodule

module two_bit_product(a,b,res);
input[1:0]b;
input[1:0]a;
output [3:0]res;
wire [1:0] t1,t2;
wire carry;
assign t1[0]=a[0]&b[0];
assign t1[1]=a[0]&b[1];
assign t2[0]=a[1]&b[0];
assign t2[1]=a[1]&b[1];
assign res[0]=t1[0];

HA  BT1(.S(res[1]),.C(carry),.a(t1[1]),.b(t2[0]));
HA  BT2(.S(res[2]),.C(res[3]),.a(carry),.b(t2[1]));
endmodule