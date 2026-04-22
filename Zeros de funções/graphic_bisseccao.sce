// MÉT. DA BISSECÇÃO

clear();clc();clf()      // limpa as variáveis, o console e a saída gráfica

printf("\n **** MÉTODO GRÁFICO PARA ISOLAR RAÍZES DA FUNÇÃO ****\n")
printf("\n **** USO DE UMA FUNÇÃO PADRÃO ****\n")

x=-4:0.1:4      // define onde começa e termina o eixo das abscissas
y=x.^3-9*x+3     // função padrão

plot2d(x, y)
h = gce()          // obtém manipulador do objeto gráfico atual (linha plotada)
line_handle = h.children    // h.children manipulador de linha
line_handle.thickness = 4   // espessura da linha
line_handle.line_mode = 1       
line_handle.foreground = color('red')

xtitle("Localização das raízes: gráfico de f(x) = x^3-9x+3",...
       "Valores do domínio [-4 , 4]",...
       "Valores da função f(x) = y")
a = gca()                              // obtém o manipulador dos eixos
a.title.font_size = 4                   // ajusta o tamanho da fonte do título do gráfico
a.x_label.font_size = 4                 // ajusta o tamanho da fonte do rótulo do eixo X
a.y_label.font_size = 4                 // ajusta o tamanho da fonte do rótulo do eixo Y

xgrid()
