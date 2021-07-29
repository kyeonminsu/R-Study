library(ggplot2)
library(dplyr)
df <- as.data.frame(mpg)

# mpg data set을 이용하여 drv(구동방식)별 hwy(고속도로 연비)를 
# 상자 그림으로 표현

ggplot(data=df,
       aes(x=drv, y=hwy)) +
  geom_boxplot()

# 그래프를 보고 파악할 수 있는 점

# 4륜 구동은 hwy가 약 17~22사이에 자동차가 모여있다.
# 전륜 구동은 연비가 극단적인 형태의 자동차가 많다.
# 후륜 구동은 대부분의 자동차가 사분위 범위에 해당한다.


################################################################
#ggplot2에는 그래프를 그리는 함수와 도형이나 텍스트 같은 다양한 객체를 그리는 함수도 포함되어 있습니다. 
#그래프에 선이나 도형을 포함시키면 그래프의 가독성이 높아지기 때문에 많이 이용되는 기능입니다.

df <- economics
head(df)

# 날짜별 개인 저축률에 대한 선 그래프를 그려보자

ggplot(data=df,
       aes(x=date, y=psavert)) +
  geom_line()

# 직선을 추가해보자

ggplot(data=df,
       aes(x=date, y=psavert)) +
  geom_line() +
  geom_abline(intercept=12.1, slope=-0.0003444)


# 만약 데이터를 가장 잘 표현하는 직선을 우리가 찾을 수
# 있다면 해당 그래프를 이용해서 미래의 값을 예측할 수 있다.
# 이 직선을 얻기 위해서는 기울기와 절편의 값을 구해야 하는데
# 이 값은 회귀분석을 통해서 얻을 수 있다.

# 평행선을 추가해보자

# geom_hline()을 이용해서 평행선을 그릴 수 있다.
# 기존 시간에 따른 개인저축률 그래프에 개인 저축률의 
# 평균값을 이용하여 평행선을 그려보자

ggplot(data=df,
       aes(x=date, y=psavert)) +
  geom_line() +
  geom_hline(yintercept=mean(df$psavert))

# geom_vline()을 이용하여 수직선을 그릴 수 있다.
# 개인 저축률이 가장 낮은 시기를 바로 알 수 있도록 수직선을 그려보자
# 먼저 개인 저축률이 가장 낮은 날짜를 알아야 한다.

tmp <- 
  df %>% filter(psavert == min(psavert)) %>%
  select(date)

tmp <- as.data.frame(tmp)$date

ggplot(data=df,
       aes(x=date, y=psavert)) +
  geom_line() + 
  geom_vline(xintercept = tmp)

## 만약 날짜를 직접입력하려면??
ggplot(data=df,
       aes(x=date, y=psavert)) +
  geom_line() + 
  geom_vline(xintercept = as.Date("2009-10-01"))

# 그래프에 텍스트를 추가하려면??

# geom_text()를 이용하면 그래프에 텍스트를 입력할 수 있습니다.
# 그래프의 범례나 제목과는 다르게 그래프 위에 직접 표현

# geom_text(aes(label="라벨명", vjust=세로위치, hjust=가로위치)
ggplot(data=df,
       aes(x=date, y=psavert)) +
  geom_point() + 
  xlim(as.Date("1990-01-01"),
       as.Date("1992-12-01")) +
  ylim(7,10) +
  geom_text(aes(label=psavert, vjust=0, hjust=-0.5))
#geom_text(aes(label=psavert, vjust=0, hjust=0))
# 숫자의 의미 : + 아래, 왼쪽 , - 위 , 오른쪽을 의미 

# 도형 및 화살표를 추가하는 annotate() 함수

# annotate()함수는 그래프 위에 사각형이나 화살표 등으로
# 특정 영역을 강조할 때 많이 사용됩니다.

# annotate("모양",
#          xmin=x축시작,
#          xmax=x축 끝,
#          ymin=y축 시작,
#          ymax=y축 끝)
ggplot(data=df,
       aes(x=date, y=psavert)) +
  geom_point() + 
  xlim(as.Date("1990-01-01"),
       as.Date("1992-12-01")) +
  ylim(7,10) + 
  annotate("rect",
           xmin=as.Date("1991-01-01"),
           xmax=as.Date("1991-12-31"),
           ymin=8,
           ymax=9,
           alpha=0.3,
           fill="red")

# 여기에 추가적으로 화살표를 표시할 수 있습니다.
# 화살표 역시 annotate()를 이용하여 표현합니다.

ggplot(data=df,
       aes(x=date, y=psavert)) +
  geom_point() + 
  xlim(as.Date("1990-01-01"),
       as.Date("1992-12-01")) +
  ylim(7,10) + 
  annotate("rect",
           xmin=as.Date("1991-01-01"),
           xmax=as.Date("1991-12-31"),
           ymin=8,
           ymax=9,
           alpha=0.3,
           fill="red") +
  annotate("segment",
           x = as.Date("1990-05-01"),
           xend=as.Date("1991-05-01"),
           y = 7.5,
           yend=8.5,
           color="blue",
           arrow=arrow()) +
  annotate("text",
           x=as.Date("1991-05-01"),
           y=8.5,
           label="글자도 쓸수 있어요!!")


# 마지막으로 그래프의 제목과 각 축의 이름, 배경색등을 설정해보자
# 테마는 총 8가지를 기본으로 제공하며 기본 테마는 theme_gray()

# labs(x=x축 이름, y=y축 이름, title=그래프 제목)
ggplot(data=df,
       aes(x=date, y=psavert)) +
  geom_point() + 
  xlim(as.Date("1990-01-01"),
       as.Date("1992-12-01")) +
  ylim(7,10) + 
  labs(x="연도", y="개인저축률", title="날짜별 개인 저축률") + 
  theme_classic()
