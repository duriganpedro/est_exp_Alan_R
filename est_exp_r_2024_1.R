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
# 1 - Caracter
"Nome e Sobrenome"
"B"
'1'
'Jaboticabal'
# 2 - Numéricos Inteiros
-5
2
0
# 3 - Numéricos Reais (Double)
3.14
1.5
338.59
# 4 - Boleano (lógico)
#Operação Relacional
#Operadores Lógicos
#Negação !
#Disjunção |
#Conjunção &
#Igual ==
#Diferente !=
#Maior >
#Menor <
#Maior ou Igual >=
#Menor ou Igual <=
3>5
3<5
2>=2
2<=2
3==3
3!=3

#Operadores Aritméticos
#Soma +
#Subtração -
#Multiplicação *
#Divisão /
#Resto da Divisão %%
#Divisão Inteira %/%
#Potência ^
#Raiz Quadrada sqrt()
#Logaritmo natural log()
#Logaritmo com base 10 log10()
#Logaritmo com base 2 log2()
#Exponencial exp()

#Exemplos:
3+5
3-5
3*5
3/5
3%%5
3%/%5
3^5
sqrt(3)
cbrt(3)
log(3)
log10(3)
log2(3)
exp(3)
2^4
2.5/2
2.5%/%2
2.5%%2
# 583245 pra extrair só os dois primeiros numeros
583245%%100
583245%%10000 %/% 100

#Funções
sqrt(225)
81^1/3

#Funçoes Trigonometricas em radianos
pi
sin(30*pi/180)
log(10)

#Funções Logaritmicas
exp(1)

factorial(28)
choose(13,3)*choose(15,3)/choose(28,6)


##Operadores Lógicos

##################
# A # B #     A&B
##################
# V # V #     V
# V # F #     F
# F # V #     F
# F # F #     F 
##################

# Conjunção - E
TRUE & TRUE
TRUE & FALSE
FALSE & TRUE
FALSE & FALSE

# Disjunção - OU
TRUE | TRUE
TRUE | FALSE
FALSE | TRUE
FALSE | FALSE
#Negação - NOT
!TRUE
!FALSE

#ATRIBUIÇÃO (Alt - )

x<-5 #atribui o valor 5 ao objeto y
y=6

#Regras para bons indicadores
# - Nunca iniciado com números
# - Não pode ter espaços
# - pode ter "______"
# - Nao pode ter palavras reservadas
# - Nao pode ter simbolos especiais
# - Nao pode ter letras maiusculas
# - Nao pode ter acentuacaos
# - Deve fazer sentido para o programador
#####################################################

#precisamos de um objeto para guardar a data de nascimento de uma pessoa
niver <- "01/01/2024"
niver
