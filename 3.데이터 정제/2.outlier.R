# 이상치 정제

# 성별에 존재할 수 없는 값이 있을 경우
# table() 함수를 이용하여 빈도수를 알아보면 확인할 수 있다.

df <- data.frame(id=c(1,2,NA,4,NA,6),
                 score=c(20,30,NA,50,67,NA),
                 gender=c("^^","F","M","F","M","M"),
                 stringsAsFactors = F)
df
str(df)
table(df$gender)


# 이상치를 결측치로 변환

df$gender = ifelse(df$gender %in% c("M","F"),
                   df$gender,
                   NA)
table(df$gender)
df
