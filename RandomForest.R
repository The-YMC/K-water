#setwd("C:\\Rpath\\water\\data.new - 극단치 제거\\data.new - 극단치 제거")
#setwd("C:\\r_temp\\water\\data.new - 극단치 제거\\data.new - 극단치 제거")
customer.size.new<-read.csv("customer.size.new.csv")
head(customer.size.new)
colnames(customer.size.new)<-c("x","customer.size.new")

customer.state.new<-read.csv("customer.state.new.csv")
head(customer.state.new)
colnames(customer.state.new)<-c("x","customer.state.new")

customer.type.new<-read.csv("customer.type.new.csv")
head(customer.type.new)
colnames(customer.type.new)<-c("x","customer.type.new")

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
                        customer.type.new,
                        Date.char.new)

# head(cleaned.data.new)
# cleaned.data.new$Usage.hourly.new[c(1:120)]
head(cleaned.data.new)
cleaned.data.new<-data.frame(cleaned.data.new)


cleaned.data.new<-cleaned.data.new[,-c(6,8,10)]

cleaned.data.new<-as.data.frame(cleaned.data.new)



cleaned.data.new$holiday.new<-as.factor(cleaned.data.new$holiday.new)
cleaned.data.new$wday.new<-as.factor(cleaned.data.new$wday.new)
cleaned.data.new$customer.size.new<-as.factor(cleaned.data.new$customer.size.new)
cleaned.data.new$customer.state.new<-as.factor(cleaned.data.new$customer.state.new)
cleaned.data.new$customer.type.new<-as.factor(cleaned.data.new$customer.type.new)
cleaned.data.new$YYYYmm.new<-as.factor(cleaned.data.new$YYYYmm.new)
cleaned.data.new$Time.new<-as.factor(cleaned.data.new$Time.new)



cleaned.data.new$Time<-ifelse(cleaned.data.new$Time.new=="1"|cleaned.data.new$Time.new=="2"|cleaned.data.new$Time.new=="3"|cleaned.data.new$Time.new=="4"|cleaned.data.new$Time.new=="5"|cleaned.data.new$Time.new=="6",0,
                              ifelse(cleaned.data.new$Time.new=="7"|cleaned.data.new$Time.new=="8"|cleaned.data.new$Time.new=="9"|cleaned.data.new$Time.new=="10"|cleaned.data.new$Time.new=="11"|cleaned.data.new$Time.new=="12",1,
                                     ifelse(cleaned.data.new$Time.new=="13"|cleaned.data.new$Time.new=="14"|cleaned.data.new$Time.new=="15"|cleaned.data.new$Time.new=="16"|cleaned.data.new$Time.new=="17"|cleaned.data.new$Time.new=="18",2,3)))

cleaned.data.new$YYYYmm<-ifelse(cleaned.data.new$YYYYmm=="201610"|cleaned.data.new$YYYYmm=="201611"|cleaned.data.new$YYYYmm=="201612",0,
                                ifelse(cleaned.data.new$YYYYmm=="201701"|cleaned.data.new$YYYYmm=="201702"|cleaned.data.new$YYYYmm=="201703",1,
                                       ifelse(cleaned.data.new$YYYYmm=="201704"|cleaned.data.new$YYYYmm=="201705"|cleaned.data.new$YYYYmm=="201706",2,
                                              ifelse(cleaned.data.new$YYYYmm=="201707"|cleaned.data.new$YYYYmm=="201808"|cleaned.data.new$YYYYmm=="201809",3
                                                     ,4))))


cleaned.data.new$Time.new<-NULL
cleaned.data.new$YYYYmm.new<-NULL

str(cleaned.data.new)
cleaned.data.new$YYYYmm.new<-as.factor(cleaned.data.new$YYYYmm)
cleaned.data.new$Time.new<-as.factor(cleaned.data.new$Time)



cleaned.data.new$YYYYmm<-as.factor(cleaned.data.new$YYYYmm)



