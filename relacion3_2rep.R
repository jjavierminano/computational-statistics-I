### INTRODUCTION TO R PROGRAMMING

	## EX 1, aproximating pi using series

leibniz <- function(n){

vector <- 0:n
suma <- sum( ((-1)^vector)/(2*vector+1) )
return(suma)
}
leibniz(100)


	## EX 2

numero <- function(x){

#delete thousands' point
new_str <- gsub("\\.", "",x)

#convert the decimal coma to decimal point
new_str2 <- gsub(",", ".", new_str)
new_str3 <- as.numeric(new_str2)

return(new_str3)
}

numero("1.345,89")

	## EX 3

numero <- function(x){

	if(class(x) != "numeric" & class(x) != "factor" & class(x) != "character"){
	stop("error")
	}else if(class(x) == "numeric"){
	new_str <- x
	}else{
	#delete thousands' point
	new_str <- gsub("\\.", "",x)

	#convert the decimal coma to decimal point
	new_str2 <- gsub(",", ".", new_str)
	new_str3 <- as.numeric(new_str2)
	}

return(new_str3)
}

	## EX 4

set.seed(1)
rowMeans(replicate(3, runif(10, 0, 1)))

	## EX 5

game <- function(nreplicas){

urn <- rep(c("red", "white"), c(7,3))
x <- sample(urn, 1)

	if(x == "white"){ #roll 3 dices nreplicas times

	print("white")
	dice <- t(replicate(nreplicas, sample(1:6,3, replace = TRUE)))
	dicesum <- colSums(dice)
	abs_frequency <- table(dice)
	rel_frequency <- table(dice)/(nreplicas*3)
	results <- list(dice, dicesum, abs_frequency, rel_frequency)

	}else{
	
	print("red")
	normal_data <- rnorm(nreplicas, 4, 3.2)
	normal_data_sorted <- sort(normal_data)
	quantiles <- quantile(normal_data)
	mean <- mean(normal_data)
	sd <- sd(normal_data)
	results <- list(normal_data, normal_data_sorted, quantiles, mean, sd)

	}

return(results)
}

game(10)




















































































