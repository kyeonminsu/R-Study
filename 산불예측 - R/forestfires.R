library(ggplot2)# 시각화 함수
library(dplyr)# 데이터 조작 함수 
install.packages('car')
library(car) #some 함수 사용
install.packages("vcd")
library(vcd) #모자이크 그림
library(gridExtra) # 그래프 그리드

#csv파일을 불러온다. 
df=read.csv("forestfires.csv")

#데이터 타입을 확인한다. 
class(df)

#데이터의 앞부분을 확인한다.
head(df)

#데이터의 뒷부분을 확인한다.
tail(df)

#데이터를 랜덤으로 확인할 수 있다. some함수는 car패키지에 있다.
some(df)

#데이터의 컬럼들을 확인한다.
ls(df)

#데이터 구조를 한눈에 확인한다.
str(df)

#데이터의 행 개수를 확인한다.
nrow(df)

#데이터의 열 개수를 확인한다.
ncol(df)

# 데이터의 차원을 확인한다.
dim(df)

#요약 통계량을 확인한다.
summary(df) 

#범위를 확인한다. 
range(df$FFMC)

#분산을 확인한다.
df_tmp<-select(df, -month,-day)
df_tmp
var(df_tmp)

#표준편차를 확인한다. 
sd(df_tmp$X)


#결측지 or 이상치값 탐색
is.na(df)
table(is.na(df)) #517x13=6721

#시각화 
# ggplot(data=df, aes(x=day))+
#       geom_bar()+
#       xlab("")+ylab("")+
#       scale_fill_gradient(low = "#CCE5FF", high = "#FF00FF")+
#       theme_classic() + ggtitle("day")


circle<-table(df$month)
pie(circle, clockwise=T)

#막대 그래프 
# month
a<- ggplot(df, aes(x=month)) +
geom_bar(aes(fill=month))+
geom_text(aes(label=..count..),stat='count',vjust = 1.5)+
ggtitle("month")+
theme(plot.title = element_text(hjust = 0.5))  

#day
b<- ggplot(df, aes(x=day)) +
geom_bar(aes(fill=day))+
geom_text(aes(label=..count..),stat='count',vjust = 1.5)+
ggtitle("day")+
theme(plot.title = element_text(hjust = 0.5)) 

test<-grid.arrange(a,b, nrow=1, ncol=2)
ggsave(file="C:/Users/kyeon/OneDrive/바탕 화면/BigData/Fires/graph/2.month,day.jpg",test,width=30, height=20, units=c("cm"))
#X
a<-ggplot(df, aes(x=factor(X))) +
geom_bar(aes(fill=factor(X)))+
xlab("X")+
geom_text(aes(label=..count..),stat='count',vjust = 1.5)+
ggtitle("X좌표")+
theme(plot.title = element_text(hjust = 0.5))  

#Y
b<-ggplot(df, aes(x=factor(Y))) +
geom_bar(aes(fill=factor(Y)))+
xlab("Y")+
geom_text(aes(label=..count..),stat='count',vjust = 1.5)+
ggtitle("Y좌표")+
theme(plot.title = element_text(hjust = 0.5))  

test<-grid.arrange(a,b, nrow=1, ncol=2)
ggsave(file="C:/Users/kyeon/OneDrive/바탕 화면/BigData/Fires/graph/1.X,Y.jpg",test,width=30, height=20, units=c("cm"))


#X,Y 산점도
a<- ggplot(df, aes(x=X, y=Y)) + 
geom_point(shape=16, size=3, colour="red") +
ggtitle("X and Y")+
theme(plot.title = element_text(hjust = 0.5))

#X,Y 막대그래프 
b<- ggplot(df, aes(x=X, fill=factor(Y))) +
geom_bar(position = "dodge")+
geom_text(aes(label=..count..),stat='count',vjust = -0.2)+
ggtitle("X and Y")+
theme(plot.title = element_text(hjust = 0.5)) 

test<-grid.arrange(a,b, nrow=1, ncol=2)
ggsave(file="C:/Users/kyeon/OneDrive/바탕 화면/BigData/Fires/graph/3.X,Y.jpg",test,width=30, height=20, units=c("cm"))

