#벡터 생성(vecter)
#벡터명 <- c()

v1 <- c(1,2,3,4);
#숫자형 벡터
print(v1);

print(class(v1)); #numeric출력(숫자형벡터)
print(typeof(v1)); #숫자는 기본적으로 실수타입

v2 <- c(1L,2L,3L);
print(typeof(v2)); #정수형 벡터
#변수 창에서 int로 표시

v3 <- c(TRUE, TRUE, FALSE);
print(v3);
print(typeof(v3)); #논리형 벡터

v4 <- c('a','b','c');
print(mode(v4)); #문자형 벡터
#벡터의 요소는 반드시 동일해야함

v5 <- c(1,2,TRUE,'HI');
print(v5);      
print(typeof(v5)); #character
#다른 타입으로 벡터를 만드는데 그 중 문자가있다면
#자동적으로 전부 문자타입으로 출력됨

v6 <- c(1,2,FALSE,TRUE);
print(v6);
print(typeof(v6)); #숫자(실수)형 벡터
#논리형과 숫자형이 벡터의 요소에 같이 있으면
#벡터의 요소는 숫자형 값이 된다.



#연속적인 숫자로 구성된 벡터생성
#벡터명 <- 시작값:종료값
v1 <- c(1:10)
v1 <- 1:10 #c함수 생략가능
print(v1) #1~10까지의 숫자 벡터생성

v2 <- c(1,3,5,7,10:20)
print(v2)
v3 <- c(1,2,3,10:15)
print(v3)


#일정한 간격의 숫자로 구성된 벡터생성
#seq(시작값, 종료값, 간격)
v3 <- seq(1,10,2)
print(v3)

v4 <- seq(5,15,3)
print(v4)

v5 <- c(seq(0.2,1.0,0.3))
print(v5)


#반복된 숫자로 이루어진 벡터생성
v6 <- rep(1,times=5)
print(v6) #1 6번 반복

v7 <- c(rep(1:5,times=3))
print(v7)


#숫자가 아닌값 반복하기
test <- rep('a',times=4)
print(test)

test1 <- rep('안녕',3) #times생략 가능 반복할 횟수만 적기
print(test1)

v8 <- rep(c(1,5,10),times=2)
print(v8)

v9 <- rep(c(1,5,10),each=2)
print(v9)


#벡터의 특정요소 접근(인덱싱)
#벡터명[인덱스 번호]

v <- c('a','b','c','d','e')
print(v)
print(v[1])
print(v[2])
print(v[3])
print(v[4])
print(v[5])
print(v[6])#인덱스의 값을 넘어가면 결측값 반환

#벡터의 여러요소에 접근(슬라이싱)
#벡터명[시작:종료]
print(v[1:3])
print(v[3:4])

print(v[seq(1,5,2)])
print(v[seq(1,5,3)])

#벡터의 특정값 제외출력
print(v[-2])
print(v[-3])
print(v[-c(1:3)]) #인덱스 번호 중 3~5번까지 제외
print(v[-c(3:2)])

#벡터의 요소값에 이름설정
#names(벡터) <- c(이름1, 이름2,..)
score <- c(70,80,90)
names(score) <- c('짱구','유리','철수');
print(score)#이름과 요소들이 함께 출력
print(names(score)) #이름만 출력가능
print(score[1]) #인덱스 번호로 접근
print(score['짱구'])
print(score[c(1:2)])
print(score[c('짱구','유리')])
print(score[c('유리','철수')])
print(score[-2])
print(score[-'짱구']) #이름은 안됨

#벡터 값 수정
vec <- seq(10,100,10)
print(vec)

print(vec[1])
vec[1] <- 100
print(vec)
vec[2] <- 200
print(vec)

print(vec[2:4])
vec[2:4] <- c(200,300,400)
print(vec)

print(vec[seq(1,7,2)])
vec[seq(1,7,2)] <- c(1000,3000,500,700)
print(vec)



#벡터와 산술연산자
v1 <- c(1,4,5,7,9)
print(v1)

print(v1+10) #벡터의 각 요소마다 10이 더해짐
print(v1+20)
print(v1+30)
print(v1*2) #다른 연산들도 가능
print(v1-3)


#벡터끼리의 산술연산
v2 <- seq(1,15,3)
print(v2)

