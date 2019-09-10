## Set working directory - Path/Location for input and output files
setwd("C:/Users/xgao4/OneDrive - IQVIA/Documents/Holland Training/Practices/First R Regression")

#install and load packages
install.packages("car")
library(car)


##Load data into R
source_data <- read.csv("_first_reg.csv")
print (source_data)

##check the Correlation
cor(source_data)


par(mfrow=c(2, 3))  # divide graph area in 3 columns
##draw scatter graph
scatter.smooth(x=source_data$POD, y=source_data$cu, main="POD ~ cu")
scatter.smooth(x=source_data$POD, y=source_data$rx, main="POD ~ rx")
scatter.smooth(x=source_data$POD, y=source_data$lg_rx, main="POD ~ lg_rx")
scatter.smooth(x=source_data$POD, y=source_data$lg2_rx, main="POD ~ lg2_rx")
scatter.smooth(x=source_data$POD, y=source_data$lg3_rx, main="POD ~ lg3_rx")
scatter.smooth(x=source_data$POD, y=source_data$lg4_rx, main="POD ~ lg4_rx")


#fit the model
fit <- lm(POD ~ rx+cu+lg_rx+lg2_rx+lg3_rx+lg4_rx, data=source_data)
#Printing the summary statistics for linearMod.
#The more the stars beside the variable's p-Value, the more significant the variable.
#A larger t-value indicates that it is less likely that the coefficient is not equal to zero purely by chance. 
#So, higher the t-value, the better.
#R-Squared Higher the better (> 0.70)
#Adj R-Squared Higher the better
#F-Statistic Higher the bette
#Std. Error Closer to zero the better
summary(fit)
vif(fit)#multicollinearity, vif should not >10, or delete any one of column

#remove cu and re-fit the model
fit1 <- lm(POD ~ rx+lg_rx+lg2_rx+lg3_rx+lg4_rx, data=source_data)
summary(fit1)

vif(fit1)

plot(fit1)


# source_data$rx2 <- source_data$rx^2
# fit2 <- lm(POD ~ rx+lg_rx+lg2_rx+lg3_rx+lg4_rx+rx2, data=source_data)
# summary(fit2)
# 
# vif(fit2)
# 
# plot(fit2)


