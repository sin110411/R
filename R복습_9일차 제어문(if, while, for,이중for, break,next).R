#조건문

#if 조건문
#if(조건식){조건식이 참일때 실행할 문장}

#조건식이 참일경우
if(TRUE){
  print('조건문 안의 문장')
}
print('조건문 밖의 문장')

#조건식이 거짓일경우
if(FALSE){
  print('조건문 안의 문장')
}
print('조건문 밖의 문장') #조건문 밖의 문장만 출력


#if ~ else if
my_age <- 25

if(my_age>=20){ #조건식1이 참일경우 실행
  print('성인입니다')
}else if(my_age>=17){
  print('고등학생 입니다') #조건식 1이 거짓이고 2가 참일경우 실행
}else if(my_age>=14){
  print('중학생 입니다') #조건식 1,2가 거짓이고 3이 참일경우 실행
}else if(my_age>=10){
  print('초등학생입니다') #조건식1,2,3이 거짓이고 4가 참일경우 실행
}
print('프로그램을 종료합니다.') #조건문 밖의 문장


#if ~ else if~ else
class <- 10

if(class==1){
  print('1반입니다')
}else if(class==2){
  print('2반입니다')
}else if(class==3){
  print('3반입니다')
}else{
  print('다시 반 번호를을 확인해주시기 바랍니다')
}


#if ~ if
my_age <- 20

if(my_age>=20){
  print('성인입니다')
}

if(my_age>=17){
  print('고등학생입니다')
}
#서로 다른 조건문이기때문에 참으로 인식되는 if문 두개가 전부다 출력됨



#============조건문 실습===========#

#<실습>
#1.홀짝 판별하는 
#정수를 저장하는 변수 생성 후
#변수에 저장된 정수가 홀수인지 짝수인지 판별하는 프로그램

num <- 11

if(num%%2==0){
  print('짝수입니다')
}else if(num%%2==1){
  print('홀수입니다')
}


#2.배수판별
#정수를 저장하는 변수 생성 후, 
#저장된 값이 4와5의 배수라면 변수에 저장된값 그대로 출력
#그게 아니라면 0을 출력

num1 <- 21

if(num1%%4==0 & num1%%5==0){
  print(num1)
}else{
  print(0)
}


#3. 나이에 따른 입장료 계산 프로그램 
#10세 이하의 입장료는 1000원
#65세 이상은 0원
#기본입장료는 2000원
#나이, 입장료 출력

age <- 9

if(age<=10){
  price <- 1000
}else if(age>=65){
  print <- 0
}else{
  price <- 2000
}

cat(age,'살의 입장료는 : ',price,'원 입니다')


#============조건문 실습===========#


#반복문


#while : 조건이 참일동안만 반복하는 반복문
#while(TRUE){#무한 반복문 / 무한 루프}

while(FALSE){
  print('반복문 안의 문장')
}
print('while문 종료') #거짓이기때문에 반복문 밖의 문장 출력

#1~10출력

num <- 1

while(num<=10){
  print(num)
  num <- num+1
}
print('숫자 출력 종료')



#============반복문(while) 실습===========#

#<실습>
#1시부터 시작해서 7시가 되면 알람이 울리는 프로그램 만들기
#while문 사용
#<출력결과>
#1시
#2시
#...
#7시가 되었습니다 알람이 울립니다

#<방법1>wile 조건식 사용
time <- 1

while(time<=6){
  cat(time,'시\n')
  time <- time+1
}
cat(time,'시가 되었습니다. 알람이 울립니다.')


#<방법2>무한반복 사용

time <- 1

while(TRUE){
  if(time <=6)
  cat(time,'시\n')
  else
    break
  time <- time+1
}
cat(time,'시 가 되었습니다. 알람이 울립니다.')


#============반복문(while) 실습===========#


#for
#for : 범위나 횟수가 정해져있는 동안 반복해서 실행
#for(변수 in 집합){반복할 문장}

for(i in 1:10){
  print(i) #한번 반복할때마다 i가 반복될 수 있도록 함
}


#반복횟수로 이용
for(i in 1:3){
  print('안녕!')
} #반복되는 객체가 저장된 변수를 출력하는것이 아니라면
# for는 반복되는 객체의 수 만큼 해당 문장을 반복해서 보여줌


#============반복문(for) 실습===========#

#<실습>
#1) 1~20까지 출력
for(i in 1:20){
  print(i)
}


#2)20~1까지 출력
for(i in 20:1){
  print(i)
}

for(i in seq(20,1,-1)){ #20부터 1까지인데 간격이 -1이기때문에
  #20에서 하나씩 줄어들며 1까지 도달
  print(i)
}


#3) 10~30까지 출력하는데 짝수만 출력
for(i in 10:30){
  if(i%%2==0){
    print(i)
    }
}

for(i in seq(10,30,2)){ #10에서 30까지 도달하는데 간격을 2씩주어
  #if문 없이도 seq를 통해 짝수만 출력될 수 있도록 함.
   print(i)
}


#4) 구구단 7단 출력
#출력 예시
#7 X 1 =7

for(i in 1:7){
  cat(7,'x',i,'=',7*i,'\n')
}


#5)1~20까지 3의 배수 합 출력

result <- 0

for(i in 1:20){
  if(i%%3==0){
    result <- result+i
    print(result)
  }
}
cat('1~20까지의 숫자 중 3의 배수 합계 :', result)

#============반복문(for) 실습===========#


#반복문 활용(데이터 프레임)
df <- data.frame(
  name=c('짱구','철수','유리'),
  score=c(60,90,80)
)

print(df)


#반복문으로 score열 데이터 가져오기
for(i in 1:length(df$score)){
  print(df$score[i])
} #데이터 프레임명[인덱스 번호] 길이때문에 3까지 나오게 되는데
#인덱스 번호로 활용하여 출력한것



#반복문을 통해 데이터프레임에 새로운 열 추가
#70점 이상이면 합격 아니면 불합격 = is_test 열추가

is_pass <- c()

for(i in 1:length(df$score)){
  if(df$score[i]>=70){
    is_pass[i] <- '합격'}
  else{
     is_pass[i] <- '불합격'
}
}

print(is_pass)


#is_test에 is_pass문 추가하기
df$is_test <- is_pass
print(df)



#이중 반복문
for(i in 1:3){
  for(j in 1:3){
    cat('i=',i,'j=',j,'\n')
  }
}


#============이중 반복문(for) 실습===========#

#<실습> 구구단 출력 (2~9단까지 구구단 출력)
#2X1=2...

for(i in 2:9){
  cat('===',i,'단===\n')
  for(j in 1:9){
    cat(i,'x',j,'=',i*j,'\n')
  }
}

#============이중 반복문(for) 실습===========#


#기타 제어문
#break : 해당 중괄호 영역을 즉시 탈출
#1~10까지 숫자 중 5까지만 출력하기

for(i in 1:10){
  print(i)
  if(i==5){
    break #for문의 중괄호 영역탈출
  }
}

#10까지만 출력
for(i in 1:20){
  if(i==10){
    break
  }
  print(i)
}


#next문 : 다음 반복문으로 넘어간다
#1~10까지 숫자 중 5를 제외하고 출력

for(i in 1:10){
  if(i==5){
    next
  }
  print(i)
}



#짝수를 제외하고 홀수만 출력
for(i in 1:30){
  if(i%%2==0){
    next
  }
  print(i)
}