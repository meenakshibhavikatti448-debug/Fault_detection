`timescale 1ns/1ps

module tb_fault_detect;

reg a, b, cin;
reg [2:0] fault_select;

wire fs, fc;

// Instantiate Fault Detector
fault_detector DUT (
    .a(a),
    .b(b),
    .cin(cin),
    .fault_select(fault_select),
    .fault_sum_detected(fs),
    .fault_carry_detected(fc)
);

integer i, j;

initial begin
    $display("FA Fault Injection Test");
    $display("A B Cin | Fault | Sum_Fault? | Carry_Fault?");
    $display("----------------------------------------------");

    // Try all input combinations
    for (i = 0; i < 8; i = i + 1) begin
        {a, b, cin} = i;

        // Try all faults 0 to 4
        for (j = 0; j < 5; j = j + 1) begin
            fault_select = j;

            #5;
            $display("%b  %b  %b   |   %0d   |     %b       |      %b",
                     a, b, cin, fault_select, fs, fc);
        end
    end

    $finish;
end

endmodule
