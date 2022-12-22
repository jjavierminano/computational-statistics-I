	### Relacion 3.3

	## Ejercicio 1

# a)
npos <- function(v1, v2){
v1 <- as.matrix(v1)
v2 <- as.matrix(v2)
M <- v1 %*% t(v2)

num_productos <- nrow(M) * ncol(M)
num_positivos <- sum(M>0)

resultados <- list(v1, v2, M, num_productos, num_positivos)
return(resultados)
}

npos(-2:6, 8:-1)


	## Ejercicio 2

progres <- function(a1, a2, n){

if(n < 10){stop("n debe ser mayor o igual a 10")}

sucesion <- c(a1, a2)
i<-3

	while(i<=n){
	
		x <- sample(c(0,1), size=1, prob= c(0.75, 0.25))

		if(x==0){
		
		sucesion[i] <- sucesion[i-1]+ sucesion[i-2]
		
		}else{
		
		sucesion[i] <- 2*(sucesion[i-1]+ sucesion[i-2])
		
		}
	i<-i+1
	}

resultados <- list("10 primeros terminos" = sucesion[1:10], "media" = mean(sucesion), 
			"varianza" = var(sucesion), "termino n" =  sucesion[n])

return(resultados)
}


	## Ejercicio 3

library(haven)
dataset <- read_sav("Empleados.sav")
head(dataset)

 # a)
tipo_salario <- function(salario){

	if(salario<900){
	tipo_de_salario <- as.factor("bajo")
	}else if(salario > 900 & salario<2500){
	tipo_de_salario <- as.factor("medio")
	}else{
	tipo_de_salario <- as.factor("alto")
	}

return(tipo_de_salario)
}

help(sapply)
class(dataset$salario)
dataset$tipo_salario <- sapply(dataset$salario, tipo_salario)

 # b)
dataset$sexo
dataset_mujeres <- dataset[dataset$sexo == "m", ]
dataset_hombres <- dataset[dataset$sexo == "h", ]

 # c)
dim(dataset) #474 filas
474 * 38/100 #180 personas
indice <- sample(1:474, 180, replace = FALSE)

muestra <- dataset[sort(indice), ]
muestra$salario <- mean(dataset$salario)

	## Ejercicio 5
help(read.table)
data <- read.table("monedas.txt", header = TRUE, sep = ",")

juego <- function(arg){

data <- read.table("monedas.txt", header = TRUE, sep = ",")

x <- sample(c("dado", "moneda"), 1)

	if(x == "dado"){
	
	}









}



























































