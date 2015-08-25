##-------------------------------Question 1-------------------------------------
##A pharmaceutical company is interested in testing a potential blood pressure 
##lowering medication. Their first examination considers only subjects that 
##received the medication at baseline then two weeks later. The data are as 
##follows (SBP in mmHg)

Subject  Baseline	Week 2
1	140	132
2	138	135
3	150	151
4	148	146
5	135	130

##Consider testing the hypothesis that there was a mean reduction in blood 
##pressure? Give the P-value for the associated two sided T test.

Baseline	<- c(140,138,150,148,135)
Week2 <- c(132,135,151,146,130)

t.test(Baseline, Week2, paired = TRUE)

0.087

##-------------------------------Question 2-------------------------------------

##A sample of 9 men yielded a sample average brain volume of 1,100cc and a 
##standard deviation of 30cc. What is the complete set of values of ??0 that a 
##test of H0:??=??0 would fail to reject the null hypothesis in a two sided 5% 
##Students t-test?

mean = 1100
sd = 30
n = 9

distmake <- mean + (sd *scale(rnorm(n)))

t.test(distmake, conf.level = 0.95) 

1077 to 1123 

##-------------------------------Question 3-------------------------------------

##Researchers conducted a blind taste test of Coke versus Pepsi. Each of four 
##people was asked which of two blinded drinks given in random order that they 
##preferred. The data was such that 3 of the 4 people chose Coke. Assuming that 
##this sample is representative, report a P-value for a test of the hypothesis 
##that Coke is preferred to Pepsi using a one sided exact test.

##The bionom.test function performs an exact test of a simple null hypothesis 
##about the probability of success in a Bernoulli experiment. The first element
##counts the number of successes, the second the total number of trials. The 
##'alternative' argument creates a one sided test. 

##The null hypothesis below asks if the probability of picking Coke is equal to
##the probability of picking Pepsi, the default value 50%. If the null is true,
##there will be no difference. The alternative hypothosis asks if the 
##probability of picking Coke is higher/greater than 50%. Here, we reject the 
##null hypothesis and note the p-value.

##The p-value measures the likelihood of the observed effect if the null 
##hypothesis is true. That is, what are the chances of seeing this result if the
##probability actually was 50%?

library(stats)

Cokeno <- 3
TotalTrialNo <- 4

binom.test(Cokeno, TotalTrialNo, alternative = "greater")

0.31

##-------------------------------Question 4-------------------------------------

##Definitions: 

##test statistic: A test statistic is a standardized value that is calculated 
######from sample data during a hypothesis test. Computed from sample data, 
######the test statistic might be a mean score, proportion, difference between 
######means, difference between proportions, z-score, t-score, chi-square, etc.

##Z-value: The Z-value is a test statistic for Z-tests that measures the 
######difference between an observed statistic and its hypothesized population 
######parameter in units of standard error. Another name for a z-statistic.

##z-statistic: The z statistic reflects the the number of standard deviations or
######standard errors, X is away from the mean. Another name for a z-value.

##z-score: Z-scores indicate how many standard deviations away from the mean 
######a particular value is. A z-score is the result of standardising data. 
######Also known as the standard score. A z-score is the normal random variable 
######of a standard normal distribution. Another name for a z-value.

##z-score = z-value = z-statistic = z test statistic = standard score = 
##normal score = standardised variable

##The value of a variable minus its mean, divided by its standard deviation or 
##standard error.

##Margin of error = Critical value x Standard error or the standard deviation 

##z-test: The Z-test compares sample and population means to determine if there 
######is a significant difference.

##critical value: Critical values for a test of hypothesis depend upon a test 
######statistic and the significance level, ??, which defines the sensitivity of 
######the test. A value of ?? = 0.05 implies that the null hypothesis is rejected
###### 5 % of the time when it is in fact true.

##The p-value measures the likelihood of the observed effect if the null 
######hypothesis is true. 

##Infection rates at a hospital above 1 infection per 100 person days at risk 
##are believed to be too high and are used as a benchmark. A hospital that had 
##previously been above the benchmark recently had 10 infections over the last 
##1,787 person days at risk. About what is the one sided P-value for the 
##relevant test of whether the hospital is *below* the standard?

