// MET. SECANTE
// link para o site de derivadas: https://www.wolframalpha.com/input?i=derivate
clear(); clc()                          // limpa a tela e o console

printf("**** APROXIMAÇÃO PELO MÉTODO DA SECANTE ****\n")

deff('y = f(x)', 'y = x^3 - 9*x + 3')                       // definindo a função 
old_x0 = 0.0                                            // condição inicial do problema (xk - 1)
old_x1 = 1.0                                            // condição inicial do problema (xk)

epsilon1 = 1e-06                                            // erro desejado p/ X
epsilon2 = 1e-06                                            // erro desejado p/ Y
k = 0                                                       // controlador de iterações
k_max = 100
new_x = old_x1 - f(old_x1)*(old_x1 - old_x0)/(f(old_x1) - f(old_x0))                          // expressão para aproximação da raiz


printf(" k  |    xk     | abs(xk-x1) |    f(xk)    |   \n")             // tabela perfumada que irá aparecer no console
while(k < k_max) & (abs(new_x - old_x1) > epsilon1) & (abs(f(new_x))> epsilon2)
    old_x0 = old_x1
    old_x1 = new_x
    new_x = old_x1 - f(old_x1)*(old_x1 - old_x0)/(f(old_x1) - f(old_x0))
    k = k + 1                                                        // incrementa/atualiza k
printf(" %2i | %10.6f | %10.6f | %10.6f |\n", k, new_x, abs(new_x - old_x1), f(new_x))
end
printf("Aprox. ""%8.6f"" à raiz, com ""%2i"" iterações", new_x, k)
