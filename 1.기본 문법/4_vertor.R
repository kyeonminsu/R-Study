# scalar 생성
var1 <- c(100)   # scalar
var1

# vector 생성 - c()

var1 = c(10,30,77,100)
var1

var2 = c(89,56,33)
var2

var3 = c(TRUE,FALSE,FALSE,TRUE)
var3

var4 = c("홍길동", "강감찬", "유관순")
var4

var5 = c("홍길동", 100, TRUE, 3.141592)
var5

var6 =?c(var1, var2)
var6

var7 = c(var1, var4)
var7

# vector 생성 - :

var1 = 1:5
var1

var2 = 5:0
var2

var3 = 3.3:10
var3

# vector 생성 - seq()

var1 = seq(from=1, to=5, by=1)
var1

var2 = seq(from=0.5, to=10, by=1.5)
var2

var3 = seq(from=10, to=5, by=-2)
v?r3


# vector 생성 - rep()    # replicate 함수

var1 = rep(1:3, times=3) # times 생략 가능
var1                     # 1 2 3 1 2 3 1 2 3 

var2 = rep(1:3, each=3)  # each는 각 원소가 반복할 횟수 지정
var2                     # 


# vector간의 연산

var1 = 1?3
var2 = 4:6

var1                      # 1 2 3
var2                      # 4 5 6 

var1 * 2                  # 2 4 6
var1 + 10                 # 11 12 13

var1 + var2               # 5 7 9

var3 = 1:6
var3

var1 + var3               # var1 : 1 2 3 1 2 3 (?ecycling rule)
# var3 : 1 2 3 4 5 6
# 2 4 6 5 7 9

var4 = 1:5
var4

var1 + var4               # var1 : 1 2 3 1 2 (recycling rule)
# var4 : 1 2 3 4 5
# 연산은 되지만 warning 발생
# 2 4 6 5 7

