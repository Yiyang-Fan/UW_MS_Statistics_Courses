/*
 * Logistic regresssion example
 * stanlogist <- stan("LogisticExample.stan",data = list(x=c(0,1,2),y=c(6,8,75),n=c(16,74,238)),iter = 500, chains = 1, seed=1234)
 */

data {
	int y[3];
	int n[3];
	int x[3];
}

parameters {
	real beta0;
	real beta1;
}

model {
for (i in 1:3)
	y[i] ~ binomial(n[i],inv_logit(beta0+beta1*x[i]));
}
