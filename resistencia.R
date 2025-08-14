# Carregue o pacote
library(est031)

# Liste os datasets disponíveis no pacote
data(package = "est031")

# Carregue o dataset desejado
data(resistencia, package = "est031")

resistencia <- unlist(resistencia)
resistencia <- as.numeric(resistencia)

# Defina os intervalos desejados
intervalos <- seq(75, 250, by = 25)

# Classifique os dados nos intervalos
resistencia_classes <- cut(resistencia, breaks = intervalos, right = FALSE)

# Frequência absoluta
f <- table(resistencia_classes)

# Frequência relativa
p <- prop.table(f)

# Monte a tabela final
tabela_freq <- data.frame(
    Intervalo = names(f),
    Frequencia_Absoluta = as.vector(f),
    Frequencia_Relativa = round(as.vector(p), 4)
)

print(tabela_freq)

# Plotar histograma com densidade no eixo y
hist(
  resistencia,
  breaks = intervalos,
  right = FALSE,
  freq = FALSE, # Mostra densidade no eixo y
  main = "Histograma da Resistência (Densidade)",
  xlab = "Resistência",
  ylab = "Densidade",
  col = "skyblue",
  border = "black"
)

# Calcular a função de distribuição acumulada empírica
fda_empirica <- ecdf(resistencia)

# Plotar a FDAE
plot(
  fda_empirica,
  main = "Função de Distribuição Acumulada Empírica",
  xlab = "Resistência",
  ylab = "F(x)",
  col = "blue",
  lwd = 0.01
)