print(v1+v2)#백터간 대응되는 위치에 있는 요소끼리연산
print(v1*v2)
print(v2+(v1*2))#연산자 자유롭게 사용가능


#벡터의 길이가 같지 않은 벡터끼리의 연산
v3 <- c(1,2,3)
print(v1+v3)
#서로배수관계에 있지않다는 오류발생
#벡터의길이가 같지 않음

cat('v1의 벡터길이: ',length(v1))
cat('v2의 벡터길이: ',length(v3))
#길이가 다른경우 서로 배수관계에 있다면 계산이 가능함
#(2,4), (3,9)개 등등..

v4 <- 1:6
print(v4)

print(v3+v4)
#길이가 다름에도 불구하고 오류나지않음
cat('v3의 벡터길이: ', length(v3))
cat('v4의 벡터길이: ',length(v4))
#각각 위치가 맞는 벡터의 요소끼리 계산한다음
#길이가 더 짧은 벡터가 다시힌번 순서가 돌아가며 배수끼리게싼
#재사용법칙!


#벡터에서 사용가능한 함수
v <- c(1,3,5,7,9)
cat('벡터의 길이: ', length(v))
cat('벡터 요소의 합: ',sum(v))
cat('벡터 요소의 평균: ',mean(v))
cat('벡터의 최대값: ',max(v))
cat('벡터의 최소값: ',min(v))
cat('벡터의 중간값: ',median(v))
cat('벡터 요소의 범위: ', range(v)) #최소값, 최대값반환


#벡터와 관계연산자
v <- 1:9
print(v)


print(v>5) #벡터의 요소하나하나가 5보다 큰지 물어보는것
#조건에맞는 값들은 TRUE로 출력되고 아닌 값들은 FALSE로출력

print(v[v>5])#벡터의 요소중에 참값인 애들만 뽑앗 
#새로운 벡터를 만든것
#v[조건식] : 필터링이라고 부름
#조건식 : 결과가 TRUE,FALSE논리형으로 나오는 식

condi <- (v>5 & v<8) #벡터의 요소중 5보다 크고 8보다 작은 것드이 조건
print(condi)
print(v[condi]) #조건에 맞는애들만 따로 빼서 벡터로 만들어줌

condi <- !(v<=3 | v>=8)
print(condi)
print(v[condi])



#-------------------------------#
#<실습1>
#1)10,11,13,15,16 5개의 값을 가지는 벡터 생성
v1 <- c(10,11,13,15,16)
print(v1)

#2)15~25까지의 값을 가지는 벡터 생성
v2 <- 15:25
print(v2)

#3) 20~30까지의 숫자 중 짝수만을 가지는 벡터 생성
v3 <- seq(20,30,2)
print(v3)

#4)20개의 TURE라는 요소를 가지는 벡터 생성
v4 <- rep(TRUE,times=20)
print(v4)

v4 <- 1:20
condi <- v4>0
print(condi)



#-------------------------------#
#<실습2>
#1)100에서 150까지 저장된 벡터 생성
v5 <- 100:150
print(v5)

#2)위의 벡터에서 10번째 값 출력
print(v5[10])


#3) 위의 벡터에서 3~12번째 값 출력
print(v5[3:12])


#4) 위의 벡터에서 맨끝에서 10개의 값들만 제외하고 출력
#벡터의 길이 계산사용
print(v5[-c(42:51)])
print(v5[1:(length(v5)-10)])

#5)위의 벡터에서 홀수값들 만 출력
print(v5[v5%%2==1])


#6) 앞에서부터 20개의 값을 1부터 20이라는 값으로 수정하고 출력
v5[1:20] <- c(1:20)
print(v5)


#<실습3>
#짱구, 철수, 맹구, 훈이, 유리 5명의 학생의 점수
# 각각 60,95,55,70,85점
#학생의 점수를 요소로 가진 벡터 생성
#벡터의 요소마다 학생의 이름으로 요소명 지정하고 출력
#요소마다 지정된 이름만 출력
student <- c(60,95,55,70,85)
names(student) <- c('짱구','철수','맹구','훈이','유리')
print(student)
print(names(student))


#학생의 인원수 출력
cat('학생인원수 출력: ', length(student),'명')
#학생들의 총점 출력
cat('학생들의 총점: ', sum(student),'점')
#학생들의 평균 점수 출력
cat('학생들의 평균 점수 출력: ', mean(student),'점')