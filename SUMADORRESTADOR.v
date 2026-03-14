module SUMADORRESTADOR (
    input [3:0] A,
    input [3:0] B,
    input OP,          // 0 = Suma, 1 = Resta
    output [3:0] RESULTADO,
    output COUT_EXT
);

    wire [3:0] B_XOR;
    wire c1, c2, c3;

    // Lógica XOR para invertir B solo si OP es 1
    assign B_XOR[0] = B[0] ^ OP;
    assign B_XOR[1] = B[1] ^ OP;
    assign B_XOR[2] = B[2] ^ OP;
    assign B_XOR[3] = B[3] ^ OP;

    // Instancias usando el módulo SUMADOR1BIT (que está definido abajo)
    SUMADOR1BIT bit0 (.A_IN(A[0]), .B_IN(B_XOR[0]), .C_IN(OP), .S1_OUT(RESULTADO[0]), .C1_OUT(c1));
    SUMADOR1BIT bit1 (.A_IN(A[1]), .B_IN(B_XOR[1]), .C_IN(c1), .S1_OUT(RESULTADO[1]), .C1_OUT(c2));
    SUMADOR1BIT bit2 (.A_IN(A[2]), .B_IN(B_XOR[2]), .C_IN(c2), .S1_OUT(RESULTADO[2]), .C1_OUT(c3));
    SUMADOR1BIT bit3 (.A_IN(A[3]), .B_IN(B_XOR[3]), .C_IN(c3), .S1_OUT(RESULTADO[3]), .C1_OUT(COUT_EXT));

endmodule 

// Módulo de 1 bit metido en el mismo archivo para no generar más códigos
module SUMADOR1BIT (
    input A_IN, B_IN, C_IN,
    output S1_OUT, C1_OUT
);
    assign S1_OUT = A_IN ^ B_IN ^ C_IN;
    assign C1_OUT = (A_IN & B_IN) | (C_IN & (A_IN ^ B_IN));
endmodule