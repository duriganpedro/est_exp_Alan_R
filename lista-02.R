# Lista 02 - 09/12/2024
# Exercício 01
x <- c(22, 35, 44, 28)

# Média - Prática
mean(x)

# Média - Mais rebuscada
soma <- sum(x)
n <- length(x)
soma/n

# Exercício 02
x1 <- 0
x2 <- 3
y1 <- 0
y2 <- 4
d <- sqrt((x2-x1)^2+(y2-y1)^2)
paste0("A distância é: ",d)

# Exercício 03
m <- (y2-y1)/(x2-x1)
paste0("A inclinação é: ",
       round(m,4))

# Exercício 04
A <- 3421
B <- A %/% 100
C <- A %% 100
paste0("B é ", B, " e C é ", C)

# Exercício 05
A <- 872
C <- A %/% 100
D <- A %% 100 %/% 10
U <- A %% 10
SOMA <- C+D+U
paste0("A soma é ", SOMA)

# Implementar a função que dado o número
# com 3 dígitos, ele retorna a soma dos
# dígitos
source("R/minhas-funcoes.R")
soma_digitos(123)
soma_digitos(872)
soma_digitos(567)

# Exercício 06
a <- 2
b <- -4
c <- -6
delta <- b^2 - 4*a*c
x1 <- (-b + sqrt(delta)) / (2 * a)
x2 <- (-b - sqrt(delta)) / (2 * a)
paste0("x1 = ", x1, "; x2 = ", x2)











