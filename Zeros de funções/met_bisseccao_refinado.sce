// MÉT. BISSECÇÃO REFINADO

clear();clc(); clf()

printf("**** APROXIMAÇÃO PELO MÉTODO DA BISSECÇÃO ***\n")

deff('y = f(x)', 'y = x^3-9*x+3')           // definindo a função padrão
ak = 0.0                                    // limite infimo do intervvalo
bk = 1.0                                      // limite supremo do intervalo


epsilon1 = 1e-06                            // erro desejado p/ X
epsilon2 = 1e-06                            // erro desejado p/ Y
k = 0                                       // monitor das iterações
k_max = 100                                 // máximo de iterações possíveis
xm = (ak + bk)/2                            // cálculo do ponto médio entre os limites intervalares

printf(" k  |    xm    | abs(bk-ak) |    f(xm)    |    \n")

while(k < k_max) & (abs(bk - ak) > epsilon1) & (abs(f(xm))> epsilon2)
    xm = (ak + bk)/2
    k = k + 1
mprintf(" %2.2i | %10.6f | %10.6f | %10.6f |\n", k, xm, abs(bk - ak), f(xm)) 
    if f(ak) * f(xm) < 0 then
        bk = xm
    else
        ak = xm
    end
end
printf("Aprox. ""%8.6f"" à raiz, com ""%2.2i"" iterações", xm, k)
    
