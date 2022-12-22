#Repeticion de la relacion 1.

	## Ejercicio 1

c(1,2,3,4,5)
seq(1,5,1)
1:5

	## Ejercicio 2

c(1,3,5,7)
seq(1,7,2)

	## Ejercicio 3

 #a)
8:5
seq(8,5,-1)

 #b)
example(rep)
rep(c(3,2), c(7,2))

 #c)
seq(1, 4, 0.75)

	## Ejercicio 4

chicas <- c("ana", "maria", "laura")


	## Ejercicio 5

x <- c(2,-5, 4, 6,-2, 8)

x[x>0]

x[x<0]

x[2:length(x)]

indice1<- seq(1, length(x), 2)
x[indice1]

indice2 <- seq(2, length(x), 2)
indice2
x[indice2 & x>0]

	## Ejercicio 6

seis <- c(3, log(-15), 5)
is.nan(seis)
seis[!is.nan(seis)]

	## Ejercicio 7
#es una tonteria

	## Ejercicio 8

v <- 1:6
matrix(v, nrow = 2, ncol = 3)

matrix(v, nrow = 3)

matrix(v, nrow =2, byrow = T)

matrix(v, nrow = 3, ncol = 3)


	## Ejercicio 9

matrix(1:6,nrow=2)
matrix(1:6,nrow=4)
matrix(1:6,nrow=4,ncol=4)

	## Ejercicio 10

v <- c(2,1,3,4)
A <- matrix(v, nrow = 2)
B <- matrix(c(3,8), nrow = 2)

A%*%B
outer(A,B)

	## Ejercicio 12

v <- c(0,0,0,0,0,0)
matrix(v, nrow = 2)

	## Ejercicio 13

help(rep)
v <- rep(1:3, each = 10)
matrix(v, nrow = 3, byrow = T)

 #vamos a hacerlo con rbind

v1 <- rep(1, 10)
v2 <- rep(2, 10)
v3 <- rep(3, 10)

rbind(v1, v2, v3)

v1p <- c(1,2,3)
replicate(10, v1p)

v4 <- c(1,2,3,2,3,1,3,1,2)
m<- matrix(v4, nrow = 3)
cbind(m,m,m)

	## Ejercicio 14

coches <- c(5, 7, 13, 4, 1, 7, 14, 3, 11)
M <- matrix(coches,nrow = 3, dimnames = list(c("Blanco", "Negro", "Rojo"),c("Toyota", "Audi", "Nissan")))

 #a)
Azul <- c(8, 5, 7)
M <- rbind(M, Azul)

 #b)
Hyundai <- c(2,7,3,5)
M <- cbind(M, Hyundai)
M
 #c) 
M[c("Negro", "Rojo"), ]

 #d)
M[, c("Toyota", "Hyundai")]

 #e)
M[c("Azul"), c("Toyota", "Hyundai")]

 #f)
Kia <- 7:10
M <- cbind(M, Kia)

 #g)
Verde <- 3:7
M <- rbind(M, Verde)

 #h)
M[c("Azul", "Rojo"), c("Toyota", "Audi")]

 #i)
M <- M[, -which(colnames(M) == "Toyota")]
M

 #j)

M <- M[-which(rownames(M) == "Verde"), ]
M






