what is the p-value of whether the hospital is below the standard?

##The standard deviation of the sample proportion, or standard error, can be 
##approximated by the equation ??p = sqrt(p*(1 - p)/n) where..

p = 1/100 ##Infection rate
p2 = 10/1787 ##Infection rate in sample 
n = 1787 ##Number of observations in the sample

serror = sqrt(p*(1-p)/n) ##standard error of the sample proportion

##Now that we have the standard error for this proportion we can perform a 
##z-test which compares our two proportions. 

##A z-test results in a z-score. In other words, we need to express the 
##difference between the sample proportions in terms of standard errors.

zscore = (p-p2)/serror

##pnorm gives the cumulative probability of the z-score. 
##lower.tail=FALSE returns the probability above the z-score.

pnorm(zscore, lower.tail=FALSE)

##In summary, what we've done is to convert the difference in rates into
##units of standard error, which are called z-scores. We've then asked, what 
##is the probability that we would obtain a result that is greater than the 
##value of the Z-score, that is to say, a difference of more than 1.87 SE.
##This is the p-value.

0.03

What is the P-value for whether the hospital is below the benchmark?

Null hypothesis = sample observation is below the benchmark
Alternative hypothesis = sample observation is above the benchmark

##The p-value measures the likelihood of the observed effect if the null 
######hypothesis is true. 

High P values: your data are likely with a true null. Accept null.
Low P values: your data are unlikely with a true null. Reject null

figures x 100 and rounded

p (benchmark rate) = 1%
p2 (incident rate) = 0.6% = centre of distribution
SE of p = 0.2%

p - p2 = 0.4%
zscore of p = 0.4%/0.2% = 2 standard deviations

ALternative method

##Lambda (??) is the total number of events (k) divided by the number of units 
######(n) in the data (?? = k/n).

benchmarkrate <- 1/100
totaldays <- 1787
lambda <- benchmarkrate * totaldays#Acceptable number of infections in 1787 days
observed_infections <- 10
#H0: That the observed data is under the expected rate. 
#Probability of observing 10 or fewer infections under null:
ppois(10,lambda)


p = 1/100 
p2 = 10/1787 

p/p2




##-------------------------------Question 5-------------------------------------

##Suppose that 18 obese subjects were randomized, 9 each, to a new diet pill and
##a placebo. Subjects' body mass indices (BMIs) were measured at a baseline and 
##again after having received the treatment or placebo for four weeks. The 
##average difference from follow-up to the baseline (followup - baseline) was 
##???3 kg/m2 for the treated group and 1 kg/m2 for the placebo group. The 
##corresponding standard deviations of the differences was 1.5 kg/m2 for the 
##treatment group and 1.8 kg/m2 for the placebo group. Does the change in BMI 
##appear to differ between the treated and placebo groups? Assuming normality of
##the underlying data and a common population variance, give a pvalue for a two 
##sided t test.

Treated <- -3 + (1.5 *scale(rnorm(9)))
Placebo <- 1 + (1.8 *scale(rnorm(9)))

t.test(Treated, Placebo) 

Less than 0.01

##-------------------------------Question 6-------------------------------------

##Brain volumes for 9 men yielded a 90% confidence interval of 1,077 cc to 1,123
##cc. Would you reject in a two sided 5% hypothesis test of H0:??=1,078?

No you wouldn't reject.

##-------------------------------Question 7-------------------------------------

##Researchers would like to conduct a study of 100 healthy adults to detect a 
##four year mean brain volume loss of .01 mm3. Assume that the standard 
##deviation of four year volume loss in this population is .04 mm3. About what 
##would be the power of the study for a 5% one sided test versus a null 
##hypothesis of no volume loss?

##-------------------------------Question 8-------------------------------------

##Researchers would like to conduct a study of n healthy adults to detect a four
##year mean brain volume loss of .01 mm3. Assume that the standard deviation of 
##four year volume loss in this population is .04 mm3. About what would be the 
##value of n needded for 90% power of type one error rate of 5% one sided test 
##versus a null hypothesis of no volume loss?

##-------------------------------Question 9-------------------------------------

##As you increase the type one error rate, ??, what happens to power?

You will get larger power.
