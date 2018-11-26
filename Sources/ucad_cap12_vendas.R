# Le o arquivo CSV e o joga em uma variável (Dataset)
dispatch <- read.csv("../Data/AnaliseVendas_cap12.csv", header=TRUE)
articleHitsComments <- read.csv("../Data/ucad_cap12_artigoCliqueComenta.csv", header=TRUE)

# Demonstra os registros do arquivo CSV 
head(dispatch)
head(articleHitsComments)

# Exibe o gráfico de Dispersão
plot(Sales~jitter(Article.count), data=dispatch,
     xlab = "Quantidade Vendida",
     ylab = "Vendas",
     main = "Gráfico de Dispersão: Vendas X Quantidade")


# Carrega a biblioteca lattice para ser utilizado na plotagem abaixo
library(lattice)

# Essa disposição de gráficos de dispersão mostra os cliques e comentários de cada artigo, agrupados por autor
xyplot(webHits ~ commentCount | authorName, data = articleHitsComments)