str(cleaned.data.new)


# 시간별 강수량,기온,습도 붙이기 -------------------------------------------------------
head(cleaned.data.new)

library(stringr)
cleaned.data.new$Date.Time<-str_c(cleaned.data.new$Date.char.new,cleaned.data.new$Time.new)
head(cleaned.data.new)
cleaned.data.new$Usage.hourly.new[c(1:120)]
#cleaned.data.new[c(1:10),]

#climate<-read.csv("climate.csv")
#climate<-climate[,c(7,4,5,6)]
head(climate)

#cleaned.data.new<-cleaned.data.new[,-c(4,5)]
#head(cleaned.data.new)
cleaned.data.new$Usage.hourly.new[c(1:120)]
cleaned.data.new$Usage.hourly.new<-as.numeric(cleaned.data.new$Usage.hourly.new)
str(cleaned.data.new)
head(cleaned.data.new)

cleaned.data.new.tmp<-cleaned.data.new[,c(2,12)]
cleaned.data.new.tmp$Usage.hourly.new[c(1:120)]
str(cleaned.data.new.tmp)

head(cleaned.data.new.tmp)
head(climate)
str(climate)
climate$Date.Time<-as.character(climate$Date.Time)

library(dplyr)

cleaned.data.new.tmp<-left_join(cleaned.data.new.tmp, climate, by = "Date.Time")
#cleaned.data.new.tmp<-merge(cleaned.data.new.tmp,climate,by="Date.Time",all.x=T)

sum(is.na(cleaned.data.new.tmp))
55788/3
#edit(cleaned.data.new.tmp)



head(cleaned.data.new.tmp)
cleaned.data.new.tmp$Usage.hourly.new[c(1:120)]

cleaned.data.new.tmp$Usage.hourly.new<-as.numeric(cleaned.data.new.tmp$Usage.hourly.new)
cleaned.data.new.tmp$Usage.hourly.new[c(1:120)]

head(cleaned.data.new.tmp)

head(cleaned.data.new)
head(cleaned.data.new.tmp)
cleaned.data.new<-cbind(cleaned.data.new[,c(1,4,5,6,7,8,9,10,11)],cleaned.data.new.tmp)

head(cleaned.data.new)
sum(is.na(cleaned.data.new))
#55788
cleaned.data.new<-na.omit(cleaned.data.new)

str(cleaned.data.new)
cleaned.data.new<-cleaned.data.new[,-11]
sum(is.na(cleaned.data.new))

head(cleaned.data.new)

#cleaned.data.new<-na.omit(cleaned.data.new)



# 대수용가,관광업소,가정 규정 ---------------------------------------------------------

data.general.big <- cleaned.data.new[index_general.big,] #
head(data.general.big)
data.vaca <- cleaned.data.new[index_vaca,] #
data.below40 <- cleaned.data.new[-index_top40,] # 



data.general.big<-as.data.frame(data.general.big)
data.top40<-as.data.frame(data.top40)
data.vaca<-as.data.frame(data.vaca)
data.below40<-as.data.frame(data.below40)

# 종속변수 갯수에 따른 분할 ----------------------------------------------------------

head(data.general.big)
library(caret)
index_stra<-createDataPartition(data.general.big$Usage.hourly.new,p=0.1, list=FALSE)
head(index_stra)
head(data.general.big[index_stra,])

n <- dim(data.general.big[index_stra,])[1] ;n
set.seed(10)
train <- sample(n, n/10)

str(data.general.big)
#23018개로 해보자
hfit <- rpart(Usage.hourly.new ~ ., data = data.general.big, method = "class", control = rpart.control(minsplit = 100,minbucket = 100,cp=0.1))
plot(hfit)
#2301개로 해보자
hfit <- rpart(Usage.hourly.new ~ ., data = data.general.big, subset = train, method = "class", control = rpart.control(minsplit = 100,minbucket = 100,cp=0.1))
plot(hfit)


