# Data 10/12/2024 - Lista 03
# Exercício 01
x <- 100
y <- 68
if(x > y){
  print(x)
} else {
  print(y)
}

# Exercício 01.1
# Criar uma estrutura que classica
# a nota final do aluno:
# se a nota fou maior ou igual a 5
# "aprovado" caso contrário,
# "reprovado".
nota_final <- 4.99
if(nota_final >= 5){
  print('Aprovado')
} else {
  print('Reprovado')
}
ceiling(nota_final) # inteiro superior
floor(nota_final) # inteiro inferior

# Exercício 01.2
# implementar:
# 0 a 2.99 - reprovado
# 3 a 4.99 - recuperação
# 5 a 10 - aprovado
nota <- 8.99
if(nota < 3){
  print("Reprovado")
} else if(nota < 5){
  print("Recuperação")
} else {
  print("Aprovado")
}

# Vamos para o R das Ruas, com
# vetores.
# construção do vetor de nomes
nome <- c("Natali","Mirela","Mayara",
          "Giovana","Alaor")
n1 <- c(10,2,7,4,10)
n2 <- c(7,3,7,4,5)
n3 <- c(8,2,7,4,6)

# criando um frame de dados com os
# objetos
dados <- data.frame(nome,n1,n2,n3)
dados$media <- (dados$n1+dados$n2+dados$n3)/3
dados[1,] # mostrando a linha 1
dados[1] # coluna 01
dados[,1] # vetor coluna 1

# média da prova 1
mean(dados$n1)
mean(dados$n2)
mean(dados$n3)
mean(dados$media)

# média das notas (colunas 2 a 4)
apply(dados[2:5], 2, max)

# aprovado e reprovado
dados$class <- ifelse(dados$media>5,
                      "aprovado","reprovado")
dados$class_1 <- ifelse(dados$media<3,
                        "reprovado",
                        ifelse(dados$media<5,
                               "recuperação",
                               "aprovado"))
dados



# Utilizando o tidyverse
library(tidyverse)
nome <- c("Natali","Mirela","Mayara",
          "Giovana","Alaor")
n1 <- c(10,2,7,4,10)
n2 <- c(7,3,7,4,5)
n3 <- c(8,2,7,4,6)
dados <- data.frame(nome,n1,n2,n3)

# selecionar a coluna n1
dados |>
  select(n1)

#selecionar as clunas nome e n3
dados |>
  select(nome, n3)

# selecionar apenas os alunos
# com 10 em n1
dados |>
  filter(n1 == 10)

# selecionar apenas os alunos
# com n3 menor ou igual a 5
dados |>
  filter(n3 <= 5) |>
  select(nome, n3)

# Média das notas
dados |>
  mutate(
    media = (n1+n2+n3)/3,
    class = ifelse(media<5,"RP","AP"),
    class_1 = ifelse(media<3,"RP",
                     ifelse(media<5,
                            "RC","AP"))
  )

# Gráfico de coluna das médias
dados |>
  mutate(
    media=(n1+n2+n3)/3
  ) |>
  ggplot(aes(x=nome,y=media)) +
  geom_col(color="black",
           fill = "aquamarine4") +
  labs(title = "Média Final") +
  geom_hline(yintercept = 5,
             color="red")+
  theme_bw() +
  annotate(
    "text",
    x = 1:5,
    y = c(7,4,7,2.3,8)*1.1,
    label = c(7,4,7,2.3,8)
  )

# Gráfico de coluna das médias
# classificação mapeada nas cores
library(tidyverse)
nome <- c("Natali","Mirela","Mayara",
          "Giovana","Alaor")
n1 <- c(10,2,7,4,10)
n2 <- c(7,3,7,4,5)
n3 <- c(8,2,7,4,6)
dados <- data.frame(nome,n1,n2,n3)
dados |>
  mutate(
    media = (n1+n2+n3)/3,
    class = ifelse(media < 3,
                   "RP",
                   ifelse(media < 5,
                   "RC","AP"))
  ) |>
  ggplot(aes(x=nome,y=media,fill=class)) +
  geom_col(color="black") +
  scale_fill_manual(values = c("green",
                               "yellow",
                               "red")) +
  theme_bw() +
  geom_hline(yintercept = 5,color="red") +
  labs(title = "Média Final")

# Exercício 2
num <- 2.004
if(num %% 1 == 0) {
  print("Número Inteiro")
  }else{
  print("Número Decimal")
  }

# Exercício 3 - adicionando o nulo tmb
num <- -1
if(num == 0){
  print("Nulo")
}else if(num > 0){
  print("Positivo")
}else{
  print("Negativo")
}


# Exercício 4
vogais <-c("a","e","i","o","u")
variavel <- 1
if(is.character(variavel)){
  variavel <- stringr::str_to_lower(variavel)
  if(variavel %in% vogais ){
    print("Vogal")
  } else{
    print("Consoante")
  }
}else{
  print("Não é caracter")
}


# Exercício 5
variavel <- 52
if(is.numeric(variavel)){
  if(variavel %% 2 ==0 ){
    print("Par")
  } else{
    print("Impar")
  }
}else{
  print("Não é numero")
}

# Exercício 6
a <- -2
b <- 4
c <- -2
delta <- b*b - 4*a*c
if(delta < 0){
  print("Raízes são imaginárias")
} else if(delta == 0){
  x = -b/(2*a)
  print(x)
} else{
  x1 = (-b+sqrt(delta))/2/a
  x2 = (-b-sqrt(delta))/2/a
  print(x1)
  print(x2)
}

# Exercício 7
A <- 15
B <- 15
C <- 15
if((A<B+C)&(B<A+C)&(C<A+B)){
  if((A==B)&(B==C)){
    print("Equilátero")
  }else if((A==B)|(A==C)|(B==C)){
    print("Isósceles")
  }else{
    print("Escaleno")
  }
}else{
  print("Não é triângulo")
}

# Exercício 8
# Um ano é bissexto se ele for divisível por 400 ou se ele for divisível por 4
# e não por 100.
# se (ano mod 400 == 0) ou ((ano mod 4 == 0) e (ano mod 100 != 0)) entao
# escreval(ano, " é bisexto!")
# fimse
# exemplos: Bissexto: 1980, 1984, 1988, 1992, 1996 e 2000.
# 1900 não foi bissexto, mas 1600 foi
ano <- 1997
if((ano%%400==0)|((ano%%4==0)&(ano%%100!=0))){
  print("Ano bisexto")
}else{
  print("Não bisexto")
}
