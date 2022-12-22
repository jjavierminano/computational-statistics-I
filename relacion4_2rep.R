#RELACION 4.2 REPETIDA

	# Ejercicio 1

library("Lock5withR")
data <- HappyPlanetIndex
head(data)
attach(data)

 # a)
help(plot)
plot(Happiness, LifeExpectancy,col = c("#0000ff", "red"))
legend("topleft", col = c("blue", "red"), 
		legend = c("Felicidad", "Esp. Vida"), pch = c(1,1))
title(main = "diagrama de dispersion")
reg <- lm(LifeExpectancy ~ Happiness)
abline(reg, col = "purple")

 # b)
hist(data$Happiness, main = "Histograma Felicidad", col = "#69cece",
        prob = TRUE) #al poner prob = T permitimos que despues aparezca el density
lines(density(data$Happiness), col = "red", lwd = 2)

 # c)
barplot(table(data$Region))


 # d)






















