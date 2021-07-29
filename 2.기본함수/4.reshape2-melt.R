install.packages("reshape2")
library(reshape2)

df = airquality
class(df)
str(df)     # 153행 6열
df

View(df)

# melt()의 기본은 기준이 될 열을 지정하지 않으면 
# numeric data type의 모든 열을 행으로 변환
melt(df)       
melt(df, na.rm = T)         # value값이 NA인 것은 제외
nrow(melt(df))              # 생성된 총 row수 : 153 * 6 = 918

# month를 기준으로 데이터를 행으로 변환
melt(df,id.vars="Month")    
nrow(melt(df,id.vars="Month"))  # 생성된 총 row수 : 153 * 5 = 765

# month와 day를 기준으로 데이터를 행으로 변환
melt(df,id.vars=c("Month","Day"))
nrow(melt(df,id.vars=c("Month","Day")))  # 생성된 총 row수 : 153 * 4 = 612

# month와 day를 기준으로 ozone데이터만 행으로 변환
melt(df,id.vars=c("Month","Day"),measure.vars="Ozone")


# smiths data set을 이용하여 melt를 실습해보자
smiths

melt_smiths <- melt(smiths, id.vars=c("subject"))
melt_smiths

melt_smiths <- melt(smiths, id.vars=c("subject","time"))
melt_smiths

melt_smiths <- melt(smiths, id.vars=c("subject","time","age"))
melt_smiths   # 4행

melt_smiths <- melt(smiths,
                    id.vars=c("subject","time","age"),
                    na.rm = T)
melt_smiths


# 다른 데이터 셋으로 실습
library(ggplot2)
library(reshape2)
library(dplyr)
mpg

df <- as.data.frame(mpg)
melt(df)

melt(df, id.vars="model")

melt(df, id.vars=c("manufacturer","model"),
     measure.vars="cty")




