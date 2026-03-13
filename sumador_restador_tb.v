`timescale 1ns/1ps

module sumador_restador_tb;
    reg [3:0] A_tb, B_tb;
    reg Sel_tb;
    wire [3:0] Res_tb;
    wire Cout_tb;
    
    integer i, j, k;

    // Instancia del módulo
    sumador_restador uut (
        .A(A_tb), 
        .B(B_tb), 
        .Sel(Sel_tb), 
        .Resultado(Res_tb), 
        .Cout(Cout_tb)
    );

    initial begin
        // Archivo para GTKWave
        $dumpfile("simulacion_lab02.vcd");
        $dumpvars(0, sumador_restador_tb);

        // Ciclo para Sel (0 = Suma, 1 = Resta)
        for (k = 0; k < 2; k = k + 1) begin
            Sel_tb = k;
            // Ciclos para A y B (16x16 = 256 combinaciones)
            for (i = 0; i < 16; i = i + 1) begin
                for (j = 0; j < 16; j = j + 1) begin
                    A_tb = i;
                    B_tb = j;
                    #10;
                end
            end
        end

        $display("Simulacion completa. Revisa el archivo .vcd");
        $finish;
    end
endmodule