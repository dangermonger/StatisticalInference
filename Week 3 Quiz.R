##The function 'scale' will calculate the mean and standard deviation of the 
##entire vector, then "scale" each element by those values by subtracting
##the mean and dividing by the standard deviation. 

##Subtracting the mean from each element in the vector centres the distribution 
##at zero. Dividing the vector elements by the standard deviation results in a 
##distribution with a standard deviation of 1. A distribution having the 
##qualities N(0,1) is a standard normal distribution. Scaling a vector converts 
##each element into a z-score which tells us how many standard deviations a 
##number is from the mean.

##The method below generates 9 normally distributed random variables.The list is
##converted into a z-score, which tells us how far from mean(0) each element is.
##

set.seed(1)

y <- 1100 + (30 *scale(rnorm(9)))


rnorm2 <- function(samplenumber,mean,sd) {mean+sd*scale(rnorm(samplenumber)) }
x <- rnorm2(9,1100,30)

t.test(x, conf.level = 0.95) 
  
y <- 1100 + (30 *scale(rnorm(9)))

yx <- 1100 + 30 *scale(rnorm(9))

pop <- scale(rnorm(3))

scale(rnorm(3))


y <- rnorm(3)
y
mean(y)
sd(y)

xy <- y - mean(y)
xyz <- xy/sd(y)