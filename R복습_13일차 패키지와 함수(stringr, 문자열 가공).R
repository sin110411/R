#stringr패키지

#패키지 설치
install.packages('stringr')
library(stringr)


#1)str_count(문자열1, 문자열2) : 문자열1에서 문자열2의 개수를 카운트
str_count('abaabb','a') #3개
str_count('안녕하세요','안')

#str_count벡터사용
str_v <- c('apple','banana','melon')
str_count(str_v,'a') #문자열 벡터의 요소마다 a개수 카운트

for(str in str_v){
  print(str_count(str,'a'))
} #이 과정과 똑같음.
#원래 반복문을 사용해야했지만 반복문을 사용할 필요없이 패키지로만 가능

#2)str_c(문자열1, 문자열2,...) : 문자열 연결
str1 <- str_c('cute','cat')
print(str1) #연결한 문자 변수에 저장 가능

str2 <- str_c('안녕','하세요')
print(str2)


#str_c벡터사용
v <- c('one','tow','three')
str_c(v,'vecter') #나열된 순서대로 결합되기때문에 이점 주의할것
str_c('vecter',v) #벡터의 요소마다 하나씩 결합됨
str_c('안녕','하세요')
str_c('하세요','안녕')


#str_c옵션
#1)sep 옵션
str_c('a','b','c')
str_c('a','b','c',sep=',') #연결할 문자열 사에마다 넣을 문자열 설정
str_c('a','b','c',sep='@')

#2)collapse옵션
str_c(v,collapse=',')
#sep과 같은 기능을 하지만 벡터일때 사용하는 함수
#문자열 벡터요소사이마다 해당 문자열을 추가함

#str_dup(문자열, 숫자):문자열 반복
str_dup('dog',2)
str_dup('안녕',3)
str_dup('사원',2)

#str_dup 벡터사용
str_dup(v,2)
#벡터에 str_dup사용시, 벡터의 요소마다 반복

#str_length(문자열) : 문자열의 길이 반환
str_length('안녕하세요')
str_length('sunday')

#str_length벡터사용
str_length(v) #벡터의 요소마다 길이 반환

#str_located(문자열1, 문자열2) : 문자열1에서 문자열2위치를 반환(시작, 끝 위치)
str_locate('abab','a') #시작하는 위치와 끝나는 위치
#한글자이기때문에 시작위치와 끝위치가 같아 1이 나옴
str_locate('안녕하세요','안녕')

str_locate_all('abaaabba','a')
#문자열1에 중복값이 있는데, 그 중복값의 위치를 전부 다 보고싶을 경우
#str_locate_all을 사용하여 값을 전부 다출력
#str_locate_all을 사용한 값은 리스트형태로 출력됨
class(str_locate_all('afaffaaa','a')) #list

#str_replace(원본 문자열, 바꿀대상, 바꿀 문자열) : 문자열 교체
str1 <- 'abbac'
str_replace(str1,'a','*')
str_replace(str1,'b','$')
str_replace_all(str1,'a','*')
#str_replace_all을 사용하면 원본문자열에서 중복되는 값전체를 바꿀 수 있음


#str_split(문자열1, 문자열2) : 문자열1을 문자열2 기준으로 분리
str2 <- str_c('cow','/','dog','/','cat')
print(str2)
#/을 기준으로 분리
str_split(str2,'/')
str_split(str2,'o')


#str_sub(문자열,start,end) : 시작~끝 번호로 문자열 추출
print(str2)
str_sub(str2,start=1,end=3) #1~3번째 글자까지
str_sub(str2,start=3) #end생략시 끝까지 출력
str_sub(str2,end=4) #start생략시 처음부터
str_sub(str2,start=-4)#음수 기입시 뒤에서부터 N번째 위치를 기준


#str_trim(문자열) : 문자열 공백 추출
str3 <- ' 문 자 열 '
str_trim(str3) #양쪽 공백제거
#문자열 중간에 존재하는 문자열은 제거 안됨
str_trim(str3,side='right') #오른쪽 공백 제거
str_trim(str3,side='left') #왼쪽 공백 제거

#str_trim백터 사용
str4 <- c(' 문자열 ', '  안녕 ', '  공백  ')
str_trim(str4) #벡터 요소별로 공백 제거