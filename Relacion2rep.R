#Repetición relacion 2.

	## Ejercicio 1

coches <- c(5, 7, 13, 4, 1, 7, 14, 3, 11)
M <- matrix(coches, nrow = 3, dimnames =  list(c("Blanco", "Negro", "Rojo"), c("Toyota", "Audi", "Nissan")))
M
data <- data.frame(M)

 #a)
data["Azul", ] <- c(8,5,7)

 #b)
data[, "Hyundai"] <- c(2,7,3,5)

 #c)
data[c("Rojo", "Negro"), c("Toyota", "Nissan")]

 #d)
data[, c("Toyota", "Audi")]

 #f)
data[, "Kia"] <- c(7, 1, 9, 12)

 #g)
data["Verde", ] <- c(4, 5, 2, 1, 0)

 #i)
data[, -which(colnames(data) == "Kia")]

 #j)
data[-which(rownames(data) == "Azul"), ]


	## Ejercicio 2

 #a)
nombre <- c("Tor", "Linda", "Ato", "Kira", "Dragon", "Kimba")
edad <- c(0.5, 2, 4, 0.25, 1, 10)
sexo <- c("M", "H", "M", "H", "M", "H") 

 #b)
sexf <- as.factor(sexo)
levels(sexf) <- c("hembra", "macho")

 #c)
perros <- data.frame(nombre, edad, sexo, sexf)

 #d)
peso <- c(25, 5, 7, 1.5, 6, 39)
perros$peso <- peso

 #e)
perros[nrow(perros)+1, ] <- c("Atila", NA, "H", "hembra", 17)

 #f)
perros$edad <- as.numeric(perros$edad)
edad_humana <- perros$edad*7
perros$edad_humana <- edad_humana
perros

 #k)
perros <- perros[-which(perros$nombre == "Kimba"), ]

 #l)
perros <- na.omit(perros)
perros
 #m)
perros2 <- perros[, c("nombre", "edad", "sexf")]
perros2
perros_macho <- perros2[perros2$sexf == "macho",]
mean(perros_macho$edad)

	## Ejercicio 3

help(read.table)
datos <- read.table("archivo.txt", header = T, sep = ",")
head(datos)

 #a)
str(datos)

 #b)
dim(datos)
nrow(datos)

 #c)
head(datos)

 #d)
tail(datos)

 #e)
datos[sample(nrow(datos), 10),]

 #f)
UK <- datos[datos$country == "United Kingdom",]
nrow(UK)

 #g)

 #h)
datosmios <- datos[datos$country %in% c("Spain", "Mali", "Canada"),]
help(write.table)
write.table(datosmios, "datosmios2.txt", sep = ",")

















