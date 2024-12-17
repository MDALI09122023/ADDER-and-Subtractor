// carry look ahead adder
module HA(p,g,a,b);
input a,b;
output p,g;
assign p=a^b;
assign g=a&b;
endmodule


module carrygen(cin,p0,p1,p2,p3,g0,g1,g2,g3,c0,c1,c2,c3,c4); 
input cin,p0,p1,p2,p3,g0,g1,g2,g3;
output c0,c1,c2,c3,c4;
assign c0=cin;
assign c1=g0|(p0&cin);
assign c2=g1|(p1&g0)|(p1&p0&cin);
assign c3=g2|(p2&g1)|(p1&g0&p2)|(p2&p1&p0&cin);
assign c4=g3|(p3&g2)|(p3&p2&g1)|(p3&p1&g0&p2)|(p3&p2&p1&p0&cin);
endmodule

module CLA_adder(a, b,cin,sum,cout);
input[3:0]a,b;
input cin;
output[3:0] sum;
output cout;
wire p0,p1,p2,p3,g0,g1,g2,g3,c1,c2,c3,c4;
HA H1(p0 ,g0, a[0],b[0]);
HA H2(p1 ,g1, a[1],b[1]);
HA H3(p2 ,g2, a[2],b[2]);
HA H4(p3 ,g3, a[3],b[3]);

carrygen Gen(cin,p0,p1,p2,p3,g0,g1,g2,g3,c0,c1,c2,c3,c4);

assign sum[0]=p0^c0;
assign sum[1]=p1^c1;
assign sum[2]=p2^c2;
assign sum[3]=p3^c3;
assign cout=c4;

endmodule
