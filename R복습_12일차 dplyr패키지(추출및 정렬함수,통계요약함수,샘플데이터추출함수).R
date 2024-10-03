#패키지

#dplyr 패키지

#패키지 설치
install.packages('dplyr')
library(dplyr)

#filter(데이터, 조건식) : 조건식에 부합하는 행만 추출

#데이터 셋 불러오기
mtcars #데이터학습을 위한 r의 내장 데이터 셋 사용

#1)실린더의 개수가 4개인 자동차만 추출
head(filter(mtcars,cyl==4))
#head : 상위 6개만 가져오기

#select(데이터, 열1, 열2,...) : 지정한 열 데이터 추출
#am,gear열 추출
head(select(mtcars,am,gear))


#arrange(데이터, 열1...) :데이터를 오름차수으로 정렬
#desc()함수를 함께 사용하면 내림차순으로 정렬

#1)wt(무게)열 순으로 오름차순 정렬
head(arrange(mtcars,wt))


#2)mpg(연비)열 기준으로 내림차순 정렬
head(arrange(mtcars,desc(mpg)))


#3) 내림차순과 오름차순 혼용
# mpg,wt기준 
head(arrange(mtcars,mpg,wt))
#다중열 동시에 사용가능하나, 앞에 나열된 열 기준으로 먼저 오름차순
#mpg로 정렬하되, mpg값에 같은값이 있다면 wt값으로 오름차순 하겠다는 의미

head(arrange(mtcars,mpg,desc(wt)))
#내림차순과 오름차순 혼용했을때도 먼저 나열된 열 먼저 오름차순으로 정렬하되,
#같은 값이 있다면 내림차순으로 정렬하겠다는 의미

#mutate(데이터,추가할 열=데이터) : 데이터에 새로운 열 추가
#1) years열 추가, 연도
mutate(mtcars,years='1974')

#2)mpg순위 열 추가
#**rank()함수 : 오름차순 순으로 순위 정함
rank(c(10,11,12,13,14,15)) #값 나오고 랭크값 출력
rank(c(11,9,4,50,23))
rank(c(10,10,11,12,13)) #같은 값이 2개인 경우에만 소수점표시
#1위 : 1.5위 2개
rank(c(10,10,10,11,3,5,12,80))
#같은 값이 3개이상이면 동순위로 출력
rank(10,20,11)#rank의 값은 항상 벡터로 전달!!

head(mutate(mtcars,mpg_rank=rank(mpg)))


#distinct(데이터, 열) : 해당 열에서 중복값 삭제
distinct(mtcars,cyl)
mtcars
#전체데이터에서 일단 먼저 출력된 순서대로 값이 남고, 그 다음에 같은 값이 
#등장하면 두번째로 등장한 값은 중복처리되어 삭제됨
#해당값을 가진 맨 처음행만 삭제처리가 되지 않는것..!
distinct(mtcars,gear)

#2)한번에 여러 열의 중복 삭제하기
distinct(mtcars,cyl,gear)
#한번에 여러열을 나열 했을때 열대로 중복값 삭제가 아니라
#한줄의 행으로 데이터를 인식을 해서 두개의 열값이 모두 같은 행 제거


#summarise(데이터, 열이름=통계함수(열)) : 통계함수와 함께사용하여 데이터 요약을 확인
summary(stu.info) #데이터프레임에서 사용하는 summary는 단순 요약 통계만 출력
summarise(mtcars,cyl_mean=mean(cyl))
summarise(mtcars,gear_max=max(gear))

#1) cyl열의 평균, 최대, 최소값 확인(한번에 출력가능!
summarise(mtcars,
          cyl_mean=mean(cyl),
          cyl_min=min(cyl),
          cyl_max=max(cyl)) #괄호안에 나열하여 한꺼번에 출력 가능

#2)열 이름 지정하지 않아도 사용가능
summarise(mtcars,mean(cyl))
summarise(mtcars,min(cyl),max(cyl))


#group_by(데이터, 열) : 해당 열의 데이터를 기준으로 그룹별로 데이터를 묶음
#주로 다른 함수와 사용!

#1) cyl데이터로 그룹화
gr_cyl=group_by(mtcars,cyl)
gr_cyl #group_by만 사용했을경우 그룹화한걸 확인할 순 없음
#그룹화를 시킨 후에 다른 함수와 사용했을때 그룹화된것을 확인할 수 있음

#다른 함수와 사용
summarise(gr_cyl) #그룹화 결과 확인가능
summarise(gr_cyl,n())
#[4,6,8]옆에 있는 숫자들은 그룹별로 요소값이 몇개인지확인
#n() : 데이터의 값과 해당하는 개수 확인 함수
#cyl데이터를 그룹화 한 후 요약하면 총 4,6,8값이 출력
#이에 따른 데이터의 요소값이 11,7,14개임을 확인

#2) cyl열 그룹마다 gear값이 중복인 데이터를 제외한 개수
gr_cyl <- group_by(mtcars,cyl)
summarise(gr_cyl,n_distinct(gear))
#n_distinct() : 중복데이터를 제거한 고유값 개수확인
#n(), n_distinct()는 단독사용 불가
#summarise, filter,mutate와 함께 사용가능

#sample_n(데이터, 추출할 샘플 개수) : 전체 데이터에서 개수 기준ㅇ로 샘플 추출
#mtcars에서 10개 데이터 샘플
sample_n(mtcars,5)
head(sample_n(mtcars,2))
head(sample_n(mtcars,4))

#sample_frac(데이터, 추출할 샘플 비율) : 전체 데이터에서 비율기준으로 샘플추출
sample_frac(mtcars,0.2) #비율이기때문에 소수로 적어야함
sample_frac(mtcars,0.5)
sample_frac(mtcars,0.9)


#파이프 연산자 
#%>% : 데이터에 여러개의 함수를 한줄에 적용
gr_cyl<- group_by(mtcars,cyl)
summarise(gr_cyl,n())

group_by(mtcars,cyl) %>% summarise(n())
#원래 첫번째 같은 방법으로 따로 써야했지만 %>% 사용하여 한꺼번에 사용

#2) mutata()로 mpg순위 열 추가후 순위를 기준으로 정렬
mp_rank <- mutate(mtcars,mpg_rank=rank(mpg))
arrang(mp_rank)# %>% 연산자 사용X

mutate(mtcars,mpg_rank=rank(mpg)) %>% arrange(mpg_rank)



#==========dplyr함수 실습==========#

#<실습>
#1)mtcars 데이터 에서 mpg가 20이상이고 gear가 3인 데이터 출력
mtcars
filter(mtcars,mpg>=20 & gear==3)

#2)mtcars 데이터에서 hp(마력)순위를 저장하는 hp_rank열 추가후
#hp_rank 열기준으로 오름차순 정렬(파이프연산자 사용)
mutate(mtcars,hp_rank=rank(hp)) %>%  arrange(hp_rank)


#3)matcars 데이터를 mpg데이터로 오름차순 정렬하되,
#mpg가 같은 데이터는 hp데이터로 내림차순 정렬
arrange(mtcars,mpg,desc(hp))


#4)mtcars 데이터에서 hp열의 평균과 mpg의 중앙값 확인
summarise(mtcars,mean(hp),median(mpg))

#5) mtcars에서 샘플데이터 5개 추출
sample_n(mtcars,5)

#6) gear열 기준으로 그룹화 한 후,
#gear의 값과 해당하는 개수 출력(파이프연산자 사용)group_by
group_by(mtcars,gear) %>% summarise(n())

