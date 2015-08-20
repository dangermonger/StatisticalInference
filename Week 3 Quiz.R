##-------------------------------Question 1-------------------------------------

##In a population of interest, a sample of 9 men yielded a sample average brain 
##volume of 1,100cc and a standard deviation of 30cc. What is a 95% Student's 
##T confidence interval for the mean brain volume in this new population?

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

[1077,1123]

##-------------------------------Question 2-------------------------------------

##A diet pill is given to 9 subjects over six weeks. The average difference in 
##weight (follow up - baseline) is -2 pounds. What would the standard deviation 
##of the difference in weight have to be for the upper endpoint of the 95% 
##T confidence interval to touch 0?

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

2.60

##-------------------------------Question 3-------------------------------------

##In an effort to improve running performance, 5 runners were either given a 
##protein supplement or placebo. Then, after a suitable washout period, they 
##were given the opposite treatment. Their mile times were recorded under both 
##the treatment and placebo, yielding 10 measurements with 2 per subject. The 
##researchers intend to use a T test and interval to investigate the treatment. 
##Should they use a paired or independent group T test and interval?

A paired interval

##If you collect two measurements for each person, then each pair of 
##observations is closely related. A before and after experiment of the same 
##individuals produces a set of paired observations.

##A before and after test of two random samples would require an independent 
##group t-test since each group is independent.

##-------------------------------Question 4-------------------------------------

##In a study of emergency room waiting times, investigators consider a new and 
##the standard triage systems. To test the systems, administrators selected 20 
##nights and randomly assigned the new triage system to be used on 10 nights and
##the standard system on the remaining 10 nights. They calculated the nightly 
##median waiting time (MWT) to see a physician. The average MWT for the new 
##system was 3 hours with a variance of 0.60 while the average MWT for the old 
##system was 5 hours with a variance of 0.68. Consider the 95% confidence 
##interval estimate for the differences of the mean MWT associated with the new 
##system. Assume a constant variance. What is the interval? Subtract in this 
##order (New System - Old System).

NewSystem <- 3 + (sqrt(0.60) *scale(rnorm(10)))
OldSystem <- 5 + (sqrt(0.68) *scale(rnorm(10)))

t.test(NewSystem, OldSystem) 

[-2.75, -1.25]

##-------------------------------Question 5-------------------------------------

##Suppose that you create a 95% T confidence interval. You then create a 90% 
##interval using the same data. What can be said about the 90% interval with 
##respect to the 95% interval?

The interval will be narrower.

##Confidence interval distributions have two tails so a 95% confidence interval 
##must be wider than a 90% interval.

##-------------------------------Question 6-------------------------------------

##To further test the hospital triage system, administrators selected 200 nights
##and randomly assigned a new triage system to be used on 100 nights and a 
##standard system on the remaining 100 nights. They calculated the nightly 
##median waiting time (MWT) to see a physician. The average MWT for the new 
##system was 4 hours with a standard deviation of 0.5 hours while the average 
##MWT for the old system was 6 hours with a standard deviation of 2 hours. 
##Consider the hypothesis of a decrease in the mean MWT associated with the new 
##treatment. What does the 95% independent group confidence interval with 
##unequal variances suggest vis a vis this hypothesis? (Because there's so many 
##observations per group, just use the Z quantile instead of the T.)


NewSystem <- 4 + (0.5 *scale(rnorm(100)))
OldSystem <- 6 + (2 *scale(rnorm(100)))

t.test(OldSystem, NewSystem) 

When subtracting (old - new) the interval is entirely above zero. The new system
appears to be effective.

##-------------------------------Question 7-------------------------------------

##Suppose that 18 obese subjects were randomized, 9 each, to a new diet pill and
##a placebo. Subjects' body mass indices (BMIs) were measured at a baseline and 
##again after having received the treatment or placebo for four weeks. The 
##average difference from follow-up to the baseline (followup - baseline) was 
##???3 kg/m2 for the treated group and 1 kg/m2 for the placebo group. The 
##corresponding standard deviations of the differences was 1.5 kg/m2 for the 
##treatment group and 1.8 kg/m2 for the placebo group. Does the change in BMI 
##over the four week period appear to differ between the treated and placebo 
##groups? Assuming normality of the underlying data and a common population 
##variance, calculate the relevant *90%* t confidence interval. Subtract in the 
##order of (Treated - Placebo) with the smaller (more negative) number first.

Treated <- -3 + (1.5 *scale(rnorm(9)))
Placebo <- 1 + (1.8 *scale(rnorm(9)))

t.test(Treated, Placebo, conf.level = 0.90) 

[-5.364, -2.636]
##----------------------------------END-----------------------------------------
