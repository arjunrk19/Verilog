//RTL

module decoder_3to8 (
    input [2:0] in,
    input en,
    output reg [7:0] out
);

always @(*) begin
    if (en) begin
        case (in)
            3'b000: out = 8'b00000001;
            3'b001: out = 8'b00000010;
            3'b010: out = 8'b00000100;
            3'b011: out = 8'b00001000;
            3'b100: out = 8'b00010000;
            3'b101: out = 8'b00100000;
            3'b110: out = 8'b01000000;
            3'b111: out = 8'b10000000;
            default: out = 8'b00000000;
        endcase
    end else begin
        out = 8'b00000000;
    end
end

endmodule

//TB

`timescale 1ns / 1ps

module decoder_3to8_tb;

    reg [2:0] in;
    reg en;
    wire [7:0] out;

    decoder_3to8 uut (
        .in(in),
        .en(en),
        .out(out)
    );

    initial begin
      $monitor("Time=%0dns | en=%b | in=%03b | out=%08b", $time, en, in, out);

        en = 0; in = 3'b000; #10;
        in = 3'b001; #10;
        in = 3'b010; #10;
        in = 3'b011; #10;

        en = 1; in = 3'b000; #10;
        in = 3'b001; #10;
        in = 3'b010; #10;
        in = 3'b011; #10;
        in = 3'b100; #10;
        in = 3'b101; #10;
        in = 3'b110; #10;
        in = 3'b111; #10;

        $finish;
    end

endmodule
