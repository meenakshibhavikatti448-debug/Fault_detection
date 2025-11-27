
module tb_encoder_fault_detection();

    reg  [3:0] D;
    wire [1:0] Y;
    wire fault_detected;

    encoder_fault_detector DUT (
        .D(D),
        .Y(Y),
        .fault_detected(fault_detected)
    );

    initial begin
        $monitor("D=%b  Y=%b  Fault=%b", D, Y, fault_detected);

        D = 4'b0001; #10;
        D = 4'b0010; #10;
        D = 4'b0100; #10;
        D = 4'b1000; #10;
        D = 4'b1010; #10;

        $finish;
    end
endmodule
