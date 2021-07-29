# 극단치를 확인하기 위한 sample code
data = c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,22.1)
summary(data)
# IQR(데이터 중간 위쪽의 mid point - 중간 아래쪽의 mid point)
median_value = summary(data)[3];
median_value
lower_data = c(1,2,3,4,5,6,7,8)
upper_data = c(8,9,10,11,12,13,14,22.1)
mid_lower = median(lower_data); 
mid_lower
mid_upper = median(upper_data);
mid_upper

IQR_value = mid_upper - mid_lower; 
IQR_value
# 기준치 => IQR * 1.5
deter_value = IQR_value * 1.5
deter_value
# 3사분위 값 + 기준치 => summary(data)[5] + deter_value
outlier_value = summary(data)[5] + deter_value; 
outlier_value
boxplot(data)


# mpg data를 이용한 극단치 처리
library(ggplot2)
mpg
class(mpg)

mpg <- as.data.frame(mpg)
class(mpg)

boxplot(mpg$hwy)

# 상자그림의 통계치 추출

boxplot(mpg$hwy)$stats

# 통계치의 결과는 위에서 아래 순으로
# 아래쪽 극단치 경계, 1산분위수, 중앙값, 3사분위수
# 위쪽 극단치 경계를 의미
# 즉, 12~37을 벗어나면 극단치로 분류된다

# 해당 범위를 벗어난 값을 결측치 처리한다.

mpg$hwy <- ifelse(mpg$hwy < 12 | mpg$hwy > 37,
                  NA,
                  mpg$hwy)
table(is.na(mpg$hwy))

result <- mpg %>%
  group_by(drv) %>%
  summarise(hwy_mean=mean(hwy, na.rm=T))
result
