#Lista 01 - 09/12;2024
#Pacotes carregados no ambiente
(.packages())
#listado todos os pacotes disponiveis para uso
(.packages(all.available = TRUE))
#Instalação de pacotes
#aba Packages / Install / Procurar o Nome
#Agricolae
# Nortest
# install.packages("nortest")
#Lawstat
# install.packages("lawstat")
#tidyverse
# install.packages("tidyverse")
#carregar Pacotes
library(agricolae)
set.seed(1235)#semente aleatorea
x = rnorm(10000) #gera numeros aleatórios
hist(x)
mean(x)
sd(x)
skewness(x)

#tipos primitivos

