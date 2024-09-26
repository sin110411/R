#행렬(matrix)


#행렬의 생성
#행렬명 <-  matrix(데이터 값, now=(행의수), col=(열의수))

matrix1 <- matrix(1:6, nrow=2, ncol=3);
print(matrix1) #2행3열의 행렬생성
#[,1]에서 콤마표시는 열과 행의 표시

matrix2 <- matrix(1:9, nrow=3, ncol=2)
#데이터의 개수와 행열의 개수가 맞지 않는다면 에러!
print(matrix2)
matrix2 <- matrix(1:9, nrow=4, ncol=4)
#공간이 남아도 에러난다. 항상 데이터의 값과 공간은 동일하게

matrix2 <- matrix(1:9, nrow=3, ncol=3)
print(matrix2)

#행렬생성시 행과 열 생락하면 1열의 행렬로 생성
matrix11 <- matrix(10:15,,)
print(matrix11)      

#행렬의 속성확인 함수

#dim
print(dim(matrix2)) #3행 3열
print(dim(matrix1)) #2행 3열

#nrow
print(nrow(matrix1)) #2행
print(nrow(matrix2)) #3행

#ncol
print(ncol(matrix1)) #3열
print(ncol(matrix2)) #3열


#행렬의 요소접근
#행렬명[행의인덱스번호, 열의인덱스번호]
print(matrix1)
matrix1[2,3] #2행 3열(맨 마지막)

print(matrix2)
print(matrix2[2,1]) 
print(matrix2[3,2])
print(matrix2[1,1])

#행만 출력하는 경우
print(matrix2[,2]) #,아무것도 적지 않으면 열은 전부가져오겠다라는 뜻
#행없이 2열 전체
print(matrix2[1,]) #1행만 가져오겠다는 뜻
#이렇게 출력되는 값들은 전부 벡터(행렬은 벡터의 집합)

print(matrix2)
print(matrix2[1,2:3]) #1행에서 2~3열
print(matrix2[1:2,1:2]) #2차원의 형태로 가져올경우 행렬의 형태
print(matrix2[-2,]) #2행제외 전부
print(matrix2[,-2]) #2열제외 전부
print(matrix2[1:2,-c(1,3)]) #슬라이싱말고 개별값으로 여러개 빼고싶다면
#벡터형태로 묶어서 출력


#행렬의 요소 수정
#벡터의 경우 : 벡터명[인덱스 번호] <- 값
#행렬의 경우 : 행렬명[행번호, 열번호] <- 값
print(matrix2)

matrix2[2,3] <- 10 #기존 8이 10으로 수정
print(matrix2)
matrix2[2,] <- c(3,3,3)
print(matrix2)
matrix2[2,] <- rep(6,times=3)
print(matrix2) #rep를 사용해서 값 수정 가능
matrix2[,1] <- seq(21,25,2)
print(matrix2) #seq사용가능 #1열의 값이 21,25,2로 변경

#행렬의 조작함수
#1)전치함수 : t()
t_matrix <- t(matrix1) #전치함수는 원본변경이 안되기때문에
#전치함된 행렬을 다시 변수에 넣어 사용
print(dim(matrix1)) #2행 3열
print(dim(t_matrix)) #3행 2열
print(t_matrix[3,2])

#2)rbind(행렬명, 벡터) : 행추가
print(matrix1)
mat1 <- rbind(matrix1,c(10,20,30))
print(mat1) #밑에 10,20,30의 값이 출력됨
mat1 <- rbind(matrix1,rep(3,times=3))
mat1 <- rbind(matrix1,seq(3,10,3))
print(mat1)


#3)cbind(헹렬명, 벡터) : 열추가
mat2 <- cbind(matrix1,c(10,20))
print(mat2)


#4)apply(행렬, 1or2, 함수명)
print(matrix1)
print(apply(matrix1, 1,sum))# 행별 합계계산
print(apply(matrix1,2,max))#열별 최대수 출력
print(apply(matrix1,1,median)) #행별 중간값 출력



#행렬의 특수함수
print(matrix1)
print(rowSums(matrix1)) #행별 합계
print(colSums(matrix1)) #열별 합계
print(rowMeans(matrix1)) #행별 평균
print(colMeans(matrix1)) #열별 평균



