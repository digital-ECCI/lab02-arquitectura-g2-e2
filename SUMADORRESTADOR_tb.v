`timescale 1ns/1ps

module SUMADORRESTADOR_tb;
    reg [3:0] A_tb, B_tb;
    reg OP_tb;
    wire [3:0] RESULTADO_tb;
    wire COUT_EXT_tb;
    integer i, j;

    // Instancia del módulo unificado
    SUMADORRESTADOR uut (
        .A(A_tb), .B(B_tb), .OP(OP_tb), .RESULTADO(RESULTADO_tb), .COUT_EXT(COUT_EXT_tb)
    );

    initial begin
        $dumpfile("simulacion_total.vcd");
        $dumpvars(0, SUMADORRESTADOR_tb);

        // Prueba todas las combinaciones de SUMA
        OP_tb = 0;
        for(i=0; i<16; i=i+1) begin
            for(j=0; j<16; j=j+1) begin
                A_tb = i; B_tb = j; #5;
            end
        end

        // Prueba todas las combinaciones de RESTA
        OP_tb = 1;
        for(i=0; i<16; i=i+1) begin
            for(j=0; j<16; j=j+1) begin
                A_tb = i; B_tb = j; #5;
            end
        end

        $finish;
    end
endmodule