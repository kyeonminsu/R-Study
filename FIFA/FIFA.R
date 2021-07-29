#install.packages('data.table')
library('data.table')
setwd("C:/Users/kyeon/OneDrive/바탕 화면/빅데이터/R/FIFA")
getwd()
df<-file.choose ()
#sc<-read.csv("C:\\Users\\kyeon\\OneDrive\\바탕 화면\\빅데이터\\R\\FIFA\\results.csv")
#sc<-fread("C?\\Users\\kyeon\?OneDrive\\바탕 화면\\빅데이터\\R\\FIFA\\results.csv")
system.time(sc<-read.csv("C:\\Users\\kyeon\\OneDrive\\바탕 화면\\빅데이터\\R\\FIFA\\results.csv")) 
#fread()가 속도가 더 빠름.
head(sc)
sc <- as.data.table(sc)
#[행, 열, 그룹 조건]
sc[1,]
sc[1,1]
sc[tea?=='Korea Republic', ]
head(sc[team=='Korea Republic' & opponent=='Japan', ])
sc[team=='Korea Republic', 3]
sc[team=='Korea Republic', (opponent)]
sc[team=='Korea Republic',mean(team_score)]
sc[team=='Korea Republ?c', mean(team_score), by="team"]
sc[, lengt?(which(team=='Korea Republic'))]

sc[team=='Korea Republic', .(avg_goal = mean(team_score),avg_miss_goal=mean(opponent_score))]
sc[team=='Korea Republic', .(avg_goal = mean(team_score),avg_miss_goal=mean(opponent?score)), by=.(opponent)]
sc[team=='Korea Re?ublic', .(avg_goal = mean(team_score),avg_miss_goal=mean(opponent_score)), by=.(opponent)][order(avg_goal, decreasing = TRUE)]
#- 정렬순서

sc[team=='Korea Republic',.(result=ifelse(team_score>opponent_score,'승',ifelse(team_score==opponent_score,'무','패'?))]
sc[,result:=ifelse(team_score>opponent_score,'승',ifelse(team_score==opponent_score,'무','패'))]
sc
sc[,.(win=sum(result=='승')),by=.(team)]
sc[,.(win=sum(result=='승')),by=.(team)][order(-win)][1:10]
sc[,.(team, result=ifelse(team_score>opponent_score?'승',ifelse(team_score==opponent_score,'무','패')))][,.(win=sum(result=='승'),
                                            mu=sum(result=='무'),lose=sum(result=='패')),by=.(team)]
#열 삭제 
sc[, result:=NULL]

sc[team=='Korea Republic' & opponent=='Japan',?(team, result=ifelse(team_score>opponent_score,'승',ifelse(team_score==opponent_score,'무','패')))][,.(win=sum(result=='승'),
                                                                                                         mu=sum(result=='무'),lose?sum(result=='패')),by=.(team)]

sc[team=='Korea Republic' & opponent =='China', .(team, date, tournament, result=ifelse(team_score>opponent_score, '승', 
                                                                      ifelse(team_score==opponent_scor?, '무', "패")))][result=='패']










