module fault_detector(
    input a, b, cin,
    input [2:0] fault_select,
    output fault_sum_detected,
    output fault_carry_detected
);

wire sum_good, carry_good;
wire sum_faulty, carry_faulty;

// Good (golden) FA
full_adder G (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum_good),
    .cout(carry_good)
);

// Faulty FA
faulty_full_adder F (
    .a(a),
    .b(b),
    .cin(cin),
    .fault_select(fault_select),
    .sum_out(sum_faulty),
    .carry_out(carry_faulty)
);

// Detection logic
assign fault_sum_detected   = (sum_good   != sum_faulty);
assign fault_carry_detected = (carry_good != carry_faulty);

endmodule
