#Bella Hallstead TS code

library(TSA)

library(readr)
basotho_wool <- read_csv("basotho_wool.csv")
View(basotho_wool)

View(ts_wool)

#I read through Ch.10 and played around with our data a bit
#Our data seems to show similar patterns to the co2 example used in the book

ts.plot(ts_wool)
#Appears to have an upward trend along with the seasonal trend. 
#Cannot tell much about the variance from this plot.
acf(ts_wool,lag.max=36) 
#peaks at lags 12, 24, 36. To be expected for seasonal relationship with s=12

ts.plot(diff(ts_wool)) #First Difference
#Mean appears to be constant
#There are some bigger jumps, but overall variance appears to be constant
#Seasonal trend is still obvious
#(and looks worse if you take the log)
acf(diff(ts_wool),lag.max=36)
#Only Significant lags (other than 1) are 12, 24, 36
#Seasonal trend still present

ts.plot(diff(diff(ts_wool),lag=12)) #First Difference and Seasonal Difference
acf(diff(diff(ts_wool),lag=12),lag.max=36)
pacf(diff(diff(ts_wool),lag=12),lag.max=36)
eacf(diff(diff(ts_wool),lag=12))
#I am stuck :( 
