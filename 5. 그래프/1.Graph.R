# mpg data set을 이용하여 그래프를 생성합니다
# ggplot2를 이용한 그래프 생성

#install.packages("ggplot2")
library(ggplot2)

df <- as.data.frame(mpg)
# 1. 배경 설정
# data 속성 : 그래프를 그리는데 사용할 데이터 
# aes 속성 : x축과y축에 사용할 변수를 지정

# mpg data set의 displ(배기량)을 x축에 hwy(고속도로 연비)를 
# y축으로 지정

ggplot(data=df,
       aes(x=displ, y=hwy))    # 배경 생성


# 2. 그래프 추가
# 배경을 생성했으니 그 위에 그래프를 그린다
# + 기호를 이용하여 그래프 유형을 지정하는 함수를 추가
# 산점도를 그리는 함수는 geom_point()
# dplyr에서 연결기호는 %>%, ggplot2의 연결기호는 +

ggplot(data=df,
       aes(x=displ, y=hwy)) +
  geom_point()      # 산점도 추가

# 그래프를 보면 배기량이 클수록 연비가 떨어지는 것을 확인할 수 있다.

# 3. 설정 추가
# 축 범위를 조절하는 설정을 추가할 수 있다
# 기본적으로 축은 최소값에서 최대값을 표현할 수 있도록 기본 설정
# 일부 데이터만 표현하고 싶을 때 축 범위 조절

# 축 범위 조절 함수 : xlim(), ylim()

ggplot(data=df,
       aes(x=displ, y=hwy)) +
  geom_point() +
  xlim(3,6) +
  ylim(10,30)

# plots 창의 export menu를 이용하면 해당 그래프를 이미지나 PDF로
# 저장할 수 있다.

# 그래프를 그릴때 그래프의 option을 줄 수 있습니다.

ggplot(data=df,
       aes(x=displ, y=hwy)) +
  geom_point(size=3, color="red")      # 산점도 추가


plot.new()   # 작성한 그래프를 지울 때 사용


