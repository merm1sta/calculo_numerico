//*MET. NUMÉRICO DE FUNÇÕES QUADRÁTICAS*
function [raiz, k] = heron(d, x0, erro, max_k)
    x = x0;
    
    for k = 1: max_k
        new_x = (x + d/x)/2;        //fórmula de aproximação da raíz de Heron
        
        if abs(new_x - x) < erro then
            raiz = new_x;
            return
        end 
        
        x = new_x;
    end
    
    raiz = x;
endfunction

//coletando dados do usuário
d = input("Digite um valor para d: ");
x0 = input("Digite um valor para o x inicial (Recomendação: 1): ");
erro = input("Digite um valor para o Erro Absoluto: ");
max_k = input("Digite um valor para o máximo de iterações: ");

//chamando a função
[raiz,k] = heron(d, x0, erro, max_k);
disp("A raiz de " + string(d) + " é igual a: " + string(raiz));
disp("Convergiu em " + string(k) + " iterações.");
