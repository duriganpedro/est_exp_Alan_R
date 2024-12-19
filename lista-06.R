# Pressupostos da Análise de Variância
# - Aditividade do modelo
# - Independência dos Erros (resíduo)
# - Igualdade das variância (Homocedasticidade)
# - Normalidade dos Erros (resíduo)
# criar uma seção por análise...
# Control + Shift + R


# Análise Geomorfologia ---------------------------------------------------
# Diagnósticos da ANOVA
library(tidyverse)
dados <- read_rds("data/geomorfologia.rds")
glimpse(dados)

# Identificar os valores da superfície
# para a variável argila
dados |>
  ggplot(aes(x=x,y=argila,color = sup)) +
  geom_point()

# Aplicando um modelo de delineamento
# inteiramente casualizado.
y <- dados |> pull(argila)
trat <- dados |> pull(sup) |> as_factor()

## Criar o modelo para análise
mod <- aov(yt ~ trat)

## Estrutura do objeto mod
# str(mod)

## Extraindo os resíduos do modelo
rs <- rstudent(mod)

## Extraindo os preditos pelo modelo
yp <- predict(mod)

## Começar o diagnóstico construindo um
## arquivo com trat, y, yp e rs
diagnostico <- tibble(trat,y,yt,yp,rs)
diagnostico

# NORMALIDADE DOS RESÍDUOS
## Hitograma
diagnostico |>
  ggplot(aes(x=rs)) +
  geom_histogram(bins = 10,
                 color="black",
                 fill="gray") +
  theme_bw()

# QQ-Plot
diagnostico |>
  ggplot(aes(sample = rs)) +
  stat_qq() +
  stat_qq_line(color="blue")

## Aplicar os teste de normalidade
shapiro.test(rs) # Não rejeitamos H0
nortest::lillie.test(rs) # Não rejeitamos H0
nortest::cvm.test(rs) # Não rejeitamos H0
nortest::ad.test(rs) # Não rejeitamos H0

## Conclusão
## Os resíduos seguem uma distribuição Normal
## Boxplot ou Gráfico dos 5 números.
diagnostico |>
  ggplot(aes(x=trat, y=yt,fill=trat)) +
  geom_boxplot()

# Teste de Homocedasticidade
# Teste de Levene
lawstat::levene.test(yt,trat) # Rejeitamos H0

# Bartlett
bartlett.test(yt,trat) # Rejeitamos H0

## Dados são heterocedásticos, precisamos
## estudar sua regularidade...
## calcular a média e avariância dos
## valores de y em função dos trat.
diagnostico |>
  group_by(trat) |>
  summarise(
    log_media = log(mean(yt)),
    log_variancia = log(var(yt))
  ) |>
  ggplot(aes(x=log_media, y= log_variancia))+
  geom_point() +
  geom_smooth(method = "lm",
              se=FALSE)

## Análise de regressão
modelo_lienar <- lm(log_variancia~log_media,
                    data = diagnostico |>
                      group_by(trat) |>
                      summarise(
                        log_media = log(mean(yt+1)),
                        log_variancia = log(var(yt+1))
                      ))
summary.lm(modelo_lienar)
# Não rejeitamos H0 para a estimativa do parâmetro Beta,
# ou seja, o coeficiente angular da equação linear. Portanto
# Concluímos que a Heterocedasticidade é Irregular.

## Transformação Box and Cox
## Resultado do ChatGPT
boxcox_result <- MASS::boxcox(mod)
str(boxcox_result)

# Obter os valores de lambda e log-verossimilhança
lambda <- boxcox_result$x
log_likelihood <- boxcox_result$y

# Identificar o lambda correspondente ao maior log-verossimilhança
max_lambda <- lambda[which.max(log_likelihood)]
cat("O valor de lambda no maior log-verossimilhança é:", max_lambda, "\n")

## Nosso jetinho brasileiro
box_cox <- MASS::boxcox(mod)
box_cox |> as.data.frame() |>
  arrange(desc(y)) |>
  slice(1) |>
  pull(x)

lambda <- box_cox |> as.data.frame() |>
  arrange(desc(y)) |>
  slice(1) |>
  pull(x)

# Transformar a variável
yt <- y^lambda ## O QUE FAZER?
yt <- log(y)
# Voltar ao início da análise e refazer
# todos os passos e diagnósticos.


# Estudo de Outliers
mod <- aov(y ~ trat)
rs <- rstudent(mod)
yp <- predict(mod)
diagnostico <- tibble(trat,y,yp,rs)

## Gráfico de identificação de Outliers
diagnostico |>
  ggplot(aes(x=yp,y=rs,colour = trat)) +
  geom_point() +
  coord_cartesian(ylim = c(-5,5)) +
  geom_hline(yintercept = c(-3,3),
             color="red") +
  theme_bw()

