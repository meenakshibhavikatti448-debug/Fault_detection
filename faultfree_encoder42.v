module priority_encoder_gold(
    input  wire [3:0] D,
    output reg  [1:0] Y
);
    always @(*) begin
        casez (D)
            4'b1???: Y = 2'b11;   // D3
            4'b01??: Y = 2'b10;   // D2
            4'b001?: Y = 2'b01;   // D1
            4'b0001: Y = 2'b00;   // D0
            default: Y = 2'b00;
        endcase
    end
endmodule


