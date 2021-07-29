# 결측치가 포함된 데이터 생성
df <- data.frame(id=c(1,2,NA,4,NA,6),
                 score=c(20,30,NA,50,67,NA))
df

is.na(df)  #NA --> TRUE 
# table() 함수는 빈도를 계산하는 함수
table(is.na(df))      # data frame 전체에 대한 빈도
table(is.na(df$id))   # 특정 column에 대한 빈도
table(is.na(df$score))   # 특정 column에 대한 빈도


# 결측치가 있는 행 제거
library(dplyr)

result_df <- df %>% filter(!is.na(df$id)) # id 결측치 제거
result_df

result_df <- df %>% filter(!is.na(df$score)) # score 결측치 제거
result_df

mean(df$score)            # NA
mean(result_df$score)

# 모든 column에 존재하는 결측치 제거
result_df <- df %>% filter(!is.na(df$score),
                           !is.na(df$id))
result_df

# 결측치가 하나라도 있으면 해당 행 제거
result_df <- na.omit(df)  # 간편하지만 좋은 방식은 아님.
result_df

###########################################################################################
# 함수의 결측치 제외 기능

df <- data.frame(id=c(1,2,NA,4,NA,6),
                 score=c(20,30,NA,50,67,NA))
df

mean(df$score, na.rm=TRUE)   # 결측치를 제외하고 연산수행
sum(df$score, na.rm=TRUE)   # 결측치를 제외하고 연산수행

# 결측치를 평균 값으로 대체

df$score <- ifelse(is.na(df$score), 
                   mean(df$score, na.rm=T),
                   df$score)
df