a<- ggplot(df, aes(x=X, fill=factor(Y))) +
geom_bar()+
geom_text(aes(label=..count..),stat='count',vjust = -0.2,position=position_stack(0.5))+
ggtitle("X and Y")+
theme(plot.title = element_text(hjust = 0.5))

b<- ggplot(df, aes(x=X, fill=factor(Y))) +
geom_bar()+
geom_text(aes(label=scales::percent(..count../sum(..count..))),stat='count',vjust = -0.2,position=position_stack(0.5))+  
ggtitle("X and Y")+
theme(plot.title = element_text(hjust = 0.5)) 

test<-grid.arrange(a,b, nrow=1, ncol=2)
ggsave(file="C:/Users/kyeon/OneDrive/바탕 화면/BigData/Fires/graph/4.X,Y.jpg",test,width=30, height=20, units=c("cm"))

 #X,Y 둘의 빈도를 확인을 한다. 모자이크그림
tmp_1 <-df %>% 
        select(X,Y) %>% 
        filter(X<4)
tmp_1

tmp_2 <-  df %>% 
  select(X,Y) %>% 
  filter(X>3 & X<7)
tmp_2

tmp_3 <-  df %>% 
  select(X,Y) %>% 
  filter(X>6 & Y<8)
tmp_3

table_1<-with(tmp_1, table(X,Y))
table_1
table_2<-with(tmp_2, table(X,Y))
table_2
table_3<-with(tmp_3, table(X,Y))
table_3

mosaic(table_1, gp=gpar(fill=c("yellow", "green")),direction="v",main="X(1~3) and Y")
mosaic(table_2, gp=gpar(fill=c("yellow", "green")),direction="v",main="X(4~6) and Y")
mosaic(table_3, gp=gpar(fill=c("yellow", "green")),direction="v",main="X(7~9) and Y")
      
#히스토그램
#FFMC 
a<-ggplot(df, aes(x=FFMC, y=..density..))+
geom_histogram(binwidth=2, fill="blue",colour = "black")+
ggtitle("FFMC")+
#geom_density(alpha=0.3, fill="red")+
theme(plot.title = element_text(hjust = 0.5)) 

b<-ggplot(df, aes(x=FFMC)) + 
geom_density(fill = "blue", colour=NA, alpha=.5) +# alpha 반투명
geom_line(stat="density") +
expand_limits(y=0) +
ggtitle("FFMC")+
theme(plot.title = element_text(hjust = 0.5)) 


test<-grid.arrange(a,b, nrow=1, ncol=2)
ggsave(file="C:/Users/kyeon/OneDrive/바탕 화면/BigData/Fires/graph/5.FFMC.jpg",test,width=30, height=20, units=c("cm"))

#DMC
a<-ggplot(df, aes(x=DMC))+
geom_histogram(binwidth=2, fill="blue",colour = "black")+
ggtitle("DMC")+
theme(plot.title = element_text(hjust = 0.5)) 

b<-ggplot(df, aes(x=DMC)) +   #커널 밀도 곡선
geom_density(fill = "blue", colour=NA, alpha=.5) +# alpha 반투명
geom_line(stat="density") +
expand_limits(y=0) +
ggtitle("DMC")+
theme(plot.title = element_text(hjust = 0.5)) 

test<-grid.arrange(a,b, nrow=1, ncol=2)
ggsave(file="C:/Users/kyeon/OneDrive/바탕 화면/BigData/Fires/graph/6.DMC.jpg",test,width=30, height=20, units=c("cm"))

#DC
a<-ggplot(df, aes(x=DC))+
geom_histogram(binwidth=2, fill="blue",colour = "black")+
ggtitle("DC")+
#geom_text(aes(label=..count..),stat='count',vjust =-0.9)+
theme(plot.title = element_text(hjust = 0.5))

