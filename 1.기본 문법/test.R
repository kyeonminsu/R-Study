#library(ggplot2)
# x<-c("a","b","c","d")
# x
# qplot(x)

#qplot(data =mpg, x=cty, y = hwy)

# eng <- c(90,80,70,60)
# math <- c(50,60,70,80)
# class <- c(1,1,2,2)
# df_mid <- data.frame(eng,math,class)
# df_mid
# 
# mean(df_mid$eng)
# mean(df_mid$math)


?ibrary(readxl)
# df_exam <- read_excel("C://Users//kyeon//OneDrive//바탕 화면//빅데이터//R//EDA//excel_exam.xlsx")
# df_exam
# 
# mean(df_exam$english)
# 
# library(ggplot2)
# mpg <- as.data.frame(ggplot2::mpg)
# head(mpg, 10)
# View(mpg)
# dim(mpg) # 데이??? 차원
# str(mpg) # 변수 속성
# summary(mpg) # 요약 통계량 산출


# 숫자가 대상을 지칭하는 이름과 같은 역할을 해서 명목 변수, R에서 범주 변수는 factor(펙터)로 표현됩니다.
# 연속형 변수?? 키나 몸무게?처럼 연속적이고 크기를 의미하는 값으로 구성된 변수이????양???변수라 부???며, 
# R에서는 numeric(뉴머릭)으로 표현함.

# library(readxl)
# library(dplyr)
# df_exam <- read_excel("C://Users//kyeon//One?rive//바탕 화??//빅데이터//R//EDA//excel_exam.xlsx")
# df_exam
# df_exam%>%filter(class==4)
# df_exam%>%filter(cl??s %?n% c(1,2,5)?


# library(readxl)
# library(dplyr)
# y_data <- read_excel("C://Users//kyeon//OneDrive//바탕 화면//빅데이터/?R//EDA//excel_exa?.xlsx")
# y_data
# y_data%>% select(class, math)
# y_data%>% select(-class, -math)
# y_data%>% filter(class==1??%>%?elect(math)?# y_data%>%select(math)%>%head


# #데이터 정렬 https://www.data.go.kr/
# library(readxl)
# x_data <- rea?_excel("C://Users?/kyeon//OneDrive//바탕 화면//빅데이터//R//EDA//excel_exam.xlsx")
# x_data%>%arrange(math)
# x_data%>%arrange(desc(m??h))?# #파생변수 추가하기
# x_data%>%mutate(math_1 = ifelse(class>=4,"yes","NO"))



library(ggplot2)
libr?ry(dplyr)
crime <- read.csv("C://Users//kyeon//OneDrive//바탕 화면//빅데이터//R//EDA//기본 문법//crime.csv")
head(crime)
str(crime)
crime[c(4, 5, 6, 7, "p?_sum"] <- NA
head(crime)
table(is.na(crime$pr_sum))
crime_clean <- crime%>%filter(!is.na??r_sum))  #결측치 제거
table(is.na(crime_clean$pr_sum))
