#연산자#

#최우선 연산자#
print((10+1)*2);
print(10+1*2);
#괄호안에 있는것이 먼저 연산


#단항연산자
print(+10);
print(+20);
print(-10);
print(-100);


#산술연산자
num1 <- 10;
num2 <- 3;

#+뎃셈
print(num1+num2);

#-뺄셈
print(num1-num2);
print(num2-num1);#작은 수 에서 큰 수 빼면 마이너스로 출력

#*곱셈
print(num1*num2);
print(num1*1.5); #소수도 가능

#/나눗셈
print(num1/num2);
print(num1/2); 
#파이썬에서는 나눗셈결과가 전부 실수지만
#r에서 출력값이 정수면 동일하게 정수로 출력

#%%나머지 연산자
print(num1%%2); #0
print(num2%%2); #1
print(27%%3);
#%%나머지 연산자는 짝수,홀수,배수 표현할때 주로사용

#%/%몫연산자
print(num1%/%num2); #3

#**거듭제곱
print(num1**2); #10*10
print(num2**3); #3*3*3


#관계연산자
num3 <- 10;
num4 <- 15;

print(num3<num4); #num3이 num4보다 작니?
print(num3>num4); #num4가 num3보다 작니?
print(num3 >=num4);
print(num3==10);
print(num!=20);

#==과 !=는 문자형에서도 가능
print('안녕'=='안녕');
print('안녕'!='안녕');


#논리연산자
print(TRUE & TRUE);
print(TRUE & FALSE);
print(TRUE | FALSE);
print(!TRUE);
print(!FALSE);

num5 <- 10;
num6 <- 0;
print(num5>10);
print(num5>10 & num5==10);
print(num5==10, num5<20); #둘다 참
print(num5==10 | num5<9); #참 거짓 = 참
print(!(num5==10 & num6<1)); #둘다참 = 거짓
print(!(num6==0 & TRUE==1));
#논리형과 숫자형 관계연산자로 사용가능

#대입연산자
#<-사용 (Alt+-)
#값 -> 저장공간도 가능함
num <- 10;
10 ->num2;
print(num);
print(num2); #이것도 가능

#-----------------------------------#
#<실습1> 코인노래방 프로그램 만들기
#코인 노래방에서 한 곡당 가격400원이다.
#투입할 금액을 저장할 변수 생성하고
#투입할 금액으로 부를 수 있는 곡의 개수와
#거스름돈 금액 출력(산술연산자 사용)

coin <- 1500;
sing <- 400;
cat('투입한 금액: ', coin);
cat('부를 수 있는 곡 개수: ', coin%/%sing,'곡');
cat('거스름돈: ',coin%%sing,'원'); #나머지 연산자사용
cat('거스름돈: ',coin-(sing*3),'원'); #최우선 연산자 사용


#<실습2>
#나이 저장할 변수를 만들고
#나이가 20살 이상이면 TRUE출력, 아니면 FALSE출력
age <- 20
print(age >= 20);

#<실습3>
#정수를 저장하는 2개의 변수를 생성하고
#2개의 정수가 모두 양수라면 TRUE
#하나라도 양수가 아니라면 FALSE
num <- 10;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
num1 <- 50;

print(num>0 & num1>0);
