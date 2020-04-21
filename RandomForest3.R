data.below40 <- cleaned.data.new[-index_top40,] # 

head(data.below40)
str(data.below40)
nrow(data.below40)
#188888

# below40 세밀하게 만들기

# 대수용가 세밀하게 만들기 -------------------------------------------------------------
length(cleaned.data.new[index_below40,])
tmp3 <- cleaned.data.new[index_below40,]$Usage.hourly.new[Usage.hourly.new>0 & Usage.hourly.new<10]
tmp3 <- data.below40$Usage.hourly.new[Usage.hourly.new>0 & Usage.hourly.new<10]
length(tmp3)

#전체에서 0인 데이터 갯수
length(Usage.hourly.new[Usage.hourly.new==0])
#9204966

#일반수용가에서 0인 데이터 갯수
head(data.below40)
length(which(data.below40$Usage.hourly.new==0.000))
#9100870

str(data.below40)


# length(data.below40)
#188888

9100870/15476697
#0.58

#below40 데이터의 0.58이 0 

#0제외하고 summary보자
index_below40.zero<-which(data.below40$Usage.hourly.new==0)
index_below40.zero

data_below40.time.usage.exceptzero<-data.below40[-index_below40.zero,]

head(data_below40.time.usage.exceptzero)
summary(data_below40.time.usage.exceptzero$Usage.hourly.new)

#0
#0.006 : 1st quantile
#0.015 : median
#0.038 : 3rd quantile

data.below40$Usage.category<-ifelse(data.below40$Usage.hourly.new==0,"Z",
                                 ifelse(data.below40$Usage.hourly.new>0 & data.below40$Usage.hourly.new<=0.006,"TL",
                                        ifelse(data.below40$Usage.hourly.new>0.006 & data.below40$Usage.hourly.new<=0.015,"L",
                                               ifelse(data.below40$Usage.hourly.new>0.0015 & data.below40$Usage.hourly.new<=0.038,"M","TM"
                                               ))))

#data.below40$Usage.category<-ifelse(data.below40$Usage.hourly.new==0,"Z",
#                                        ifelse(data.below40$Usage.hourly.new>0 & data.below40$Usage.hourly.new<=0.003,"L",
#                                               ifelse(data.below40$Usage.hourly.new>0.003 & data.below40$Usage.hourly.new<=0.05,"N","M"
#                                                     )))

#data.below40$Usage.category<-ifelse(data.below40$Usage.hourly.new<=0.012,"L",
#                                        ifelse(data.below40$Usage.hourly.new>0.012 & data.below40$Usage.hourly.new<=0.037,"N","M"
#                                        ))

data.below40$Usage.category<-as.factor(data.below40$Usage.category)
head(data.below40)
str(data.below40)

# party package로 tree구성하기 -------------------------------------------------
#install.packages("party")
library(party)
library(caret)
head(data.below40)
set.seed(123)
index_stra3<-createDataPartition(data.below40$Usage.category,p=0.1,list=FALSE)
head(index_stra3)

str(data.below40)

sum(is.na(data.below40))

set.seed(123)
head(data.below40)
party_model3<-ctree(Usage.category ~ .,
                    data = data.below40[index_stra3,-c(1,5,6,7,8,10,11)],
                    controls = ctree_control(minsplit=400000,mtry=3))
#party_model3<-ctree(Usage.category ~ .,data = data.below40[,-c(1,2,3,4,5,6,10)],controls = ctree_control(minsplit=28000,mtry=3))
plot(party_model3,cex=0.1)


# 0 빼고 모델 구성 --------------------------------------------------------------
head(data.below40)
index_below40.zero<-which(data.below40$Usage.hourly.new=="0")
head(index_below40.zero)

data.below40.exceptzero<-data.below40[-index_below40.zero,]


data.below40.exceptzero$Usage.category<-ifelse(data.below40.exceptzero$Usage.hourly.new<=0.012,"L",
                                            ifelse(data.below40.exceptzero$Usage.hourly.new>0.012 & data.below40.exceptzero$Usage.hourly.new<=0.037,"N","M"
                                            ))

data.below40.exceptzero$Usage.category<-as.factor(data.below40.exceptzero$Usage.category)
head(data.below40.exceptzero)
str(data.below40.exceptzero)

head(data.below40.exceptzero)
set.seed(123)

index_stra3<-createDataPartition(data.below40$Usage.category,p=0.01,list=FALSE)
str(index_stra3)
head(index_stra3)
head(data.below40[index_stra3,])


#data.below40$Usage.category<-ifelse(data.below40$Usage.hourly.new==0,0,
#                                        ifelse(data.below40$Usage.hourly.new>0 & data.below40$Usage.hourly.new<=0.019,1,
#                                               ifelse(data.below40$Usage.hourly.new>0.019 & data.below40$Usage.hourly.new<=0.066,2,
#                                                      ifelse(data.below40$Usage.hourly.new>0.066 & data.below40$Usage.hourly.new<=0.158,3,4
#                                                      ))))
#data.below40$Usage.category<-as.factor(data.below40$Usage.category)

head(data.below40)
str(data.below40)

#party_model<-ctree(Usage.category ~ .,data = data.below40[index_stra3,-c(1,2,5,6,7,8,9,11)])
#plot(party_model)
#str(party_model)
str(data.below40[index_stra3,])
str(data.below40)

set.seed(123)

str(data.below40)
head(data.below40)
party_model3<-ctree(Usage.category ~ .,
                    data =data.below40[index_stra3,-c(1,2,3,8,9,10,11)],
                    controls = ctree_control(minsplit=5000,mtry=3))

plot(party_model3, cex=0.01)

# 예측률 계산 ------------------------------------------------------------------

party_pred3<-predict(party_model3,data.below40[-index_stra3,-c(2,3,8,9,10,11)])
str(data.below40)
confusionMatrix(party_pred3,data.below40[-index_stra3,12])
head(party_pred3)

data.below40$Usage.category <- factor(data.below40$Usage.category, levels=
                           c("Z","TL","L","M","TM"))
#randomforest
library(randomForest)

str(data.below40)
model_randomforest3<-randomForest(Usage.category~.,data=data.below40[index_stra3,-2])
model_randomforest3

importance(model_randomforest3)

plot(model_randomforest3)
