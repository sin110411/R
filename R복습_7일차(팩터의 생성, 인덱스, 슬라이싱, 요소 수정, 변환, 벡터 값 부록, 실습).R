#팩터(factor)

bt <- c('a','b','o','ab') #문자형 벡터
print(bt)

bt.new <- factor(bt)
print(bt.new)
print(levels(bt.new)) #범주값확인 함수 : levels
print(class(bt.new)) #factor

#팩터의 요소 접근
print(bt)
print(bt.new[4])
print(bt.new[2])
print(bt.new[-1])
print(bt.new[5]) #인덱스범위 벗어나면 결측값 반환
#하지만 levels값은 함께 출력됨

#슬라이싱
print(bt.new[1:3])
print(bt.new[2:4])


#팩터의 숫자형 변환
print(bt.new)
print(as.integer(bt.new))
#1, 3, 4, 2
#a  b  c  ab
#팩터에서 알파벳은알파벳의 순서대로 숫자가부여됨
#한글의 경우 팩터의 범주값 숫자는 입력순서대로 1번부터 부여됨


#팩터의 요소 추가
print(length(bt.new)) #현재 팩터 내부요소 4개
bt.new[5] <- 'a'
#아무것도 없는 인덱스 번호 적고 값을 할당.
#5번째 자리에 값을 추가하겠다는 뜻
print(bt.new)

bt.new[6] <- 'c'#에러!
#팩터는 값의 종류가 한번 정해지면 다른 종류의 값들은 추가할 수 없음
#기존에 만들어놓은 bt.new안에 'c'라는 값이 없어서 추가할 수 없음


#=========벡터 부록=========#
#벡터에 특정값 존재 유무확인

#벡터생성
vec <- seq(10,50,10)
print(vec)

#방법1) %in%연산자 사용
print(30 %in% vec)
#30이라는 값이 vec안에 있니?하고 묻는것. 결과는 논리형으로 반환
print(100 %in% vec) #거짓
print(12 %in% vec)

#방법2) any(조건식)함수 사용
print(any(vec==30))
print(any(vec>=10)) #관계연산도 사용가능
print(any(vec==1))
print(any(vec==10))

#방법3) which(조건식)함수 사용
#조건식에 부합하는 인덱스 번호를 반환
print(which(vec==30))
print(which(vec>=10))
print(which(vec==5)) #값이 없으면 integer(0)반환
#=========벡터 부록=========#



#---------------[실습코드]--------------------#

country <- c("korea","japan","china","korea","India","china","korea")

#1)위의 벡터로 팩터를 만든뒤 출력
f.country <- factor(country)
print(f.country)
print(class(f.country))

#2)팩터의 4번째 값 출력
print(f.country[4])

#3)팩터에 저장된 값의 종류
print(levels(f.country))

#4)팩터의  문자열 값을 숫자형으로 변환한뒤 출력
print(as.integer(f.country))
