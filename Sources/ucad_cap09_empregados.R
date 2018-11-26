# Le o arquivo CSV e o joga em uma variável (Dataset)
employees <- read.csv("../Data/ucad_cap09_empregados_R.csv", header=TRUE)

attach(employees)
# Mostra a estatística resumida da coluna Recebido no Dataset
summary(Recebido)

# Demonstra o aumento médio Recebido no Dataset
sd(Recebido)

# Lista a estrutura do Dataset
str(employees)

# Plota o Historgrama
hist(Recebido, breaks = 50, 
     ylab = "Frequência - Num. de Funcionários", 
     xlab = "% Recebido", 
     main = "Histograma de empregados - Frequência X % Recebido")

# Divisão do Histograma em Subconjuntos - Classificando somente para o ano de 2007
hist(Recebido[Ano ==2007], breaks = 50, 
     ylab = "Frequência - Num. de Funcionários", 
     xlab = "% Recebido", 
     main = "Histograma de empregados - Frequência X % Recebido (2007)")

# Divisão do Histograma em Subconjuntos - Classificando somente para o ano de 2008
hist(Recebido[Ano ==2008], breaks = 50, 
     ylab = "Frequência - Num. de Funcionários", 
     xlab = "% Recebido", 
     main = "Histograma de empregados - Frequência X % Recebido (2008)")

# Divisão do Histograma em Subconjuntos - Classificando somente para as Mulheres
hist(Recebido[Sexo == 'F'], breaks = 50, 
     ylab = "Frequência - Num. de Funcionários", 
     xlab = "% Recebido", 
     main = "Histograma de empregados - Frequência X % Recebido (Mulheres)")

# Divisão do Histograma em Subconjuntos - Classificando somente para os Homens
hist(Recebido[Sexo == 'M'], breaks = 50, 
     ylab = "Frequência - Num. de Funcionários", 
     xlab = "% Recebido", 
     main = "Histograma de empregados - Frequência X % Recebido (Homens)")

######

# Divisão do Histograma em Subconjuntos - Classificando somente para os não negocioado
densidade_valor_nao_negociado <- density(Recebido[Negociado == 'FALSO'])

# Nota-se o uso do parâmetro 'probability', que estabelece que os valores do histograma 
#   serão definidos de forma a que a área total das suas barras some 1. 
# Esta alteração é necessária para normalizar os valores, sendo assim, comparáveis com os 
#   gerados pela função 'densidade_valor_nao_negociado' acima.
hist(Recebido[Negociado == 'FALSO'], breaks = 50, 
     ylab = "Frequência - Num. de Funcionários", 
     xlab = "% Recebido", 
     main = "Histograma de empregados - Frequência X % Recebido (Negociado)",
     xlim = range(densidade_valor_nao_negociado$x),
     ylim = c(0, 0.6),
     probability = T,
     col = "blue")

lines(densidade_valor_nao_negociado, lw = 2)

summary(Recebido[Negociado == 'FALSO'])
sd(Recebido[Negociado == 'FALSO'])

######

# Divisão do Histograma em Subconjuntos - Classificando somente para os negocioado
densidade_valor_negociado <- density(Recebido[Negociado == 'VERDADEIRO'])

# Nota-se o uso do parâmetro 'probability', que estabelece que os valores do histograma 
#   serão definidos de forma a que a área total das suas barras some 1. 
# Esta alteração é necessária para normalizar os valores, sendo assim, comparáveis com os 
#   gerados pela função 'densidade_valor_negociado' acima.
hist(Recebido[Negociado == 'VERDADEIRO'], breaks = 50, 
     ylab = "Frequência - Num. de Funcionários", 
     xlab = "% Recebido", 
     main = "Histograma de empregados - Frequência X % Recebido (Negociado)",
     xlim = range(densidade_valor_negociado$x),
     ylim = c(0, 0.6),
     probability = T,
     col = "gray")

lines(densidade_valor_negociado, lw = 2)

summary(Recebido[Negociado == 'VERDADEIRO'])
sd(Recebido[Negociado == 'VERDADEIRO'])

