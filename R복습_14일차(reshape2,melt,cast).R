#reshape2 패키지
install.packages('reshape2')
library(reshape2)


#데이터 생성
stu.df <- data.frame(
  'name'=c("짱구",'철수','유리'),
  'gender'=c('남','남','여'),
  'kor'=c(50,100,80),
  'math'=c(70,90,100),
  'eng'=c(65,85,70)
)

stu.df


#melt(데이터, id.vars=기준이되는 열, measure.vars=반환열)
melt_test <- melt(stu.df,id.vars='name',measure.vars=c('kor','math'))
melt_test
#name열을 기준으로 국어, 수학점수가 새로로 재배치

melt(stu.df,id.vars=c('kor','math'),measure.vars='name')

#id,vars를 설정하지 않으면 데이터의 첫번째 열이 자동적으로 기준이됨
melt_test1 <- melt(stu.df,measure.vars=c('kor','math'))
melt_test1
#id.vars를 적지않아도 name기준이 되었으며, 모든 열이 반환


#name 열 기준으로 국어와 수학점수가 세로로 재배치
melt_test <- melt(stu.df)
#Using name, gender as id variables : 성별이나 이름과같은 고유값을
#식별변수로 사용하겠다는 뜻
melt_test


#cast()

#dcast(데이터, 기준열~변환)
#dcast비교를 위해 melt함수로 데이터 구조 변경 후 사용
melt_test <- melt(stu.df, id.vars='name',measure.vars=c('kor','math'))
melt_test

dc_test <- dcast(melt_test,name~variable)
dc_test
#variable(과목이름) 범주형 데이터가 열이름으로 변환

#기준열이 여러개일때(+사용)
melt_test <-  melt(stu.df)
melt_test #이름과 성별기준으로 나열
dc_test <- dcast(melt_test,name+gender~variable)
#기준열이 여러개일때 +를 사용하여 나열해줌
dc_test #이름이랑 성별 기준으로 재배치

dc_test1 <- dcast(melt_test,gender+variable+value~name)
dc_test1 #기준열이 성별, 과목, 점수가 되었으므로 이름이 나열됨
#이름은 해당값이 없는 경우 na로 처리


#acast(데이터, 기준열~반환열~분리기준열)
melt_test

#학생들의 이름을 기준으로 과목점수마다 성별 확인
ac_test <- acast(melt_test,name~gender~variable)
ac_test
class(ac_test) #array


#학생들의 이름을 기준으로 성별마다 과목점수 확인
ac_test1 <- acast(melt_test,name~variable~gender)
ac_test1
class(ac_test) #array

#이름을 기준으로 name열을 반환한 데이터에는
#variable(과목)별로 데이터가 분리된다


#cast함수로 데이터를 사용하면 요약면 사용가능
#성별을 기준으로 과목당 합계(dcast)
dcast(melt_test,gender~variable)

#cast에서 함수사용하기
dcast(melt_test,gender~variable,sum)
#성별별로 과목당 합계반환

#성별을 기준으로 과목당 평균점수 확인(acast)
acast(melt_test,gender~variable,mean)



#=======실습=======#
#직원정보 데이터프레임 생성
emp.info <- data.frame(
  'name'=c('한유진','한유민','김해진','박동해'),
  'age'=c(25,27,25,20),
  'dept'=c('개발','개발','영업','생산'),
  'sal'=c(200,300,400,200)
)

emp.info


#1)직원 이름을 기준으로 부서와 나이 반환받기
emp_melt<- melt(emp.info,id.vars='name',measure.vars=c('dept','age'))
emp_melt


#2)melt된 emp_melt를 name을 기준으로 부서반환받기
dcast(emp_melt,name~variable)
