#단순선형회귀 분석

#패키지 로드
library(ggplot2)


#데이터 셋 로드
#speed가 높을 수록 자동차의 제동거리도 높다
cars

#1)회귀분석을 하기전 두 변수 사이의상관관계 분석
#두 변수 사이에 관계가 없다면 분석결과가 나와도 무의미

#2)산점도 그래프로 대략적인 상관관계확인
ggplot(cars,aes(x=speed,y=dist))+
  geom_point()
#관측치들이 한 방향으로 가고있기때문에 대략적으로 관계가 있다고 파악 가능

#기본그래프 함수 활용하여 관계확인방법
#plot(종속변수~독립변수)
plot(cars$dist~cars$speed)

#3)상관관계 함수로 확인 : cor.test()
cor.test(cars$speed,cars$dist)
#p-value = 1.49e-12
#cor = 0.8068949 
#상관성 확인

#4)회귀모델 구현
#lm(종속변수~독립변수) : y절편값, 기울기
model <- lm(cars$dist~cars$speed)
model

#y절편 기울기 추출 : coef
b <- coef(model)[1]
w <- coef(model)[2]

b
w

#5) 회귀식(모델)그래프에 추가
ggplot(cars,aes(x=speed,y=dist))+
  geom_point()+
  geom_abline(intercept=b,slope=w)


#6)모델평가
#회귀식을 활용해 주행속도, speed에 따른 제동거리 구하기
#y=Wx+b  (y절편은 기울기x독립변수 + 상수)
#상수 : 변하지 않고 더해지는 값

#회귀식을 구현할 함수 정의
line_reg <- function(x){
  return(w*x+b)
}


#lm에서 구해진 y절편은 독립변수 x가 0일때의 y의값
#이 y절편은 회귀분석 모델링을 할때 상수로 사용이됨


line_reg(30) #주행속도 30일때 제동거리 예측값 100
line_reg(35) #주행속도 35일때 제동거리 예측값 120
line_reg(40) #주행속도 40일때 제동거리 예측값 139


#7)예측값과 실제값의 차이확인(예상 제동거리, 실제 제동거리)
#독립변수(speed)만 따로 추출
speed <- cars$speed
speed

#제동거리 예측값 계산
pred <- w*speed+b
pred


#모델의 예측값 구하는 함수  : predict(모델,데이터셋)
#모델은 lm()함수를사용해서 구한 값을 의미
pred <- predict(model,cars)
pred


compare <- data.frame(pred,cars$dist,abs(pred-cars$dist))
#ads() : 절대값을 구하는 함수
#절대오차를 구하는 법 : 예측값 - 실제값 (절대값 함수 사용)
View(compare)
colnames(compare) <- c('예상','실제','오차')
head(compare)


-----------------------------------------------------


#다중 선형회귀분석

#다중 선형회귀분석을 위한 패키지 설치

#car 패키지 : 'Compaion to Appied Regression'
#회귀분석을 수행하는데 있어 유용한 함수와 도구를 포함
install.packages('car')
library(car)

#데이터 셋 불러오기
Prestige
#1971년 캐나다 직업과 관련된 사회적 지위,
#소득, 교육, 수준 등을 나타내는 데이터


#1)데이터 준비
data.set <- Prestige[,1:4] #행은 전체 다 가져오고 열은 1~4열까지만 로드
data.set
print(colnames(data.set))#열 이름확인


#education, women, prestige를 독립변수, income(수입)을 종속변수
#3개의 독립변수로 1개의 종속변수 예측하는 다중 선형회귀 분석


#2)산점도로 변수간 관계확인
dev.off() # 이전 그래프 장치 종료
plot(data.set,ph=16,col='blue')


#3)상관관계와 산점도 확인
#필요 패키지 설치 및 로드
install.packages('GGally')
library(GGally)

#ggpairs()를 사용한 산점도, 상관관계 같이 확인
ggpairs(data.set,title="산점도, 밀도, 상관관계")+
  theme_minimal()
#변수간의 밀도그래프, 산점도, 상관관계를 한번에 확인 가능

#[그래프 설명]
#하단 삼각형에 산점도 표시
#상단 삼각형에 상관관게 개수 표시
#대각선에 밀도 표시

#인컴과 프레스티지, 인컴과 에듀케이션이 양의 상관관계를 가진다는걸 확인할 수 있음
#education, prestige 와 income은 양의 상관관계
#women과 income은 음의 관계


#4)회귀모델 도출(회귀식)
#lm(종속변수~독립변수)
model <- lm(income~education+women+prestige,data=data.set)
#데이터 직접 지정(data.set$income)하지 않았으므로 뒤에 데이터 표시해주어야함
model
summary(model)


#<확인해야 할 부분>
#1) 변수들의 Estimate값(특정 변수의 계수를 추정한 값)
#(Intercept) -253.850
#education    177.199
#women        -50.896
#prestige     141.435

#2)***으로 된 부분 : income(종속변수)를 설명하는데 중요한 변수
#*이 많을 수록 중요하다(*이 붙으면 회귀분석하는데 영향을 많이 준다는뜻. 
#별이 많을 수록 더 기여를 많이 함)

#3)p-value: < 2.2e-16
#2.2 x 10^-16 : 0.05보다 작다
# p-value가 < 0.05이라면 모델 신뢰 수준이 95% 이상이다

#4)Adjusted R-squared:  0.6323
#모델의 설명력
#설명력 : 모델이 실제 데이터를(현재 회귀식에서는 data.부분) 얼마나 설명할 수 있는지
#0~1사이이며 모델이 실제 데이터를 63%를 설명할 수 있다.


