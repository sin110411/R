#배열

#배열 생성하기
#array(데이터, dim=c(행, 열, 차원))

ar1 <- array(1:24, dim=c(3,4,2))#3행 4열의 2차원
#3행 4열로된 배열을 2차원에 걸쳐 만들어달라는 명령어
print(ar1)# 2차원 배열
print(dim(ar1)) #dim을 array에 사용할 경우 차원까지 함께 출력됨
print(length(ar1)) #배열의 요소개수는 차원전부 합쳐서 출력


#배열의 요소 접근
#배열명[행번호, 열번호, 차원]
print(ar1[3,2,2]) #3행 2열 2차원의 값= 18
print(ar1[1,2,1]) #1행 2열의 1차원의 값 =4
print(ar1[,2,1])


#슬라이싱
print(ar1[2:3,1:2,1]) #2~3행에서 1~2열의 1차원값
print(ar1[1:2,3:4,2])

#배열의 특정 차원에 함수 적용
#apply(배열명, 1or 2함수)
row_sums <- apply(ar1,1,sum)
print(row_sums)
#차원의 행끼리 또 합쳐져서 최종결과 반환

row_max <- apply(ar1,1,max)
print(row_max)

print(apply(ar1,2,min)) #열중의 최소값
print(apply(ar1,2,sum)) #열별 합계


#1차원의 배열(행렬)만 따로 추출해 계산하기
ma1 <- ar1[,,1]
print(ma1)
print(rowSums(ma1))
#차원별로 값을 따로 계산하고싶다면 차원을 다른 변수에 할당하여 계산해야함
#차원을 따로 빼면 행렬이 되기때문에 행렬의 특수함수 사용가능


#배열의 연산
#배열간의 연산은 요소별로 실행된다.
ar_a <- array(1:8,dim=c(2,2,2))
print(ar_a)
ar_b <- array(9:16,dim=c(2,2,2))
print(ar_b)

#배열 개별연산
print(ar_a+10)

#배열끼리의 연산
print(ar_a+ar_b)


#배열 확인 함수
#is.array(객체명)
print(is.array(ar_a)) #array배열이 맞냐고 물어보는것
#ar_a는 array배열이 맞기때문에 TRUE반환

vec <- seq(10,30,10)
print(is.array(vec))
#vec는 벡터이기때문에 FALSE출력됨