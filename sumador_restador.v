module sumador_restador (
    input [3:0] A,
    input [3:0] B,
    input Sel,        // 0 para Suma, 1 para Resta
    output [3:0] Resultado,
    output Cout
);
    wire [3:0] B_xor;

    // Paso 1: Inversión selectiva (XOR)
    // Si Sel es 1, B se invierte (Complemento a 1)
    // Si Sel es 0, B pasa igual
    assign B_xor[0] = B[0] ^ Sel;
    assign B_xor[1] = B[1] ^ Sel;
    assign B_xor[2] = B[2] ^ Sel;
    assign B_xor[3] = B[3] ^ Sel;

    // Paso 2: Suma con acarreo inicial (Cin = Sel)
    // Si Sel es 1, sumamos A + (~B) + 1 (Esto es Complemento a 2)
    // Si Sel es 0, sumamos A + B + 0 (Suma normal)
    assign {Cout, Resultado} = A + B_xor + Sel;

endmodule