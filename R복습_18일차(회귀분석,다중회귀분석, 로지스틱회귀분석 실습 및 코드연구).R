#패키지 로드
library(ggplot2)
  
  
#[[회귀분석 모델링 코드연구]]
#diamonds데이터에서 가격별 무게의 상관관계를 알아보고
#가격의 변동에 따른 무게예측하기
  
  
#데이터 셋 로드
diamonds

#상관관계분석
cor.test(diamonds$price,diamonds$carat)
#p-value = < 2.2e-16
#cor= 0.9215913
#상관성 확인


#그래프로 상관관계확인
plot(diamonds$price,diamonds$carat)


#기울기, 절편 구하기
model<- lm(diamonds$carat~diamonds$price)
model

#기울기 절편 추출하기
b <- coef(model)[1]
w <- coef(model)[2]


b #종속변수가 0일때 y절편의 값(상수)
w #기울기


#회귀모델 평가
#함수 생성
model_p <- function(x){
  return(w*x+b)
}

model_p(20.1)


#예측값 저장
pred <- model_p(diamonds$carat)
pred


#예측값, 실제값, 오차 출력
dia_model <- data.frame(pred,diamonds$carat,abs(pred-diamonds$carat))
colnames(dia_model) <- c('예측값','실제값','오차')
View(dia_model)

-----------------------------------------------------
  
  
#[[회귀분석 모델링 실습2]]
  
#mpg데이터의 displ에 따른 cty값 예측하기(사용자 정의함수사용해서 예측모델만들기)
#데이터 셋 불러오기
  
library(ggplot2)
mpg <- as.data.frame(ggplot2 :: mpg) # 패키지 :: 데이터 : 패키지에 저장된 특정 데이터를 불러올 때 사용
mpg


#1) cty와 displ 두변수의 상관관계 계산

plot(mpg$cty,mpg$displ)

cor.test(mpg$cty,mpg$displ)

#p-value : < 2.2e-16
#cor : -0.798524 


#2) displ(배기량)으로 cty(도시에서 연비)을 예측하는 회귀모델 생성

#모델 생성(절편, 기울기 구하기)
model <- lm(mpg$cty~mpg$displ)
model


#모델에서 절편과 기울기값 추출
b <- coef(model)[1] #절편(상수)
w <- coef(model)[2] #기울기



#3) displ(배기량)데이터로 회귀모델을 적용하여
#cty(연비)에측값 계산


#사용자 함수 이용하여 풀기
#예측값 함수 정의
pred <- function(x){
  return(abs(w*x+b))
}

pred<- round(pred(mpg$displ),0)
pred


#실제값과 예측값 비교 및 오차범위확인

result <- data.frame(pred,mpg$cty,pred-mpg$cty)
colnames(result) <- c('연비 예측값','연비 실제값','오차범위')

View(result)


#모델의 성능 확인 (MAE)
MAE <- sum(abs(pred-mpg$cty))/nrow(mpg)
MAE #1.811966

range(mpg$cty) #9 35
#현재 모델의 오차는 전체범위에서 약6.95%정도에 해당
#성능이 매우 우수하다고는 할 수 없으나, 꽤 양호한 수준의 오차범위를 가지고있음


#예측된 값의 산점도 그래프 및 회귀선 그리기

mpg1 <- data.frame(
  displ=mpg$displ,
  cty=result$`연비 예측값`
)


mpg1


ggplot(mpg1,aes(x=displ,y=cty))+
  geom_point(color='red')+
  geom_abline(intercept=b,slope=w)+
  labs(title='예측cty와 실제 displ의 상관관계')

-----------------------------------------------------
  
#(predict함수사용해서 예측모델만들기)
  
#데이터 셋 불러오기
  
library(ggplot2)
mpg <- as.data.frame(ggplot2 :: mpg) # 패키지 :: 데이터 : 패키지에 저장된 특정 데이터를 불러올 때 사용
mpg


#1) cty와 displ 두변수의 상관관계 계산

plot(mpg$cty,mpg$displ)

cor.test(mpg$cty,mpg$displ)

#p-value : < 2.2e-16
#cor : -0.798524 


#2) displ(배기량)으로 cty(도시에서 연비)을 예측하는 회귀모델 생성

#모델 생성(절편, 기울기 구하기)
model <- lm(mpg$cty~mpg$displ)
model


