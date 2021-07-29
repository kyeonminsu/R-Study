#rm(list = ls())

#iris데이터 셋을 사용한다.
colnames(iris) #컬럼들을 확인한다.
levels(iris$Species) #Species 컬럼에 몇개의 종류가 있는지 확인한다.

#"Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width" 수치형 4개를 독립변수로 이용하여 아이리스의 종류(Species)를 예측한다.
#rpart() 함수로 의사결정나무 학습을 시킨다.
# rpart()함수의 입력인자는 다음과 같다. 

# formula 함수식
# data 데이터
# weights 가중치
# subset 그룹변수
# na.action 결측값 처리
# method 분석방법 ("anova", "poisson", "class", "exp", "dist", "mrt", "user")
# model 모형
# x 독립변수
# y 종속변수
# parms 매개변수
# control 통제조건
# cost 비음조건

library(rpart) #rpart()함수 포함 패키지
install.packages("rpart.plot")
library(rpart.plot) #rpart.plot()함수 포함패키지
train <- sample(1:150, 100) #무작위로 100개 추출 (학습데이터)
#help(rpart)
tree <- rpart(Species ~ Sepal.Length + Sepal.Width + Petal.Length + 
                  Petal.Width, data=iris, subset =train, method = "class")
rpart.plot(tree)

summary(tree)

#가지치기
printcp(tree)
pruned_tree <- prune(tree, cp = 0.1) #cp =0.1로 가지치기
rpart.plot(pruned_tree)

#학습된 의사결정나무모델로 Test셋 예측
predict(pruned_tree, iris[-train,], type = "class")
#정오분류표(confusion matrix) 작성
tt <- table(iris$Species[-train], predict(pruned_tree, iris[-train,], type = "class"))
tt

#정분류율 및 오불류율 계산
sum(tt[row(tt) == col(tt)])/sum(tt) #정분류율
1-sum(tt[row(tt) == col(tt)])/sum(tt) #오분류율

#정오분류표 그래프화
test <- iris[-train,] #Test셋 따로 뽑기
test$pred <- predict(pruned_tree, iris[-train,], type = "class")  #Test셋에 대한 예측분류
library(ggplot2)
ggplot(test, aes(Species, pred, color = Species))+
     geom_jitter(width = 0.2, height = 0.1, size=2)+ 
     labs(title="Confusion Matrix", 
                 subtitle="Predicted vs. Observed from Iris dataset", 
                 y="Predicted", 
                  x="Truth")

