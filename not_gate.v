//RTL CODE

module not_gate(input a ,output y);
assign y = ~a;
endmodule

//TEST BENCH

module not_gate_tb;
reg a;
wire y;
not_gate uut (.a(a),.y(y));
initial begin
a=0;
#10;
a=1;
#10;
$display ("time=%t,a=%d,y=%d",$time,a,y);
$finish;
end 
endmodule
