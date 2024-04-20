module data_mem(
  input logic clk,
  input logic [31:0] addr_i,
  input logic [31:0] write_data_i,
  input logic mem_req_i,
  output logic [31:0] read_data_o
);

  // ����������� ����������
  parameter MEM_SIZE = 4096;
  parameter MEM_WIDTH = 32;

  // ����������� ���������� ������ ������
  logic [MEM_WIDTH-1:0] memory [0:MEM_SIZE-1];

  // ������� ��� �������� ���������� ������
  logic [31:0] read_data_reg;

  // ���������� ������� ������ ������
  always_ff @(posedge clk) begin
    if (mem_req_i == 1) begin
      read_data_reg <= memory[addr_i[13:2]];
    end
  end

  // ������ ������ ������ � ������
  always_ff @(posedge clk) begin
    if (mem_req_i == 1) begin
      memory[addr_i[13:2]] <= write_data_i;
    end
  end

  // ������������ ��������� ����� �������� �� �������� ������
  assign read_data_o = read_data_reg;

endmodule
