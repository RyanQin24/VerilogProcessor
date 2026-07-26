module pc_mux(

    input wire [31:0] pc_plus_4,
    input wire [31:0] branch_target,

    input wire branch_taken,

    output wire [31:0] next_pc

);

assign next_pc =
    branch_taken ?
    branch_target :
    pc_plus_4;

endmodule