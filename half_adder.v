//RTL

module half_adder(
  input a,
  input b,
  output sum,
  output carry
);
  assign sum = a ^ b;
  assign carry = a & b;
endmodule

//TB

module half_adder_tb;

  reg a;
  reg b;
  wire sum;
  wire carry;

  
  half_adder uut (
    .a(a),
    .b(b),
    .sum(sum),
    .carry(carry)
  );

  initial begin 


    $monitor("time = %0t,a=%0d,b=%0d,sum=%0d,carry=%0d", $time, a, b, sum, carry);
    a = 0; b = 0; #10;
    a = 0; b = 1; #10;
    a = 1; b = 0; #10;
    a = 1; b = 1; #10;

    $finish;
 end
endmodule
