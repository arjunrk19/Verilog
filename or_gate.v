//RTL

module or_gate(input a , input b, output y);
  assign y = a|b;
endmodule

//TB

module or_gate_tb;
  reg a;
  reg b;
  wire y;
  
 or_gate dut(a,b,y);
  
  initial begin 
    $monitor("The value of a=%d,b=%d,y=%d",a,b,y);
    a=1'b0;
    b=1'b0;
    #10;
   
    
    a=1'b0;
    b=1'b1;
    #10;
    
    a=1'b1;
    b=1'b0;
    #10;
   
     
    a=1'b1;
    b=1'b1;
    #10;
   
   
    
    $finish;
  end
  endmodule
