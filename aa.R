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

Usage.hourly. <- read.csv("Usage.hourly.csv")
type<-read.csv("customer.type.csv")
rm(Usage.hourly)
str(mm)
colnames(mm)<-c("num","mm")
str(type)
colnames(type)<-c("num2","type")
str(Usage.hourly.)
colnames(Usage.hourly.)<-c("num3","Usage.hourly.")

binddata <- cbind(cleaned.data,YYYYmm)

str(binddata)
library(dplyr)
head(binddata)
binddata[,4]<-NULL
pivot_table=summarise(group_by(binddata,YYYYmm),sumus=sum(Usage.hourly.))
str(pivot_table)
head(pivot_table)

pivot_table$sumus<-ifelse(pivot_table$sumus>2000,NA,pivot_table$sumus)
edit(pivot_table)
attach(pivot_table)
pivot_table$mm<-as.factor(mm)
str(pivot_table)
library(ggplot2)
ggplot(data = pivot_table, aes(x = YYYYmm, y = sumus, group = type, colour = type)) +
  geom_line()

binddata<-cbind(cleaned.data,mm)
str(binddata)
pivot_table=summarise(group_by(binddata,type,mm),sumus=sum(Usage.hourly.))
str(pivot_table)

setwd("C:/Users/jk000/water.usage.DB")
customer.size <- read.csv("customer.size.csv")

binddata2 <- cbind(cleaned.data,customer.size)

str(binddata2)
head(binddata2)



binddata2[,9]<-NULL
library(dplyr)
pivot_table=summarise(group_by(binddata2,Data,state),mean=mean(Usage.hourly.))

str(pivot_table)

head(pivot_table)

library(ggplot2)
attach(pivot_table)
pivot_table$YYYYmm<-as.character(YYYYmm)

ggplot(data = pivot_table, aes(x = Data, y = mean, group = state, colour = state)) +
  geom_line()

library(grid)
grid.locator()



str(cleaned.data)
cleaned.data$Usage.hourly.<-ifelse(cleaned.data$Usage.hourly.>43,NA,cleaned.data$Usage.hourly.)
sum(is.na(cleaned.data))
na.omit(cleaned.data)




ggplot(data = pivot_table, aes(x = YYYYmm, y = sumus)) +  geom_line()
