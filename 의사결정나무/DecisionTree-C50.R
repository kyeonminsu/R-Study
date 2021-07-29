#C50 패키지를 사용하여 의사결정나무를 구축
#rm(list = ls())
install.packages("C50")
library(C50)

iris

class(iris) #자료구조를 확인
str(iris) #구조를 확인
nrow(iris) #데이터가 몇개인가?

####### Train, Test 80%, 20%로 나눈다.
set.seed(2020)
idx <- sample(1:nrow(iris), size=nrow(iris)*0.8)
idx
class(idx)
length(idx)

D.train<-iris[idx, ]
D.train
nrow(D.train)

D.test<-iris[-idx, ]
D.test
nrow(D.test)

############# c5.0 모델 구축
model<-C5.0(Species~., data = D.train)  #.(dot)은 or 이란 뜻이다.  Species변수를 제외한 모든변수
summary(model)

plot(model)

result<-predict(object=model, newdata = D.test)
D.test$Species
result

Confusion_Matrix<-table(D.test$Species, result) # 오른쪽이 정답, 왼쪽이 예측한 결과
Accuracy<-sum(diag(Confusion_Matrix))/sum(Confusion_Matrix)
Accuracy<-Accuracy*100
Accuracy


