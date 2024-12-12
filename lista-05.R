#Lista 05 - 11/12/2024
#carregar os pacotes
library(tidyverse)
library(agricolae)
#carregar o arquivo geomorfologia

#visualizar os dados
glimpse(geomorfologia)
#Estatistica descritiva
geomorfologia |>
  group_by(sup, solo) |>
  summarise(
    N = n(),
    MEDIA = mean(amg),
    DP = sd(amg),
    EPM = DP/sqrt(N),
    CV = 100*DP/MEDIA
  ) |>

  writexl::write_xlsx("R/output/estdesc.xlsx")
# #criar um histograma
# geomorfologia |>
#     ggplot(aes(x=argila,..density..)) +
#     geom_histogram(bins = 8,color="black",
#                                  fill="gray") +
#     facet_wrap(~sup, scale = "free") +
#     theme_classic() +
#     geom_density(color="black",
#                              fill="red",
#                              alpha = 0.05)



# Função para calcular estatísticas descritivas
est_desc <- function(x) {
  n = length(x)
  media = mean(x, na.rm = TRUE)
  dp = sd(x, na.rm = TRUE)
  epm = dp / sqrt(n)
  tibble(
    Estatística = c("N", "Média", "DP", "EPM"),
    Valor = c(n, media, dp, epm)
  )
}

# Estatísticas descritivas por grupo (sup e solo)
estatisticas_grupo <- geomorfologia |>
  group_by(sup, solo) |>
  summarise(
    AMG = list(est_desc(amg)),
    AG = list(est_desc(ag)),
    AM = list(est_desc(am))
  ) |>
  unnest_wider(c(AMG, AG, AM))

# Estatísticas descritivas para todas as variáveis numéricas
estatisticas_gerais <- geomorfologia |>
  summarise(across(
    .cols = amg:v,
    .fns = ~list(est_desc(.x))
  )) |>
  pivot_longer(
    cols = everything(),
    names_to = "Variável",
    values_to = "Estatísticas"
  ) |>
  unnest_wider(Estatísticas)

# Adicionar coluna de estatísticas e reorganizar
estatisticas_gerais <- estatisticas_gerais |>
  add_column(
    Estatística = rep(c("N", "Média", "DP", "EPM"), length(unique(estatisticas_gerais$Variável)))
  ) |>
  relocate(Estatística)

# Salvar em arquivo Excel
writexl::write_xlsx(estatisticas_gerais, "R/output/est_geomorf.xlsx")







#selecionar apenas as linhas da superficie II
geomorfologia |>
  filter(sup=="II") |>
  ggplot(aes(x=ca,y=mg))+
  geom_point()+
  geom_smooth(
    method = "lm",
    se=FALSE
  )
geomorfologia |>
  filter(sup=="II") |>
  select(ca,mg) |>
  cor()

#teste de hipotese

#alternativa pode ser "t","l" ou "g"
ca<-geomorfologia |>
  filter(sup=="II") |>
  pull(ca)

mg<-geomorfologia |>
  filter(sup=="II") |>
  pull(mg)




cor.test(ca,mg,alternative="g")

##Calcular o r para varias variaveis

geomorfologia |>
  select(amg:v) |>
  cor() |>
  round(2)|>
  corrplot::corrplot(
    method = "circle",
    type = "upper",
    addCoef.col = "black"
  )

ggsave("R/plots/correlacao.png")









#coeficiente de correlação linear

#teste t

#nivel de significancia
#teste de hipoteses
#estudar correlaçoes

