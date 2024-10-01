#파일 입출력

#text파일 작성
#write.table(데이터, file='파일명')

stu.info <- data.frame(
  ID=c(1,2,3),
  name=c('둘리','도우너','또치'),
  age=c(10,9,11)
)

print(stu.info)


#데이터프레임을 텍스트 파일로 작성하기
write.table(stu.info,file='stu.txt',quote=FALSE) #텍스트 확장자 txt
#quote=FALSE : 텍스트 파일에 있는 따옴표들이 제거됨
#파일 경로 따로 작성하지 않고 파일명만 작성하면 지금r이 있는 경로와 똑같은 위치에저장


#절대경로 작성
#현재경로 확인
getwd()

write.table(stu.info,file='C:/Users/82109/Desktop/R분석/workspece/absolute.txt',
            quote=FALSE, row.names=FALSE)
#row.names=FALSE : 행번호를 작성하지 않는다.



#상대경로 작성
write.table(stu.info,file='./day/relative.txt',quote=FALSE,row.names=FALSE)
#./ : 현재위치 -> getwd()의 경로와 동일

#../
write.table(stu.info,file='../memo/relative.txt',quote=FALSE, row.names=FALSE)
#../ : 상위 폴더로 이동, 파일 탐색기의 상위 폴더로 이동과 동일


#text파일 읽기
read_data <- read.table("./stu.txt",fileEncoding='utf-8',header=TRUE,nrow=2)
#nrow=2 : 몇개의 행을 가져올건지 설정하는것
#header = TRUE : 열제목 설정

read_data #총 3개의 행중에 2개만 가져옴

read.table('./day/relative.txt',fileEncoding='utf-8',header=TRUE,nrow=1)
read.table('./day/relative.txt',fileEncoding='utf-8',header=TRUE,nrow=2)



#csv파일 작성
write.csv(stu.info,"./day/stu.csv",fileEncoding='EUC-KR')

#csv파일 읽기
read.csv('./day/stu.csv',fileEncoding='EUC-KR',nrow=2)


#row.names
#파일을 쓸때는 TRUE, FALSE로 값을 주어 행번호 사용여부결정
#파일읽을때는 숫자로 값을 주어, 해당 번호의 열을 행이름으로 사용한다는 의미



#엑셀파일 작성
#엑셀파일은 패키지를 다운받고 작성해야함
install.packages('writexl')
library(writexl) #라이브러리에 패키지 로드

write_xlsx(stu.info,path='./day/stu.xlsx')


#엑셀파일 읽기
install.packages('readxl')
library(readxl)

read_excel('./day/stu.xlsx')

#엑셀파일 write일때는 xlsx확장명으로
#엑셀파일 read일때는 excel로 

#View()함수
#테이블의 형식으로 읽어온 파일을 보여줌
xl_data<- read_excel('./day/stu.xlsx')
View(xl_data)

read_c <- read.csv('./day/stu.csv',fileEncoding='EUC-KR')
View(read_c)

read_t <- read.table('./stu.txt',fileEncoding='utf-8')
View(read_t)



#===========파일 입출력 실습===========#
#좋아하는 밴드 정보가 담긴 데이터프레임 생성

band <- data.frame(
  band_name=c('유다빈밴드','터치드'),
  vocal=c('유다빈','윤민'),
  song=c('항해','야경')
)

print(band)

#위의 데이터프레임을 day파일에 각각 파일형태로 저장하기

#text파일 생성
write.table(band,file='./day/band.txt',quote=FALSE,row.name=FALSE)

#text파일 읽기
r_band<- read.table('./day/band.txt',fileEncoding='utf-8',header=TRUE)
View(r_band)



#csv파일 생성
write.csv(band,'./day/band.csv',fileEncoding='EUC-KR',quote=FALSE,row.names=FALSE)

#csv파일 읽기
c_band<- read.csv('./day/band.csv',fileEncoding='EUC-KR',header=TRUE)
View(c_band)


#엑셀파일 생성
library(writexl)

write_xlsx(band,path='./day/band.xlsx')


#엑셀파일 읽기
e_band <- band<- read_excel('./day/band.xlsx')
View(e_band)
