/*
 * Logistic regression example
 * 
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

transformed parameters {
	real<lower=0> theta;
	theta = exp(beta1);
}

model {
beta0 ~ normal(0,3.162278);
beta1 ~ normal(0,0.2068738);
for (i in 1:3)
    y[i] ~ binomial(n[i],inv_logit(beta0+beta1*x[i]));
}
