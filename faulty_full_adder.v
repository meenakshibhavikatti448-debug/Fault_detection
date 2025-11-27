module faulty_full_adder(
    input a, b, cin,
    input [2:0] fault_select,  // fault type selector
    output sum_out,
    output carry_out
);

wire sum_real, carry_real;

// Normal full adder
full_adder U1 (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum_real),
    .cout(carry_real)
);

// Fault injection
assign sum_out   = (fault_select == 1) ? 1'b0 :
                   (fault_select == 2) ? 1'b1 : sum_real;

assign carry_out = (fault_select == 3) ? 1'b0 :
                   (fault_select == 4) ? 1'b1 : carry_real;

endmodule
