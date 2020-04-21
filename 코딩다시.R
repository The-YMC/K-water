
#상위40 index
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
# index_41<-which(Meter_ID.new=="16-005260")#  식당
# index_42<-which(Meter_ID.new=="16-006235")# 전원 주택지
# index_43<-which(Meter_ID.new=="16-005781")# 전원 주택지
# index_44<-which(Meter_ID.new=="16-006115")# 가정용 
# index_45<-which(Meter_ID.new=="16-005436")# 가정용

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


# 관광업소 
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

# 일반 대수용가 
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






cleaned.data.new<-cbind(Time.new,
                        Usage.hourly.new,
                        YYYYmm.new, 
                        temperature.new,
                        percipitation.new, 
                        holiday.new, 
                        wday.new, 
                        customer.size.new,
                        customer.state.new, 
                        customer.type.new)


cleaned.data.new<-as.data.frame(cleaned.data.new)

cleaned.data.new$holiday.new<-as.factor(cleaned.data.new$holiday.new)
cleaned.data.new$wday.new<-as.factor(cleaned.data.new$wday.new)
cleaned.data.new$customer.size.new<-as.factor(cleaned.data.new$customer.size.new)
cleaned.data.new$customer.state.new<-as.factor(cleaned.data.new$customer.state.new)
cleaned.data.new$customer.type.new<-as.factor(cleaned.data.new$customer.type.new)
cleaned.data.new$YYYYmm.new<-as.factor(cleaned.data.new$YYYYmm.new)
cleaned.data.new$Time.new<-as.factor(cleaned.data.new$Time.new)


str(cleaned.data.new)


data.general.big <- cleaned.data.new[index_general.big,] # 
data.vaca <- cleaned.data.new[index_vaca,] #
data.below40 <- cleaned.data.new[-index_top40,] # 




data.top40<-as.data.frame(data.top40)
data.vaca<-as.data.frame(data.vaca)
data.below40<-as.data.frame(data.below40)

str(data.top40)


library(dplyr)
pivot_table1=summarise(group_by(data.top40,Date.char.new),mean=mean(Usage.hourly.new))

library("forecast")
data1<-pivot_table1[,-1]
Box.test(data1)

str(data1)
str(test)

train = data1[1:419,]
test = data1[420:447,]
arma_fit <- auto.arima(train)
arma_fit
arma_forecast <- forecast(arma_fit, h = 28)



arma_fit_accuracy <- accuracy(arma_forecast, test)
arma_fit; arma_forecast; arma_fit_accuracy
plot(arma_forecast, ylim=c(0,60))
lines(tdat[1:36])