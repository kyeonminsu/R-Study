library(xlsx)

df <- read.xlsx(file.choose(),
                        sheetIndex = 1,
                        encoding = "UTF-8")
df

#기본 통계량 
summary(df)
 
# 기본 통계 함수
mean(df$math)
median(df$math)
max(df$math)
min(df$math)      
range(df$math)    # 최소값 최대값
quantile(df$math) # 사분위
var(df$math)      # 분산  
sd(df$math)# 표준편차

install.packages("moments")
library("moments")
skewness(df$math)     # 왜도
kurtosis(df$math)  # 첨도


install.packages("psych")  # psychometrics(심리측정학)
library(psych)
describe(df)

# Package for Analysis of Space-Time Ecological Series
install.packages("pastecs") 
library(pastecs)
stat.desc(df)


# 빈도를 구하기 위한 함수

install.packages("descr")
library(descr)

freq(df$math, plot = T)

