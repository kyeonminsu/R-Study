#install.packages('data.table')
library('data.table')
setwd("C:/Users/kyeon/OneDrive/���� ȭ��/������/R/FIFA")
getwd()
df<-file.choose ()
#sc<-read.csv("C:\\Users\\kyeon\\OneDrive\\���� ȭ��\\������\\R\\FIFA\\results.csv")
#sc<-fread("C?\\Users\\kyeon\?OneDrive\\���� ȭ��\\������\\R\\FIFA\\results.csv")
system.time(sc<-read.csv("C:\\Users\\kyeon\\OneDrive\\���� ȭ��\\������\\R\\FIFA\\results.csv")) 
#fread()�� �ӵ��� �� ����.
head(sc)
sc <- as.data.table(sc)
#[��, ��, �׷� ����]
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
#- ���ļ���

sc[team=='Korea Republic',.(result=ifelse(team_score>opponent_score,'��',ifelse(team_score==opponent_score,'��','��'?))]
sc[,result:=ifelse(team_score>opponent_score,'��',ifelse(team_score==opponent_score,'��','��'))]
sc
sc[,.(win=sum(result=='��')),by=.(team)]
sc[,.(win=sum(result=='��')),by=.(team)][order(-win)][1:10]
sc[,.(team, result=ifelse(team_score>opponent_score?'��',ifelse(team_score==opponent_score,'��','��')))][,.(win=sum(result=='��'),
                                            mu=sum(result=='��'),lose=sum(result=='��')),by=.(team)]
#�� ���� 
sc[, result:=NULL]

sc[team=='Korea Republic' & opponent=='Japan',?(team, result=ifelse(team_score>opponent_score,'��',ifelse(team_score==opponent_score,'��','��')))][,.(win=sum(result=='��'),
                                                                                                         mu=sum(result=='��'),lose?sum(result=='��')),by=.(team)]

sc[team=='Korea Republic' & opponent =='China', .(team, date, tournament, result=ifelse(team_score>opponent_score, '��', 
                                                                      ifelse(team_score==opponent_scor?, '��', "��")))][result=='��']