b<-ggplot(df, aes(x=DC)) +   #커널 밀도 곡선
geom_density(fill = "blue", colour=NA, alpha=.5) +# alpha 반투명
geom_line(stat="density") +
expand_limits(y=0) +
ggtitle("DC")+
theme(plot.title = element_text(hjust = 0.5))


test<-grid.arrange(a,b, nrow=1, ncol=2)
ggsave(file="C:/Users/kyeon/OneDrive/바탕 화면/BigData/Fires/graph/7.DC.jpg",test,width=30, height=20, units=c("cm"))

#ISI
a<-ggplot(df, aes(x=ISI))+
geom_histogram(binwidth=2, fill="blue",colour = "black")+
ggtitle("ISI")+
theme(plot.title = element_text(hjust = 0.5))

b<-ggplot(df, aes(x=ISI)) +   #커널 밀도 곡선
geom_density(fill = "blue", colour=NA, alpha=.5) +# alpha 반투명
geom_line(stat="density") +
expand_limits(y=0) +
ggtitle("ISI")+
theme(plot.title = element_text(hjust = 0.5))

test<-grid.arrange(a,b, nrow=1, ncol=2)
ggsave(file="C:/Users/kyeon/OneDrive/바탕 화면/BigData/Fires/graph/8.ISI.jpg",test,width=30, height=20, units=c("cm"))

#temp
a<-ggplot(df, aes(x=temp))+
geom_histogram(binwidth=1, fill="blue",colour = "black")+
ggtitle("temp")+
theme(plot.title = element_text(hjust = 0.5))

b<-ggplot(df, aes(x=temp)) +   #커널 밀도 곡선
geom_density(fill = "blue", colour=NA, alpha=.5) +# alpha 반투명
geom_line(stat="density") +
expand_limits(y=0) +
ggtitle("temp")+
theme(plot.title = element_text(hjust = 0.5))

test<-grid.arrange(a,b, nrow=1, ncol=2)
ggsave(file="C:/Users/kyeon/OneDrive/바탕 화면/BigData/Fires/graph/9.temp.jpg",test,width=30, height=20, units=c("cm"))

#RH
a<-ggplot(df, aes(x=RH))+
geom_histogram(binwidth=1, fill="blue",colour = "black")+
ggtitle("RH")+
theme(plot.title = element_text(hjust = 0.5))

b<-ggplot(df, aes(x=RH)) +   #커널 밀도 곡선
geom_density(fill = "blue", colour=NA, alpha=.5) +# alpha 반투명
geom_line(stat="density") +
expand_limits(y=0) +
ggtitle("RH")+
theme(plot.title = element_text(hjust = 0.5))

test<-grid.arrange(a,b, nrow=1, ncol=2)
ggsave(file="C:/Users/kyeon/OneDrive/바탕 화면/BigData/Fires/graph/10.RH.jpg",test,width=30, height=20, units=c("cm"))

#wind
a<-ggplot(df, aes(x=wind))+
geom_histogram(binwidth=1, fill="blue",colour = "black")+
ggtitle("wind")+
theme(plot.title = element_text(hjust = 0.5))

b<-ggplot(df, aes(x=wind)) +   #커널 밀도 곡선
geom_density(fill = "blue", colour=NA, alpha=.5) +# alpha 반투명
geom_line(stat="density") +
expand_limits(y=0) +
ggtitle("wind")+
theme(plot.title = element_text(hjust = 0.5))

test<-grid.arrange(a,b, nrow=1, ncol=2)
ggsave(file="C:/Users/kyeon/OneDrive/바탕 화면/BigData/Fires/graph/11.wind.jpg",test,width=30, height=20, units=c("cm"))

#Rain
a<-ggplot(df, aes(x=rain))+
geom_histogram(binwidth=1, fill="blue",colour = "black")+
ggtitle("rain")+
theme(plot.title = element_text(hjust = 0.5))

b<-ggplot(df, aes(x=rain)) +   #커널 밀도 곡선
geom_density(fill = "blue", colour=NA, alpha=.5) +# alpha 반투명
geom_line(stat="density") +
expand_limits(y=0) +
ggtitle("rain")+
theme(plot.title = element_text(hjust = 0.5))

