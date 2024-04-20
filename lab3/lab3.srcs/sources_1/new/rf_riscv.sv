module register_file(
  input logic [9:0] addr_1,
  input logic [9:0] addr_2,
  input logic [9:0] write_addr,
  input logic write_enable,
  input logic [31:0] write_data,
  output logic [31:0] read_data_1,
  output logic [31:0] read_data_2
);

  // Параметры регистрового файла
  parameter REG_FILE_SIZE = 1024;
  parameter REG_WIDTH = 32;

  // Определение внутреннего регистрового файла
  logic [REG_WIDTH-1:0] rf_mem [0:REG_FILE_SIZE-1];
  
  // Инициализация нулевого регистра значением 0
  initial begin
    rf_mem[0] = 32'h00000000;
  end

  // Запрет записи в нулевой регистр
  always_ff @ (posedge write_enable) begin
    if (write_enable && write_addr != 0) begin
      rf_mem[write_addr] <= write_data;
    end
  end

  // Чтение из регистрового файла
  assign read_data_1 = (addr_1 == 0) ? 32'h00000000 : rf_mem[addr_1];
  assign read_data_2 = (addr_2 == 0) ? 32'h00000000 : rf_mem[addr_2];

endmodule