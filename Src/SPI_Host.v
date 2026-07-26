module spi_master #(
    parameter CLK_DIV = 25      // SCLK = clk/(2*CLK_DIV)
)(
    input  wire       clk,
    input  wire       rst,

    input  wire       start,
    input  wire       rw,        // Reserved for higher-level logic
    input  wire [7:0] tx_data,

    output reg  [7:0] rx_data,
    output reg        busy,
    output reg        done,

    output reg        spi_sclk,
    output reg        spi_mosi,
    input  wire       spi_miso,
    output reg        spi_cs
);

localparam IDLE     = 2'd0;
localparam TRANSFER = 2'd1;
localparam FINISH   = 2'd2;

reg [1:0] state;

reg [7:0] tx_shift;
reg [7:0] rx_shift;

reg [2:0] bit_cnt;

reg [$clog2(CLK_DIV)-1:0] clk_cnt;

always @(posedge clk) begin

    if (rst) begin

        state <= IDLE;

        spi_cs   <= 1'b1;
        spi_sclk <= 1'b0;
        spi_mosi <= 1'b0;

        busy <= 0;
        done <= 0;

    end
    else begin

        done <= 0;

        case(state)

        //---------------------------------------------------------
        IDLE:
        //---------------------------------------------------------
        begin

            spi_cs   <= 1;
            spi_sclk <= 0;
            busy     <= 0;

            if(start) begin

                busy <= 1;

                spi_cs <= 0;

                tx_shift <= tx_data;
                rx_shift <= 8'h00;

                bit_cnt <= 3'd7;

                clk_cnt <= 0;

                spi_mosi <= tx_data[7];

                state <= TRANSFER;

            end

        end

        //---------------------------------------------------------
        TRANSFER:
        //---------------------------------------------------------
        begin

            if(clk_cnt == CLK_DIV-1) begin

                clk_cnt <= 0;

                spi_sclk <= ~spi_sclk;

                //---------------------------------------
                // Rising edge
                //---------------------------------------
                if(spi_sclk == 0) begin

                    rx_shift[bit_cnt] <= spi_miso;

                end
                //---------------------------------------
                // Falling edge
                //---------------------------------------
                else begin

                    if(bit_cnt == 0) begin

                        rx_data <= rx_shift;

                        state <= FINISH;

                    end
                    else begin

                        bit_cnt <= bit_cnt - 1;

                        tx_shift <= {tx_shift[6:0],1'b0};

                        spi_mosi <= tx_shift[6];

                    end

                end

            end
            else begin

                clk_cnt <= clk_cnt + 1;
            end

        end

        //---------------------------------------------------------
        FINISH
        //---------------------------------------------------------
        begin

            spi_cs <= 1;
            spi_sclk <= 0;

            busy <= 0;
            done <= 1;

            state <= IDLE;

        end

        endcase

    end

end