test<-grid.arrange(a,b, nrow=1, ncol=2)
ggsave(file="C:/Users/kyeon/OneDrive/바탕 화면/BigData/Fires/graph/12.Rain.jpg",test,width=30, height=20, units=c("cm"))

#area
a<-ggplot(df, aes(x=area))+
geom_histogram(binwidth=1, fill="blue",colour = "black")+
ggtitle("area")+
theme(plot.title = element_text(hjust = 0.5))

b<-ggplot(df, aes(x=area)) +   #커널 밀도 곡선
geom_density(fill = "blue", colour=NA, alpha=.5) +# alpha 반투명
geom_line(stat="density") +
expand_limits(y=0) +
ggtitle("area")+
theme(plot.title = element_text(hjust = 0.5))

test<-grid.arrange(a,b, nrow=1, ncol=2)
ggsave(file="C:/Users/kyeon/OneDrive/바탕 화면/BigData/Fires/graph/13.area.jpg",test,width=30, height=20, units=c("cm"))

#기상과 area 
#area 면적 로그변환 해야함.
df$area_log <- log(df$area + 1)
#area,temp 산점도
a<-ggplot(df, aes(x=temp, y=area, group=1)) + 
geom_line(linetype="dotted", size=1, colour="red") +
geom_point(size=3, shape=19, colour="red") +
ggtitle("temp and area")+
theme(plot.title = element_text(hjust = 0.5))

#area(log),temp 산점도
b<-ggplot(df, aes(x=temp, y=area_log, group=1)) + 
geom_line(linetype="dotted", size=1, colour="red") +
geom_point(size=3, shape=19, colour="red") +
ggtitle("temp and log(area)")+
theme(plot.title = element_text(hjust = 0.5))

test<-grid.arrange(a,b, nrow=1, ncol=2)
ggsave(file="C:/Users/kyeon/OneDrive/바탕 화면/BigData/Fires/graph/14.area,temp.jpg",test,width=30, height=20, units=c("cm"))

#area,RH 산점도
a<-ggplot(df, aes(x=RH, y=area, group=1)) + 
geom_line(linetype="dotted", size=1, colour="red") +
geom_point(size=3, shape=19, colour="red") +
ggtitle("RH and area")+
theme(plot.title = element_text(hjust = 0.5))

#area(log),RH 산점도
b<-ggplot(df, aes(x=RH, y=area_log, group=1)) + 
geom_line(linetype="dotted", size=1, colour="red") +
geom_point(size=3, shape=19, colour="red") +
ggtitle("RH and log(area)")+
theme(plot.title = element_text(hjust = 0.5))

test<-grid.arrange(a,b, nrow=1, ncol=2)
ggsave(file="C:/Users/kyeon/OneDrive/바탕 화면/BigData/Fires/graph/16.area,RH.jpg",test,width=30, height=20, units=c("cm"))

#area,wind 산점도
a<-ggplot(df, aes(x=wind, y=area, group=1)) + 
geom_line(linetype="dotted", size=1, colour="red") +
geom_point(size=3, shape=19, colour="red") +
ggtitle("wind and area")+
theme(plot.title = element_text(hjust = 0.5))

#area(log),wind 산점도
b<-ggplot(df, aes(x=wind, y=area_log, group=1)) + 
geom_line(linetype="dotted", size=1, colour="red") +
geom_point(size=3, shape=19, colour="red") +
ggtitle("wind and log(area)")+
theme(plot.title = element_text(hjust = 0.5))

test<-grid.arrange(a,b, nrow=1, ncol=2)
ggsave(file="C:/Users/kyeon/OneDrive/바탕 화면/BigData/Fires/graph/17.area,wind.jpg",test,width=30, height=20, units=c("cm"))

#area,rain 산점도
a<-ggplot(df, aes(x=rain, y=area, group=1)) + 
geom_line(linetype="dotted", size=1, colour="red") +
geom_point(size=3, shape=19, colour="red") +
ggtitle("rain and area")+
theme(plot.title = element_text(hjust = 0.5))  

