#Sepal.Length --> 꽃받침의 너비  Number
#Sepal.Width  --> 꽃받침의 길이  Number
#Petal.Length --> 꽃잎의 너비  Number
#Petal.Width  --> 꽃잎의 길이  Number
#Species    --> 붓꽃의 종    Factor



#데이터 준비
library(caret)
set.seed(1712)
inTrain <- createD?taPartition(y=iris$Species, p=0.7, list=FALSE)
inTrain
training<-iris[inTrain,]
testing <-iris[-inTrain,]


training
testing
dim(training)

#변수 표준화
training.data <- scale(training[1:4])
summary(training.data)

#모델 작성

iris.kmeans <- kmeans(trainin?.data[,-5], centers = 3, iter.max = 10000)
iris.kmeans$centers
#군집확인 
training$cluster<-as.factor(iris.kmeans$cluster)
qplot(Petal.Width,Petal.Length,colour=cluster,data=training)

#표로 결과 확인
table(training$Species, training$cluster)

#k-means 군??? 분석에서는 입력하는 변수와 함께 중심의 갯수를 지정하는 것이 중요하다. 몇개의 군집 중심이 적당한지 결정하는 방법에는 여러가지가 있다.
#그 중에 자주 사용하는 NbClust와 sum of squares이 있다. 

#install.packages('NbClust')
library(NbClust)
nc <- NbClust(trai?ing.data, min.nc = 2, max.nc = 15, method = "kmeans")

par(mfrow=c(1,1))
barplot(table(nc$Best.n[1,]),
        xlab="Numer of Clusters", ylab="Number of Criteria",
        main="Number of Clusters Chosen")



wssplot <- function(data, nc = 15, seed = 1234)?{
  wss <- (nrow(data) - 1) * sum(apply(data, 2, var))
  for (i in 2:nc) {
    set.seed(seed)
    wss[i] <- sum(kmeans(data, centers=i)$withinss)}
  plot(1:nc, wss, type="b", xlab = "Number of Clusters",
       ylab = "Within groups sum of squares")}

wssp?ot(training.data)


#testdata로 사용하여 군집할당 
training.data <- as.data.frame(training.data)
modFit <- train(x = training.data[,-5], 
                y = training$cluster,
                method = "rpart")

testing.data <- as.data.frame(scale(testing[-?]))
testClusterPred <- predict(modFit, testing.data) 
table(testClusterPred ,testing$Species)



