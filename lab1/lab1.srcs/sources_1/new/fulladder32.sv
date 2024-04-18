module fulladder(
  input logic a_i,
  input logic b_i,  
  input logic carry_i,
  output logic sum_o,
  output logic carry_o  
);
assign sum_o = (a_i ^ b_i) ^ carry_i;
assign carry_o = ((a_i & b_i) | (a_i & carry_i)) | (b_i & carry_i);   
endmodule



module fulladder4(
    input logic [3:0] a_i,
    input logic [3:0] b_i,
    input logic   carry_i,
    output logic [3:0] sum_o,
    output logic carry_o
    );
    logic [3:0] carry;// массив для хранения переносов между однобитными сумматорами
    
    fulladder adder0(
    .a_i(a_i[0]),
    .b_i(b_i[0]),
    .carry_i(carry_i),
    .sum_o(sum_o[0]),
    .carry_o(carry[0])
    ); 
    
    fulladder adder1(
    .a_i(a_i[1]),
    .b_i(b_i[1]), 
    .carry_i(carry[0]),
    .sum_o(sum_o[1]),
    .carry_o(carry[1])
    ); 
    
    fulladder adder2(
    .a_i(a_i[2]), 
    .b_i(b_i[2]), 
    .carry_i(carry[1]), 
    .sum_o(sum_o[2]), 
    .carry_o(carry[2])
    ); 
    
    fulladder adder3(
    .a_i(a_i[3]), 
    .b_i(b_i[3]), 
    .carry_i(carry[2]), 
    .sum_o(sum_o[3]), 
    .carry_o(carry_o)
    ); 
    
endmodule


module fulladder32(
    input logic [31:0] a_i, b_i,
    input logic c_i,
    output logic [31:0] s_o, // выходная сумма
    output logic c_o // выходной перенос
);

    logic [7:0] carry; // массив для хранения переносов между блоками четырехбитных сумматоров
    
    fulladder4 block0 (.a_i(a_i[3:0]), .b_i(b_i[3:0]), .carry_i(c_i), .sum_o(s_o[3:0]), .carry_o(carry[0])); // Первый четырехбитный сумматор
    fulladder4 block1 (.a_i(a_i[7:4]), .b_i(b_i[7:4]), .carry_i(carry[0]), .sum_o(s_o[7:4]), .carry_o(carry[1])); // Второй четырехбитный сумматор
    fulladder4 block2 (.a_i(a_i[11:8]), .b_i(b_i[11:8]), .carry_i(carry[1]), .sum_o(s_o[11:8]), .carry_o(carry[2])); // Третий четырехбитный сумматор
    fulladder4 block3 (.a_i(a_i[15:12]), .b_i(b_i[15:12]), .carry_i(carry[2]), .sum_o(s_o[15:12]), .carry_o(carry[3])); // Четвертый четырехбитный сумматор
    fulladder4 block4 (.a_i(a_i[19:16]), .b_i(b_i[19:16]), .carry_i(carry[3]), .sum_o(s_o[19:16]), .carry_o(carry[4])); // Пятый четырехбитный сумматор
    fulladder4 block5 (.a_i(a_i[23:20]), .b_i(b_i[23:20]), .carry_i(carry[4]), .sum_o(s_o[23:20]), .carry_o(carry[5])); // Шестой четырехбитный сумматор
    fulladder4 block6 (.a_i(a_i[27:24]), .b_i(b_i[27:24]), .carry_i(carry[5]),  .sum_o(s_o[27:24]), .carry_o(carry[6])); // Седьмой четырехбитный сумматор
    fulladder4 block7 (.a_i(a_i[31:28]), .b_i(b_i[31:28]), .carry_i(carry[6]), .sum_o(s_o[31:28]), .carry_o(carry[7])); // Восьмой четырехбитный сумматор
    
    assign c_o = carry[7]; // Выходной перенос равен переносу от последнего четырехбитного сумматора
    
endmodule
