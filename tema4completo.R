#Relación 1 - Ejercicio 1
niños <- read.table("niños.txt", head = TRUE, sep = ",")
View(niños)
niños$peso <- round(niños$peso * 0.453592, 2)
niños$altura <- round(niños$altura * 0.0254, 2)
sum(niños$sexo == "M")
sum(niños$sexo == "F")
niños$edad <- trunc(niños$edad / 12)
table(niños$edad)
mean(niños$edad, na.rm = TRUE)
mean(niños$edad, trim = 0.3, na.rm = TRUE)

quantile(niños$altura)
summary(niños$altura)
sort(table(niños$altura), decreasing = TRUE)
sd(niños$altura)

plot(niños$altura)
hist(niños$altura)

par(mfrow = c(1,2))
boxplot(niños[which(niños$sexo == "M"),]$altura, main = "niños", ylab = "altura")
boxplot(niños[which(niños$sexo == "F"),]$altura, main = "niños", ylab = "altura")

muestra <- niños[sample(1:nrow(niños), 50, replace = TRUE),]
muestra <- muestra[!duplicated(muestra),]
nrow(muestra)


#Relación 2 - Ejercicio 1
data <- read.table("HappyPlanet.txt", head = TRUE, sep = ",")
View(data)
plot(data$Happiness, data$LifeExpectancy, col = c("#0000ff", "red"))
legend("topleft", col = c("blue", "red"),
        legend = c("Felicidad", "Espereza de vida"), pch = c(1,1))
title(main="Diagrama de dispersión")
reg<-lm(data$LifeExpectancy ~ data$Happiness, data = data)
abline(reg, col="purple")

hist(data$Happiness, main = "Histograma Felicidad", col = "#69cece",
        prob = TRUE)
lines(density(data$Happiness), col = "red", lwd = 2)

plot(x = factor(data$Region), main = "Gráfico de Región",
        xlab = "Tipo", ylab = "Frecuencia", ylim = c(0, 35))
barplot(table(data$Region))

library(car)
happy_f <- recode(data$Happiness, as.factor = TRUE,
        "2.4:3.5=1; 3.51:6=2; 6.1:9=3")
algo<-table(factor(data$Region), happy_f)
barplot(algo, col = rainbow(7), main = "Felicidad por regiones",
        ylim = c(0,30), beside = TRUE,
        legend.text = levels(factor(data$Region)),
        args.legend = list(title = "Regiones", x = "topright",
                         horiz = TRUE),
        xlab = "Grupos de felcicidad")

pie(table(data$Region), col = rainbow(7), main = "REGIONES")
legend("topleft", horiz = TRUE, col = rainbow(7),
        legend = rownames(table(data$Region)), pch = 8,
        title = "Regiones")


rownames(table(data$Region))

#Ejercicio 2
View(quakes)
attach(quakes)
par(mfrow = c(1,1))
hist(depth, col = "#a7e6e6", main = "Histograma sobre la profundidad", xlab = "Profundidad", ylab = "Frecuencia", prob = TRUE)
lines(density(depth), col = "red", lwd = 2)
abline(v =c(mean(depth), median(depth)), col = c("red","brown"), lwd = c(2,2), lty = c(2,2))
legend("topright", col = c("red","brown"), legend = c("Media", "Mediana"), lwd = 2, bty = "n" )
mtext(c("Desviacion tipica", sd(depth)), side = c(3, 3), adj = c(0.8, 1))

#Ejercicio 3
a <- rnorm(500)
hist(a, prob = TRUE)
densidad <- density(a)
lines(densidad, col = "red", lwd = 2)
plot(densidad, col = "red", lwd = 2)
plot(densidad, xlab = " ", col = "blue", xlim = c(-5, 5), ylim = c(0, 0.5), lwd = 2)
col1 <- rgb(0.1, 0.7, 0.2, 0.3)
polygon(c(min(densidad$x), densidad$x), c(0, densidad$y), col = col1)
b <- rnorm(500, 1.5, 2)
lines(density(b), col = "black", lwd = 2)
col2 <- rgb(0, 0, 1, 0.3)
polygon(c(min(density(b)$x), density(b)$x), c(0, density(b)$y), col = col2)


x <- rnorm(500)
plot(density(x), xlab = " ", col = "blue", xlim = c(-5, 5),
     ylim = c(0, 0.5), lwd = 2, main = "representacion", ylab = "Densidad")
abline(v=0, col = "blue")
polygon(c(0,density(x)$x[density(x)$x>0]),
        c(0,density(x)$y[density(x)$x>0]),
        col = rgb(0.2,0.5,0.5,0.1), lwd= 2)
abline(v=c(-2,2), col = c("#6c6c97", "#67679e"))
polygon(c(-2,density(x)$x[density(x)$x>-2 & density(x)$x<2],2),
        c(0,density(x)$y[density(x)$x>-2 & density(x)$x<2],0),
        col = rgb(0.5,0.2,0.5,0.1), lwd= 2)
inf <- mean(x)-sd(x)
sup <- mean(x)+sd(x)
polygon(c(inf,density(x)$x[density(x)$x>inf & density(x)$x<sup],sup),
        c(0,density(x)$y[density(x)$x>inf & density(x)$x<sup],0),
        col = rgb(0.2,0.5,0.2,0.1), lwd = 2)
abline(v = c(inf, sup))


#Relación Regresión
#Ejercicio 1

cohete <- read.table("cohete.txt", header = TRUE, sep =",")
View(cohete)
attach(cohete)
plot(resistencia~edad)
reg <- lm(resistencia~edad, cohete)
reg
abline(reg, col = "violet")
summary(reg)$adj.r.squared
#Esta bien
predict(reg)
residuals(reg)
predict(reg, data.frame(edad = c(4,7.5,9.8,12,17,15.5,22)))
confint(reg, level = 0.95, parm = "edad")
confint(reg, level = 0.99, parm = "edad")