#tree함수
library(tree)
treemodel1<-tree(Usage.hourly.new ~ ., data=data.general.big[index_stra,])

plot(treemodel1)
text(treemodel1)

#customer.size.new , customer.state.new, customer.type.new, YYYYmm제거

treemodel1<-tree(Usage.hourly.new ~ ., data=data.general.big[index_stra,-c(8,9,10,12)])
str(treemodel1)
plot(treemodel1)

#rpart함수이용
hfit <- rpart(Usage.hourly.new ~ ., data = data.general.big[index_stra,-c(8,9,10,12)], method = "class", control = rpart.control(minsplit = 100,cp=0.1))

plot(hfit)

# 대수용가 세밀하게 만들기 -------------------------------------------------------------
length(cleaned.data.new[index_general.big,])
tmp2 <- cleaned.data.new[index_general.big,]$Usage.hourly.new[Usage.hourly.new>0 & Usage.hourly.new<10]
tmp2 <- data.general.big$Usage.hourly.new[Usage.hourly.new>0 & Usage.hourly.new<10]
length(tmp2)
head(tmp2)
str(tmp2)


hist(tmp2)

h2 <- hist(tmp2, breaks = 1000000, plot=FALSE)
h2$counts=h2$counts/sum(h2$counts)
plot(h2, 
     xlim = c(0,0.5),
     # xlim = c(0,1), # 다양한 범위를 시도해보아라. 플랏 모양이 달라진다. 
     # xlim = c(0,0.4),
     # xlim = c(0,0.3),
     # xlim = c(0,0.1),
     main="데이터의 약 25.3%가 0인 값을 가졌다", 
     xlab="Usage.hourly", 
     ylab="Proportion",
     col="grey70")

#대수용가의 물사용량

#head(Usage.hourly.new[index_general.big,])
#head(Usage.hourly.new)

#전체에서 0인 데이터 갯수
length(Usage.hourly.new[Usage.hourly.new==0])
#9204966

#대수용가에서 0인 데이터 갯수
data.general.big$Usage.hourly.new[c(1:2000)]
head(cleaned.data.new)
head(data.general.big)
#data_general.big.time.usage<-cleaned.data.new[index_general.big,c(9,10)]
#head(data_general.big.time.usage)
length(which(data.general.big$Usage.hourly.new==0.000))
#58359

head(data.general.big)
head(data.general.big[,c(9,10)])



#58359

length(index_general.big)
#230174

58359/230174
133538/230174
#대수용가 데이터의 1/4이 0 

#기준 추출
head(data_general.big.time.usage)
summary(data.general.big$Usage.hourly.new)

#0제외하고 summary보자
index_general.big.zero<-which(data.general.big$Usage.hourly.new==0)
index_general.big.zero

data_general.big.time.usage.exceptzero<-data.general.big[-index_general.big.zero,]

head(data_general.big.time.usage.exceptzero)
summary(data_general.big.time.usage.exceptzero$Usage.hourly.new)

#0
#0.019 : 1st quantile
#0.066 : median
#0.158 : 3rd quantile

#head(data.general.big)
#length(which(data.general.big$Usage.hourly.new>0.019 & data.general.big$Usage.hourly.new<=0.066))
#length(which(data.general.big$Usage.hourly.new>0.066 & data.general.big$Usage.hourly.new<=0.158))
#length(which(data.general.big$Usage.hourly.new>0.158))

#head(data.general.big)
#length(which(data.general.big$Usage.hourly.new>0.006 & data.general.big$Usage.hourly.new<=0.015))
#23755
#length(which(data.general.big$Usage.hourly.new>0.015 & data.general.big$Usage.hourly.new<=0.039))
#23176
#length(which(data.general.big$Usage.hourly.new>0.039))
#23654

