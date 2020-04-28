### 날짜와 시간 변수를 다룰 때 사용한 코드를 정리해두는 공간입니다.

#### 날짜, 시간 생성하기
```r
library(lubridate)

t <- Sys.time()
date <- format(t,"%Y%m%d")
year<-year(t)
month<-month(t)
day<-day(t)
hour<-hour(t)
min<-minute(t)
sec<-second(t) %>% round()

t
date
year;month;day;hour;min;sec
```

#### 날짜 변수의 '연산'
```r
library(lubridate)

today<-format(Sys.time(),"%Y-%m-%d")
start.date<-today
start.date<-as.Date(end.date) %m-% months(1)
start.date<-as.Date(end.date) %m-% days(1)
```

#### Time Zone을 고려하기
```
library(lubridate)

time.system <- Sys.time()
time.seoul <- with_tz(time.system, tzone="Asia/Seoul")
time.EDT <- with_tz(time.system, tzone="America/New_York")

today <- Sys.time() %>% format("%Y%m%d")
today.seoul <- Sys.time() %>% with_tz(tzone="Asia/Seoul") %>% format("%Y%m%d")
```

#### Date 변수가 Today로 나온 경우를 날짜 형태로 변경하기
```r
time.system <- Sys.time()
  time.seoul <- with_tz(time.system, tzone="Asia/Seoul") %>% format("%y.%m.%d")
  date[date=="Today"] <- time.seoul
```
