//RTL

module priority_encoder(input [3:0]in,input enb,output reg [1:0]out);
  always@(*) begin
    if (enb) begin
      casez (in)
     4'b1??? : out = 2'b11;
     4'b01?? : out = 2'b10;   
     4'b001? : out = 2'b01;   
     4'b0001 : out = 2'b00;
      endcase
      end
  else begin
    out = 2'b00;
  	end
end
endmodule


//TB


`timescale 1ns/1ps

module priority_encoder_tb;

  reg [3:0] in;
  reg enb;
  wire [1:0] out;
  
//intanstiation by name 
  priority_encoder dut (
    .in(in),
    .enb(enb),
    .out(out)
  );

  initial begin
    $display("---- Priority Encoder Testbench ----");
    $display("  time=%0t  enb=%b  in=%04b  out=%02b", $time, enb, in, out);

    enb = 1; in = 4'b0000; #10;
    $display("  time=%0t  enb=%b  in=%04b  out=%02b", $time, enb, in, out);

    in = 4'b0001; #10;
    $display("  time=%0t  enb=%b  in=%04b  out=%02b", $time, enb, in, out);

    in = 4'b0010; #10;
    $display("  time=%0t  enb=%b  in=%04b  out=%02b", $time, enb, in, out);

    in = 4'b0011; #10;
    $display("  time=%0t  enb=%b  in=%04b  out=%02b", $time, enb, in, out);

    in = 4'b0100; #10;
    $display("  time=%0t  enb=%b  in=%04b  out=%02b", $time, enb, in, out);

    in = 4'b0101; #10;
    $display("  time=%0t  enb=%b  in=%04b  out=%02b", $time, enb, in, out);

    in = 4'b0110; #10;
    $display("  time=%0t  enb=%b  in=%04b  out=%02b", $time, enb, in, out);

    in = 4'b0111; #10;
    $display("  time=%0t  enb=%b  in=%04b  out=%02b", $time, enb, in, out);

    in = 4'b1000; #10;
    $display("  time=%0t  enb=%b  in=%04b  out=%02b", $time, enb, in, out);

    in = 4'b1001; #10;
    $display("  time=%0t  enb=%b  in=%04b  out=%02b", $time, enb, in, out);

    in = 4'b1010; #10;
    $display("  time=%0t  enb=%b  in=%04b  out=%02b", $time, enb, in, out);

    in = 4'b1011; #10;
    $display("  time=%0t  enb=%b  in=%04b  out=%02b", $time, enb, in, out);

    in = 4'b1100; #10;
    $display("  time=%0t  enb=%b  in=%04b  out=%02b", $time, enb, in, out);

    in = 4'b1101; #10;
    $display("  time=%0t  enb=%b  in=%04b  out=%02b", $time, enb, in, out);

    in = 4'b1110; #10;
    $display("  time=%0t  enb=%b  in=%04b  out=%02b", $time, enb, in, out);

    in = 4'b1111; #10;
    $display("  time=%0t  enb=%b  in=%04b  out=%02b", $time, enb, in, out);

    enb = 0; in = 4'b1100; #10;
    $display("  time=%0t  enb=%b  in=%04b  out=%02b", $time, enb, in, out);

    in = 4'b0011; #10;
    $display("  time=%0t  enb=%b  in=%04b  out=%02b", $time, enb, in, out);

    $display("---- End of Test ----");
    $finish;
  end

endmodule