#area(log),rain 산점도
b<-ggplot(df, aes(x=rain, y=area_log, group=1)) + 
geom_line(linetype="dotted", size=1, colour="red") +
geom_point(size=3, shape=19, colour="red") +
ggtitle("rain and log(area)")+
theme(plot.title = element_text(hjust = 0.5))

test<-grid.arrange(a,b, nrow=1, ncol=2)
ggsave(file="C:/Users/kyeon/OneDrive/바탕 화면/BigData/Fires/graph/18.area,rain.jpg",test,width=30, height=20, units=c("cm"))


#박스플롯
#FFMC
a<-ggplot(df, aes(x = 1, y = FFMC)) + 
geom_boxplot(width=0.8, outlier.size=3, outlier.shape=16, outlier.colour="red") + 
scale_x_continuous(breaks = NULL) + # x축 이름 생략
theme(axis.title.x = element_blank()) + # x축 구분자 생략
ggtitle("FFMC")+
theme(plot.title = element_text(hjust = 0.5))+
stat_summary(fun.y="mean", geom="point", shape=21, size=3, fill="blue") 

#DMC
b<-ggplot(df, aes(x = 1, y = DMC)) + 
geom_boxplot(width=0.8, outlier.size=3, outlier.shape=16, outlier.colour="red") + 
scale_x_continuous(breaks = NULL) + # x축 이름 생략
theme(axis.title.x = element_blank()) + # x축 구분자 생략
ggtitle("DMC")+
theme(plot.title = element_text(hjust = 0.5))+
stat_summary(fun.y="mean", geom="point", shape=21, size=3, fill="blue")

#DC
c<-ggplot(df, aes(x = 1, y = DC)) + 
geom_boxplot(width=0.8, outlier.size=3, outlier.shape=16, outlier.colour="red") + 
scale_x_continuous(breaks = NULL) + # x축 이름 생략
theme(axis.title.x = element_blank()) + # x축 구분자 생략
ggtitle("DC")+
theme(plot.title = element_text(hjust = 0.5))+
stat_summary(fun.y="mean", geom="point", shape=21, size=3, fill="blue")

#ISI
d<-ggplot(df, aes(x = 1, y = ISI)) + 
geom_boxplot(width=0.8, outlier.size=3, outlier.shape=16, outlier.colour="red") + 
scale_x_continuous(breaks = NULL) + # x축 이름 생략
theme(axis.title.x = element_blank()) + # x축 구분자 생략
ggtitle("ISI")+
theme(plot.title = element_text(hjust = 0.5))+
stat_summary(fun.y="mean", geom="point", shape=21, size=3, fill="blue")

test<-grid.arrange(a,b,c,d, nrow=2, ncol=2)
ggsave(file="C:/Users/kyeon/OneDrive/바탕 화면/BigData/Fires/graph/19.boxplot1.jpg",test,width=30, height=20, units=c("cm"))

#temp
a<-ggplot(df, aes(x = 1, y = temp)) + 
geom_boxplot(width=0.8, outlier.size=3, outlier.shape=16, outlier.colour="red") + 
scale_x_continuous(breaks = NULL) + # x축 이름 생략
theme(axis.title.x = element_blank()) + # x축 구분자 생략
ggtitle("temp")+
theme(plot.title = element_text(hjust = 0.5))+
stat_summary(fun.y="mean", geom="point", shape=21, size=3, fill="blue")


#RH
b<-ggplot(df, aes(x = 1, y = RH)) + 
geom_boxplot(width=0.8, outlier.size=3, outlier.shape=16, outlier.colour="red") + 
scale_x_continuous(breaks = NULL) + # x축 이름 생략
theme(axis.title.x = element_blank()) + # x축 구분자 생략
ggtitle("RH")+
theme(plot.title = element_text(hjust = 0.5))+
stat_summary(fun.y="mean", geom="point", shape=21, size=3, fill="blue")

