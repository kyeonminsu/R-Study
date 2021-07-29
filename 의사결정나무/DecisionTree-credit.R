df <- read.csv(file.choose(),
                encoding = "UTF-8")

df

class(df)
str(df)

#여기서 하나 습관적으로 해두면 좋을것은 데이터를 섞는 것입니다. 
#보통 데이터는 시간순서로 저장되어있기 때문에 아래에 쌓인 데이터의 내용과 위에쌓인 데이터의 내용이 어떤 경향성을 띌수가 있습니다.


#nrow로 행의 갯수를 세고, 이를통해 랜덤한 숫자를 추출하고, 이를 바탕으로 랭킹을 매겨본뒤, 
#다시한번 무작위로 뒤섞인 데이터를 저장하는 과정입니다. 
#이렇게 랜덤하게 섞는 방법을 이용하면, 샘플링할때도 단순하게 위에서 몇개는 훈련용, 그 나머지는 테스트용으로 간단하게 나눠볼수 있습니다.
df <- df[order(runif(nrow(df))),]

#train <- creditr[1:900,]
#test <- creditr[901:1000,]
#더욱 간단한 방법 sample()메서드를 이용하는 방법도 있다.

index <- sample(1:nrow(df), nrow(df) * 0.7, replace = F)
train <- df[index,]
test <- df[-index,]

#C5.0으로 모델 만들기
library(C50)
#바로 훈련을 시키되, 특정한 열을 제외하여야 합니다. 
#변수들을 하나하나 언급하는 경우에는 상관이 없으나, 이러한 귀찮은 과정을 하지 않고 바로 모델 훈련에 이용하려면, 
#default는 빼주고 나머지것으로 예측해보라고 던져야 합니다.
#C5.0(훈련데이터, 라벨)

train$default<-as.factor(train$default)
credit_model <- C5.0(within(train, rm(default)), train$default)
result<-predict(credit_model,newdata=test)

Confusion_Matrix<-table(test$default, result) # 오른쪽이 정답, 왼쪽이 예측한 결과
Accuracy<-sum(diag(Confusion_Matrix))/sum(Confusion_Matrix)
Accuracy


#table(test$default,predict(credit_model,newdata=test))


#rpart 패키지 이용하기.
library(rpart)
library(rpart.plot)
mm <- rpart(default ~ . , data = train)
rpart.plot(mm)

result2<-predict(credit_model,newdata=test)

Confusion_Matrix<-table(test$default, result2) # 오른쪽이 정답, 왼쪽이 예측한 결과
Accuracy<-sum(diag(Confusion_Matrix))/sum(Confusion_Matrix)
Accuracy

