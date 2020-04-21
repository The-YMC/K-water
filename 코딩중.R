str(cleaned.data)

head(Date.char.new)

str(Usage.hourly.vaca)
str(Usage.hourly)

YYYYmm.new<-as.character(YYYYmm.new)
X<-cbind(X.new,Date.char.new,Usage.hourly.new,YYYYmm.new)

head(X)


pivot_table=summarise(group_by(binddata,type,YYYYmm),sum=sum(Usage.hourly.))

library(dplyr)

pivot_table=summarise(group_by(X,YYYYmm.new),mean=mean(Usage.hourly.new))

rm(X)
str(cleaned.data)

# Time Series -------------------------------------------------------------

rm(moho.gagu)
cleaned.data.new<-cbind(X.new, Meter_ID.new, Date.char.new,Time.new,
                        Usage.hourly.new,YYYYmm.new)

cleaned.data.new<-as.data.frame(cleaned.data.new)
head(cleaned.data.new)
pivot_table=summarise(group_by(cleaned.data.new,YYYYmm.new),sum=sum(Usage.hourly.new))






YYYYmm.new<-as.factor(YYYYmm.new)



# pivot_table<-pivot_table[-429,]

pivot_table

head(pivot_table)

edit(pivot_table)

install.packages("forecast")
library(forecast)
??auto.arima

data<-unlist(data)
b<-diff(data)
plot(b)
data<-pivot_table[,-1]
fit<-auto.arima(diff(data))
fit

plot(fit)

arima=arima(data,order=c(0,0,0))

tsdiag(arima)

install.packages("KPSS")
library(KPSS)
??kpss.test
kpss.test(data)

head(arima)
str(data)

a<-forecast(arima)
plot(a)
a

edit(a)


Box.test(diff(data))


jinstall.packages("pp.test")
library("pp.test")
pp.test(data)

rwf(data)

