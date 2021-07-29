# matrix 생성

var1 = matrix(c(1:5))   
var1                    

# nrow 속성을 이용해여 지정된 행을 가지는 matrix 생성
# 열 기준으로 데이터가 채워진다. 

var2 = matrix(c(1:10), nrow=2)
var2                            


# nrow 속성 사용시 만약 행과 열의 ???가 일치하지 않는 경우

var3 = matrix(c(1:13), nrow=3)
var3                          

# matrix 생성 시 행 우선으로 데이터를 생성하는 경우

var4 = matrix(c(1:10), nrow=2, byrow=T)
var4                      

# vector를 대상으로 rbind()는 행 묶음으로 matrix??? 생성
# vector를 대상으로 cbind()는 열 묶음으로 matrix를 생성

var5 = c(1,2,3,4)
var6 = c(5,6,7,8)

mat1 = rbind(var5, var6)
mat1         

mat2 = cbind(var5, var6)
mat2

# 데이터 타입과 데이터 구조 확인
mode(mat1)             # numeric
class(mat1)        ?   # matrix


# matrix 연산
var1 = matrix(c(1:6), ncol=3)
var1

var2 = matrix(c(1,-1,2,-2,1,-1), ncol=3)
var2

var1*var2   # elementwise product(element단위의 곱연산)

t(var1)     # transpose matrix (전치행렬)

var3 = matrix(c(1,-1,2,-2,1,-1), ncol=2)
var3?
var1 %*% var3   # matrix product (행렬곱)

# 역행렬 : matrix A가 nxn matrix일 때, 
# 아래를 만족하는 nxn matrix B가 존재하면 B를 A의 역행렬이라 한다.
# AB = BA = I(단위행렬 E)
# 가우스 조던 소거법을 이용하여 계산.

var1 = matrix(c(1,2,3,3,0,1,5,4,2), ncol?3)
var1

solve(var1)     # matrix inversion (역행렬)
