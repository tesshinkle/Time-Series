#Bella Hallstead TS code

library(TSA)

library(readr)
basotho_wool <- read_csv("basotho_wool.csv")
View(basotho_wool)

View(ts_wool)

#I read through Ch.10 and played around with our data a bit
#Our data seems to show similar patterns to the co2 example used in the book

par(mfrow=c(1,1))
ts.plot(ts_wool)
#Appears to have an upward trend along with the seasonal trend. 
#Cannot tell much about the variance from this plot.
acf(ts_wool,lag.max=36) 
#peaks at lags 12, 24, 36. To be expected for seasonal relationship with s=12

dtrend<-lm(ts_wool~time(ts_wool)) # simple linear regression
ts.plot(rstudent(dtrend),main="Detrended Series") ## This gives you the de-trended residuals
acf(rstudent(dtrend),lag.max=36)

ts.plot(diff(ts_wool)) #First Difference
#Mean appears to be constant
#There are some bigger jumps, but overall variance appears to be constant
#Seasonal trend is still obvious
#(and looks worse if you take the log)
acf(diff(ts_wool),lag.max=36)
#Only Significant lags (other than 1) are 12, 24, 36
#Seasonal trend still present

ts.plot(diff(diff(ts_wool),lag=12)) #First Difference and Seasonal Difference
par(mfrow=c(1,2))
acf(diff(diff(ts_wool),lag=12),lag.max=36,ci.type='ma')
pacf(diff(diff(ts_wool),lag=12),lag.max=36)
eacf(diff(diff(ts_wool),lag=12))
#I am stuck :( 

ts.plot(diff(ts_wool,lag=12))
acf(diff(ts_wool,lag=12), lag.max=36,ci.type='ma')
pacf(diff(ts_wool,lag=12), lag.max=36)
eacf(diff(ts_wool,lag=12))

ts.plot(diff(log(ts_wool),lag=12))

ts.plot(diff(rstudent(dtrend),lag=12))
acf(diff(rstudent(dtrend),lag=12),lag.max=36,ci.type='ma')
pacf(diff(rstudent(dtrend),lag=12),lag.max=36)
eacf(diff(rstudent(dtrend),lag=12))



