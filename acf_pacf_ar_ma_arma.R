AR1 <- list(order = c(1,0,0), ar=0.5, sd=0.01)
AR1 <- arima.sim(n=10000, model = AR1)

MA1 <- list(order = c(0,0,1), ma=0.7, sd=0.01)
MA1 <- arima.sim(n=10000, model = MA1)

ARMA11 <- list(order = c(1,0,1), ar=0.5, ma=0.5, sd=0.01)
ARMA11 <- arima.sim(n=10000, model = ARMA11)

#Graphing the three series

combo <- cbind(AR1,MA1,ARMA11)
plot(combo)

par(mfrow =c(1,2))
#Comparing their acf and pacf

#for the AR
acf(AR1)#Geometric decay
pacf(AR1)#cutoff after lag 1

#for the MA
acf(MA1)#Cut off after lag 1
pacf(MA1)#Geometric decay

#for the ARMA
acf(ARMA11)#Geometric decay
pacf(ARMA11)#Geometric decay

par(mfrow =c(3,3))
plot.ts(AR1)
acf(AR1)#Geometric decay
pacf(AR1)#Cut off after lag 1

plot.ts(MA1)
acf(MA1)
pacf(MA1)

plot(ARMA11)
acf(ARMA11)
pacf(ARMA11)







