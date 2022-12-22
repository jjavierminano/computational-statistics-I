#RELACION 4.1

	## Ejercicio 1

 # 1)
niños <- read.table("niños.txt", sep = ",")
head(niños)

 # 2)
niños$peso <- niños$peso/2.204
niños$altura <- niños$altura/39.37
head(niños)

 # 3)
sum(niños$sexo == "F") #129 niños
sum(niños$sexo == "M") #121 niños

 # 4)
table(as.integer(niños$edad/12))

 # 5)
help(mean)
head(niños)
mean(niños$edad/12, na.rm = TRUE, trim = 0.10)

 # 6)
quantile(niños$altura)

 # 7)
summary(niños$altura)
sd(niños$altura)

 # 8)
hist(niños$altura)

 # 9)
niñosM <- niños[ niños$sexo == "M",]
niñosF <- niños[ niños$sexo == "F",]

boxplot(niñosM$altura, niñosF$altura)
	#REVISAR


 # 10)
indice <- sample(1:nrow(niños), 50, replace = TRUE)
niños_alea <-  niños[indice, ]
dim(niños_alea)

niños_alea_unique <-unique(niños_alea)
dim(niños_alea_unique)








