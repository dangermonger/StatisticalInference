##-------------------------------Question 1-------------------------------------
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

##-------------------------------Question 2-------------------------------------

##A 95% confidence interval has two tails and since we're interested in the 
##upper end we'll need to input the 0.975 quantile with the lower.tail=FALSE.
##The degrees of freedom (df) for the t-distribution is equal to the sample size
##minus 1.

##The t-value is like the z score from above except that it is used for small
##sample sizes and the t-distribution has taller tails. Taking the mean of the 
##sample from a random variable again centres the distribution at zero and the 
##result is divided by the sample standard deviation or the standard error of 
##the mean, expressed as sd/sqrt(n).

##standard deviation (population) = SD
##SD/sqrt(samplesize) = standard error of the mean = sample SD = SE 
##observation - mean of obs = meandiff
##sample observation - mean of sample obs = samplemeandiff
##(a/b = c/d) = (d/c = b/a)
##(a/b = c/d) = (a = b(c/d))

##z-score = meandiff/SD
##t-value = samplemeandiff/SE
##SE = samplemeandiff/t-value
##SD = sqrt(samplesize)*(samplemeandiff)/t-value

samplesize = 9
samplemeandiff = -2

tvalue <- qt(0.975, df=(samplesize-1), lower.tail = FALSE) ##critical t-value

standardev = sqrt(samplesize)*(samplemeandiff)/tvalue

##-------------------------------Question 4-------------------------------------

NewSystem <- 3 + (sqrt(0.60) *scale(rnorm(10)))
OldSystem <- 5 + (sqrt(0.68) *scale(rnorm(10)))

t.test(NewSystem, OldSystem) 

##-------------------------------Question 7-------------------------------------

Treated <- -3 + (1.5 *scale(rnorm(9)))
Placebo <- 1 + (1.8 *scale(rnorm(9)))

t.test(Treated, Placebo, conf.level = 0.90) 

##----------------------------------END-----------------------------------------
