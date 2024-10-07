#패키지 불러오기
library(ggplot2)


#그래프에 사선그리기

#ggplot에 저장된 economics 데이터셋
economics


#1)geom_abline() : 꺾은선 그래프 그리기
#날짜(date)별 개인 저축렬(psavert)그래프 그리기

ggplot(economics,aes(x=date,y=psavert))+
  geom_line()


#cor.test() 상관관계 구하기
#geom_abline()을 그리기위해서는 상관관계를 확인하여
#절편과 기울기를 구한 후, 두 값을 인수로 전달해야한다.

#날짜와 저축률 상관관계
cor.test(economics$date,economics$psavert)#date가 날짜이기때문에
#수치형 벡터로변환
numeric_date <- as.numeric(economics$date)
numeric_date
#1970년 1월1일 0시 0분 0초를 기준으로 날짜를 숫자로 바꾸면 "날짜 차이(일수)"
#-195인 첫번째 날짜는  1970년 1월1일 0시 0분 0초 를 기준으로 195일 전 이라는 뜻


#다시 상관관계 구하기(수치화된 데이터로)
cor.test(numeric_date,economics$psavert)

#cor : 상관관계 계수. -1~1사이의 값으로 나옴
#양수 : 양수가 1에 가까울 수록 두 변수는 강한 양의 상관관계를 가짐
#음수 : 음수가 -1에 가까울 수록 두 변수는 강항 음의 상관관계를 가진다
#절대값이 0.7이상이면 상관관계가 있다고 본다.
#p-value ; 두변수가 통계적 의미가 있는지 판단하는 검정 통계량
#-> 0.05보다 작으면 통계적으로 유의미하다


#현재데이터의 결과는 cor : -0.8386684이며 p-value < 2.2e-16으로 상관성 확인


#절편과 기울기 구하기 : lm(종속변수y~독립변수x)
rg_result <- lm(economics$psavert~numeric_date)
rg_result


#y절편과 기울기 추출
rg_coef <- coef(rg_result)
rg_coef
class(rg_coef)
#굳이 coef로 한번더 추출하는 것은 안해도 되는 작업이지만
#가독성과 명확성을 위해 lm에서 추출된 기울기와 절편을 coef를 이용하여
#한번더 추출해줌

inter <- rg_coef[1] #절편저장
sl <- rg_coef[2] #기울기 저장


#4)꺾은선그래프에 사선 추가하기
ggplot(economics,aes(x=numeric_date, y=psavert))+
  geom_line()+
  geom_abline(intercept=inter,slope=sl) #1차 단순 회귀분석




#=============실습=============#
#날짜(date)별 개인 저축렬(psavert)산점도그래프위에
#회귀선 그리기


#1)산점도 그래프 그리기
ggplot(economics,aes(x=date, y=psavert))+
  geom_point(size=2,color='red')


#2)date와 psavert의 상관성 구하기
cor.test(economics$date, economics$pasavert)

#date 수치화작업
n_date <- as.numeric(economics$date)
n_date

cor.test(n_date,economics$psavert)
#상관성 확인!


#3)lm()으로 기울기, 절편값 구하기
p_lm <- lm(economics$psavert~n_date)
p_lm


#4)y절편값 추출
p_coef <- coef(p_lm)
p_coef


#5)산점도 그래프 위에 회귀선 그리기
ggplot(economics,aes(x=date,y=psavert))+
  geom_point(size=2,color='red')+
  geom_abline(intercept=p_coef[1], slope=p_coef[2])+
  labs(title='날짜별 저축률 산점도와 회귀선')

#=============실습=============#




#geom_text() : 그래프에 레이블 입력하기
ggplot(airquality,aes(x=Day,y=Temp))+
  geom_point(color='orange')+
  geom_text(aes(label=Temp,vjust=0,hjust=1))
#x = 0: 그래프의 가로축에서 왼쪽 끝 (0% 위치)
#y = 1: 그래프의 세로축에서 위쪽 끝 (100% 위치)


ggplot(airquality,aes(x=Day, y=Temp))+
  geom_point(color='blue')+
  geom_text(aes(label=Day,vjust=1,hjust=0))
#데이터 날짜사용, 레이블 우측하단
#레이블을 오른쪽 하단에 배치하고싶다면 가로값1, 세로값0



#그래프에 객체 추가

#1)평행선 그리기
economics
# 개인 저축률(psavert)과 날짜(date)를 사용한 꺾은선 그래프
#평균값에 대한 평행선 추가

ggplot(economics,aes(x=date,y=psavert))+
  geom_line()+
  geom_hline(yintercept=mean(economics$psavert))
#yintercept에 y값만 넣게되면 모든 y값이 평행선으로 표시됨


#2)수직선 그리기
#개인 저축률이 가장 낮은 시기를 바로 알 수 있는 수직선 추가

#dplyr함수 사용하여 그리기
#x축데이터는 날짜이므로 psavert값이 가장 낮은 날짜부터구하기

library(dplyr)

#저축률이 가장낮은 행 추출
x_inter <- filter(economics,psavert==min(economics$psavert))
x_inter
#저축률중에서 가장 낮은 값 구한것

#행에서 데이터만 추출
x_inter <- x_inter$date
x_inter #날짜만 추출됨

#그래프에 수직선 추가
ggplot(economics,aes(x=date,y=psavert))+
  geom_line()+
  geom_vline(xintercept=x_inter)



#annotate() : 도형 및 화살표 그리기
mtcars

#wt(무게)3~4, mpg(연비) 12~21인 영역에 사각형 도형 그리기
ggplot(mtcars,aes(x=wt,y=mpg))+
  geom_point()+
  annotate('rect',xmin=3,xmax=4,ymin=12,ymax=21,
           alpha=0.5,fill='skyblue')+
  annotate('segment',x=2.5,xend=3.7,y=10,yend=17,
           color='red',arrow=arrow())


#alpha : 투명도
#fill :  도형 색상
#arrow : 끝에 화살표 촉 추가
#x, xend : x축 설정
#y, yend : y축 설정
#x값 지정된거부터 선 시작 이런식으로 그린것


#annotate 도형 종류
#rect : 사각형
#polygon : 다각형
#segment  : 선추가