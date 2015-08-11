
* The p prefix returns the cumulative probability. 
* The q prefix returns the quantile of.

##The number of people showing up at a bus stop is assumed to be Poisson with a 
##mean of 5 people per hour. You watch the bus stop for 3 hours. About what's 
##the probability of viewing 10 or fewer people?

For Poisson, lambda = the mean, so lambda over three hours is 3 x mean = 15. 
Lower tail = true is the default. Use lower tail = FALSE to find 10 or more
people.

ppois(10, lambda=15)

##Brain volume for adult women is normally distributed with a mean of about 
##1,100 cc for women with a standard deviation of 75 cc. What brain volume 
##represents the 95th percentile?

qnorm(0.95, mean = 1100, sd = 75)

##Refer to the previous question. Brain volume for adult women is about 
##1,100 cc for women with a standard deviation of 75 cc. Consider the sample 
##mean of 100 random adult women from this population. What is the 95th 
##percentile of the distribution of that sample mean?

The sample standard deviation is equal to the population std/sqrt of the number
of samples. In this case its 75/sqrt(100)

qnorm(0.95, mean = 1100, sd = 7.5)

##You flip a fair coin 5 times, about what's the probability of getting 4 or 5 heads?

The total number of probabilities here is equal to the number of outcomes of a 
single flip (2) to the power of the number of flips (5) = 32. We know that the 
likelihood of 5 heads in a row is 1 in 32. To calculate the number of permutations
of four heads in five flips, it is easier to calculate the number of ways you
can arrange 1 tail in 5 flips = 5. Now we have 1 in 32 and 5 in 32. 6/32 
expressed as a probability is 6/.32 = 18.75.

##The respiratory disturbance index (RDI), a measure of sleep disturbance, for a
##specific population has a mean of 15 (sleep events per hour) and a standard 
##deviation of 10. They are not normally distributed. Give your best estimate of
##the probability that a sample mean RDI of 100 people is between 14 and 16 
##events per hour?

According to the Central Limit Theorum, the distribution of the mean of samples
taken from a non-normal distribution becomes normally distributed. We also know
that the standard deviation of a sample is equal to the population std/sqrt of 
the number of samples. In this case its 10/sqrt(100) = 1, meaning that 14 and 16
fall within 2 standard deviations of the mean. The empirical rule tells us that 
for a normal distribution, this equals 68%.

##Suppose that diastolic blood pressures (DBPs) for men aged 35-44 are normally 
##distributed with a mean of 80 (mm Hg) and a standard deviation of 10. About 
##what is the probability that a random 35-44 year old has a DBP less than 70?

The emprical rule tells us that 68% falls within the first standard deviation
either side of the mean. If we want to find out what falls to the left of this 
only, we must subtract 68 from 100 and divide by two. 

##What is the variance of the distribution of the average an IID draw of n 
##observations from a population with mean ?? and variance ??2.

The variance of a sample distribution is equal to the population variance
divided by the number of observations.

##Consider a standard uniform density. The mean for this density is .5 and the 
##variance is 1 / 12. You sample 1,000 observations from this distribution and 
##take the sample mean, what value would you expect it to be near?

A uniform density is a square distribution. The mean of the sample is equal to 
the mean of the population.