rm(list = ls())

#주어진 데이터에서 여러 개의 bootstrap 자료를 생성 --> 각 자료에 대한 예측 모델 생성 --> 결합하여 최종 모델 결정
#일반적으로 traing data의 모집단 분포를 모르기 때문에 실제 문제에서는 평균예측모델을 구할 수 없다.
#배깅은 traing data를 모집단으로 생각하고 평균예측모델을 구하기 때문에 분산을 줄이고 예측력을 향상시킬 수 있다.
#일반적으로 overfitting 된 모델일 경우 사용하면 좋다.
#bootstrap : raw data 에서 랜덤 복원추출을 통해 만든 동일한 크기의 자료들
#voting : 여러 개의 모델로부터 산출된 결과를 합쳐 다수결에 의해 최종 결과로 선택

# bootstrap data 생성
set.seed(2020)
idx1 <- sample(1:nrow(iris), size=nrow(iris)*0.8)
idx2 <- sample(1:nrow(iris), size=nrow(iris)*0.8)
idx3 <- sample(1:nrow(iris), size=nrow(iris)*0.8)
idx4 <- sample(1:nrow(iris), size=nrow(iris)*0.8)
idx5 <- sample(1:nrow(iris), size=nrow(iris)*0.8)

train1<-iris[idx1, ]
train2<-iris[idx2, ]
train3<-iris[idx3, ]
train4<-iris[idx4, ]
train5<-iris[idx5, ]

test1<-iris[-idx1, ]
test2<-iris[-idx2, ]
test3<-iris[-idx3, ]
test4<-iris[-idx4, ]
test5<-iris[-idx5, ]

#install.packages("party")
library(party)

# Modeling
tree1 <- ctree(Species ~ ., train1)
tree2 <- ctree(Species ~ ., train2)
tree3 <- ctree(Species ~ ., train3)
tree4 <- ctree(Species ~ ., train4)
tree5 <- ctree(Species ~ ., train5)

plot(tree1)
plot(tree5)

#predict
pred1 <- predict(tree1, test1)
pred2 <- predict(tree2, test2)
pred3 <- predict(tree3, test3)
pred4 <- predict(tree4, test4)
pred5 <- predict(tree5, test5)

# 각각의 예측 결과를 취합
test <- data.frame(Species = iris$Species, pred1, pred2, pred3, pred4, pred5)
test

# 5개 분류기의 결과를 취합하여 최종 결과를 voting
funcResultValue <- function(x) {
  result <- NULL
  for (i in 1:nrow(x)) {
    xtab <- table(t(x[i, ]))
    rvalue <- names(sort(xtab, decreasing = T)[1])
    result <- c(result, rvalue)
  }
  print(result)
  return(result)
}

test$result <- funcResultValue(test[ ,2:6])
head(test)
Confusion_Matrix<-table(test$result, test$Species)
Confusion_Matrix
Accuracy<-sum(diag(Confusion_Matrix))/sum(Confusion_Matrix)
Accuracy<-Accuracy*100
Accuracy

