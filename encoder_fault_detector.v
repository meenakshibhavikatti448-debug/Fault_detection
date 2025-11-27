
module encoder_fault_detector(
    input  wire [3:0] D,      // Encoder inputs
    output wire [1:0] Y,      // Actual encoder output
    output wire        fault_detected
);

    wire [1:0] Y_golden;      // Expected output (fault-free)

    // Instantiate actual encoder (may contain faults)
    priority_encoder_faulty U1 (
        .D(D),
        .Y(Y)
    );

    // Instantiate golden reference encoder (fault-free)
    priority_encoder_gold U2 (
        .D(D),
        .Y(Y_golden)
    );

    // Fault detected if actual output ? expected output
    assign fault_detected = (Y != Y_golden);

endmodule
