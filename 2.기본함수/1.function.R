#데이터 파악하기 
library(ggplot2)
#mgg 데이터를 불러와 데이터 프레임을 만듬.
mpg <- as.data.frame(ggplot2::mpg)

mpg
class(mpg) #데이터프레임 출력 

ls(mpg) #자료구조(메모리구조)를 파악하기 위한 함수.
head(mpg) #데이터의 앞부분을 추출하는 함수. 기본값은 d?ta frame일 경우 앞에서 6행까지 추출.
tail(mpg) #데이터의 뒷부분을 추출하는 함수. 기본값은 data frame일 경우 뒤에서 6행까지 추출.
View(mpg) #View 창에서 데이터 출력.
dim(mpg) #data frame의 행과 열의 개수를 구하는 함수. 선형구조에 적용 불가능.
nrow(mpg) #dat? frame의 행의 개수를 구하는 함수. 선형구조에 적용 불가능.
ncol(mpg) #data frame의 column의 개수를 구하는 함수. 선형구조에 적용 불가능.
str(mpg) #데이터에 들어있는 column들의 속성을 확인하기 위한 함수.
ls(mpg) #data frame의 column 항목을 vector로 추출하는 ???수.
length(mpg)    # data frame인 경우 column의 개수  
summary(mpg) # 요약 통계량을 산출하는 함수.
rev(head(mpg)) # vector인 경우 원소의 순서를 역순으로, data frame인 경우 column을 역순으로




install.packages("hflights")
library(hflights)

class(hflights?   # data frame
head(hflights)    # 상위 6행 출력
tail(hflights)    # 하위 6행 출력
View(hflights)    # View 창으로 출력
dim(hflights)     # 행,열 (227496,21)     
str(hflights)     # 변수의 속성확인
summary(hflights) # 요약 통계

ls(hflights)      # colum?명을 vector로 출력
nrow(hflights)    # 행의 개수
ncol(hflights)    # 열의 개수
length(hflights)  # 열의 개수
# matrix에 length()를 적용하면 열의 개수가 아니라
# 모든 원소의 개수를 리턴한다.
rev(head(hflights))             # vector인 경우 원소의 순서를 역순???로# data frame인 경우 column을 역순으로



# iris dataset
# 통계학자인 피셔(Fisher) 가 소개한 데이터.
# 붓꽃(iris)의 3가지 종(setosa, versicolor, virginica)에 대해 
# 꽃받침(sepal)과 꽃잎(petal)의 길이를 정리한 데이터

# R에 기본으로 내장
# Species : 붓꽃??? 종. setosa, versicolor, virginica (Factor)
# Sepal.Width : 꽃받침의 너비 (numeric)
# Sepal.Length : 꽃받침의 길이 (numeric)
# Petal.Width : 꽃잎의 너비 (numeric)
# Petal.Length : 꽃잎의 길이 (numeric)

head(iris)
rev(head(iris))
View(iris)
str(iris)
summa?y(iris)
rev(iris)

