set.seed(1837)
y1<-arima.sim(list(order=c(1,1,1),ar=-0.5,ma=-0.3),n=500)
y2<-arima.sim(list(order=c(1,1,2),ar=0.3,ma=c(-0.3,0.5)),n=500)
par(mfrow=c(2,2))
plot(y1,type="l",xlab="Time",ylab="Series")
plot(y2,type="l",xlab="Time",ylab="Series")
acf(y1,30,xlab="Lag",ylab="ACF",main="")
acf(y2,30,xlab="Lag",ylab="ACF",main="")

##Simulating the series
set.seed(40)
n<-500
x1<-arima.sim(list(order=c(2,0,0), ar=c(-0.4, 0.3)), n)
#x2<-arima.sim(list(order=c(3,0,0), ar=c(1/4,1/2,-1/8)),n)
#par(mfrow=c(3,2), mar=c(4,4,4,4))
plot(x1, type="l", xlab="Time", ylab="Series")
#plot(x2, type="l", xlab="Time", ylab="Series")
acf(x1, 25, xlab="Lag", ylab="ACF", main="")
#acf(x2, 25, xlab="Lag", ylab="ACF", main="")
acf(x1,25,type="partial",xlab="Lag",ylab="Partial ACF",main="", ylim=c(-1,1),xlim=c(0,25))
#acf(x2,25,type="partial",xlab="Lag",ylab="Partial ACF",main="", ylim=c(-1,1),xlim=c(0,25))

##Fitting the AR series
x1fit<-arima(x1, order=c(2,0,0))

#zero mean model
x1fit1<-arima(x1, order=c(2,0,0), include.mean=FALSE)

#Simulating the series
set.seed(534)
n<-500
x3<-arima.sim(list(order=c(0,0,2), ma=c(-0.5, 0.4)), n)
x4<-arima.sim(list(order=c(0,0,3), ma=c(1/3,1/5,-1/9)),n)
par(mfrow=c(3,2), mar=c(2,2,2,2))
plot(x3, type="l", xlab="", ylab="")
plot(x4, type="l", xlab="", ylab="")
acf(x3, 25, ylab="", main="")
acf(x4, 25, ylab="", main="")
acf(x3, 25, type="partial", ylab="", ylim=c(-1,1),xlim=c(0,25))
acf(x4, 25, type="partial", ylab="", ylim=c(-1,1),xlim=c(0,25))
#Fitting an MA process
MAfit1<-arima(x4, order=c(0,0,3))



