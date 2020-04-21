library(rpart) 

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

hdata<-data.top40

library(rpart) 
n <- dim(hdata)[1] 
set.seed(10) 
train <- sample(n, n/2) 
hfit <- rpart(Usage.hourly.new ~ ., data = hdata, subset = train, method = "class", control = rpart.control(minsplit = 100))


str(hfit)

plot(hfit,xpd = NA) 
text(hfit,use.n=T,all=TRUE, cex=.7) 

library(partykit)


a <- as.party(hfit)
plot(a)

cp.opt <- hfit$cptable[which.min(hfit$cptable[, "xerror"]), "CP"] 
cp.opt

prune.h <- prune(hfit, cp = cp.opt) # ap<-as.party(prune.h) plot(ap)


library(dplyr) 
out.data<- data %>%   # data데이터프레임을 변형할 것이고, 변형을 완료한 결과를 out.data에 저장하겠다는 의미다. 
  group_by(Date) %>% #같은 날짜를 가진 관측치끼리 한 그룹으로 모은다.총 447(날짜의 수)개의 그룹으로 나뉜다. 
  summarise(sum=sum(Usage.hourly), mean=mean(Usage.hourly)) # 같은 그룹으로 묶인 데이터끼리 우측 연산을 수행한다. 
# 가령 방금 예시의 경우, 동일한 날짜를 가지는 관측치들의  사용량을 다 더해서 sum변수에 집어넣을 수도 있고, 
# 동일한 날짜를 가지는 관측치들의 사용량을 mean으로 구할 수도 있다. 



library(rpart)
fit <- rpart(log(mean.use+0.1)~., 
             method="class",data=data2)



printcp(fit)
plot(fit)

library(tree)
htree <- tree(mean~., data2[-train,2:4], subset=train)
summary(htree)
plot(htree)
text(htree, all = T)
htree







