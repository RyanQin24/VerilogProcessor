module register_file (

    input wire clk,

    // Read ports
    input wire [4:0] rs1,
    input wire [4:0] rs2,

    output wire [31:0] read_data1,
    output wire [31:0] read_data2,


    // Write port
    input wire [4:0] rd,
    input wire [31:0] write_data,
    input wire reg_write

);


    reg [31:0] registers [0:31];


    integer i;


    // Initialize registers
    initial begin

        for(i=0;i<32;i=i+1)
            registers[i] = 32'b0;

    end



    // Two asynchronous read ports
    assign read_data1 =
        (rs1 == 0) ? 32'b0 : registers[rs1];


    assign read_data2 =
        (rs2 == 0) ? 32'b0 : registers[rs2];



    // Single synchronous write port
    always @(posedge clk) begin

        if(reg_write && rd != 0)
            registers[rd] <= write_data;

    end


endmodule