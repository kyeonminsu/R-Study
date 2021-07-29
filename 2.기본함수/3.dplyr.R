library(dplyr)
install.packages('xlsx')
library(xlsx)

excel_data <- read.xlsx(file.choose(),
                        sheetIndex = 1,
                        encoding = "UTF-8")
excel_data

df<-tbl_df(excel_data) # 현재 R의 console 크기에서 볼 수 있는  만??? 결과 출력
df 

df <- rename(excel_data, 
             '클래스' = class,
             '수학' = math,
             '영어' = english 
             )
df    # column명 변경


df <- filter(excel_data,id < 10 & math >50) # filter(data frame, 조건1, 조건2, ... )
?f

excel_data %>% filter(english>=90) #다른 예시

df <- filter(excel_data, #데이터를 정렬
             math > 50) %>%
  arrange(desc(english))
df

df <- select(excel_data,math) #select(data frame, column1, c?lumn2, ...)
df

df<-filter(excel_data, class<2) ?>%select(-math) #math column1만 제외하고 출력
df


#새로운 column 생성, 파생 변수 만들기 
df$test = df$id + 100
df

df <- filter(excel_data, class>1) %>% mutate(test = id+200)
df

# group_by(data frame, 범주형 column)
df <- filter(excel_data, math>30) %>% ?roup_by(id)
df


excel_data %>% group_by(class) %>%
               summarise(mean_math = mean(math), 
                          sum_math = sum(math),
                          median_math = median(math),
                          n = n())



df1 <- data.fr?me(x=c(1,2,3))
df1
df2 <- data.frame(y=c(4,5,6))
df2

bind_rows(df1,df2)
df2 = rename(df2, x = y)
bind_rows(df1,df2)

bind_cols(df1,df2)





