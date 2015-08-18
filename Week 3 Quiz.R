##The function 'scale' will calculate the mean and standard deviation of the 
##entire vector, then "scale" each element by those values by subtracting
##the mean and dividing by the standard deviation. 

##Subtracting the mean from each element in the vector centres the distribution 
##at zero. Dividing the vector elements by the standard deviation results in a 
##distribution with a standard deviation of 1. A distribution having the 
##qualities N(0,1) is a standard normal distribution. Scaling a vector converts 
##each element into a z-score which tells us how many standard deviations a 
##number is from the mean(0). Z-scores are normal random variables of a standard 
##normal distribution.

##The method below generates 9 standard normally distributed random variables. 
##As the sample size is small, the mean and standard deviation of the 
##distribution will only be approximately standard normal.

##Each element of the list is converted into a z-score, which converts the units
##of the distribution into units of standard deviation, meaning the shape of 
##the distribution is preserved as the distribution is scaled up later. This 
##idealised quantity strips the variation caused by the small sample size. 
##This process (subtraction of the mean and division by standard deviation) is 
##exactly reversed by multiplying by the standard deviation and adding the mean,
##thereby reinstating the dimensions of the distribution by the chosen figures.

##A t-test is finally performed on the populated distribution.

mean = 1100
sd = 30
n = 9

distmake <- mean + (sd *scale(rnorm(n)))

t.test(distmake, conf.level = 0.95) 