# Análise Produção Macieira -----------------------------------------------
## 1- Download do dados de
## produção da Macieira (site da disciplina)
## 2 - Salvar na pasta data-raw
## 3 - realizar a faxina de dados e salvar como
## "prodmacieira.rds"
## 4 - realizar o diagnóstico da ANOVA.
## modelo é DBC
## mod <- aov(y ~ trat + bloco)
dados_macieira <- read_rds("data/prodmacieira.rds")
y <- dados_macieira |>
  mutate(
   prod = ifelse(prod == 170.89,158.02,prod)
  ) |> pull(prod)
bloco <- dados_macieira |> pull(bloco) |> as_factor()
trat <- dados_macieira |> pull(tratamento) |> as_factor()
mod <- aov(y ~ trat + bloco)

## Extraindo os resíduos do modelo
rs <- rstudent(mod)

## Extraindo os preditos pelo modelo
yp <- predict(mod)

## Começar o diagnóstico construindo um
## arquivo com trat, y, yp e rs
diagnostico <- tibble(trat,y,yp,rs)
diagnostico

# NORMALIDADE DOS RESÍDUOS
## Hitograma
diagnostico |>
  ggplot(aes(x=rs)) +
  geom_histogram(bins = 10,
                 color="black",
                 fill="gray") +
  theme_bw()

# QQ-Plot
diagnostico |>
  ggplot(aes(sample = rs)) +
  stat_qq() +
  stat_qq_line(color="blue")

## Aplicar os teste de normalidade
shapiro.test(rs) # rejeitamos H0
nortest::lillie.test(rs) # rejeitamos H0
nortest::cvm.test(rs) # rejeitamos H0
nortest::ad.test(rs) # rejeitamos H0

## Conclusão
## Os resíduos não seguem uma distribuição Normal
## Boxplot ou Gráfico dos 5 números.
diagnostico |>
  ggplot(aes(x=trat, y=y,fill=trat)) +
  geom_boxplot()

# Teste de Homocedasticidade
# Teste de Levene
lawstat::levene.test(yt,trat) # Rejeitamos H0

# Bartlett
bartlett.test(yt,trat) # Rejeitamos H0

## Dados são heterocedásticos, precisamos
## estudar sua regularidade...
## calcular a média e avariância dos
## valores de y em função dos trat.
diagnostico |>
  group_by(trat) |>
  summarise(
    log_media = log(mean(y)),
    log_variancia = log(var(y))
  ) |>
  ggplot(aes(x=log_media, y= log_variancia))+
  geom_point() +
  geom_smooth(method = "lm",
              se=FALSE)

## Análise de regressão
modelo_lienar <- lm(log_variancia~log_media,
                    data = diagnostico |>
                      group_by(trat) |>
                      summarise(
                        log_media = log(mean(y+1)),
                        log_variancia = log(var(y+1))
                      ))
summary.lm(modelo_lienar)
# Não rejeitamos H0 para a estimativa do parâmetro Beta,
# ou seja, o coeficiente angular da equação linear. Portanto
# Concluímos que a Heterocedasticidade é Irregular.

## Transformação Box and Cox
## Resultado do ChatGPT
boxcox_result <- MASS::boxcox(mod,
            lambda = seq(-2, 2, length =10))
str(boxcox_result)

## Nosso jetinho brasileiro
box_cox <- MASS::boxcox(mod)
box_cox |> as.data.frame() |>
  arrange(desc(y)) |>
  slice(1) |>
  pull(x)

lambda <- box_cox |> as.data.frame() |>
  arrange(desc(y)) |>
  slice(1) |>
  pull(x)

# Transformar a variável
yt <- y^lambda ## O QUE FAZER?
# Voltar ao início da análise e refazer
# todos os passos e diagnósticos.


# Estudo de Outliers
mod <- aov(y ~ trat+bloco)
rs <- rstudent(mod)
yp <- predict(mod)
diagnostico <- tibble(trat,y,yp,rs)

## Gráfico de identificação de Outliers
diagnostico |>
  ggplot(aes(x=yp,y=rs,colour = trat)) +
  geom_point() +
  coord_cartesian(ylim = c(-5,5)) +
  geom_hline(yintercept = c(-3,3),
             color="red") +
  theme_bw()

# Identificando o outlier
diagnostico |>
  filter(rs > 3) |>
  pull(y)

diagnostico |>
  filter(rs > 3) |>
  pull(yp)
# Identificado o outlier, vamos
# substituir o seu valor em y pelo
# valor predito.
# y (170.89) por yp(158.02)
# vamos realizar a substituição,
# no momento em que extraímos os dados
# y...














