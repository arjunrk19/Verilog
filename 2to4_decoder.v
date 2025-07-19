//RTL

module decoder_2to4 (
    input [1:0] in,
    input en,
    output reg [3:0] out
);

always @(*) begin
    if (en) begin
        case (in)
            2'b00: out = 4'b0001;
            2'b01: out = 4'b0010;
            2'b10: out = 4'b0100;
            2'b11: out = 4'b1000;
            default: out = 4'b0000;
        endcase
    end else begin
        out = 4'b0000;
    end
end

endmodule

//TB

`timescale 1ns / 1ps

module decoder_2to4_tb;

    reg [1:0] in;
    reg en;
    wire [3:0] out;

    decoder_2to4 uut (
        .in(in),
        .en(en),
        .out(out)
    );

    initial begin
      $monitor("Time=%0t | en=%b | in=%02b | out=%04b", $time, en, in, out);

        en = 0; in = 2'b00; #10;
        in = 2'b01; #10;
        in = 2'b10; #10;
        in = 2'b11; #10;

        en = 1; in = 2'b00; #10;
        in = 2'b01; #10;
        in = 2'b10; #10;
        in = 2'b11; #10;

        $finish;
    end

endmodule
