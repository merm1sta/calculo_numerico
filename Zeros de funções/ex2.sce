// // Problema 2.1.2: f(x) = x^2 + ln(x) no intervalo [o,5; 1], com erro = 1e-05

clear();clc();clf()      // limpa as variáveis, o console e a saída gráfica

///////////////////////////////////////////////////////////////////////////////////////
// BISSECCAO COM PLOT DO GRÁFICO
/*printf("\n **** MÉTODO GRÁFICO PARA ISOLAR RAÍZES DA FUNÇÃO ****\n")
printf("\n **** USO DE UMA FUNÇÃO PADRÃO ****\n")

x=0,5:0.1:1      // define onde começa e termina o eixo das abscissas
y=x.^2+log(x)     // função padrão

plot2d(x, y)
h = gce()          // obtém manipulador do objeto gráfico atual (linha plotada)
line_handle = h.children    // h.children manipulador de linha
line_handle.thickness = 4   // espessura da linha
line_handle.line_mode = 1       
line_handle.foreground = color('red')

xtitle("Localização das raízes: gráfico de f(x) = x^3-9x+3",...
       "Valores do domínio [0,5 ; 1]",...
       "Valores da função f(x) = y")
a = gca()                              // obtém o manipulador dos eixos
a.title.font_size = 4                   // ajusta o tamanho da fonte do título do gráfico
a.x_label.font_size = 4                 // ajusta o tamanho da fonte do rótulo do eixo X
a.y_label.font_size = 4                 // ajusta o tamanho da fonte do rótulo do eixo Y

xgrid()*/


///////////////////////////////////////////////////////////////////////////////////////
// BISSECCAO REFINADO
/*printf("**** APROXIMAÇÃO PELO MÉTODO DA BISSECÇÃO ***\n")

deff('y = f(x)', 'y = x^2+log(x)')           // definindo a função padrão
ak = 0.5                                    // limite infimo do intervvalo
bk = 1.0                                      // limite supremo do intervalo


epsilon1 = 1e-05                            // erro desejado p/ X
epsilon2 = 1e-05                            // erro desejado p/ Y
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
printf("Aprox. ""%8.6f"" à raiz, com ""%2.2i"" iterações", xm, k)*/
    

///////////////////////////////////////////////////////////////////////////////////////
// NEWTON-RAPHSON
/*printf("**** APROXIMAÇÃO PELO MÉTODO NEWTON-RAPHSON ****\n")

deff('y = f(x)', 'y = x^2 + log(x)')                       // definindo a função 
deff('y = f1(x)', 'y = 2*x + 1/x')                           // definindo a derivada (primeira) da função
old_x = 0.75                                            // condição inicial do problema (xk); xm de [o,5; 1]

epsilon1 = 1e-05                                            // erro desejado p/ X
epsilon2 = 1e-05                                            // erro desejado p/ Y
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
printf("Aprox. ""%8.6f"" à raiz, com ""%2i"" iterações", new_x, k)*/


///////////////////////////////////////////////////////////////////////////////////////
// SECANTE
printf("**** APROXIMAÇÃO PELO MÉTODO DA SECANTE ****\n")

deff('y = f(x)', 'y = x^2 + log(x)')                       // definindo a função 
old_x0 = 0.5                                            // condição inicial do problema (xk - 1)
old_x1 = 1.0                                            // condição inicial do problema (xk)

epsilon1 = 1e-05                                            // erro desejado p/ X
epsilon2 = 1e-05                                            // erro desejado p/ Y
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
