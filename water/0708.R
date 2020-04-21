library(rpart) 

#?ƒ?œ„40 index
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
# index_41<-which(Meter_ID.new=="16-005260")#  ?‹?‹¹
# index_42<-which(Meter_ID.new=="16-006235")# ? „?› ì£¼íƒ×Ù€
# index_43<-which(Meter_ID.new=="16-005781")# ? „?› ì£¼íƒ×Ù€
# index_44<-which(Meter_ID.new=="16-006115")# ê°€? •?š© 
# index_45<-which(Meter_ID.new=="16-005436")# ê°€? •?š©

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
                  index_40)
index_top40<-unlist(index_top40)


# ê´€ê´‘ì—…?†Œ 
index_vaca<-list(index_3,index_8,
                 index_10,index_12,
                 index_14,index_15, index_16,
                 index_17,
                 index_18,index_19,
                 index_20,index_21,
                 index_22,
                 index_23,index_25,
                 index_26,index_27, index_37)
str(index_vaca)
index_vaca<-unlist(index_vaca)

# ?¼ë°? ??€?ˆ˜?š©ê°€ 
index_general.big<-list(index_1,
                        index_2,
                        # index_3,
                        index_4,
                        index_5,
                        index_6,
                        index_7,
                        # index_8,
                        index_9,
                        # index_10,
                        index_11,
                        # index_12,
                        index_13,
                        # index_14,
                        # index_15,
                        # index_16,
                        # index_17,
                        # index_18,
                        # index_19,
                        # index_20,
                        # index_21,
                        # index_22,
                        # index_23,
                        index_24,
                        # index_25,
                        # index_26,
                        # index_27,
                        index_28,
                        index_29,
                        index_30,
                        index_31,
                        index_32,
                        index_33,
                        index_34,
                        index_35,
                        index_36,
                        # index_37,
                        index_38,
                        index_39,
                        index_40)
index_general.big<-unlist(index_general.big)



cleaned.data.new1<-cbind( Meter_ID.new, Date.char.new,Time.new,
                        Usage.hourly.new,YYYYmm.new)

cleaned.data.new1<-as.data.frame(cleaned.data.new1)
head(cleaned.data.new1)

str(data.general.big)
data.general.big <- cleaned.data.new1[index_general.big,] # 
data.vaca <- cleaned.data.new1[index_vaca,] #
data.below40 <- cleaned.data.new1[-index_top40,] # 


data.top40 <- cleaned.data.new1[index_top40,] # 
data.below40 <- cleaned.data.new1[-index_top40,] # 


library(dplyr)
pivot_table=summarise(group_by(data.general.big,Date.char.new),mean=mean(Usage.hourly.new))
pivot_table=summarise(group_by(data.vaca,Date.char.new),mean=mean(Usage.hourly.new))
pivot_table=summarise(group_by(data.below40,Date.char.new),mean=mean(Usage.hourly.new))


pivot_table=summarise(group_by(data.top40,Date.char.new),mean=mean(Usage.hourly.new))
pivot_table=summarise(group_by(data.below40,Date.char.new),mean=mean(Usage.hourly.new))


library(tseries)
library(timeDate)
library(forecast)

# pivot_table<-pivot_table[-429,]

which.max(pivot_table$mean)

head(pivot_table)

#edit(pivot_table)
# 
# install.packages("forecast")
# library(forecast)
# ??auto.arima
# 
# data<-unlist(data)
# b<-diff(data)
# plot(b)
# data<-pivot_table[,-c(1,2)]

data<-pivot_table[,-1]


data[430,]

data<-data[-427,]
data<-data[-428,]
data<-data[-429,]
data<-data[-430,]

t<-ts(data,start=c(10,01),frequency=7) 
t<-as.vector(t)
lambda<-BoxCox.lambda(t)
# lambda
t<-BoxCox(t,lambda)
t<-diff(t)
adf.test(t, k=0) 


plot(t,main="data.below40", type="l")

summary(aa<-auto.arima(t))


acf(t,main="data.acf")
pacf(t,main="data.pacf")
plot(density(t),main="data.density")


fitted(fit)
forecast(fit)





plot(forecast(aa))
lines(fitted(aa),col="red",lty=2,lwd=2)



s1=simulate(aa,365)
s1

s2=simulate(aa,365,bootstrap = T)
s2



lines(s1, col="orange",lwd=1)
lines(s2, col="green", lwd=1)
legend("bottomleft",legend=c("simulation","boostrap"),col=c(2,4),lty=1)






tom=function(x){
  nn=length(x)
  mu=mean(x)
  ss=sd(x,1)
  t1=(x-mu)/ss
  (sqrt(nn-2)*t1)/(sqrt(nn-1-t1*t1))
}

tt1=qt(0.99,8)
tt2=qt(0.95,8)

a<-tom(data)
tt1
tt2

b<-a[a>tt1]
b




# ´ë¼ö¿ë°¡ --------------------------------------------------------------------


library(dplyr)
pivot_table1=summarise(group_by(data.general.big,Date.char.new),mean=mean(Usage.hourly.new))

data1<-pivot_table1$mean

t1<-ts(data1,start=c(0,1)) 
ndiffs(t1)


# t1<-as.vector(t1)
# lambda<-BoxCox.lambda(t1)
# t1<-BoxCox(t1,lambda)
t1<-diff(t1)

adf.test(t1, k=0) 


plot(t1,main="´ë¼ö¿ë°¡ ÀÏÆò±Õ ¹°»ç¿ë·®", type="l")

summary(aa1<-auto.arima(t1))

