#사용자 정의함수
#함수명 <- function(매개변수,..){실행할 기능}


#인사말을 출력하는 greet()함수 정의
greet <- function(){
  print('hi!')
}


#함수 호출
greet()
greet()
#함수 호출은 횟수에 상관없이 계속 가능

#2개의 숫자를 전달받아 그 합계를 구하는 함수
addNum <- function(num1,num2){
  return(num1+num2)
}

#함수 호출
addNum(10) #매개변수의 개수에 맞춰 인수 전달해야함
addNum(10,10)

#숫자4개를 전달받아 합계를 구하는 함수
addNum <- function(num1,num2,num3,num4){
  result <- num1+num2+num3+num4
  return(result)
}

addNum(10,20,10,10)


#디폴트값 정의
addNum <- function(num1,num2,num3=100,num4=100){
          #디폴트 값은 중간부터 정의할 수 없음. 끝부터 가능
  result <- num1+num2+num3+num4
  return(result)
}

addNum(10,10)
#디폴트값이 있기때문에 인수를 2개만 전달해도 가능함

addNum(10,10,10)
addNum(10,10,10,10)
#디폴값이 설정되어있어도 다른 인수를 넣을 수 있음


#함수호출
#1)매개변수, 리턴 둘다 없는 경우

welcome <- function(){
  print('안녕! :-)')
}

#함수 호출
welcome


#2)매개변수O, 리턴값X
printName <- function(name){
  print(name)
}

#함수 호출
printName('둘리')
printName('짱구')
printName('유리')


#3)매개변수X 리턴값O
getNum <- function(){
  num <- 10
  return(num)
}

getNum()
getNum()
#함수안에 지역변수 10이 저장되어있기때문에
#함수를 호출하게 되면 함수안에 저장되어있는 10이 호출됨

#리턴값이 있는 함수는 하나의 값처럼 사용이 가능함
print(10+getNum())
print(100*getNum())


#4)매개변수O , 리턴O
addNum <- function(num1,num2){
  return(num1+num2)
}

getMax <- function(vec){
  return(max(vec))
}

addNum(10,20)
getMax(c(1,2,3))
getMax(seq(10,50,10)) #매개변수가 벡터이기때문에 인수 벡털 전달

#함수 종료 return
#1)함수의 결과로 반환
#2)함수 종료
exit <- function(){
  print('return문은')
  return() #NULL(빈값의미), 함수를 종료시키고 밑에문장 실행되지 않음
  print('함수 종료를 의미하기도 합니다')
}

exit()
#밑에 문장은 출력되지 않음


#반환해야하는 값이 여러개일 경우
my.func <- function(num1,num2){
  #숫자 2개를 입력받아, 더한값과 곱한값을 반환
  #return(num1+num2,num1*num2) #함수는 정의되더라도 실행 시 에러가 남
  num.sum <- num1+num2
  num.mul <- num1*num2
  return(list(sum=num.sum,
              mul=num.mul))
}

my.func(10,10)
#return(num1+num2,num1*num2)로 작성했을 경우
#다중인자 반환 허용하지 않음

my.func(20,10)


#함수 자체를 변수에 저장하여 출력하기
result <- my.func(10,20)
print(result)

#변수에 저장하면 개별적으로 값을 출력할 수 있음
print(result$sum)
print(result$mul)

cat(result$sum+10)
#개별로 출력한값은 개별값으로 사용가능함

#========사용자 정의함수 실습========#

#<실습>
#함수명 : sum_num
#2개의 정수를 전달받아 그 합을 반환하는 함수

#함수정의
sum_num <- function(num1,num2){
  add <- num1+num2
  return(add)
}

#함수 호출
sum_num(10,100)
sum_num(20,10)


#<실습2>
#함수명 : fac_clac
#양의 정수를 전달받아 그 수의 팩토리얼을 계산하는 함수를 정의
#5!=1X2X3X4X5=>120

fac_clac <- function(num1){
  result <- 1
  for(i in 1:num1){
    result <- result*i
  }
  return(result)
}

fac_clac(5)



#<실습3>
#함수명: even_odd

#숫자형 벡터를 전달받으면 짝수와 홀수를
#각각의 리스트에 분리하여 반환하는 함수 정의
#결과 list(even=짝수들, odd=홀수들,,)

