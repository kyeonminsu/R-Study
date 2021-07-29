rm(list = ls())
#iris 데이터 살펴보기
colnames(iris)
levels(iris$Species)

#R에서 배깅 알고리즘을 학습시킬 수 있는 함수는 adabag 패키지의 bagging() 함수입니다. 
#bagging() 함수의 입력인자는 다음과 같습니다.

#formula 포뮬러
#data 학습시킬 데이터
#mfinal  Tree 반복생성 횟수
#control 통제(rpart.control)

#위의 입력인자에서 control이라는 인자가 있는데 bagging() 함수는 기본적으로 
#의사결정나무 함수인 rpart() 함수를 이용하기 때문에 rpart.control() 함수를 이용하여 각각 의사결정나무의 옵션을 설정할 수 있습니다.

#minsplit Tree 최소 Node 수
#minbucket Terminal Node의 최소 데이터수
#cp 복잡성 계수
#maxsurrogate 최대 분기후보
#usesurrogate 허용 분기후보
#xval 교차 인정값
#maxdepth 최대 깊이

install.packages("adabag")
library(adabag)
train <- sample(1:150, 100) #무작위로 100개 추출 (학습데이터)
iris.bagging <- bagging(Species ~.,data=iris[train, ],mfinal=5,  #5개 의사결정나무 이용
                        control=rpart.control(maxdepth=5, minsplit=5)) #최대깊이 5, 최소 노드 5

iris.bagging$trees #각각 의사결정나무 결과보기

#bagging 모델을 구성하는 의사결정나무 그래프(첫번째)
library(rpart.plot)
rpart.plot(iris.bagging$trees[[1]])

#최종적으로 학습 데이터가 배깅 모델을 통해 분류된 결과는"iris.bagging$class" 로 확인할 수 있다.
#iris.bagging$importance를 통해 X인자의 중요도를 확인할 수 있습니다.
iris.bagging$class
iris.bagging$importance

#학습된 배깅 모델으로 Test셋 예측하기
predict(iris.bagging, iris[-train,])$class
tt <- table(iris$Species[-train], predict(iris.bagging, iris[-train,])$class)

#정분류율 및 오불류율 계산
sum(tt[row(tt) == col(tt)])/sum(tt) #정분류율
1-sum(tt[row(tt) == col(tt)])/sum(tt) #오분류율

#정오분류표 그래프화
library(ggplot2)
test <- iris[-train,]
test$pred <- predict(iris.bagging, iris[-train,])$class #예측된 분류 입력하기
ggplot(test, aes(Species, pred, color = Species)) +
        geom_jitter(width = 0.2, height = 0.1, size=2) +
       labs(title="Confusion Matrix", 
                            subtitle="Predicted vs. Observed from Iris dataset", 
                             y="Predicted", 
                             x="Truth")



