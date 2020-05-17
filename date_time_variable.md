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

#### 네이버 뉴스에서 기사 제공 시간이, "**시간 전, 1일 전, 2일 전, ..." 등으로 표기된 경우 날짜로 변경하기
```r
df2 <- df1 %>% 
  mutate(date = str_remove(date, "Korea언론사|Korea|foodnews")) %>% 
  mutate(date = str_trim(str_remove(date, "^.*면.단"))) %>% 
  mutate(date = str_trim(str_remove(date, "^.*면")))

# df3 <- df2 %>% 
#   mutate(date = str_extract(date, "\\d{4}\\.\\d{2}\\.\\d{2}\\.$")) 

today.seoul <- Sys.time() %>% with_tz(tzone="Asia/Seoul")
today.seoul

today.m0 <- today.seoul %m-% days(0) %>% format("%Y.%m.%d.")
today.m1 <- today.seoul %m-% days(1) %>% format("%Y.%m.%d.")
today.m2 <- today.seoul %m-% days(2) %>% format("%Y.%m.%d.")
today.m3 <- today.seoul %m-% days(3) %>% format("%Y.%m.%d.")
today.m4 <- today.seoul %m-% days(4) %>% format("%Y.%m.%d.")
today.m5 <- today.seoul %m-% days(5) %>% format("%Y.%m.%d.")
today.m6 <- today.seoul %m-% days(6) %>% format("%Y.%m.%d.")
today.m7 <- today.seoul %m-% days(7) %>% format("%Y.%m.%d.")

df3 <- df2 %>% 
  mutate(date = case_when(str_detect(date, ".*시간 전") ~ today.m0,
                          date=="1일 전" ~ today.m1,
                          date=="2일 전" ~ today.m2,
                          date=="3일 전" ~ today.m3,
                          date=="4일 전" ~ today.m4,
                          date=="5일 전" ~ today.m5,
                          date=="6일 전" ~ today.m6,
                          date=="7일 전" ~ today.m7,
                          TRUE ~ date
                          )
  )
```

#### 날짜 형식 통일하기
```r
tab <- rbind(tab1, tab2) %>%
  mutate(date = case_when(str_detect(date, ".*시간 전") ~ str_c(today.m0, ", ", date),
                          TRUE ~ str_remove_all(date, "\\s") %>% 
                            as.Date(format="%Y.%m.%d") %>% 
                            format("%Y.%m.%d")
                          )
  ) %>% 
  arrange(desc(date))
```
#### 날짜 Sequence 만들기
```r
from<-as.Date("2011/01/01")
to<-as.Date("2019/12/31")
window<-as.character(seq(from,to,"months"))
window<-str_sub(window,1,7) %>% str_replace("-","")
```
