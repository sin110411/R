#ggplot2패키지

#패키지 설치
install.packages('ggplot2')
library(ggplot2)


#R의 내장 데이터셋 불러오기
airquality #1973년 뉴욕의 대기 측정 데이터

#그래프 기본틀 생성
str(airquality) #str()데이터프레임 요약함수

ggplot(airquality,aes(x=Day,y=Temp))#아직 값이 안들어가고 틀만 만들어진 상태


#산점도 그래프 : geom_point()
ggplot(airquality,aes(x=Day,y=Temp))+
  geom_point(size=3,color='orange')+
  labs(x='일자',y='온도',title='산점도 그래프')

#산점도 그래프 옵션
#1)size : 관측점 크기
#2)color : 색상


#산점도 그래프 월별로 관측점 색상 다르게하기
#산점도는 값이 누적되는 그래프가 아니기때문에 사실 그룹와는 안해주어도 상관은 없음
ggplot(airquality,aes(x=Day,y=Temp,group=Month,colour=factor(Month)))+
  geom_point(size=2)+
  labs(color='Month',title='월별 산점도그래프')
       #범례의 제목 지정부분이기때문에 따옴표를 사용해야함
       #color는 점,선 등의 색상에 대한 범례를 의미


#변수들간의 상관관계 대략적으로 확인하기
#pairs(데이터 셋)
pairs(airquality)



#꺾은선 그래프 : geom_line()
ggplot(airquality,aes(x=Day,y=Temp))+
  geom_line()
#기본적인 형태는이게 맞지만, 데이터 결과적으로는
#x값을 일별로 전부 계산한것이기때문에 무의미 한 상태

#월별로 꺾은선 그래프 그리기
ggplot(airquality,aes(x=Day,y=Temp,group=Month,colour=factor(Month)))+
  geom_line()+
  labs(color='Month')


#막대그래프 : geom_bar()
#mtcars데이터 사용

#cyl종류별 빈도수 확인
mtcars
ggplot(mtcars,aes(x=(cyl)))+
  geom_bar(width=0.2,fill='red')+
  labs(x='cyl',y='빈도 수', title='실린더 별 빈도수')
              #y값을 ggplot에서 정의하진 않았으나, 라벨명 적기 가능
#그래프에서 쓸모없는 값인 5,7이 같이 출력되는 이유는
#실린더의 개수를 범주형으로 변형하지 않았기 때문
#x축 값들을 범주형 변수로 처리하지 않을경우, 기본적으로 연속형 변수로 간주하기때문
#width : 막대 두께
#fill : 막대 색상

#쓸모없는값 빼기
ggplot(mtcars,aes(x=factor(cyl)))+
  geom_bar(width=0.2,fill=c('skyblue','blue','purple'))+
  labs(x='cyl',y='빈도수',title='실린더 별 빈도수')
#막대그래프마다 색상을 다르게 하고싶다면 fill에 벡터형태로 색상 전달
#이 경우, 막대그래프 개수와 색상개수를 맞춰주어야함


#막대별 색상구별 및 범례
ggplot(mtcars,aes(x=factor(cyl), fill=factor(cyl)))+
  geom_bar(width=0.2)+
  labs(fill='cyl')
  
  
#누적 막대 그래프
#실린더 종류별 빈도파악하면서 실린더별로 gear의 개수(빈도)확인
ggplot(mtcars,aes(x=factor(cyl)))+
  geom_bar(aes(fill=factor(gear)),width=0.5)+
  labs(fill='실린더별 기어개수')
  #geom_bar()안에 aes함수를 이요아여 누적할 열 지정


#누적 막대 그래프로 선버스트 차트 만들기
#선버스트 차트 : 계층구조의 데이터를 수준별로 비율을 표시하는 그래프
#coord_polar()추가 
ggplot(mtcars,aes(x=factor(cyl)))+
  geom_bar(aes(fill=factor(gear)))+
  labs(fill='실린더별 기어개수')+
  coord_polar()
 
#도넛형태 선버스트 차트
#coord_polar(theta='y')
ggplot(mtcars,aes(x=factor(cyl)))+
  geom_bar(aes(fill=factor(gear)))+
  labs(fill='실린더별 기어개수')+
  coord_polar(theta='y')


#box그래프 : geom_boxplot
#airquality데이터셋에서 월별로 기온보기
ggplot(airquality,aes(x=Month, y=Temp, group=Month))+
  geom_boxplot()


#히스토 그램 그래프 : geom_histogram()
#airquality 데이터셋에서 Temp(온도) 히스토그램 그래프그리기
ggplot(airquality,aes(x=Temp))+
  geom_histogram(binwidth=0.5,fill='red')
#binwigth : 간격설정, 막대의 너비


#그래프에 그래프 더하기(같은 영역에 그래프 여러개 작성)
ggplot(airquality,aes(x=Day,y=Temp))+
  geom_line(color='red')+
  geom_point(size=2,color='blue')
#한 그래프위에 꺾은선 그래프와 산점고 그래프 같이표시
#같이 사용하고싶은 그래프 +로 연결


#그래프 여러개 같이 한번에 확인
#gridExtra 패키지 사용
install.packages('gridExtar')
library(gridExtra)

g1 <- ggplot(airquality,aes(x=Day,y=Temp))+
  geom_point()
g1 #산점도 그래프 변수안에 저장

g2 <- ggplot(airquality,aes(x=Day,y=Temp))+
  geom_line()
g2#꺾은선 그래프 변수안에 저장

grid.arrange(g1,g2,ncol=2)
grid.arrange(g1,g2,nrow=2)
#arrange() : 그래프 출력시 배치에 사용


#=========실습=========#
#diamonds데이터 사용
diamonds
#1)cut등급별로 막대그래프 그리기

g_bar <- ggplot(diamonds,aes(x=factor(cut),fill=factor(cut)))+
  geom_bar(width=0.3)+
  labs(fill='cut등급별 보석 개수',x='cut등급',y='개수',title='cut등급별 보석 개수')

g_bar


#2)carat과 price데이터로 산점도 그래프 그리기
# x: carat,  y:price
g_point <- ggplot(diamonds,aes(x=carat, y=price,colour=factor(cut)))+
  geom_point(size=2)+
  labs(color='cut',title='carat과 price의 산점도',
       x='carat',y='price')

g_point

#3)위에서 만든 그래프로 같은 영역에 표현
grid.arrange(g_bar,g_point,ncol=2)