#다중선형회귀 할때는 필요한 변수들만 가져와서 모델을 생성해야함
data <-  Prestige[,1:5] #데이터 하나 더 추가해서 데이터 다시 설정
#type변수 제외하고 전부로드
data

#패키지 불러오기
library(MASS)
#MASS : 다양한 통계분석 기법과 데이터 셋을 제공하는 패키지

#5)모델생성
model <- lm(income~education+women+prestige+census,data=data)
model

#stepAIC()함수 : 모델생성에 기여하는 변수들을 선별하는 함수
model2 <- stepAIC(model)
#기존 model에서 모델생성에 기여하는 변수들을 선별하여 model2에 재할당

#step이 진행될때마다 필요없는 변수가 하나씩 줄어든다
#AIC=1607.93 : 모델의 적합도와 복잡도를 모두 고려하는 지표
#AIC 계산식 : AIC=2 X log-likelihood + 2 x k
#AIC값은 모델의 적합도(log-likelihood)와
#모델의 자유도(모수의 수)에 의해 결정
#k는 모델 변수의 개수

#setpAIC 동작 순서 : 
#1)strat 초기모델 ; 주어진 초기모델(model)에서 시작
#AIC값이 작은 모델을 선택하는 것이 목표

#2) 변수를 추가 / 제거
#단계별로 변수를 추가하거나 제거해서 새로운 모델을 만든다
#이때 만들어진 모델의 AIC값을 계산

#3) 최적 모델 선택 : 
#AIC값이 가장 작은 모델을 선택하고, 그 모델을 기반으로 
#다음 단계로 진행
# 이 과정은 더이상 AIC값이 감소하지 않을때까지 반복

#최종 AIC값 : AIC=1604.96
#더이상 AIC값이 떨어지지 않을때까지 반복하는것

model2 #확인해보면 women이랑 Prestige 2개의 변수만 남음



#6)모델평가
pred <- predict(model2,data)
pred #직업명과 함께 출력
pred<- unname(pred) #예측값만 보기
pred <- round(pred,0)
pred


#실제값
Prestige$income


#7)실제값과 예측값 차이확인
pred_data <- data.frame(pred,Prestige$income,pred-Prestige$income)
colnames(pred_data) <- c('예측값','실제값','오차범위')
pred_data
View(pred_data)

#8)MAE값 확인하기
MAE <- mean(abs(pred-Prestige$income))
MAE


-----------------------------------------------------


  
#로지스틱 회귀분석 : 종속변수가 연속적인 숫자가 아니라 범주형데이터로 되어있을때사용

#iris 데이터셋
#다양한 붓꽃(iris) 종을 분류한 데이터
iris


#꽃받침과 꽃임 데이터로 품종을 예측하는 모델 구축
#(로지스틱 회귀 모델)


#1)데이터 준비
data <- iris
data

#2)범주형데이터를 숫자형으로 변환
#as.intrger()
data$Species <- as.integer(data$Species)

#3)변환확인
iris$Species #기존데이터
data$Species #변환 확인
#setosa : 1
#versicolor :2
#virginica : 3


#4)로지스틱 회귀모델 생성
#glm(종속변수~독립변수)
model <- glm(Species ~ ., data=data) # . : 종속변수 제외 전체
model

summary(model)
# Estimate 랑 *확인해야함
# Estimate 를 확인해보면 회귀식의 상수와 변수의 계수를 확인할 수 있다
# Petal.Length와 petal.width(꽃잎의 길이와 너비)는
#회귀식을 도출하는데 큰 기여


#생성한 모델로 품종예측
head(iris,3) #행 3개만 확인

#5)첫번째 행의 독립변수로 품종 예측
#첫번째 행 도출 후 -> 데이터 프레임

unkown <- data.frame(rbind(c(5.1,3.5,1.4,0.2)))
#rinb 행추가
names(unkown) <- names(iris)[1:4]

unkown
#하나의 데이터로 붓꽃 품종 데이터 예측
#predict(모델, 데이터셋) 
#데이터셋에 모델 적용하여 예측결과 반환

pred <- predict(model,unkown)
pred #예측값 : 0.9174506 (예측결과는 실수로반환되기때문에 반올림 필수)
pred <- round(pred,0) #정수로 반올림
pred #반환값 1 : setosa

head(iris)#첫번째 예측결과 실제 값과 일치


#6)전체데이터로 모델 평가하기

#전체데이터 준비
#종속변수(품종)을 제외한 독립변수로만 구성된 데이터 셋
head(iris)
test <- iris[,1:4]
test #품종빠진 데이터 셋

#7)모델에 데이터를 적용하여 품종예측
pred <- predict(model,test)
pred

#8)실제값이 정수형이기때문에 예측값을 정수형으로 변환
pred <- round(pred,0)
pred #예측값

#9)실제 품종 데이터 가져오기
answer <- iris$Species
answer


#10)범주형 데이터를 숫자형으로 변환
answer<- as.integer(answer)
answer #실제품종(정수형)

#11) 예측품종과 실제 품종비교
#관계연산자 사용
#실제 데이터와 예측데이터가 다르다면 False출력될것 
answer==pred

#12)예측 정확도 계산
acc <- mean(answer==pred)
acc

#일치하는 개수 확인
total_acc <- sum(answer==pred)
total_acc #146
print(length(pred)) #150
#4개의 값 제외하고 146개의 값이 일치!

#연산될때 TRUE 는 1로 FALSE는 0으pred#연산될때 TRUE 는 1로 FALSE는 0으로 계산된다
# ->TREU(1)의 합계 / 데이터 수 =정확도
# ->TRUE의 개수 / 행의개수