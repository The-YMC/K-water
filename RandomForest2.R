head(data.vaca)
str(data.vaca)
nrow(data.vaca)
#188888

# vaca 세밀하게 만들기

# 대수용가 세밀하게 만들기 -------------------------------------------------------------
length(cleaned.data.new[index_vaca,])
tmp2 <- cleaned.data.new[index_vaca,]$Usage.hourly.new[Usage.hourly.new>0 & Usage.hourly.new<10]
tmp2 <- data.vaca$Usage.hourly.new[Usage.hourly.new>0 & Usage.hourly.new<10]
length(tmp2)

#전체에서 0인 데이터 갯수
length(Usage.hourly.new[Usage.hourly.new==0])
#9204966

#관광업소에서 0인 데이터 갯수
head(data.vaca)
length(which(data.vaca$Usage.hourly.new==0.000))
#45737

length(index_vaca)
#188888

45737/188888
#vaca 데이터의 1/4이 0 

#0제외하고 summary보자
index_vaca.zero<-which(data.vaca$Usage.hourly.new==0)
index_vaca.zero

data_vaca.big.time.usage.exceptzero<-data.vaca[-index_vaca.zero,]

head(data_vaca.big.time.usage.exceptzero)
summary(data_vaca.big.time.usage.exceptzero$Usage.hourly.new)

#0
#0.025 : 1st quantile
#0.154 : median
#0.18 : 3rd quantile

data.vaca$Usage.category<-ifelse(data.vaca$Usage.hourly.new==0,"Z",
                                        ifelse(data.vaca$Usage.hourly.new>0 & data.vaca$Usage.hourly.new<=0.025,"TL",
                                               ifelse(data.vaca$Usage.hourly.new>0.025 & data.vaca$Usage.hourly.new<=0.154,"L",
                                                      ifelse(data.vaca$Usage.hourly.new>0.154 & data.vaca$Usage.hourly.new<=0.18,"M","TM"
                                                      ))))

#data.vaca$Usage.category<-ifelse(data.vaca$Usage.hourly.new==0,"Z",
#                                        ifelse(data.vaca$Usage.hourly.new>0 & data.vaca$Usage.hourly.new<=0.003,"L",
#                                               ifelse(data.vaca$Usage.hourly.new>0.003 & data.vaca$Usage.hourly.new<=0.05,"N","M"
#                                                     )))

#data.vaca$Usage.category<-ifelse(data.vaca$Usage.hourly.new<=0.012,"L",
#                                        ifelse(data.vaca$Usage.hourly.new>0.012 & data.vaca$Usage.hourly.new<=0.037,"N","M"
#                                        ))

data.vaca$Usage.category<-as.factor(data.vaca$Usage.category)
head(data.vaca)
str(data.vaca)

# party package로 tree구성하기 -------------------------------------------------
#install.packages("party")
library(party)

head(data.vaca)
set.seed(123)
index_stra<-createDataPartition(data.vaca$Usage.category,p=0.1,list=FALSE)
head(index_stra)

set.seed(123)
party_model2<-ctree(Usage.category ~ .,data = data.vaca[index_stra,-c(2,3,8,9,10,11)],controls = ctree_control(minsplit=4500,mtry=3))
#party_model2<-ctree(Usage.category ~ .,data = data.vaca[,-c(1,2,3,4,5,6,10)],controls = ctree_control(minsplit=28000,mtry=3))
plot(party_model2)


# 0 빼고 모델 구성 --------------------------------------------------------------
head(data.vaca)
index_vaca.zero<-which(data.vaca$Usage.hourly.new=="0")
head(index_vaca.zero)

data.vaca.exceptzero<-data.vaca[-index_vaca.zero,]


data.vaca.exceptzero$Usage.category<-ifelse(data.vaca.exceptzero$Usage.hourly.new<=0.012,"L",
                                                   ifelse(data.vaca.exceptzero$Usage.hourly.new>0.012 & data.vaca.exceptzero$Usage.hourly.new<=0.037,"N","M"
                                                   ))

data.vaca.exceptzero$Usage.category<-as.factor(data.vaca.exceptzero$Usage.category)
head(data.vaca.exceptzero)
str(data.vaca.exceptzero)

head(data.vaca.exceptzero)
set.seed(123)
index_stra<-createDataPartition(data.vaca.exceptzero$Usage.category,p=0.1,list=FALSE)
head(index_stra)
head(data.vaca[index_stra,])


#data.vaca$Usage.category<-ifelse(data.vaca$Usage.hourly.new==0,0,
#                                        ifelse(data.vaca$Usage.hourly.new>0 & data.vaca$Usage.hourly.new<=0.019,1,
#                                               ifelse(data.vaca$Usage.hourly.new>0.019 & data.vaca$Usage.hourly.new<=0.066,2,
#                                                      ifelse(data.vaca$Usage.hourly.new>0.066 & data.vaca$Usage.hourly.new<=0.158,3,4
#                                                      ))))
#data.vaca$Usage.category<-as.factor(data.vaca$Usage.category)

head(data.vaca)
str(data.vaca)

#party_model<-ctree(Usage.category ~ .,data = data.vaca[index_stra,-c(1,2,5,6,7,8,9,11)])
#plot(party_model)
#str(party_model)

set.seed(123)
head(data.vaca)
party_model2<-ctree(Usage.category ~ .,data =data.vaca[index_stra,-c(2,3,8,9,10,11)],controls = ctree_control(minsplit=4500,mtry=3))
plot(party_model2)

# 예측률 계산 ------------------------------------------------------------------

party_pred2<-predict(party_model2,data.vaca[-index_stra,-c(2,3,8,9,10,11)])
str(data.vaca)
confusionMatrix(party_pred2,data.vaca[-index_stra,12])
head(party_pred2)


#randomforest
library(randomForest)

str(data.vaca)
model_randomforest2<-randomForest(Usage.category~.,data=data.vaca[index_stra,-2])
model_randomforest2

importance(model_randomforest2)


plot(model_randomforest2)
