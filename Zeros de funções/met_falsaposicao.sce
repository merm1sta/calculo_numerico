// MÉT. FALSA POSIÇÃO

clear();clc();                              // limpa a tela e o console

printf("**** APROXIMAÇÃO PELO MÉTODO DA FALSA POSIÇÃO ****\n")

deff('y = f(x)', 'y = x^3-9*x+3')           // definindo a função padrão
ak = 0.0                                    // limite infimo do intervvalo
bk = 1.0                                      // limite supremo do intervalo


epsilon1 = 1e-06                            // erro desejado p/ X
epsilon2 = 1e-06                            // erro desejado p/ Y
k = 0                                       // monitor das iterações
k_max = 100                                 // máximo de iterações possíveis
xk = ak - (f(ak)*(bk - ak))/(f(bk) - f(ak))                           // cálculo do ponto (por média ponderada) entre os limites intervalares

printf(" k  |    xk    | abs(xb-xa) |    f(xk)    |    \n")             // tabela perfumada que irá aparecer no console

while(k < k_max) & (abs(bk - ak) > epsilon1) & (abs(f(xk))> epsilon2)
    xk = ak - (f(ak)*(bk - ak))/(f(bk) - f(ak))
    k = k + 1                                                                   // incrementa/atualiza k
mprintf(" %2i | %10.6f | %10.6f | %10.6f |\n", k, xk, abs(bk - ak), f(xk)) 
    if f(ak) * f(xk) < 0 then
        bk = xk
    else
        ak = xk
    end
end
printf("Aprox. ""%8.6f"" à raiz, com ""%2i"" iterações", xk, k)
