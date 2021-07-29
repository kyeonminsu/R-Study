# data frame 생성
# vector를 이용한 data frame 생성
no = c(1,2,3)
name = c("홍길동","최길동","김길동")
pay = c(250,150,300)

df = data.frame(NO=no,Name=name,Pay=pay)
df

# matrix를 이용한 data frame 생성
mat1 = matrix(data = c(1,"홍길동",150,
             ?         2,"최길동",150,
                       3,"김길동",300),
              nrow = 3,
              by=T)           # 행 우선

mat1

memp = data.frame(mat1)
memp

# 3개의 vector를 이용하여 data frame 생성
df = data.frame(x=c(1:5),
                y=seq(?,10,2),
                z=c("a","b","c","d","e"))
df
# data frame의 column을 참조하기 위해서는 $ 이용
df$x           # 1 2 3 4 5



df = data.frame(x=c(1:5),
                y=seq(2,10,2),
                z=c("a","b","c","d","e"))
str(df)

summary(df)


# ?ubset() 함수의 사용

df = data.frame(x=c(1:5),
                y=seq(2,10,2),
                z=c("a","b","c","d","e"))

sub1 <- subset(df, x>=3)   # x가 3이상인 행 추출
sub1

sub2 <- subset(df, x>=3 & y<=8)
sub2

M=matrix(c(1:9),3,3,byrow=T)
M
N=matrix(c(?:9),3,3)
N
M%*%N



test = data.frame(DepartmentID=c(31,33,34,35),
                  DepartmentName = c("영업부","기술부","사무부","마케팅"))
test

