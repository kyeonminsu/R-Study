install.packages("plyr")
library(plyr)

x <- data.frame(id=c(1,2,3,4,6),
                height=c(160,175,180,177,194))
y <- data.frame(id=c(5,4,1,3,2),
                weight=c(55,73,80,94,77))
x
y
# join() : key값을 기준으로 두 개의 data frame을 하나로 ???합
inner_df = join(x,y, by="id", type="inner")  # inner join
inner_df

left_df = join(x,y, by="id", type="left") # left join
left_df

right_df = join(x,y, by="id", type="right") # right join
right_df

full_df = join(x,y, by="id", type="full") # full join
f?ll_df


x <- data.frame(id=c(1,2,3,4,6),
                gender=c("M","F","M","F","M"),
                height=c(160,175,180,177,194))
y <- data.frame(id=c(5,4,1,3,2),
                gender=c("M","F","M","F","M"),
                weight=c(55,73,80,94,77))?
x
y
df <- join(x,y, by=c("id","gender"), type="inner")
df

# 2. 그룹별 기술 통계량 구하기
# tapply() : 집단별 통계치를 구해주며 한번에 1개의 통계치만 구할 수 있다.
str(iris)
unique(iris$Species)
result = tapply(iris$Sepal.Length, iris$Species, FUN=mean) #???균
result
result = tapply(iris$Sepal.Length, iris$Species, FUN=sd) # 표준편차
result

# ddply() : 한번에 여러개의 통계치를 구할 수 있다.
result = ddply(iris, 
               .(Species), 
               summarise,
               avg=round(mean(Sepal.Length)?2),
               sd=round(sd(Sepal.Length),2),
               max=max(Sepal.Length))
result
View(result) 
