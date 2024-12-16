##1 - Download
##2 - salvar em data raw
#bibliotecas
library(tidyverse)
library(readxl)
library(writexl)

#carregando os dados
df <- read_xlsx("data-raw/dadosprodmacieira.xlsx")
df
##3 - faxina e salvar como "prodmacieira.rds
df |> as_tibble() |>
    write_rds("data/prodmacieira.rds")

##4   realizar o diagnostico da ANOVA modelo DBC, mod<-aov(y~trat+bloco)

df<-read_rds("data/prodmacieira.rds")
#tribble
df<-read_rds("data/prodmacieira.rds")|>tribble(
df
glimpse(df)
ggplot(df, aes(x=tratamento, y=produtividade))+
  geom_point()
y<-df|> pull(produtividade)
df|>ggploty<-df|> pull(produtividade)
trat<-aov(y~trat+bloco)
summary(mod)

##    y é numerico, trat e bloco sao fatores, normalidade dos residuos
##    homocedasticidade
##    Estudo de outliers




---

glimpse(df)
df |>
  ggplot(
    aes(
      x=bloco,
      y=produtividade,
      color=sup
    ))+
      geom_point()
  
```



#Aplicando um moelo de delineamento inteiramente casualizado
```{r}
y<-dados |> pull(argila)
trat<-dados |> pull(sup) |>as_factor()
trat
```

##Criar modelo para ánalise
```{r}
mod<-aov(yt~trat)
mod

```


##Estrutura do objeto mod
```{r}
str(mod)

```
##Extraindo os residuos do modelo

```{r}
rs<-rstudent(mod)
rs
```

##Extraindo os preditos pelo modelo
```{r}
yp<-predict(mod)
yp

```

## Começar o diagnostico construindo um arquivo cm sup,y,yp,rs
```{r}
diagnostico<-tibble(
  trat,
  yt,
  yp,
  rs
)
diagnostico
```

```{r}

#Normalidade dos residuos

diagnostico |> 
  ggplot(
    aes(
      x=rs
    )
  ) +
  geom_histogram(
    bins=10,
    color="black",
    fill="gray30"
    )+
      theme_bw()

```


```{r}

#QQplot
diagnostico |> 
  ggplot(
    aes(
      sample=rs
    )
  )+
  stat_qq()+
  stat_qq_line(
    color="blue"
  )
```

```{r}

diagnostico |>
  ggplot(aes(sample = rs)) +
  stat_qq() +
  stat_qq_line(color = "blue") +
  facet_wrap(~ trat) +
  theme_bw()

```

```{r}

library(plotly)

# Calcular quantis teóricos e empíricos
qq_data <- qqnorm(diagnostico$rs, plot.it = FALSE)
# Suponha que 'trat' seja um fator indicando grupos
# Converta em numérico apenas para ilustrar no 3D
group_numeric <- as.numeric(diagnostico$trat)

plot_ly(
  x = ~qq_data$x,
  y = ~qq_data$y,
  z = ~group_numeric,
  type = 'scatter3d',
  mode = 'markers'
) %>%
  layout(
    scene = list(
      xaxis = list(title = "Quantis Teóricos"),
      yaxis = list(title = "Quantis Empíricos"),
      zaxis = list(title = "Grupo")
    )
  )
```

```{r}
# install.packages("nortest")
#Aplicando os testes de normalidade
shapiro.test(rs)#nao rejeitamos H0
nortest::lillie.test(rs)#nao rejeitamos H0
nortest::cvm.test(rs)#nao rejeitamos H0
```

```{r}
# Conclusão
## Os resíduos seguem uma distribuição NORMAL
##Gráfico dos 5 números ou Boxplot

diagnostico |> 
  ggplot(aes(
    x=trat,
    y=yt,
    fill=trat,
  )
  )+
    geom_boxplot()


###############################
diagnostico |> 
  ggplot(aes(
    x=trat,
    y=y,
    fill=trat,
  )
  )+
    geom_boxplot()

#
  
diagnostico |>
  ggplot(aes(x = trat, y = y, fill = trat)) +
  # Gráfico de violino com ajuste na largura
  geom_violin(trim = FALSE, alpha = 0.7, scale = "width") +
  
  # Adicionar pontos individuais com jitter para visualizar a distribuição
  geom_jitter(width = 0.1, alpha = 0.5, size = 1.5, color = "black") +
  
  # Adicionar a mediana de forma destacada
  stat_summary(fun = median, geom = "crossbar", 
               width = 0.3, color = "white", 
               fatten = 2, linetype = "solid") +
  
  # Ajuste de escala de cor (ex: viridis - requer library(viridis) ou scale_fill_viridis_c)
  scale_fill_brewer(palette = "Pastel1") +
  
  # Título e rótulos
  labs(title = "Distribuição por Tratamento", 
       x = "Tratamento", 
       y = "Resposta",
       fill = "Tratamento") +
  
  # Tema minimalista
  theme_minimal(base_size = 14) +
  theme(
    legend.position = "top",
    plot.title = element_text(hjust = 0.5, face = "bold")
  )




#####################

diagnostico |>
  ggplot(aes(x = trat, y = yt, fill = trat)) +
  # Gráfico de violino com ajuste na largura
  geom_violin(trim = FALSE, alpha = 0.7, scale = "width") +
  
  # Adicionar pontos individuais com jitter para visualizar a distribuição
  geom_jitter(width = 0.1, alpha = 0.5, size = 1.5, color = "black") +
  
  # Adicionar a mediana de forma destacada
  stat_summary(fun = median, geom = "crossbar", 
               width = 0.3, color = "white", 
               fatten = 2, linetype = "solid") +
  
  # Ajuste de escala de cor (ex: viridis - requer library(viridis) ou scale_fill_viridis_c)
  scale_fill_brewer(palette = "Pastel1") +
  
  # Título e rótulos
  labs(title = "Distribuição por Tratamento", 
       x = "Tratamento", 
       y = "Resposta",
       fill = "Tratamento") +
  
  # Tema minimalista
  theme_minimal(base_size = 14) +
  theme(
    legend.position = "top",
    plot.title = element_text(hjust = 0.5, face = "bold")
  )


```


```{r}

#Teste de homocedasticidade
#Teste de Levene
lawstat::levene.test(y,trat)


#Bartlett
bartlett.test(y,trat)



```

```{r}

##estudar a regularidade
##calcular media e variancia dos valores de y em funçao dos trat
diagnostico |> 
  group_by(trat) |> 
  summarise(
    log_media=log(mean(y)),
    log_variancia=log(var(y))
  ) |> 
  ggplot(
    aes(
      x=log_media,
      y=log_variancia
      )
    )+
  geom_point()+
  geom_smooth(
    method = "lm",
              se=FALSE
    )

#Análise de regressão
modelo_linear<-lm(log_variancia~log_media,
                  data=diagnostico |> 
                    group_by(trat) |> 
                    summarise(
                      log_media=log(mean(y)),
                      log_variancia=log(var(y))
                      )
)
```

```{r}
#transformação Box and Cox

box_cox<-MASS::boxcox(mod)
box_cox |> as_data_frame() |> 
  arrange(desc(y)) |>
  slice(1) |> 
  pull(x) 


lambda<-box_cox |> 
  as.data.frame() |> 
  arrange(desc(y)) |> 
  slice(1) |> 
  pull(x) 

yt<-y^lambda

```


```{r}
#Estudo de outliers
mod<-aov(y~trat)
rs<-rstudent(mod)
yp<-predict(mod)
diagnostico<-tibble(trat,y,yp,rs) |> 
  ggplot(
    aes(
      x=trat,
      y=log_variancia
      )
    )+
  geom_point()+
  geom_smooth(
    method = "lm",
              se=FALSE
    )
# Estudo de outliers
mod <- aov(y ~ trat)
rs <- rstudent(mod)
yp <- predict(mod)

# Criando o tibble e o gráfico
diagnostico <- tibble(trat, y, yp, rs) |> 
  ggplot(aes(x = yp, y = rs)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)


diagnostico




```


```{r}ggplot_gtable(data)

```

