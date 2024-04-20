module alu_riscv (
  input  logic [31:0]  a_i,
  input  logic [31:0]  b_i,
  input  logic [4:0]   alu_op_i,
  output logic         flag_o,
  output logic [31:0]  result_o
);

  always_comb begin
    case (alu_op_i)
      5'b00000: begin // ADD
        result_o = a_i + b_i;
        flag_o = 0;
      end

      5'b10000: begin // SUB
        result_o = a_i - b_i;
        flag_o = 0;
      end

      5'b00001: begin // SLL
        result_o = a_i << b_i;
        flag_o = 0;
      end

      5'b00010: begin // SLTS
        result_o = (a_i < b_i) ? 1 : 0;
        flag_o = 0;
      end

      5'b00011: begin // SLTU
        result_o = (a_i < b_i) ? 1 : 0;
        flag_o = 0;
      end

      5'b00100: begin // XOR
        result_o = a_i ^ b_i;
        flag_o = 0;
      end

      5'b00101: begin // SRL
        result_o = a_i >> b_i;
        flag_o = 0;
      end

      5'b10101: begin // SRA
        result_o = $signed(a_i) >>> b_i;
        flag_o = 0;
      end

      5'b00110: begin // OR
        result_o = a_i | b_i;
        flag_o = 0;
      end

      5'b00111: begin // AND
        result_o = a_i & b_i;
        flag_o = 0;
      end

      default: begin
        result_o = 0;
        flag_o = 0;
      end
    endcase
  end
endmodule