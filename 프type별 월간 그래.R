setwd("C:/Users/jk000/Documents")

cleaned.data <- read.csv("cleaned.data.csv")

attach(cleaned.data)

str(cleaned.data)


str(cleaned.data)
library("dplyr")
set.seed(0)
df<-data.frame(key1=da)


?summarise
x=summarise(group_by(cleaned.data,Data),sumus=sum(Usage.hourly.))
x

plot(x)

edit(x)


xx<-x[-(62:66),]
xx

edit(xx)

attach(xxx)
str(xx)

library("ggplot2")

xx$Data<-as.factor(Data)

ggplot(data=xx, aes(x=Data, y=sumus))

plot(xx, type="l")

??plot

head(xxx)

########################################################################
library(reshape2)
library("dplyr")

str(cleaned.data)

xxx=summarise(group_by(cleaned.data,type,Data),sumus=sum(Usage.hourly.))
xxx$Data<-ifelse(xxx$sumus>2000,NA,xxx$Data)
attach(xxx)
xxx$Data<-as.factor(Data)
xxx<-xxx[-(62:66),]
xxx<-xxx[-88,]
xxx<-xxx[-432,]
edit(xxx)

str(cleaned.data)


plot(xxx, type="l", col="blue")
lines(xxx$sumus,type="l",pch=23, lty=1, col="blue")

abline(h=mean(xxx$sumus), col="red")
mean(xxx$sumus)
edit(xxx)
abline(v=xxx$Data[xxx$Data==20170102], col="green")

abline(v=200, col="green")
abline(v=303, col="green")
abline(v=364, col="green")


edit(cleaned.data)

cleaned.data$YYYYmm <- NA
cleaned.data$YYYYmm <- as.factor(substr(cleaned.data$Data,1,6))


library(dplyr)
monthly.data <- cleaned.data %>% 
  select(c("Meter_ID","Data","Usage.hourly.","type","state","YYYYmm")) %>% 
  group_by(YYYYmm) %>% 
  mutate(monthly.use=mean(Usage.hourly.))

plot(x=monthly.data$YYYYmm,as.character(monthly.data$monthly.use), type="b", xaxt="n")
axis(1, at=1:15, labels=unique(monthly.data$YYYYmm),tick=rep(1:15), padj=1)

#극단치 제거
top8<- head(order(monthly.data$Usage.hourly., decreasing=T),8)
plot(x=monthly.data[-top8,]$YYYYmm,as.character(monthly.data[-top8,]$monthly.use), type="b", xaxt="n")
axis(1, at=1:15, labels=unique(monthly.data$YYYYmm),tick=rep(1:15), padj=1)


customer <- read.csv("customer_info_final.csv")

colnames(customer) <- c("n","수용가번호","Meter_ID","addr","소블럭","type","size","state")
cleaned.data <- merge(cleaned.data,customer[,c(3,6,7,8)],  by = "Meter_ID",all.x=T)


setwd("C:/Users/jk000/Documents/2. 물사용 패턴 분석을 통한 물 수요량 예측")
write.csv(cleaned.data, "cleaned.data.csv")

head(pivot_table)

pivot_table=summarise(group_by(cleaned.data,type,Data),sumus=sum(Usage.hourly.))
pivot_table$sumus<-ifelse(pivot_table$sumus>2000,NA,pivot_table$sumus)
edit(pivot_table)
attach(pivot_table)
pivot_table$Data<-as.factor(Data)

ggplot(data = pivot_table, aes(x = Data, y = sumus, group = type, colour = type)) +
  geom_line()

# pivot_table<-pivot_table[-(62:66),]
# pivot_table<-pivot_table[-88,]
# pivot_table<-pivot_table[-432,]

library(ggplot2)
ggplot(data = pivot_table, aes(x = Data, y = sumus, group = type, colour = type)) +
  geom_line()

library(grid)
grid.locator()

which.max(pivot_table$sumus)

setwd("C:/Users/jk000/water.usage.DB")

YYYYmm <- read.csv("YYYYmm.csv")


percipitation <- read.csv("percipitation.csv")
str(percipitation)
head(percipitation)

Usage.hourly. <- read.csv("Usage.hourly.csv")
type<-read.csv("customer.type.csv")
rm(Usage.hourly)
str(YYYYmm)
colnames(YYYYmm)<-c("num","YYYYmm")
str(type)
colnames(type)<-c("num2","type")
str(Usage.hourly.)
colnames(Usage.hourly.)<-c("num3","Usage.hourly.")

binddata <- cbind(Usage.hourly.,mm,type)

str(binddata)
library(dplyr)
pivot_table=summarise(group_by(binddata,type,mm),sumus=sum(Usage.hourly.))
str(pivot_table)
head(pivot_table)

pivot_table$sumus<-ifelse(pivot_table$sumus>2000,NA,pivot_table$sumus)
edit(pivot_table)
attach(pivot_table)
pivot_table$mm<-as.factor(mm)
str(pivot_table)
library(ggplot2)
ggplot(data = pivot_table, aes(x = mm, y = sumus, group = type, colour = type)) +
  geom_line()

binddata<-cbind(cleaned.data,YYYYmm)
str(binddata)
library(dplyr)
pivot_table=summarise(group_by(binddata,type,YYYYmm),sum=sum(Usage.hourly.))
str(pivot_table)
head(pivot_table)
library(ggplot2)
ggplot(data = pivot_table, aes(x = YYYYmm, y = sum, group = type, colour = type)) +
  geom_line()

attach(pivot_table)
str(pivot_table)
pivot_table$YYYYmm<-as.factor(YYYYmm)
rm(cleaned.data)
rm(YYYYmm)
rm(xxx)

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

head(index_top40)



  
data.top40 <- data[index_top40,] # 
data.below40 <- data[-index_top40,] # 


