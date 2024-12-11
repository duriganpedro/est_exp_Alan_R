#Lista 2 - 09/12/2024
#Exercício 1
x<-c()
x<-c(22,35,44,28)
#Média - Mais rebuscada
soma<-sum(x)
n<-length(x)
media<-soma/n
media

#Exercício 2 - Distancia Euclidiana entre 2 pontos
#x1 = 0, y1 = 0
#x2 = 3, y2 = 4
x1<-0
y1<-0
x2<-3
y2<-4
distancia<-sqrt(
  (x2-x1)^2
  +
    (y2-y1)^2
)
distancia
# Exercício 3 - Implemente o programa anterior para o calculo de inclinalçao(m)
m<-((y2-y1)/(x2-x1))
paste0("O valor da inclinação é:",
       round(m,4))

#Exercício 4 - Numero inteiro com 4 digitos obtenha b e c
a<-1234
a%/%100 # b
a%%100  # c

#Exercício 5 - Numero inteiro de 3 digitos, obtenha a soma desses digitos
a<-872

#apenas o 2do digito
a%/%100 + a%/%10%%10 + a%%10

#chamar as funções
source("funções.R")
somadigitos(872)
somadigitos(123)