even_odd <- function(vec){
  even <- c()
  odd <- c()
  for(i in 1:length(vec)){
    if(vec[i]%%2==0){
      even[i] <- vec[i]}
    else{
        odd[i] <- vec[i]
      }
  }
  return(list(even=even,odd=odd))
}

even_odd(c(1,2,3,4,5,6,7,8,9,10))
#차례대로 값이 출력되긴 하나, na값이 함께 생성됨
#인덱스번호로 나뉘어져서 빈값이 생기면서 na가 발생함


even_odd <- function(vec){
  even_nums <- vec[vec%%2==0]
  odd_nums <- vec[vec%%2==1]
  result <- list(even <- even_nums, odd=odd_nums)
  return(result)
}

even_odd(c(1,2,3,4,5,6,7,8,9,10))

#벡터[조건식]방법을 이용하여 na값 발생없이 참인 값만 맞춰서 들어갈 수 있도록 함



#사용자 정의함수 apply사용

#--막간 복습--#
#apply
ma1 <- matrix(seq(10,100,10),nrow=2,ncol=5)
print(ma1)
print(dim(ma1)) #2행 5열

#apply함수적용
apply(ma1,1,sum) #행별 함수 적용
apply(ma1,2,sum) #열별 함수 적용

#--막간 복습--#


#+10더하는 사용자 정의 함수 생성
addTen <- function(num1){
  return(num1+10)
}

print(ma1)
apply(ma1,1,addTen)
#행렬에 사용자 정의함수 적용가능
#1행에 적용시 행의 결과가 열로 들어감

apply(ma1,2,addTen)
#열의 결과는 행으로 출력됨


#--막간 복습--#

#데이터 프레임
pr.data <- data.frame(
  name=c('짱구','철수','유리'),
  score=c(70,90,80),
  age=c(5,6,7)
)

print(pr.data)

#데이터 프레임[행,열]
pr.data[,c('score','age')]
#열만 가져오는데 열의 이름으로 접근하며 벡터로 값을 전달

pr.data[1:2,c('score','age')]
pr.data['age']
pr.data[,'age']#이렇게 가져오면 데이터프레임이 아니라 벡터로 가져옴
class(pr.data['age']) #data.frame
class(pr.data[,'age']) #numeric
#--막간 복습--#


#sapply(데이터셋, 함수)
result <- sapply(pr.data['age'],mean)
#sapply를 사용할때는 데이터프레임에서 열만 가져온 형태로 적어야함
#대괄호안에 콤마없이
print(result) #age열의 평균

print(sapply(pr.data[,'age'],mean)) 
#,콤마를 사용하여 벡터형태로 값을 전달하면 벡터요소값 하나하에 개별적으로
#평균을 구하는 함수를 적용한 것이여서 벡터의 요소 값이 그대로 출력됨 
print(sapply(pr.data['age'],addTen)) 
#데이터프레임에 함수 작용



#========사용자 정의함수 실습========#

#<실습>
user.df <- data.frame(
  id=1:4,
  name=c('해리포터','론위즐리','헤르미온느','덤블도어'),
  age=c(17,16,17,60)
)
print(user.df)

#1) 나이를 인수로 받아서 나이가 20살이상이면 '성인' 아니면 '미성년자'
#문자열을 반환하는 함수 정의 한 후 함수 호출하기
#함수명 : is_adult()

is_adult <- function(num1){
  if(num1>=20){
    print('성인')}
  else {
    print('미성년자')
  }
}


#개별출력
is_adult(user.df$age[1])
is_adult(user.df$age[2])
is_adult(user.df$age[3])
is_adult(user.df$age[4])


#반복문으로 출력
for(i in 1:length(user.df$name)){
  is_adult(user.df$age[i])
}


#2)user.df에서 age열의 데이터 is_adult() 함수 적용 후
#user.df에 is_adult라는 새로운 열을 추가 
#추가한 열의 데이터는 is adult(함수의 반환값)


result_a <- sapply(user.df['age'],is_adult)
print(result_a)
#여기서는 괄호안에 콤마를 붙여 벡터의 형태로 값을 전달해주어야함.
#함수 안에 if문이 들어있기때문에 값이 if문을 만나 그 안에서 조건에따라
#출력되는 값이 새로운 변수에 저장되어야하는것인데 if문의 경우
#데이터프레임과 같이 비교대상이 하나 이상의 값이되면 에러가 발생하기때문


user.df$is_adult <- c(result_a)
user.df
