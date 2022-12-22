#RELACION 3.1 REPETIDA

	## Exercise 1

help(runif)

general <- function(a, b){

	if(b <= a) { stop("b must be bigger than a")}

x <- a #entrar al bucle
iteraciones <- 0
vector_resultados <- c()

	while( x<((b+a)/2) ){
	iteraciones <- iteraciones + 1
	x <- runif(1,a,b)
	vector_resultados[iteraciones] <- x
	}

lista_return <- list("iteraciones" = iteraciones, vector_resultados[1:length(vector_resultados)-1])
return(lista_return)

}

general(0,10)


	## Exercise 2

dice <- function(n){

roll_dice <- sample(1:6, n, replace = TRUE)
number_even_number <- sum(roll_dice%%2 == 0)
transformed_roll <- roll_dice
percentage_odd <- sum(roll_dice%%2 == 1)/n * 100

	if(number_even_number > n/2){
	transformed_roll[which(transformed_roll%%2 == 0)] <- mean(roll_dice)
	}else{
	transformed_roll[which(transformed_roll%%2 == 1)] <- percentage_odd

	}

list1 <- list("roll" = roll_dice,"n even numbers"= number_even_number,
"% odd numbers" = percentage_odd, "transformed roll" = transformed_roll)

return(list1)
}

dice(10)

	## Exercise 3

library(ISwR)
data <- juul

 #a.1) Express sex as factor
data$sex <- as.factor(data$sex)
levels(data$sex) <- c("M", "F")

 #a.2)Express menarche as factor
data$menarche <- as.factor(data$menarche)
levels(data$menarche) <- c("No", "Si")

 #a.3) Express tanner as factor
data$tanner <- as.factor(data$tanner)
levels(data$tanner) <- c("I", "II", "III", "IV", "V")

 #b) truncate age

help(trunc)
age2 <- trunc(data$age)
table(age2)

 #c) descriptive analysis
summary(data)












