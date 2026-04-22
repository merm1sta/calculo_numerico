/////////////////////////////////////////////////////////
clear(); clc(); //limpa as variaveis e limpa console
//......................................................

printf("\n****Eliminação de Gauss sem pivoteamento****\n")
printf("Resolução direta de sistemas de equações linerares\n")

/////////////////////exemplo 3.1/////////////////////////
printf("\n ******* Dados de entrada - Matriz A e Vetor B *****\n")
//dados de entrada - matriz dos coef. e vetor dos termos independentes (vetor solução)
A = [3,2,4; 1,1,2;4,3,-2];
B = [1;2;3];
T = A;

printf("\n.....Entrada - Matriz A (original):\n");
disp(A);
printf("\n.....Entrada - Matriz B (original):\n");
disp(B);
n = length(B);
//printf("\n DIMENSÃO MATRIZ:")
//disp(n) // atribução para a verificação dos resultados)

//....................................................................
printf("\n ******************** TRIANGULARIZAÇÃO **********:\n")
//alg. de triangularização
n = length(B)
for k = (1:n-1)
    for i = (k+1:n)
        m = A(i,k)/ A(k,k)
        A(i,k) = 0
        for j = (k+1:n)
            A(i,j) = A(i,j) - A(k,j) * m
        end
        B(i) = B(i) - B(k) * m
        //printf("/nMatriz A/n")
        //disp(A);
        //printf("/nMatriz B/n")
        //disp(B);
    end
end

printf("\n Saída - Matriz A (triangularizada):\n");
disp(A);
printf("\n Saída - Vetor B (triangularizada):\n");
disp(B);


//.....................................................................
printf("\n*************** RETROSUBSTITUIÇÃO ***************:\n");
// alg. de retrosubstituicao
U = A;
C = B;
n = length(C);
X = zeros(n,1);
if U(n,n) == 0 then
    error("ERRO: pivô nulo na matriz triangular superior.");
end
X(n) = C(n) / U(n,n); // sol. ultima linha
for k = (n-1:-1:1)
    soma = 0;
    for j = (k+1:n)
        soma = soma + U(k,j)*X(j);
    end
    if U(k,k) == 0 then
        error("ERRO: pivô nulo durante a redistribuição.");
    end
    X(k) = (C(k) - soma) / U(k,k);
end

//.....................................................................
printf("\n Saída - Solução X do sistema (AX = B):\n");
mprintf("  %.6f\n", X);

//.....................................................................
printf("\n****** VERIFICAÇÃO DA SOLUÇÃO, SE AX = B ****** \n\n");
// verificando a soluçao sendo que AX = B
for i = (i:n)
    s = 0;
    for j = (1:n)
        s = s + T(i,j)*X(j);
        if (j < n) then
            printf("(%.3f*%.3f) + ",  T(i,j), X(j));
        end   
        if (j == n) then
            printf("(%.3f*%.3f) = ",  T(i,j), X(j));
            printf("%.3f\n", s);
        end
    end
end

//.....................................................................
printf("\n************ FIM DA ELIMINAÇÃO GAUSSIANA ************\n");
//////////////////////////////////////////////////////////////////////
