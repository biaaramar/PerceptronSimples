clear
//Cria uma matriz de tamanho 4x4 com todos os valores iguais a 1
M = ones(4,4);
//Muda os valores da matriz para representar a porta lógica AND
M(1,2)=-1;
M(1,3)=-1; 
M(1,4)=-1;
M(2,4)=-1;
M(3,4)=-1;
M(2,2)=-1; 
M(3,3)=-1;
disp(M)
//Plota as classes diferentes
//A saida 1 equivale a saida verdadeira da tabela AND
//A saida -1 equivale a saida verdadeira
for i=1:4
    if M(i,4)==1
        plot(M(i,2),M(i,3),'bo:');
    else
        plot(M(i,2),M(i,3),'r*:');
    end
end
//Ajusta a área do gráfico
mtlb_axis([-2 2 -2 2])
//Inicia o vertos de pessos com valores aleaótios 
n = 0.5
W = rand(1,3,'uniform');
disp(W);
//Inicia o processo de treinamento atribuindo 1 ao erro
Erro = 1;
while (Erro == 1)
    Erro = 0;
     //Seleciona o vetor de entrada
    for i=1:4  
        //Calcula a ativação u(t)
        u = M(i,1)*W(1) + M(i,2)*W(2) + M(i,3)*W(3);
        y = 0;
        //Verifica a saída y(t)
        if u>0
            y=1;
        else
            y=-1;
        end
        if ((y>0) & (M(i,4)==1)) | ((y<0) & (M(i,4)==-1))
            W=W;
        else
            Erro=1; 
        if (u~=0)
             //Ajusta os pesos via regra de aprendizagem
             //Passo de apredizagem n = 0.5
             //(M(i,4)-y) é o erro
             for j=1:3
                W(j)=W(j) + n*(M(i,4)-y)*M(i,j);
             end
        end
        end
        if u==0
            erro=1;
                for j=1:3
                    W(j)=W(j) + (M(i,4)*M(i,j));
                end
        end
        disp(W)
   end
end
//Inputs novos a seram calculadas com os pesos ajustados
x1 = input('x1: ');
x2 = input('x2: ');
u = 1 * W(1) + x1 * W(2) + x2 * W(3);
y = 0;        
if u > 0 
    y = 1;
end
if u < 0 
    y = -1;
end
disp(y,'Output = ');
//Plota o gráfico com os valores escolhidos
k=0;
for i=-2:0.01:2
    k=k+1;
     XX(k)=i;
     YY(k)=-((W(2)/W(3))*i)-(W(1)*1)/W(3);
end
plot(XX,YY);
mtlb_axis([-2 2 -2 2])



 
        
        
        
        
        
        
        
        
        
        


