library(reshape2)

df = airquality; 
df

melt_df <- melt(df,id.vars=c("Month","Day")); 
head(melt_df)


# Month를 기준으로 각 값들의 mean
dcast_df <- dcast(melt_df,
                  formula=Month ~ variable,
                  fun=mean,
                  na.rm=T)
dcast_df

# 모든 column 원상 복구
dcast_df <- dcast(melt_df,formula=Month + Day ~ ...)
dcast_df


#### mpg 데이터 셋 사용
df <- as.data.frame(mpg)

melt_df <- melt(df, id.vars=c("manufacturer","model"),
                measure.vars="cty")
melt_df;

dcast_df <- dcast(melt_df,
                  formula=manufacturer ~ variable,
                  fun=mean)
dcast_df
## cf. 각 제조사별 cty의 평균

df <- as.data.frame(mpg)

df %>% group_by(manufacturer) %>%
  summarise(avg_cty=mean(cty))



