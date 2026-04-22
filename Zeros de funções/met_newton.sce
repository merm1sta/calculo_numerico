// MET. NEWTON-RAPHSON
// link para o site de derivadas: https://www.wolframalpha.com/input?i=derivate
clear(); clc()                          // limpa a tela e o console

printf("**** APROXIMAÇÃO PELO MÉTODO NEWTON-RAPHSON ****\n")

deff('y = f(x)', 'y = x^3 - 9*x + 3')                       // definindo a função 
deff('y = f1(x)', 'y = 3*x^2 - 9')                           // definindo a derivada (primeira) da função
old_x = 0.5                                            // condição inicial do problema (xk)

epsilon1 = 1e-06                                            // erro desejado p/ X
epsilon2 = 1e-06                                            // erro desejado p/ Y
k = 0                                                       // controlador de iterações
k_max = 100
new_x = old_x - f(old_x)/f1(old_x)                          // expressão para aproximação da raiz; new_x = xk+1


printf(" k  |    xk     | abs(xk-x0) |    f(xk)    |   f1(xk)   |\n")             // tabela perfumada que irá aparecer no console
while(k < k_max) & (abs(new_x - old_x) > epsilon1) & (abs(f(old_x))> epsilon2)
    old_x = new_x
    new_x = old_x - f(old_x)/f1(old_x)
    k = k + 1                                                        // incrementa/atualiza k
printf(" %2i | %10.6f | %10.6f | %10.6f |\n", k, new_x, abs(new_x - old_x), f(old_x))
end
printf("Aprox. ""%8.6f"" à raiz, com ""%2i"" iterações", new_x, k)
