module instr_mem(
  input logic [9:0] addr_i,
  output logic [31:0] read_data_o
);

  // ����������� ����������
  parameter MEM_SIZE = 1024;
  parameter MEM_WIDTH = 32;

  // ����������� ���������� ������ ����������
  logic [MEM_WIDTH-1:0] memory [0:MEM_SIZE-1];

  // ����������� ������ � ������ ����������
  assign read_data_o = memory[addr_i[11:2]];

  // ���������� Design Source ����� � ���������� ������ ����������
  // ������ ����������� ����� memory_contents.txt:
  // 0000_0000
  // 0000_1111
  // ...

  // �������� ����������� ������ ����������
  initial begin
    $readmemh("program.mem", memory);
  end

endmodule