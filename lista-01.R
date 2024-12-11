# Lista 01 - 09/12/2024
# Pacotes carregados no ambiente
(.packages())

# Listando todos os pacotes dispníveis para
# uso
(.packages(all.available = TRUE))

# Instalação de Pacotes
# Aba Packages / Install/Procurar o Nome
# Pacotes a serem instalados
# agricolae
# nortest
# lawstat
# tidyverse

# Instalação por comando
# install.packages("agricolae")

# Carregar Pacotes
library(agricolae)
set.seed(1235) #semente aleatória
x = rnorm(10000) # gera numeros aleatórios
hist(x)
mean(x)
sd(x)
skewness(x)
kurtosis(x)

# Tipos Primitivos...
# 1 - Caracter
"Nome e Sobrenome"
"B"
'1'
'Jaboticabal'

# 2 - Numérico Inteiro
-5
2
0

# 3 - Numérico Real (Double)
3.14
1.5
338.59

# 4 - Booleano (Lógico)
TRUE
FALSE

# OPERAÇÃO RELACIONAL
3 > 5
3 < 5
2 >= 2
2 <= 2
2 == 2
2 != 2

# OPERAÇÃO ARITMÉTICA
2 + 2
2 - 2
2 * 2
2 / 2
9 %/% 4
9 %% 4
2^4
2**4
5 %/% 2
5/2-5%/%2
583245 %/% 10000
583245 %% 10000 %/% 100
583245 %% 100

# FUNÇÕES
sqrt(225) # raiz quadrada
81^(1/3) # raiz cúbica
sin(30)
pi
sin(30*pi/180)
log(10)
exp(2.302585)
log10(10000)
log(27, 3)
exp(1)
factorial(3)
factorial(4)
factorial(5)
# sala com 13 meninos e 15 meninas, qual a
# chance de no sorteio de 6 alunos, formarmos
# um grupo com 3 meninas e 3 meninos
choose(13,3)*choose(15,3)/choose(28,6)

# OPERADORES LÓGICOS
# Conjunção  - E
TRUE & TRUE
TRUE & FALSE
FALSE & TRUE
FALSE & FALSE

# Disjunção - OU
TRUE | TRUE
TRUE | FALSE
FALSE | TRUE
FALSE | FALSE

# Negação - NÃO
! TRUE
! FALSE

# ATRIBUIÇÃO (Alt -)
y <- 5
y = 6
# Regras para bons identificadores
# - nunca iniciado com número
# - não pode ter "expaço"
# - pode ter "_" (underscore)
# - não é recomendado uso do ponto "."
# - não pode ser utilizado palavras
# rezervadas (pi, if, TRUE, T, FALSE, F...)
# - não pode ter acentuação.
# - não pode ter caracteres especiais
# (+, -, *, /, %, $, @, #...)
# - Deve fazer sentido para o programador
# Precisamos de um objeto para guardar a
# data de nasciento de uma pessoa:
data_nascimento <- "19/09/1999"
dataNascimento <- "29/09/1989"
data_de_nascimento_do_usuario <- "28/08/1988"

# Precisamos do nome do obejto que receberá
# uma análise de variância
analise
analide_de_vaiancia
anova

# Diferencia maiúsculas de minúsculas
NOME_DO_USUARIO <- "Alan"
nome_do_usuario <- "Pedro"









