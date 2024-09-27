#데이터프레임
#data.frame함수 사용(벡터1, 벡터2,...)

name <- c('둘리','도우너','또치') #문자열 벡터
rank <- c(1,2,3) #숫자형 벡터

stu.info <- data.frame(name,rank)
print(stu.info)
#문자형 벡터와 숫자형 벡터를결합하여 데이터프레임 생성
#합한 벡터들이 열방향으로 결합
#하나의 벡터는 데이터프레임에서 하나의 열이됨

stu_df <- data.frame(
  #열제목 = 데이터
  ID=1:5,
  name=c('짱구','철수','훈이','맹구','유리'),
  Age=c(5,6,7,5,6),
  scores=c(75,92,88,79,95)
)#요소의개수는 전부 동일해야함. 아니면 에러!

print(stu_df)
print(class(stu_df)) #data.frame


#데이터프레임 적용 함수
#summary(): 데이터프레임의 각 열에 대한 요약 통계확인
print(summary(stu_df))
print(summary(stu.info))


#rownames(): 데이터프레임, 행렬에서 행이름 지정
rownames(stu_df) <- c('1번','2번','3번','4번','5번')
print(stu_df)

#colnames() : 데이터프레임, 행렬에서 열이름 지정
colnames(stu.info) <- c('이름','순위')
print(stu.info) #기존에 name과 rank가 이름,순위로 변경

#데이터프레임 요소접근
#1)행과 열의 인덱스번호 : 데이터프레임[행번호, 열번호]
print(stu_df)
print(stu_df[1,2])
print(stu_df[3,4])
print(stu_df[1,]) #행만 출력
print(stu_df[,2]) #열만 출력

#2)열 이름으로 접근 : 데이터프레임$열이름
print(stu_df$ID) #벡터형으로 가져옴
print(stu_df$name)
print(stu_df$scores)
print(stu_df$name[2]) #이름으로 접근후, 그 안에서 열의 두번째값
print(stu_df$ID[1])

#3)행이름으로 접근 : df['행이름',]
print(stu_df['3번',])
print(stu_df['1번',])
print(stu_df['4번',])


#데이터프레임 수정
#1)특정값 수정
print(stu_df$scores[1])
stu_df$scores[1] <- 70
stu_df[2,3] #6
stu_df[2,3] <- 8
print(stu_df[2,3])


#2)열추가 : 열에 들어갈 값을 벡터로 추가
#df$새로운 열이름 <-  벡터값
stu_df$gender <- c('남자','남자','남자','남자','여자')
print(stu_df)

#3)열 수정
stu_df$Age <- stu_df$Age+1
#Age열에 각각 +1
print(stu_df$Age)
stu_df$Age <- stu_df$Age-1
print(stu_df$Age)

#4)행추가 : 추가할 행의개수만큼 행이 들어가있는
#데이터프레임을 생성 후 추가(기존과 동일해야함!)
#rbind(df,추가할df)
#만약 추가할 행의 개수가 1개라면 리스트형태로 넣어도 됨

#추가할 행의 데이터프레임 생성
new_row <- data.frame(
  ID=6,
  name='짱아',
  Age=2,
  scores=70,
  gender='여자'
)

print(new_row)
rownames(new_row) <- '6번' #행이름 생성

#데이터프레임 추가
stu_df <- rbind(stu_df,new_row)
print(stu_df)


#데이터프레임의 조작함수

#1)subset() : 조건에따라 데이터프레임의 부분집합 반환
#subset(df,조건식)
print(stu_df)
#나이가 6살 이상인 아이들만 가져오기
print(subset(stu_df,Age>=6))
print(subset(stu_df,scores>=85))

subset_df1 <- subset(stu_df,Age>=6)
print(subset_df1)
subset_df2 <- subset(stu_df,scores>=85)
print(subset_df2)

#2)t(): 데이터 프레임의 행과 열 전치함수
print(t(stu_df))
print(stu_df) #원본변경은 안됨
t_df <- t(stu_df) #새로운 변수에 재할당
print(t_df)


#3)apply(데이터 프레임,1 or 2, 함수명): 데이터 프레임의 행이나 열에 함수적용
#각 행의 점수와 학생들의 나이 합계 계산

#행별 계산
row_sums <- apply(stu_df[c('Age','scores')],1,sum)
print(row_sums)
print(apply(stu_df[c('Age','scores')],1,median))

#열별 계산
col_sums <- apply(stu_df[c('Age','scores')],2,sum)
print(col_sums)



#==========실습==========#
#<실습> 
#1) 다음의 데이터를 저장할 데이터 프레임 생성(person.df)
# name      age     gender    height    is_student
# 둘리      10        "M"      150       TRUE
# 또치      12        "F"      155       TRUE 
# 도우너    11        "M"      145       TRUE
# 고길동    40        "M"      170       FALSE

person.df <- data.frame(
  name=c('둘리','또치','도우너','고길동'),
  age=c(10,12,11,40),
  gender=c('M','F','M','M'),
  height=c(150,155,145,170),
  is_student=c(TRUE, TRUE, TRUE, FALSE)
)

print(person.df)

#2)위의 데이터 프레임에서 행 추가 
#name: 마이콜 , age: 20, gender: 'M', height:180 ,is_student:FALSE

new_df <- data.frame(
  name='마이콜',
  age=20,
  gender='M',
  height=180,
  is_student=FALSE
)

person.df <- rbind(person.df,new_df)
print(person.df)

#3)위의 데이터프레임에 행이름 삽입(1번,2번,,,..)
rownames(person.df) <- c('1번','2번','3번','4번','5번')
print(person.df)

#4)데이터 프레임에서 학생인 사람들의 평균 나이와 평균 키 출력
stu_T<- subset(person.df,is_student==TRUE)
print(stu_T)

apply(stu_T[c('age','height')],2,mean) #apply에서 이중 컬럼 선택시 무조건 벡터형태로 출력할것

#5)데이터 프레임에서 학생인 사람들의 나이 합계 출력
print(stu_T)
cat('학생인 사람들의 나이 합계 :' , apply(stu_T[2],2,sum),'살')
