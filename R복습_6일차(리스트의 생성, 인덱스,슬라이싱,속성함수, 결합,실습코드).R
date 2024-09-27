#리스트


#리스트의 생성
#list(속성명1=속성값1, 속성명2= 속성값2,...)함수사용

score=c(60,70,80)
names(score) <- c("R","python","sql")

my.info <- list(name='짱구', age=5, gender='Male',score=score)
#미리 벡터로 score를 만들어놓고 리스트에서 다시 score라는 속성명에 할당한것
print(my.info)


#리스트 요소 접근
print(my.info[1]) #첫번째의 속성명, 속성값이 둘다 출력
print(my.info[1:3]) #슬라이싱 가능
print(my.info[[1]]) #[[]]이중괄호 사용하면 속성값만 출력가능
print(my.info[[1:3]]) #[[]]이중괄호 슬라이싱 불가

#리스트 요소중 벡터접근
print(my.info[[4]][1]) #4번째 요소중 1번째의 값
print(score[1]) #위와 동일한 값

#리스트 속성명으로 접근하기
print(my.info$name)
print(my.info$score)
print(my.info$age)
print(my.info$score["R"]) #속성명안에서 다시 이름으로 접근
print(my.info$score["python"])
print(score['python']) #바로 속성명으로 접근해도 됨


#리스트의 요소 값 수정
#1)리스트의 속성명 사용
my.info$name <- '맹구'
print(my.info) #기존의 짱구 -> 맹구 수정

my.info$name <- '유리'
print(my.info$name)

#2)인덱스 번호 사용
my.info[2] <- 7
print(my.info)

my.info[2] <- 6
print(my.info)


#리스트 요소 추가
#리스트명$추가할 속성명 <- 속성값
my.info$class <- '해바라기반'
print(my.info)


#리스트의 속성함수
#length() : 리스트의 길이
print(length(my.info)) #속성값과 속성명은 한쌍이여서 1개로취급

#names() : 리스트의 속성명 확인
print(names(my.info))


#리스트의 결합
list_a <- list(a=1, b=2)
list_b <- list(c=3, d=4)
print(list_a)
print(list_b)

merge_list <- c(list_a,list_b)
print(merge_list)

#리스트는 연산이 불가능함.
print(list_a+10)
print(list_a+list_b)
#결합만 가능


#리스트의 활용 : 행렬과 배열의 이름
ma1=matrix(1:6,nrow=2,ncol=3)
print(ma1) #2행 3열의 행렬

#dimnames(행열 or 배열)
#리스트를 이용하여 행열과 배열에 행이름, 열이름을 지정할 수 있다
dimnames(ma1) <- list(c('row1','row2'),c('col1','col2','col3'))
print(ma1)

ar1 <- array(1:12,dim=c(2,3,2))
print(ar1)
#배열은 차원이름까지 지정할 수 있음
dimnames(ar1) <- list(c('row1','row2'),c('col1','col2','col3'),c('slide1','slide2'))
print(ar1)



#----------------------------------#

#<실습>
#1)아래의 정보가 들어간 리스트 생성
#학생이름(name) : "둘리"
#학생나이(age) : "10"
#학생 점수(scores): 
#           국어: 80 수학: 90 영어:75


scores <- c(80,90,75)
names(scores) <- c('국어','수학','영어')

stu_info <- list(name='둘리', age=10, scores=scores )
print(stu_info)



#2) 위의 리스트에서 학생의 수학점수를 85점으로 수정
stu_info[[3]][2]
stu_info[[3]][2] <- 85
print(stu_info$score)

#3)학생의 평균점수, 총합점수를 출력
cat('학생의 평균점수 : ', mean(stu_info$scores),'점')
cat('학생의 총합점수 : ', sum(stu_info$scores),'점')

#4) 학생 리스트에서 주소(address)="서울"요소 추가
stu_info$address <- '서울'
print(stu_info)