
module priority_encoder_faulty(
    input  wire [3:0] D,
    output reg  [1:0] Y
);
    reg [1:0] temp;

    always @(*) begin
        casez (D)
            4'b1???: temp = 2'b11;
            4'b01??: temp = 2'b10;
            4'b001?: temp = 2'b01;
            4'b0001: temp = 2'b00;
            default: temp = 2'b00;
        endcase

        // Injecting a sample fault:
        // Y[1] is stuck-at-0 (you can remove/change for testing)
        Y[0] = temp[0];
        Y[1] = 1'b0;   // stuck-at-0 fault for demonstration
    end
endmodule