#wind
c<-ggplot(df, aes(x = 1, y = wind)) + 
geom_boxplot(width=0.8, outlier.size=3, outlier.shape=16, outlier.colour="red") + 
scale_x_continuous(breaks = NULL) + # x축 이름 생략
theme(axis.title.x = element_blank()) + # x축 구분자 생략
ggtitle("wind")+
theme(plot.title = element_text(hjust = 0.5))+
stat_summary(fun.y="mean", geom="point", shape=21, size=3, fill="blue")

#rain
d<-ggplot(df, aes(x = 1, y = rain)) + 
  geom_boxplot(width=0.8, outlier.size=3, outlier.shape=16, outlier.colour="red") + 
  scale_x_continuous(breaks = NULL) + # x축 이름 생략
  theme(axis.title.x = element_blank()) + # x축 구분자 생략
  ggtitle("rain")+
  theme(plot.title = element_text(hjust = 0.5))+
  stat_summary(fun.y="mean", geom="point", shape=21, size=3, fill="blue")


test<-grid.arrange(a,b,c,d, nrow=2, ncol=2)
ggsave(file="C:/Users/kyeon/OneDrive/바탕 화면/BigData/Fires/graph/20.boxplot2.jpg",test,width=30, height=20, units=c("cm"))

par(mfrow=c(1,1))
#barplot(table(df$X), main="montesinho park X 좌표", xlab = "X", ylab = "Count", col = "green" ) #포르투갈의 국립공원
#barplot(table(df$Y))
# barplot(table(df$month))
# barplot(table(df$day))
# barplot(table(df$FFMC))
# barplot(table(df$DMC))
# barplot(table(df$DC))
# barplot(table(df$ISI))
# barplot(table(df$temp))
# barplot(table(df$RH))
# barplot(table(df$wind))
# barplot(table(df$rain))
#hist(df$FFMC)


#month int형으로 변환
df$month<-as.character(df$month)
df
df[,3] #행열 
for(i in 1:517){
  if(df[i,3]=="jan")
  {
    df[i,3]<-"1"
  }
  else if(df[i,3]=="feb")
  {
    df[i,3]<-"2"
  }
  else if(df[i,3]=="mar")
  {
    df[i,3]<-"3"
  }
  else if(df[i,3]=="apr")
  {
    df[i,3]<-"4"
  }
  else if(df[i,3]=="may")
  {
    df[i,3]<-"5"
  }
  else if(df[i,3]=="jun")
  {
    df[i,3]<-"6"
  }
  else if(df[i,3]=="jul")
  {
    df[i,3]<-"7"
  }
  else if(df[i,3]=="aug")
  {
    df[i,3]<-"8"
  }
  else if(df[i,3]=="sep")
  {
    df[i,3]<-"9"
  }
  else if(df[i,3]=="oct")
  {
    df[i,3]<-"10"
  }
  else if(df[i,3]=="nov")
  {
    df[i,3]<-"11"
  }
  else if(df[i,3]=="dec")
  {
    df[i,3]<-"12"
  }
}
df$month<-as.integer(df$month)
str(df)

#요일을 int형으로 변환
df$day<-as.character(df$day)
for(i in 1:517){
  if(df[i,4]=="mon")
  {
      df[i,4]<-"1"
  }
  else if(df[i,4]=="tue")
  {
      df[i,4]<-"2"
  }
  else if(df[i,4]=="wed")
  {
    df[i,4]<-"3"
  }
  else if(df[i,4]=="thu")
  {
    df[i,4]<-"4"
  }
  else if(df[i,4]=="fri")
  {
    df[i,4]<-"5"
  }
  else if(df[i,4]=="sat")
  {
    df[i,4]<-"6"
  }
  else if(df[i,4]=="sun")
  {
    df[i,4]<-"7"
  }
}
df$day
df$day<-as.integer(df$day)
str(df)


#상관관계
#install.packages("corrplot")
library(corrplot)
attach(df)
x<-cor(df[,1:13] ,method = 'pearson')
plot(df)
corrplot(x)
corrplot(x, method = "number")
corrplot(x, method = "ellipse")


#area 면적 로그변환 해야함.

df$area <- log(df$area + 1)
hist(df$area)
qqnorm(df$area)
qqline(df$area)

#표준화, 정규화