#행렬의 연산
mat1 <- matrix(c(rep(10,times=2),rep(20,times=2)),nrow=2,ncol=2)
print(mat1)

print(mat1+10) #행렬 요소마다 +10
print(mat1-10) #행렬 요소마다 -10

#같은 크기의 행렬 연산
mat2 <- matrix(seq(50,80,10),nrow=2,ncol=2)
print(mat2)


print(dim(mat1)) #2행 2열
print(dim(mat2)) #2행 2열

print(mat1+mat2) #같은 위치에 있는 요소끼리 계산
print(mat1-mat2)
print(mat1*mat2)


#크기가 다른 행렬의 계산
mat1 <- matrix(c(1,2,3),nrow=1,ncol=3)
mat2 <- matrix(1:6,nrow=2,ncol=3)
print(dim(mat1)) #1행 3열
print(dim(mat2)) #2행 3열
print(mat1+mat2) #에러발생 크기가 동일하지 않음

#벡터+행렬(브로드 캐스팅)
print(c(1,2)+mat1) #브로드캐스팅도 벡터와 행렬이배수관계에 있어야함
print(length(mat2)) #mat2 개수6개
print(c(1,2)+mat2) #2와 6은 배수관계이므로 재사용법칙에 의해 계산가능
#컬럼방향으로 브로드캐스팅된것





#---------------------------------------#

#<실습1>
#1) 1~20으로 구성된 4행 5열의 행렬 생성
test_mat <- matrix(1:20,nrow=4,ncol=5)
print(test_mat)
print(dim(test_mat))

#2) 10으로만 구성된 2행 4열의 행렬 생성
test_mat2 <- matrix(rep(10,times=8), nrow=2, ncol=4)
print(test_mat2)
print(dim(test_mat2))

#3)2까지 만든 행렬의 2행 4열의 값을 35로 수정후 출력
test_mat2[2,4] #10
test_mat2[2,4] <- 35
print(test_mat2)

#4) 위에서 만든 행렬에서 1행의 2열~4열까지 값을 2~4로 수정후 출력
test_mat2[1,2:4]
test_mat2[1,2:4] <- c(2:4)
print(test_mat2)

#5) 31~34로 구성된 새로운 행 추가
rbind(test_mat2,c(31:34))
print(test_mat2)

#6) 41~43로 구성된 새로운 열 추가
cbind(test_mat2,c(41:43))
print(test_mat2)

#7) 행마다의 합 출력
print(rowSums(test_mat2))
print(apply(test_mat2,1,sum))

#8) 열마다의 평균 출력
print(colMeans(test_mat2))
print(apply(test_mat2,2,mean))


#9) 행마다의 최대값, 열마다의 최소값 출력
print(apply(test_mat2,1,max))
print(apply(test_mat2,2,min))

#---------------------------------------#



#<실습2>
#1) 11~30 중 홀수로만 구성된 5행 2열의 행렬 생성
test_mat3 <- matrix(seq(11,30,2),nrow=5,ncol=2)
print(dim(test_mat3))


#2) 위에서 만든 행렬의 행과 열을 전치한 새로운 행렬 생성후 출력
t_test_mat3 <- t(test_mat3)
print(t_test_mat3)

#3)2까지 만든 행렬의 2행 4열의 값을 35로 수정후 출력
t_test_mat3[2,4]
t_test_mat3[2,4] <- 35
print(t_test_mat3)

#4) 위에서 만든 행렬에서 1행의 2열~4열까지 값을 2~4로 수정후 출력
t_test_mat3[1,2:4]
t_test_mat3[1,2:4] <- c(2:4)
print(t_test_mat3)

#5) 31~35로 구성된 새로운 행 추가
t_test_mat3 <- rbind(t_test_mat3,c(31:35))
print(t_test_mat3)

#6) 41~43로 구성된 새로운 열 추가
t_test_mat3 <- cbind(t_test_mat3,c(41:43))
print(t_test_mat3)

#7) 행마다의 합 출력
print(rowSums(t_test_mat3))
print(apply(t_test_mat3,1,sum))


#8) 열마다의 평균 출력
print(colMeans(t_test_mat3))
print(apply(t_test_mat3,2,mean))

#9) 행마다의 최대값, 열마다의 최소값 출력
print(apply(t_test_mat3,1,max))
print(apply(t_test_mat3,1,min))