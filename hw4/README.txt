Q1 - 
MEDV = (-0.1084)*CRIM + 0.0458*ZN + 2.7187*CHAS=1 + (-17.376)*NOX + 3.8016*RM + (-1.4927)*DIS + 0.2996*RAD + (-0.0118)*TAX + (-0.9465)*PTRATIO + 0.0093*B + (-0.5226)*LSTAT + 36.3411

>> This is an example of multiple linear regression.
[assesses the relationship between a dependent variable (class) and multiple independent variables.]

>> MEDV/class: dependent (predicted) variable
>> 36.3411: y-intercept (value of class when all other independent variables are 0)
>> CRIM, ZN, CHAS=1, NOX, RM, DIS, RAD, TAX, PTRATIO, B, LSTAT: independent variable

>> regression coefficients: represents the change in the value of MEDV relative to a one-unit change in them

>> Sign of a regression coefficient tells whether there is a positive or negative correlation between each independent and the dependent variable. Positive coefficient indicates if the value of the independent variable increases, the mean of the dependent variable also increases. A negative coefficient tells us that if the independent variable increases, the dependent variable will also decrease.

Why 2 features [INDUS and AGE] are not included?

They are removed because they have the lowest standardized regression coefficient. 
They are not contributing to explain the variance in MEDV.

Adding independent variables to a multiple linear regression model will always increase the amount of explained variance in the dependent variable (typically expressed as R²).  Therefore, adding too many independent variables without any theoretical justification may result in an over-fit model.

So, to avoid overfitting, M5 selection algorithm has eliminated these variables.



Q2 -
lowest RMSE able to achieve?

2.5095 [learning rate-0.221  momentum-0.16] -> changed no other parameters

among the values checked: (only for reference)

l-0.1       m-0.1 	= 2.7066
l-0.2       m-0.1 	= 2.5856
l-0.3       m-0.1 	= 2.7177

l-0.1       m-0.2 	= 2.5966
l-0.2       m-0.2 	= 2.6048
l-0.3       m-0.2 	= 2.9317

l-0.1       m-0.3 	= 2.704
l-0.2       m-0.3 	= 2.6275
l-0.3       m-0.3 	= 2.9406

l-0.2       m-0.11 	= 2.5817
l-0.21      m-0.11 	= 2.5441
l-0.21      m-0.12 	= 2.5386
l-0.221     m-0.121 	= 2.5194
l-0.22111   m-0.12111 	= 2.5192
l-0.23      m-0.12111 	= 2.5191
l-0.23      m-0.13 	= 2.5164
l-0.2202    m-0.13 	= 2.5159
l-0.2202    m-0.14 	= 2.5124
l-0.2202    m-0.15 	= 2.5104
l-0.2202    m-0.1522 	= 2.5101
l-0.22      m-0.155555 	= 2.5099
l-0.2212    m-0.155555 	= 2.5096
l-0.221     m-0.16 	= 2.5095  ----->  [lowest]



Q3 -
equation: 

num_rings = -0.825 *(sex=l) + 0.058 *(sex=M) - 0.458 *(length) + 11.075 *(diameter) + 10.762 *(height) + 8.975 *(whole_weight) - 19.787 *(shucked_weight) - 10.582 *(viscera_weight) + 8.742 *(shell_weight) + 3.895



Q5 -
Data points in each cluster!!

cluster 0: 1388 items
cluster 1: 499
cluster 2: 448
cluster 3: 22
cluster 4: 172
cluster 5: 1648
total = 4177



Q6 - 
num_rings = (-11.933)*length + 25.766*diameter + 20.358*height + 2.836

