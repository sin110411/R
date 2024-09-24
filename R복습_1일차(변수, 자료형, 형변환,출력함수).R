#변수

name <- '홍길동';
print(name);
num <- 10;
print(num+10);
#저장된 변수는 값처럼 사용가능
#반드시 변수를 먼저 실행한 후 변수 호출할것

#오늘 날짜를 저장하는 day1, day2, day3
#변수만든 후 변수에 저장된 값출력
day1 <- '20240924';
day2 <- 20240924;
day3 <- 2024.0630;
print(day1); #문자열
print(day2); #숫자형(정수형)
print(day3); #숫자형(실수형)


#기본자료형
#1)숫자형 자료형
num <- 20; #기존에 있던 변수에 그대로 값을 대입하면 변수 변경
num1 <- 10L; #L은 정수형이라는 뜻
print(class(num)) #numeric출력
print(class(num1)) #integer(정수)출력
print(typeof(num)) #double(실수)출력
print(typeof(num1)) #integer출력
print(mode(num)) #numeric출력
print(mode(num1)) #numeric출력
#type가 가장 구체적으로 알려줌


#2)문자형
char1 <- 'hello';
char2 <- '10+20';
print(char1);
print(char2);
print(typeof(char1));
print(typeof(char2)); #''안에 정의됐다면 무조건 문자형
print(class(char1));
print(class(char2));
print(mode(char1));
print(mode(char2));
#전부다 character 출력


#3)논리형
log1 <- TRUE;
log2 <- FALSE;
print(log1);
print(log2);
print(class(log1));
print(class(log2));
print(typeof(log1));
print(typeof(log2));
print(mode(log1));
print(mode(log2));
#전부다 logical출력


#자료형 실습#
#이름(문자열)을 저장하는 변수 name,
#나이 (숫자형 정수)를 저장하는 변수 age,
#취미(문자형)를 저장하는 변수 hobby
#변수에 저장된값 출력, 타입도 출력

name <- '홍길동';
age <- 20L;
hobby <- '영화시청';

print(name);
print(class(name));
print(age);
print(typeof(age));
print(hobby);
print(mode(hobby));


#특수데이터
#1)null : 정의되지 않은 값
null_value <- NULL;
print(null_value);
print(typeof(null_value));
#타입이 null인것이 아니라 비어있다는 뜻

#2)NA : 결측값(측정 / 관측 실패)
na_value <- NA;
print(na_value);


#3)NaN : 수학적으로 정의 불가능한 값
nan_value <- 0/0  #0나누기0
print(nan_value); #nan출력

#4)inf / -inf : 양의무한대와 음의 무한대
inf_value <- 10/0;
print(inf_value); 
#10/0은 수학적으로 양의 무한대를 상징한다.



#자료형 형변환
#1)숫자형 형변환
num1 <- '10.2';
print(class(num1)); #character

print(as.numeric(num1));
print(class(as.numeric(num1)));#numeric


#1-1)실수형-> 정수형
print(as.numeric(num1));
print(typeof(as.numeric(num1))); #double

print(as.integer(num1)); #소수점 버린 정수로 출력됨
print(typeof(as.integer(num1))); #integer


#2)논리형
print(as.numeric(TRUE)); #1 출력
print(as.integer(TRUE)); #1 출력
print(class(as.numeric(TRUE))); #numeric
print(as.integer(FALSE)); #0 출력
print(class(as.numeric(FALSE))); #numeric출력
#논리형에서 TRUE는 0외에 모든 값을, FALSE는 0을 의미한다

#2-1)숫자형->논리형
num3 <- 10;
num4 <- 0;

print(as.logical(num3)); #TRUE
print(as.logical(num4)); #FALSE출력
print(mode(as.logical(num3))); #logical
print(mode(as.logical(num4))); #logical
print(as.logical(0.0)); #0.0도 FALSE의미!


#3)문자형->논리형
print(as.logical('TRUE')); #따옴표 사라지고 TRUE로 출력
print(as.logical('FALSE'));
print(as.logical('T')); #T대문자로도 가능함
print(as.logical('F'));
print(as.logical(""));
#비어있는 값은 FALSE가 아닌 NA결측값출력


#4)문자형 형변환
print(as.character(10)); #'10'으로 출력
print(as.character(20));
print(class(as.character(30))); #character
print(as.character(13.3)); #실수도 가능
print(as.character(TRUE)); #'TRUE'
print(as.character(FALSE));



#출력함수
#1) print() : 하나의 값만 출력
print(1);
#print(1,'문자'); 에러! 출력안됨
print(10.3234234,digits=3); 
#값이 아닌 옵션과는 사용가능하지만 어차피 출력값이 1개여야함
#digits=n : 앞에서부터 숫자 n개만 출력하겠다는 뜻

#2)cat() : 콤마를 이용하여 여러개 값 출력
cat(1,'문자',TRUE);
#cat안에 있는 3가지의 값 출력됨

num <- 10;
cat('num에 저장된 값: ',num);
#cat을 활용하면 문장 출력도 가능함

#sprint(): 여러종류의 데이터를 하나의 문자열안에서 서식에 맞춰 출력
sprintf("정수형: %d",10);
sprintf("실수형: %f",13.4);
sprintf("실수형 자리수 제한: %.2f",10.123);
#%.nf : n수만큼 자리수 출력
sprintf("논리형: %s",TRUE);
sprintf("문자형: %s","HI");
sprintf('%d %f %s',10,3.14,FALSE);


#실습#
#이름(문자열)을 저장할 변수 name
#나이(정수)를 저장할 변수 age
#오늘날짜를 저장할 변수(실수)를 저장할 변수 date 월까지만

#<출력결과>
#이름: 000
#나이 : 00세
#오늘날짜 : 2023.06

#1)cat()
#2)sprintf()사용

#----------------------#

#변수정의
name <- '홍길동';
age <- 25;
date <- 2024.09;

#cat 사용
cat('이름: ',name);
cat('나이: ',age);
cat('오늘날짜: ',date);
#cat은 콤마로 구분되어있기때문에
#2개의 값이 출력된것.(문자열1개 숫자1개)


#sprintf사용
sprintf('이름: %s ',name);
sprintf('나이: %d ',age);
sprintf('오늘날짜: %.2f',date);
#sprintf는 형식지정자이기때문에
#값이 하나로 인식됨. 문자열안에 숫자형이 들어온것뿐!