#index_general.big.zero<-which(data_general.big.time.usage$Usage.hourly.new==0)  
#index_general.big.below1stquantile.exceptzero<-which(data_general.big.time.usage$Usage.hourly.new>0 & data_general.big.time.usage$Usage.hourly.new<=0.019)
#index_general.big.below.median<-which(data_general.big.time.usage$Usage.hourly.new>0.019 & data_general.big.time.usage$Usage.hourly.new<=0.066)
#index_general.big.below3rdquantile<-which(data_general.big.time.usage$Usage.hourly.new>0.066 & data_general.big.time.usage$Usage.hourly.new<=0.158)
#index_general.big.upper3rdquantile<-which(data_general.big.time.usage$Usage.hourly.new>0.158)

data.general.big$Usage.category<-ifelse(data.general.big$Usage.hourly.new==0,"Z",
                                                  ifelse(data.general.big$Usage.hourly.new>0 & data.general.big$Usage.hourly.new<=0.019,"TL",
                                                         ifelse(data.general.big$Usage.hourly.new>0.019 & data.general.big$Usage.hourly.new<=0.066,"L",
                                                                ifelse(data.general.big$Usage.hourly.new>0.066 & data.general.big$Usage.hourly.new<=0.158,"M","TM"
                                                                ))))

#data.general.big$Usage.category<-ifelse(data.general.big$Usage.hourly.new==0,"Z",
#                                        ifelse(data.general.big$Usage.hourly.new>0 & data.general.big$Usage.hourly.new<=0.003,"L",
#                                               ifelse(data.general.big$Usage.hourly.new>0.003 & data.general.big$Usage.hourly.new<=0.05,"N","M"
#                                                     )))

#data.general.big$Usage.category<-ifelse(data.general.big$Usage.hourly.new<=0.012,"L",
#                                        ifelse(data.general.big$Usage.hourly.new>0.012 & data.general.big$Usage.hourly.new<=0.037,"N","M"
#                                        ))

data.general.big$Usage.category<-as.factor(data.general.big$Usage.category)
head(data.general.big)
str(data.general.big)

# party package로 tree구성하기 -------------------------------------------------
#install.packages("party")
library(party)

head(data.general.big)
set.seed(123)
index_stra<-createDataPartition(data.general.big$Usage.category,p=0.1,list=FALSE)
head(index_stra)
head(data.general.big[index_stra,])


#data.general.big$Usage.category<-ifelse(data.general.big$Usage.hourly.new==0,0,
#                                        ifelse(data.general.big$Usage.hourly.new>0 & data.general.big$Usage.hourly.new<=0.019,1,
#                                               ifelse(data.general.big$Usage.hourly.new>0.019 & data.general.big$Usage.hourly.new<=0.066,2,
#                                                      ifelse(data.general.big$Usage.hourly.new>0.066 & data.general.big$Usage.hourly.new<=0.158,3,4
#                                                      ))))
#data.general.big$Usage.category<-as.factor(data.general.big$Usage.category)

head(data.general.big)
str(data.general.big)

#party_model<-ctree(Usage.category ~ .,data = data.general.big[index_stra,-c(1,2,5,6,7,8,9,11)])
#plot(party_model)
#str(party_model)
install.packages("party")
library(party)
set.seed(123)
party_model1<-ctree(Usage.category ~ .,data = data.general.big[index_stra,-c(2,3,8,9,10,11)],controls = ctree_control(minsplit=4500,mtry=3))
party_model2<-ctree(Usage.category ~ .,data = data.general.big[,-c(1,2,3,4,5,6,10)],controls = ctree_control(minsplit=28000,mtry=3))
plot(party_model1)


# 0 빼고 모델 구성 --------------------------------------------------------------
head(data.general.big)
index_general.big.zero<-which(data.general.big$Usage.hourly.new=="0")
head(index_general.big.zero)

data.general.big.exceptzero<-data.general.big[-index_general.big.zero,]