acf(t1,main="´ë¼ö¿ë°¡ ÀÏÆò±Õ ¹°»ç¿ë·®.acf")
pacf(t1,main="´ë¼ö¿ë°¡ ÀÏÆò±Õ ¹°»ç¿ë·®.pacf")
plot(density(t1),main="´ë¼ö¿ë°¡ ÀÏÆò±Õ ¹°»ç¿ë·®.density")

tsdiag(aa1)
title("´ë¼ö¿ë°¡")

fitted(aa1)



plot(forecast(aa1,h=30))
lines(fitted(aa1),col="red",lty=2,lwd=2)

s1=simulate(aa1,30)
s1

s2=simulate(aa1,30,bootstrap = T)
s2

plot(forecast(aa1,h=30))
lines(fitted(aa1),col="red",lty=2,lwd=2)


lines(s1, col="forestgreen",lwd=1)
legend("bottomleft",legend="simulation",col="forestgreen",lty=1)

plot(forecast(aa1,h=30))
lines(fitted(aa1),col="red",lty=2,lwd=2)

lines(s2, col="mediumvioletred", lwd=1)
legend("bottomleft",legend="bootstrap",col="mediumvioletred",lty=1)


# °ü±¤¾÷¼Ò --------------------------------------------------------------------

data.vaca <- cleaned.data.new1[index_vaca,] #


library(dplyr)
pivot_table2=summarise(group_by(data.vaca,Date.char.new),mean=mean(Usage.hourly.new))

data2<-pivot_table2$mean

t2<-ts(data2,start=c(0,1)) 
ndiffs(t2)

# t2<-as.vector(t2)
# lambda<-BoxCox.lambda(t2)
# t2<-BoxCox(t2,lambda)

t2<-diff(t2)
adf.test(t2, k=0) 


plot(t2,main="°ü±¤¾÷ ÀÏÆò±Õ ¹°»ç¿ë·®", type="l")

summary(aa2<-auto.arima(t2))

acf(t2,main="°ü±¤¾÷ ÀÏÆò±Õ ¹°»ç¿ë·®.acf")
pacf(t2,main="°ü±¤¾÷ ÀÏÆò±Õ ¹°»ç¿ë·®.pacf")
plot(density(t2),main="°ü±¤¾÷ ÀÏÆò±Õ ¹°»ç¿ë·®.density")

tsdiag(aa2)
title("´ë¼ö¿ë°¡")

fitted(aa2)

forecast(aa2, h=30)

plot(forecast(aa2,h=30))
lines(fitted(aa2),col="red",lty=2,lwd=2)

s1=simulate(aa2,30)
s1

s2=simulate(aa2,30,bootstrap = T)
s2

plot(forecast(aa2,h=30))
lines(fitted(aa2),col="red",lty=2,lwd=2)


lines(s1, col="forestgreen",lwd=1)
legend("bottomleft",legend="simulation",col="forestgreen",lty=1)

plot(forecast(aa1,h=30))
lines(fitted(aa1),col="red",lty=2,lwd=2)

lines(s2, col="mediumvioletred", lwd=2)
legend("bottomleft",legend="bootstrap",col="mediumvioletred",lty=1)


# ÀÏ¹İ¼ö¿ë°¡ -------------------------------------------------------------------



data.below40 <- cleaned.data.new1[-index_top40,] # 


library(dplyr)
pivot_table3=summarise(group_by(data.below40,Date.char.new),mean=mean(Usage.hourly.new))


data3<-pivot_table3$mean


data3<-data3[-429]
data3<-data3[-428]
data3<-data3[-427]

t3<-ts(data3,start=c(0,1)) 
ndiffs(t3)

# lambda<-BoxCox.lambda(t3)
# t3<-BoxCox(t3,lambda)

t3<-diff(t3)
adf.test(t3, k=0) 



plot(t3,main="ÀÏ¹İ¼ö¿ë°¡ ÀÏÆò±Õ ¹°»ç¿ë·®", type="l")

summary(aa3<-auto.arima(t3))

acf(t3,main="ÀÏ¹İ¼ö¿ë°¡ ÀÏÆò±Õ ¹°»ç¿ë·®.acf")
pacf(t3,main="ÀÏ¹İ¼ö¿ë°¡ ÀÏÆò±Õ ¹°»ç¿ë·®.pacf")
plot(density(t3),main="ÀÏ¹İ¼ö¿ë°¡ ÀÏÆò±Õ ¹°»ç¿ë·®.density")

tsdiag(aa3)
title("ÀÏ¹İ¼ö¿ë°¡")

fitted(aa3)

forecast(aa3, h=30)

plot(forecast(aa3,h=30))
lines(fitted(aa3),col="red",lty=2,lwd=2)

s1=simulate(aa3,30)
s1

s2=simulate(aa3,30,bootstrap = T)
s2

plot(forecast(aa3,h=30))
lines(fitted(aa3),col="red",lty=2,lwd=2)


lines(s1, col="forestgreen",lwd=1)
legend("bottomleft",legend="simulation",col="forestgreen",lty=1)

plot(forecast(aa3,h=30))
lines(fitted(aa3),col="red",lty=2,lwd=2)

lines(s2, col="mediumvioletred", lwd=2)
legend("bottomleft",legend="bootstrap",col="mediumvioletred",lty=1)




training <- subset(auscafe, end=length(auscafe)-61)
test <- subset(auscafe, start=length(auscafe)-60)
cafe.train <- Arima(training, order=c(2,1,1),
                    seasonal=c(0,1,2), lambda=0)
cafe.train %>%
  forecast(h=60) %>%
  autoplot() + autolayer(test)








