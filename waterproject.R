
M.train <- read.csv("c:/Users/jk000/Documents/MNIST_train.csv")
M.test <- read.csv("c:/Users/jk000/Documents/MNIST_test.csv")



library(class)

set.seed(1234)

MN<-rbind(MN.train,MN.test)

n<-dim(MN)[1]
n

n1<-dim(M.train)[1]
n1

n2<-dim(M.test)[1]
n2

train<-sample(n, n1)
error<-list()


set.seed(1); z1 <- sample(1:20, n1 ,replace=T,prob=rep(0.1,20))
set.seed(1); z2 <- sample(1:20, n2 ,replace=T,prob=rep(0.1,20))

mnist.train <- MN.train[z1==1,]
mnist.test <- MN.test[z2==1,]
dim(mnist.train)
dim(mnist.test)



for (i in 1:10){
  error[[i]]<-mean(knn(MN.train[,-1],MN.test[,-1],MN.train[,1],k=i)!=MN.test[,1])
}
  error.list<-unlist(error)

plot(error.list, type="o")


which(min(error.list)==error.list)

predict.knn<-knn(MN[train,-1],MN[-train,-1],MN[train,1],k=1)
length(predict.knn)
length(MN.test[,1])
table(predict.knn, as.factor(MN.test[,1]))


mean(predict.knn== as.factor(MN.test[,1])) #accuracy rate


