#rm(list = ls())
# 시계열 데이터를 이용하여 선 그래프를 그리기

# 사용 data set
economics
economics_long

# 컬럼설명
# date : 날짜(년도별 월)
# pce : personal consumption expenditures(개인소비지출)
#       경기선행지수로 사용된다. in billions of dollars(십억달러)
# pop : total population, in thousands (전체인구 - 천단위)
# psavert : personal savings rate(개인 저축률)
# uempmed : median duration of unemployment, in weeks
#           비고용기간의 중앙값 (주단위)
# unemploy : number of unemployed in thousands( 실업자 수 - 천단위)

help(economics)

# 시간에 따른 실업자수 추이를 생성해보자
ggplot(data=economics,
       aes(x=date, y=unemploy)) +
  geom_line()

# 5년을 주기로 등락을 거듭하고 있다.
# 2008년 리먼 브라더스 사태로 실업률 대량 증가

# scatter를 이용한 산점도를 그린 후 그 위에 선 그래프를
# 추가해서 그래프에 그래프를 추가해 보자

ggplot(data=economics,
       aes(x=date, y=unemploy)) +
  geom_point(color = "red") + 
  geom_line()