#모델에서 절편과 기울기값 추출
b <- coef(model)[1] #절편(상수)
w <- coef(model)[2] #기울기

#predict(모델,데이터 셋)함수 이용하여 풀기
pred <- predict(model,mpg)
pred #실수 출력. 형변환 필요
pred <- round(pred,0)
pred

#실제값 확인
mpg$cty


#정확도 확인
mean(pred==mpg$cty) #0.1752137


#모델의 성능 확인 (MAE)
MAE <- sum(abs(pred-mpg$cty))/nrow(mpg)
MAE #1.811966
#===============회귀분석모델링 코드연구===============#



-----------------------------------------------------
  
  
#===============다중 회귀분석 코드연구===============#
  
#iris데이터에서 Sepal.Length, Sepal.Width, Petal.Length데이터를 가지고 
#Petal.Width의 값 예측하기
  
  
#1)데이터셋 준비
iris
iris1 <- data.frame(
  Sepal.Length=iris$Sepal.Length,
  Sepal.Width=iris$Sepal.Width,
  Petal.Length=iris$Petal.Length,
  Petal.Width=iris$Petal.Width
)

iris1#필요한 데이터만 로드



#2)종속변수와 독립변수간의 상관성 확인

#패키지 로드
library(car)
library(GGally)
ggpairs(iris1,title='종속변수와 독립변수간의 상관성 확인')+
  theme_minimal()

#Sepal.Length와Petal.Length 가장 높은 상관성을 보임


#3)절편,기울기 구하기 / 모델링
model <- lm(Petal.Width~Sepal.Length+Sepal.Width+Petal.Length,data=iris1)
model

summary(model)

#Adjusted R-squared : 0.9366 
#p-value : < 2.2e-16
#*** : Sepal.Length,  Sepal.Width,  Petal.Length


#4)다중 회귀분석 stepAIC진행
library(MASS)

model2 <- stepAIC(model)
model2


#5)예측값 계산
#stepAIC를 통해 선택된 변수들로 생성된 새로운 model2사용
pred <- predict(model2,iris1)
pred <- round(pred,1)
pred


#6)예측값과 실제값 비교
result1 <- data.frame(pred,iris$Petal.Width,pred-iris$Petal.Width)
colnames(result1) <- c('예측값','실제값','오차범위')
result1
View(result1)


#7)정확도 비교
mean(iris$Petal.Width==pred) #0.26
#하지만 Petal.Width의 경우 연속적인 값이기때문에
#관계연산자를 사용한 비교의 비율값은 올바르지 않을 수 있음


#8)정확하게 일치한 값 도출
sum(iris$Petal.Width==pred) #36개
#최대오차범위 0.6이상 벗어나는 값이 없음
#꽤 높은 예측률을 보여주는 모델

#===============다중 회귀분석 코드연구===============#


-----------------------------------------------------
  
  
  
#=============로지스틱 회귀분석 코드연구=============#
  
#mtcars데이터에서 mpg(연비),hp(마력),cyl(실린더 수)로 am(자동차 변속기 여부)예측하기

#1)데이터 셋 준비
mtcars

data <- data.frame(
  mpg = mtcars$mpg,
  cyl = mtcars$cyl,
  hp = mtcars$hp,
  am = mtcars$am
)


data #am데이터가 이진분류인 범주형데이터 형태
#만약 문자형이라면 as.integer로 변환한 후 사용할것


#2)절편,기울기 구하기 / 모델링
#로지스틱 회귀분석은 glm사용

model <- glm(am~.,data=data)
model


#3)예측값 구하기
#실제 데이터 준비
real_am <-data.frame(
  mpg = mtcars$mpg,
  cyl = mtcars$cyl,
  hp = mtcars$hp
)

real_am #am 값이 빠진 실제 데이터


pred <- predict(model,real_am)
pred
pred <- round(pred,0)
pred


#4)예측값과 실제값 비교
#실제값 데이터 준비
real_am <- data.frame(
  am=mtcars$am
)

real_am


mean(real_am==pred) #0.84375


pred_data <- data.frame(pred,mtcars$am,pred-mtcars$am)
colnames(pred_data) <- c('실제값','예측값','오차범위')
pred_data
View(pred_data)


#정확도 계산
MAE <- sum(abs(pred-real_am))/nrow(data)
MAE #0.15625


sum(pred==real_am) #32개 데이터중 27개완벽 일치

#=============로지스틱 회귀분석 코드연구=============#