//RTL

module full_adder(input a,b,c,output sum,carry);
  assign sum = a^b^c;
  assign carry = (a&b) | (b&c) | (a&c);
endmodule

//TB

module full_adder_tb;
  reg a;
  reg b;
  reg c;
  wire sum;
  wire carry;
  
  full_adder dut(a,b,c,sum,carry);
  
  initial
    begin 
      $monitor("The output for a=%0d,b=%0d,c=%0d is sum= %0d,carry=%0d",a,b,c,sum,carry );
      a=0;b=0;c=0;#10;
      a=0;b=0;c=1;#10;
      a=0;b=1;c=0;#10;
      a=0;b=1;c=1;#10;         
      a=1;b=0;c=0;#10;       
      a=1;b=0;c=1;#10;
      a=1;b=1;c=0;#10;        
      a=1;b=1;c=1;#10;
 $finish;
end
endmodule
