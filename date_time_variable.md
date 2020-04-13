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
