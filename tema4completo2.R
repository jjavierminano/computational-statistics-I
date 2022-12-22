#Graficos y análisis estadísticos con R. Parte 1.

	# Ejercicio 1

 # 1.1)
niños <- read.table("niños.txt", header = TRUE, sep = ",")
head(niños)


 # 1.2)
help(round)
niños$altura <- niños$altura/39.37
niños$altura<- round(niños$altura, digits = 2)

niños$peso <- round(niños$peso/2.20462, digits = 2)
head(niños)

 # 1.3)
num_varones <- sum(niños$sexo == "M")
num_varones
num_niñas <- sum(niños$sexo == "F")
num_niñas

 # 1.4)
niños$años <- trunc(niños$edad/12)
table(niños$años)

 # 1.5)
mean(niños$edad, na.rm = T)
help(mean)
mean(niños$edad, trim = 0.15, na.rm = T)

 # 1.6)
quantile(niños$altura)

 # 1.7)
summary(niños$altura)
sd(niños$altura)

 # 1.8)
density(niños$altura)
plot(density(niños$altura), freq = TRUE)
hist(niños$altura, freq = F, main = "Histograma de altura")
lines(density(niños$altura))

 # 1.9)
niños_M <- niños[niños$sexo == "M",]
niños_F <- niños[niños$sexo == "F",]
boxplot(niños_M$altura, niños_F$altura, ylab = "altura", names = c("niños", "niñas"))
mean(niños_M$altura)
mean(niños_F$altura)
max(niños_M$altura)
max(niños_F$altura)


 # 1.10)
indice_alea <- sample(1:nrow(niños),50, replace = T)
niños_alea <- niños[unique(indice_alea), ]

 # plus, linear model
head(niños)
attach(niños)
niños$peso

reg <- lm(niños$peso~niños$altura)
reg
plot(niños$altura, niños$peso)
abline(reg, col = "blue")


#Graficos y análisis estadísticos con R. Parte 2.

	# Ejercicio 1

data <- read.table("happyplanet.txt", header = T, sep = ",")

 # 1.1)
plot(data$Happiness, data$LifeExpectancy, main = "Dispersión")
reg <- lm(data$LifeExpectancy~data$Happiness)
abline(reg, col = "red")

 # 1.2)
hist(data$Happiness, main = "felicidad", prob = TRUE, col = "grey")
densidad <- density(data$Happiness)
lines(densidad, col = "red")
help(lines)
help(abline)
		#abline sirve para los modelos, lines para lo demás.

 # 1.3)
head(data)
table(data$Region)
barplot(table(data$Region), ylim = c(0, 40))
help(barplot)

 # 1.4)
#install.packages("car")
library(car)
happy_f <- recode(data$Happiness, as.factor = TRUE, 
			"2.4:3.5 = 1; 3.51:6 = 2; 6.1:9 = 3")


 # 1.5)
algo<-table(factor(data$Region), happy_f)
algo
barplot(algo, col = rainbow(7), main = "felicidad por regiones",
		beside = TRUE, ylim = c(0,40), 
		legend.text = levels(factor(data$Region)),
		args.legend = list(title = "Regiones", x = "topright",
                         horiz = TRUE),
		xlab = "grupos de felicidad")

 # 1.6)
pie(table(data$Region), col = rainbow(7), main = "regiones")
legend("topleft", horiz = FALSE, col = rainbow(7),
	legend = rownames(table(data$Region)), pch = 1,
	title = "REGIONES")

 # 1.7)
X<-split(data, data$Region)
head(X)
boxplot(X[[1]]$Happiness, X[[2]]$Happiness, X[[3]]$Happiness,
	 X[[4]]$Happiness, X[[5]]$Happiness, X[[6]]$Happiness, X[[7]]$Happiness,
		main = "boxplot de felicidades", col = rainbow(7), ylim = c(0,10),
		names = c("1", "2", "3", "4", "5", "6", "7"))


	## Ejercicio 2

head(quakes)

 # a) b) c) d)
attach(quakes)
densidad <- density(depth)
hist(depth, main = "Histograma de profundidad", prob = TRUE, ylim = c(0, 0.0045),
	ylab = "probabilidad", xlab = "profundidad", col = "blue")
lines(densidad, col = "red")

abline(v = mean(depth), col = "green", lty = "dashed", lwd = 2)
abline(v = mean(depth) + c(-sd(depth), sd(depth)), lty = 3, lwd = 3, col = "orange")
abline(v = median(depth), col = "yellow", lty = 1, lwd = 4)

	## Ejercicio 3

 # a)
vector <- rnorm(500)
 
 # b)
hist(vector, prob = T, main = "histograma del vector normal")

 # c)
abline(v = mean(vector), col = "blue", lty = 1, lwd = 3)
densidad <- density(vector)

 # d)
lines(densidad, col = "red")

 # e)
plot(densidad, col = "red")

 # f)
help(polygon)
# i
plot(densidad, col = "blue", xlim =c(-6,6), ylim = c(0, 0.5), xlab = " ")

# ii
polygon(densidad, col = "green")

# iii
vector2 <- rnorm(500, 1.5, 2)
lines(density(vector2), col = "red")
polygon(density(vector2), col = "blue")

# iv
densidad1 <- density(rnorm(500))
densidad2 <- density(rnorm(500, 1.5, 2))
plot(densidad1, col = "red", xlim = c(-6,6), ylim = c(0, 0.5),
	 main = "densidades", xlab = " ")
polygon(densidad1, col = rgb(0,1,0, alpha = 0.5))
lines(densidad2, col = "red")
polygon(densidad2, col = rgb(0,0,1, alpha = 0.5))

# v)
 #v1
plot(densidad, xlim = c(-5, 5), col = "red", xlab= " ")
polygon(c(0, densidad$x[densidad$x >= 0]),
		c(0, densidad$y[densidad$x >=0]),
		col = rgb(1,0,0, alpha = 0.5),
		border = "red", main = "mayores que 0")
		
 #v2
plot(densidad, xlim = c(-5, 5), col = "red", xlab = " ")
polygon(c(2, densidad$x[densidad$x <=2 & densidad$x >=-2]),
	c(-2, densidad$y[densidad$x <=2 & densidad$x >=-2]),
	col = rgb(1,0,0, alpha = 0.5),
	border = "red", main = "intervalo")


# Regresion lineal e introduccion a la inferencia.

# 1)
cohete <- read.table("cohete.txt", header = TRUE, sep = ",")

# 2)
attach(cohete)
edad <- cohete$edad
plot(x = edad, y = resistencia)

# 3)
reg <- lm(resistencia ~ edad)
abline(reg, col = "red")

# 4) la bondad del ajuste es el coeficiente de determinacion
summary(reg)
summary(reg)$r.squared

# 5)
predict(reg)
residuals(reg)

# 6)
v <- c(4, 7.5, 9.8, 12, 17, 15.5, 22)
predict(reg, data.frame(edad = v))

# 7)
help(confint)
confint(reg, level = 0.95)
confint(reg, level = 0.99)
plot(confint(reg))





















