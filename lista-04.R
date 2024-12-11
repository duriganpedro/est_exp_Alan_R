# Lista 4 - Visualização de dados
library(tidyverse)
data_set <- read_rds("data/geomorfologia.rds")
glimpse(data_set)

# Analisar a Argila
data_set |>
  summarise(
    n = n(),
    media = mean(argila),
    mediana = median(argila),
    desv_pad = sd(argila),
    assimetria = agricolae::skewness(argila),
    curtose = agricolae::kurtosis(argila)
  ) |>
  t()

# Histograma do Teor de Argila do solo
data_set |>
  ggplot(aes(x=argila,..density..)) +
  geom_histogram(bins = 8,color="black",
                 fill="gray") +
  facet_wrap(~sup, scale = "free") +
  theme_classic() +
  geom_density(color="black",
               fill="red",
               alpha = 0.05)


## Média e desvio e erro padrão
# da argila para cada superfície
data_set |>
  group_by(sup) |>
  summarise(
    media = mean(argila),
    desv_pad = sd(argila),
    err_pad = desv_pad/sqrt(n())
  )

## Boxplot dos teores de argila
## por superfície geomórfica
data_set |>
  ggplot(aes(x=solo, y= argila,
             fill=solo)) +
  geom_boxplot() +
  theme_bw() +
  scale_fill_viridis_d()

## Fazer um gráfico de dispersão de
## pontos com x = x e y a argila
## realizar um ajuste linear, ou seja,
## regressão linear entre x e argila
data_set  |>
  ggplot(aes(x=x, y=argila)) +
  geom_point() +
  geom_smooth(method = "lm",
              se=FALSE) +
  theme_minimal() +
  geom_smooth(
    method = "lm",
    formula = y ~ poly(x,2),
    se=FALSE, color="red"
  ) +
  geom_smooth(
    method = "lm",
    formula = y ~ poly(x,3),
    se=FALSE, color="darkgreen"
  )

# Análise de regressãio por modelos
# lineares
# Ajuste Linear
modelo_linear <- lm(argila ~ x,
                     data = data_set)
summary.lm(modelo_linear)

# Ajuste Quadrático
modelo_quadratico <- lm(argila ~x + x2,
                        data= data_set |>
                          mutate(x2=x^2)
                          )
summary.lm(modelo_quadratico)

# Ajuste Cúbico
modelo_cubico <- lm(argila ~x + x2 + x3,
                        data= data_set |>
                          mutate(
                            x2=x^2,
                            x3=x^3
                                 )
)
summary.lm(modelo_cubico)
## Para casa, adicionar as equações
## aos gráficos
data_set  |>
  ggplot(aes(x=x, y=argila)) +
  geom_point() +
  geom_smooth(method = "lm",
              se=FALSE)













