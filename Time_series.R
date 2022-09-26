# In this case the age of death of 42 successive kings of England has been read into the variable ‘kings’.
# Once you have read the time series data into R, the next step is to store the data 
# in a time series object in R, so that you can use R’s many functions for analyzing 
# time series data. To store the data in a time series object,
# we use the ts() function in R. For example, to store 
# the data in the variable ‘kings’ as a time series object in R, we type:

kings <- scan("http://robjhyndman.com/tsdldata/misc/kings.dat",skip=3)
kings


# In this case the age of death of 42 successive kings of England has been read into the variable ‘kings’.
# 
# Once you have read the time series data into R, the next step is to store the 
# data in a time series object in R, so that you can use R’s many functions for
# analyzing time series data. To store the data in a time series object, 
# we use the ts() function in R. For example, to store the data in the 
# variable ‘kings’ as a time series object in R, we type:

kingstimeseries <- ts(kings)
kingstimeseries
  Start = 1
End = 42
Frequency = 1


births <- scan("http://robjhyndman.com/tsdldata/data/nybirths.dat")
birthstimeseries <- ts(births, frequency=12, start=c(1946,1))
birthstimeseries

# Plotting Time Series
# Once you have read a time series into R, the next step is usually to 
# make a plot of the time series data, which you can do with the plot.ts() function in R.
# 
# For example, to plot the time series of the age of death
# of 42 successive kings of England, we type:

plot.ts(kingstimeseries)
plot.ts(birthstimeseries)


# In this case, it appears that an additive model is
# not appropriate for describing this time series, 
# since the size of the seasonal fluctuations and
# random fluctuations seem to increase with the
# level of the time series. Thus, we may need to 
# transform the time series in order to get a 
# transformed time series that can be described 
# using an additive model. For example, we can transform
# the time 
# series by calculating the natural log of the original data:

logbirthstimeseries <- log(birthstimeseries)
plot.ts(logbirthstimeseries)

# Thus, we can try to estimate the trend component 
# of this time series by smoothing using a simple moving average. 
# To smooth the time series using a simple moving average
# of order 3, and plot the smoothed time series data, we type:
library('TTR')
kingstimeseriesMA3 <- SMA(kingstimeseries,n=3)
plot.ts(kingstimeseriesMA3)


kingstimeseriesMA5 <- SMA(kingstimeseries,n=5)
plot.ts(kingstimeseriesMA5)


kingstimeseriesMA1 <- SMA(kingstimeseries,n=1)
plot.ts(kingstimeseriesMA1)


#To estimate the trend, seasonal and irregular
#components of this time series, we type:
birthstimeseriescomponents <- decompose(birthstimeseries)
birthstimeseriescomponents$seasonal

# The estimated seasonal factors are given for the months January-December,
# and are the same for each year. The largest seasonal factor
# is for July (about 1.46), and the lowest is for February (about -2.08), 
# indicating that there seems to be a peak in
# births in July and a trough in births in February each year.
# We can plot the estimated trend, seasonal, and irregular
# components of the time series by using the “plot()” function, for example:

plot(birthstimeseriescomponents)

# Simple Exponential Smoothing
# If you have a time series that can be described using an additive
# model with constant level and no seasonality, you can use simple 
# exponential smoothing to make short-term forecasts.
# 
# The simple exponential smoothing method provides a way of estimating 
# the level at the current time point. Smoothing is controlled by the 
# parameter alpha; for the estimate of the level at the current time point. 
# The value of alpha; lies between 0 and 1. Values of alpha that are
# close to 0 mean that little weight is 
# placed on the most recent observations when making forecasts of future values

rain <- scan("http://robjhyndman.com/tsdldata/hurst/precip1.dat",skip=1)
rainseries <- ts(rain,start=c(1813))
plot.ts(rainseries)

# You can see from the plot that there is roughly constant
# level (the mean stays constant at about 25 inches). 
# The random fluctuations in the time series seem to be roughly 
# constant in size over time, so it is probably appropriate to describe
# the data using an additive model. Thus, we can make forecasts using simple
# exponential smoothing.
# 
# To make forecasts using simple exponential smoothing in R, we can
# fit a simple exponential smoothing predictive model 
# using the “HoltWinters()” function in R. To use HoltWinters() for 
# simple exponential smoothing, we need to set
# the parameters beta=FALSE and gamma=FALSE in the HoltWinters() function
# (the beta and gamma parameters are used for Holt’s exponential smoothing,
#  or Holt-Winters exponential smoothing, as described below).
# 
# The HoltWinters() function returns a list variable, that contains
# several named elements.
# 
# For example, to use simple exponential smoothing to make forecasts 
# for the time series of annual rainfall in London, we type:

rainseriesforecasts <- HoltWinters(rainseries, beta=FALSE, gamma=FALSE)
rainseriesforecasts


rainseriesforecasts$fitted
#we can plot the original data by:
plot(rainseriesforecasts)

# The plot shows the original time series in black, and the forecasts
# as a red line. The time series of forecasts is much smoother than the
# time series of the original data here.
# 
# As a measure of the accuracy of the forecasts, we can calculate the
# sum of squared errors for the in-sample forecast errors, that is, 
# the forecast errors for the time period covered by our original time series. 
# The sum-of-squared-errors is stored in a named element of
# the list variable “rainseriesforecasts” called “SSE”, so we can get its value by typing:

rainseriesforecasts$SSE
#smoothing
HoltWinters(rainseries, beta=FALSE, gamma=FALSE, l.start=23.56)

library('forecast')
rainseriesforecasts2 <- forecast.HoltWinters(rainseriesforecasts, h=8)

plot.forecast(rainseriesforecasts2)

acf(rainseriesforecasts$residuals, lag.max=20)












