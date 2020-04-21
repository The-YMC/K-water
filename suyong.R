
# 수용가별 분류하기 ---------------------------------------------------------------
index_1<-which(Meter_ID.new=="16-009003")
index_2<-which(Meter_ID.new=="16-006131")
index_3<-which(Meter_ID.new=="16-000358")
index_4<-which(Meter_ID.new=="16-006082")
index_5<-which(Meter_ID.new=="16-000295")
index_6<-which(Meter_ID.new=="16-006316")
index_7<-which(Meter_ID.new=="16-008176")
index_8<-which(Meter_ID.new=="11-006492")
index_9<-which(Meter_ID.new=="16-003216")
index_10<-which(Meter_ID.new=="16-000247")
index_11<-which(Meter_ID.new=="16-006141")
index_12<-which(Meter_ID.new=="16-000447")
index_13<-which(Meter_ID.new=="16-005979")
index_14<-which(Meter_ID.new=="16-006244")
index_15<-which(Meter_ID.new=="16-006083")
index_16<-which(Meter_ID.new=="16-005276")
index_17<-which(Meter_ID.new=="16-000294")
index_18<-which(Meter_ID.new=="16-006041")
index_19<-which(Meter_ID.new=="16-003184")
index_20<-which(Meter_ID.new=="16-005755")
index_21<-which(Meter_ID.new=="16-006345")
index_22<-which(Meter_ID.new=="16-005681")
index_23<-which(Meter_ID.new=="16-000278")
index_24<-which(Meter_ID.new=="16-005278")
index_25<-which(Meter_ID.new=="16-000279")
index_26<-which(Meter_ID.new=="16-005730")
index_27<-which(Meter_ID.new=="16-006163")
index_28<-which(Meter_ID.new=="16-000280")
index_29<-which(Meter_ID.new=="16-006589")
index_30<-which(Meter_ID.new=="16-005785")
index_31<-which(Meter_ID.new=="16-006599")
index_32<-which(Meter_ID.new=="16-006039")
index_33<-which(Meter_ID.new=="16-006236")
index_34<-which(Meter_ID.new=="16-005520")
index_35<-which(Meter_ID.new=="16-000360")
index_36<-which(Meter_ID.new=="16-000236")
index_37<-which(Meter_ID.new=="16-006280")
index_38<-which(Meter_ID.new=="16-005910")
index_39<-which(Meter_ID.new=="16-008138")
index_40<-which(Meter_ID.new=="16-006113")
index_41<-which(Meter_ID.new=="16-005260")#  식당
index_42<-which(Meter_ID.new=="16-006235")# 전원 주택지
index_43<-which(Meter_ID.new=="16-005781")# 전원 주택지
index_44<-which(Meter_ID.new=="16-006115")# 가정용 
index_45<-which(Meter_ID.new=="16-005436")# 가정용
# "16-005260"
# "16-006235"
# "16-005781"
# "16-006115"
# "16-005436"

# index_except_normal<-list(index_1,
index_top40<-list(index_1,
                  index_2,
                  index_3,
                  index_4,
                  index_5,
                  index_6,
                  index_7,
                  index_8,
                  index_9,
                  index_10,
                  index_11,
                  index_12,
                  index_13,
                  index_14,
                  index_15,
                  index_16,
                  index_17,
                  index_18,
                  index_19,
                  index_20,
                  index_21,
                  index_22,
                  index_23,
                  index_24,
                  index_25,
                  index_26,
                  index_27,
                  index_28,
                  index_29,
                  index_30,
                  index_31,
                  index_32,
                  index_33,
                  index_34,
                  index_35,
                  index_36,
                  index_37,
                  index_38,
                  index_39,
                  index_40,
                  index_41,#
                  index_42,#
                  index_43,#
                  index_44,#
                  index_45)#

index_top40<-unlist(index_top40)

head(index_top40)



cleaned.data.new<-cbind(X.new, Meter_ID.new, Date.char.new,Time.new,
                        Usage.hourly.new,YYYYmm.new)

cleaned.data.new<-as.data.frame(cleaned.data.new)

  
  data.top40 <- cleaned.data.new[index_top40,] # 
data.below40 <- cleaned.data.new[-index_top40,] # 


data.top40<-as.data.frame(data.top40)
data.below40<-as.data.frame(data.below40)

plot(data.below40)

data.below40$Date.char.new <- as.factor(data.below40$Date.char.new)

data.below40$Date.char.new <- as.factor(data.below40$Date.char.new)


library(dplyr)
pivot_table=summarise(group_by(data.below40,Date.char.new),mean=mean(Usage.hourly.new))
pivot_table=summarise(group_by(data.top40,Date.char.new),mean=mean(Usage.hourly.new))
head(pivot_table)
library("forecast")
data<-pivot_table[,-1]

Box.test(data)
data<-unlist(data)
Box.test(diff(data))
Box.test(diff(diff(data)))

install.packages("tseries")
library(tseries)
data<-as.vector(data)
data

data<-data[-427,]
data<-data[-428,]
data<-data[-429,]
data<-data[-430,]

data


t<-ts(data,start=c(10,01),frequency=7) 
t<-as.vector(t)
lambda<-BoxCox.lambda(t)
lambda
t<-BoxCox(t,lambda)
t<-diff(t)
t

plot(t,main="data")

summary(aa<-auto.arima(t))


acf(t,main="data.acf")
pacf(t,main="data.pacf")
plot(density(t),main="data.density")
fit

fitted(fit)
forecast(fit)

library(tseries)
library(timeDate)

adf.test(t, k=0) 

library(forecast)
fit<-auto.arima(t)

summary(aa<-auto.arima(t))

plot(forecast(aa))
lines(fitted(aa),col="red",lty=2,lwd=2)



s1=simulate(fit,7)
s1=simulate(aa,7)

s1
s2=simulate(fit,7,bootstrap = T)

s2=simulate(aa,7,bootstrap = T)

s2


plot(t)
lines(s1, col="red",lwd=2)
lines(s2, col="blue", lwd=2)
legend("bottomleft",legend=c("simulation","boostrap"),col=c(2,4),lty=1)

##########

aa<-auto.arima(diff(data))

##

fit<-auto.arima(diff(diff(data)))

fit
??arima
plot(fit)

tsdiag(fit)

arima=arima(data,order=c(2,0,3))

tsdiag(arima)

forecast(fit)


head(arima)

a<-forecast(fit)
plot(a)
a

rm(basic.data)

summary(aa<-auto.arima(t))


aa=auto.arima(t)
aa

aad=auto.arima(t,allowdrift = F)
aad

bb=Arima(t, order=c(3,1,2))
bb

cc=Arima(t,order=c(3,1,2), seasonal = c(0,0,2))
cc

forecast(aa)

plot(forecast(aa))
lines(fitted(aa),col="red",lty=2,lwd=2)

plot(t)

lines(fitted(forecast(aa),h=1),col=3)
lines(fitted(forecast(aa),h=2),col=2)

legend("bottomleft",legend=paste("h =",1:2), col=3:2, lty=1)


s1=simulate(fit,7)
s1=simulate(aa,7)

s1
s2=simulate(fit,7,bootstrap = T)

s2=simulate(aa,7,bootstrap = T)


??simulate
s2


plot(t)
lines(s1, col="red",lwd=2)
lines(s2, col="blue", lwd=2)
legend("bottomleft",legend=c("simulation","boostrap"),col=c(2,4),lty=1)