data.general.big.exceptzero$Usage.category<-ifelse(data.general.big.exceptzero$Usage.hourly.new<=0.012,"L",
                                                   ifelse(data.general.big.exceptzero$Usage.hourly.new>0.012 & data.general.big.exceptzero$Usage.hourly.new<=0.037,"N","M"
                                                   ))

data.general.big.exceptzero$Usage.category<-as.factor(data.general.big.exceptzero$Usage.category)
head(data.general.big.exceptzero)
str(data.general.big.exceptzero)

head(data.general.big.exceptzero)
set.seed(123)
index_stra<-createDataPartition(data.general.big.exceptzero$Usage.category,p=0.1,list=FALSE)
head(index_stra)
head(data.general.big[index_stra,])


#data.general.big$Usage.category<-ifelse(data.general.big$Usage.hourly.new==0,0,
#                                        ifelse(data.general.big$Usage.hourly.new>0 & data.general.big$Usage.hourly.new<=0.019,1,
#                                               ifelse(data.general.big$Usage.hourly.new>0.019 & data.general.big$Usage.hourly.new<=0.066,2,
#                                                      ifelse(data.general.big$Usage.hourly.new>0.066 & data.general.big$Usage.hourly.new<=0.158,3,4
#                                                      ))))
#data.general.big$Usage.category<-as.factor(data.general.big$Usage.category)

head(data.general.big)
str(data.general.big)

#party_model<-ctree(Usage.category ~ .,data = data.general.big[index_stra,-c(1,2,5,6,7,8,9,11)])
#plot(party_model)
#str(party_model)

set.seed(123)
head(data.general.big.exceptzero)
party_model1<-ctree(Usage.category ~ .,data = data.general.big.exceptzero[,-c(5,7,8,10)],controls = ctree_control(minsplit=35000,mtry=3))
party_model2<-ctree(Usage.category ~ .,data = data.general.big[,-c(1,2,3,4,5,6,10)],controls = ctree_control(minsplit=28000,mtry=3))
plot(party_model1)


# 0 빼고 모델 구성 --------------------------------------------------------------
head(data.general.big)
index_general.big.zero<-which(data.general.big$Usage.hourly.new=="0")
head(index_general.big.zero)

data.general.big.exceptzero<-data.general.big[-index_general.big.zero,]


data.general.big.exceptzero$Usage.category<-ifelse(data.general.big.exceptzero$Usage.hourly.new<=0.012,"L",
                                                   ifelse(data.general.big.exceptzero$Usage.hourly.new>0.012 & data.general.big.exceptzero$Usage.hourly.new<=0.037,"N","M"
                                                   ))

data.general.big$Usage.category<-as.factor(data.general.big$Usage.category)
head(data.general.big)
str(data.general.big)












# 예측률 계산 ------------------------------------------------------------------

#head(data.general.big[index_stra,-c(1,2,5,6,7,8,9,11)])
#head(data.general.big[-index_stra,-c(1,2,5,6,7,8,9,11)])

party_pred2<-predict(party_model1,data.general.big[-index_stra,-c(2,3,8,9,10,11)])
str(data.general.big)
confusionMatrix(party_pred2,data.general.big[-index_stra,12])
head(party_pred2)



#str(party_model2)
#set.seed(123)
#party_model3<-ctree(Usage.category ~ .,data = data.general.big[,-c(1,2,3,8,9,10)])
#plot(party_model3)
#str(party_model3)


#randomforest
library(randomForest)


#data.general.big[index_stra,-c(1,2,3,8,9,10)]
head(data.general.big[index_stra,-c(2,3,8,9,10,11)])
head(data.general.big[index_stra,13])
sum(is.na(data.general.big))

str(data.general.big)
model_randomforest<-randomForest(Usage.category~.,data=data.general.big[index_stra,-c(2,3,8,9,10,11)])
model_randomforest2<-randomForest(Usage.category~.,data=data.general.big[index_stra,-c(2,3,8,9,10,11)])
importance(model_randomforest)


