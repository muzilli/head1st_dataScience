# Le o arquivo CSV e o joga em uma variável (Dataset)
employees <- read.csv("../Data/ucad_cap10_empregados.csv", header=TRUE)

# Demonstra os 30 primeiros registros do arquivo CSV 
head(employees,n=30)

# Exibe o gráfico de Dispersão
plot(employees$requested[employees$negotiated==TRUE],
     employees$received[employees$negotiated==TRUE],
     xlab = "Solicitado",
     ylab = "Recebido",
     main = "Gráfico de Dispersão: Recebido X Solicitado")

# Regressão Linear - lm
# y = a + (b * x), onde a = intercepção e b = inclinação
#   y = Aumento Recebido
#   x = Aumento Solicitado
# Inclinação da Linha = coeficiente de correlação multiplicado pelo desvio padrão de y, 
#   dividido pelo desvio padrão de x
#   Fórmula = Valor Dependente (Y) ~ Valor Independente (X)
myLm <- lm(employees$received[employees$negotiated==TRUE] ~ employees$requested[employees$negotiated==TRUE],
           data = employees)
coeficiente                  <- myLm$coefficients
vlr_estimado_nas_observacoes <- myLm$fitted.values

summary(myLm)

# RMS
summary(myLm)$sigma

# Desenha a linha da Regressão Linear no gráfico
lines(employees$requested[employees$negotiated==TRUE], vlr_estimado_nas_observacoes, lwd = 5)

# Calcula o Coeficiente de Correlação dos dados
cor_correlacao <- cor(employees$requested[employees$negotiated==TRUE],
                      employees$received[employees$negotiated==TRUE])

# Valor possivel de um aumento esperado
#   my_raise = Valor (em %) solicitado
my_raise <- 5
vlr_intercept  <- coeficiente["(Intercept)"] 
vlr_inclinacao <- coeficiente["employees$requested[employees$negotiated == TRUE]"] 

vlr_perc_possivel_aumento <- vlr_intercept + vlr_inclinacao * my_raise
print (vlr_perc_possivel_aumento)


# Novas Linhas de Regressão
myLmBig <- lm(employees$received[employees$negotiated==TRUE & employees$requested > 10] ~ 
                employees$requested[employees$negotiated==TRUE & employees$requested > 10],
           data = employees)

myLmSmall <- lm(employees$received[employees$negotiated==TRUE & employees$requested <= 10] ~ 
                employees$requested[employees$negotiated==TRUE & employees$requested <= 10],
              data = employees)

# Inclinação e o ponto de interceptação das novas linhas de regressão acima
summary(myLmSmall)$coefficients
summary(myLmBig)$coefficients

# RMS 
summary(myLmSmall)$sigma
summary(myLmBig)$sigma
