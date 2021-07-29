###### 막대 그래프
# mpg data set을 이용한 drv별 평균 hwy 막대 그래프 그리기

# 1. 집단별 평균표로 구성된 data frame 생성
library(ggplot2)
library(dplyr)
df <- as.data.frame(mpg)

head(df)

result <- df %>%
  group_by(drv) %>%
  summarise(mean_hwy = mean(hwy))

result     # 구동방식별 고속도로 평균 연비

# 2. 그래프 생성

ggplot(data=result,
       aes(x=drv, y=mean_hwy)) +
      geom_col(width=0.3)

# 3. 크기순으로 정렬
# 기본적으로 알파벳 오름차순으로 범주가 정렬
# reorder를 이용하면 막대를 값의 크기순으로 정렬할 수 있다
# reorder()의 기본 정렬은 오름차순, - 기호를 이용하면 내림차순

ggplot(data=result,
       aes(x=reorder(drv, -mean_hwy), y=mean_hwy)) +
        geom_col()

# 빈도 막대 그래프 - geom_col() 대신 geom_bar()를 이용
# 빈도 막대 그래프는 별도의 data frame을 만들지 않고 
# raw data frame을 이용하여 바로 생성

# drv 항목의 빈도 그래프를 그려보자

ggplot(data = df,
       aes(x=drv)) +
  geom_bar(width=0.5)

# 빈도 막대 그래프에 추가해서 누적 막대 그래프를 표현해보자
# 이전 그래프는 구동방식(drv)에 따른 빈도는 알 수 있으나
# 각 구동방식내에서 cyl(실린더의 개수)의 빈도까지 파악 할 수는 없습니다.
# geom_bar() 함수내에 aes()를 이용하여 누적할 열을 지정합니다.

ggplot(data = df,
       aes(x=drv)) +
  geom_bar(aes(fill=factor(cyl)),width=0.5)


# 도수분포를 막대 모양 그래프(히스토그램)로 표현할 수 있습니다.

ggplot(data = df,
       aes(x=hwy)) +
  geom_histogram()

# 히스토그램의 bin의 값을 설정하지 않아서 30으로 설정
# 만약 bin값을 다시 설정하려면 다음과 같이 설정(비율지정)
ggplot(data = df,
       aes(x=hwy)) +
  geom_histogram(binwidth = 1)



