library(ISLR)
head(Default)
n <- dim(Default)[1]
set.seed(1)
train <- sample(1:n, n/2)
default.train <- Default[train,]
default.test <- Default[-train,]


nl <- nlevels(default.train[,1])
mu <- list()
S <- list()
pro <- list()
dmvnorm<-function(x,mu,sigma){
  p<-length(mu)
  mu<-c(mu)
  x<-c(x)
  f=1/(2*pi)^(p/2)/(det(sigma))^(1/2)*exp(-0.5*t(x-mu)%*%solve(sigma)%*%(x-mu))
  return(f)
}
PP<-function(x,pro,mu,sigma){
  K<-length(pro)
  PP<-numeric(K)
  for (i in 1:K){
    PP[i]<-pro[[i]]*dmvnorm(x,mu[[i]],sigma[[i]])
  }
  PP<-PP/sum(PP)
  return(PP)
}
for (i in 1:nl){
  mu[[i]]<-apply(default.train[default.train$default==levels(default.train[,1])[i],3:4],2,mean)
  S[[i]]<-cov(default.train[default.train$default==levels(default.train[,1])[i],3:4])
  pro[[i]]<-dim(default.train[default.train$default==levels(default.train[,1])[i],3:4])[1]/dim(default.train[,3:4])[1]
}
Y.pred<-numeric(dim(default.test)[1])
Pprob<-matrix(0,ncol=2,nrow=length(Y.pred))
for (i in 1:dim(default.test)[1]){
  Pprob[i,]<-PP(unlist(default.test[i,3:4]),pro,mu,S)
  Y.pred[i]<-which.max(Pprob[i,])
}
Y.hat<-character(length(Y.pred))
Y.hat[Y.pred==1]<-"No"
Y.hat[Y.pred==2]<-"Yes"

table(pred=Y.hat,true=default.test[,1])

sum(default.test[,1]!=Y.hat)
sum(default.test[,1]!=Y.hat)/length(Y.hat)

head(Default)

iris12<-iris[,c(1,2,5)]

Default12<-Default[,c(1,3,4)]

########### LDA
fit<-lda(default~.,data=Default12,subset=train)
pred.lda<-predict(fit,Default12[-train,])$class
table(pred.lda,Default12[-train,1])
mean(pred.lda!=Default12[-train,1])

########### QDA

#QDA
install.packages("mass")
library(MASS)
fit2<-qda(default~.,data=Default12,subset=train)
pred.qda<-predict(fit2,Default12[-train,])$class
table(pred.qda,Default12[-train,1])
mean(pred.qda!=Default12[-train,1])



#LOOCV
fit2loocv<-qda(default ~.,data=Default,cv=T)
pred2loocv<-predict(fit2loocv,Default)$class
table(pred2loocv,Default[,1])

mean(pred2loocv!=Default[,1])


#K-fold CV
K<-10
ind<-(1:n)%%K+1
set.seed(1234)
folds<-sample(ind,n)
predcv<-character(n)
for (k in 1:K){
  fit<-lda(default~.,data=Default,subset=which(ind!=k))
  predcv[ind==k]<-as.character(predict(fit,Default[ind==k,])$class)
}
table(predcv,Default[,1])

mean(predcv!=Default[,1])







library(MASS)
library(naivebayes)
library(e1071)
k <- 10
error.rate <- rep(NA, k)
n <- dim(Default)[1]
for(i in 1:k){
  set.seed(i)
  train <- sample(1:n, n/2)
  fit.vs <- naiveBayes(default ~ ., data=Default[train,])
  fit.vs
  pred1 <- predict(fit.vs, newdata=Default[-train,])
  mean(pred1 == Default[-train,]$default)
  error.rate[i] <- 1-mean(pred1 == Default[-train,]$default)
  if(i==k){
    plot(error.rate ,type="l", 
         ylim=c(min(error.rate)*0.9,max(error.rate)*1.1),
         ylab="Error Rate",
         xlab="K")
    abline(h=mean(error.rate), lty=2, col=2)
  }
}
mean(error.rate)


n <- dim(Default)[1]
error.loocv <- vector(mode = "logical", n)
for( i in 1:n){
  fit.loocv <- naiveBayes(default ~ ., data=Default[-i,])
  pred2 <- predict(fit.loocv, newdata=Default[i,])
  error.loocv[i] <- (pred2 != Default[i,]$default)
}
mean(error.loocv) 












error.kfold

n <- dim(Default)[1]
cv.error <- rep(NA, n)


for( i in 1:n){
  fit1 <- naiveBayes(default ~ ., data=Default[-i,])
  pred2 <- predict(fit1, newdata=Default[i,])
  cv.error[i] <- pred2 == Default[i,]$default
}


cv.error <- 1- as.numeric(cv.error)
mean(cv.error)



library(ISLR)

head(Default12)

glm.fit=glm(default~., data=Default12[-train,],family=binomial(link=logit))


library(boot) #cv.glm을 사용하기 위한 라이브러리입니다.
cv.err=cv.glm(Default12, glm.fit) #cv.glm함수를 통해 LOOCV를 시행합니다.
cv.err$delta #delta는 cross-validation 결과들을 담고 있습니다.
## 오래 걸림 ㅠㅠ
str(cv.err)

loocv=function(fit){
  h=lm.influence(fit)$h
  mean((residuals(fit)/(1-h))^2)
}

loocv(glm.fit)

str(Default12)
cv.error=rep(0,5)
degree=1:5 #1차부터 5차함수까지 fitting해 봅시다.

