package_version(R.version)
#install.packages('Sejong')
library(KoNLP)

useSystemDic() # 시스템 사전 설정
useSejongDic() # 세종 사전 설정
useNIADic()  

library(NIADic)

install.packages("installr")
library(installr)

updateR()

#라이브러리 버전을 낮추기
#???나콘다에서 R버전 변경하기
#오후에 진행.
#R 버전 3.6.3으로 변경해야함. R 폴더 들어가서 확인
#깃허브 들어가서 우리말 확인해보기 