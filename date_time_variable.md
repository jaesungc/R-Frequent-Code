### 날짜와 시간 변수를 다룰 때 사용한 코드를 정리해두는 공간입니다.

```r
library(lubridate)

today<-format(Sys.time(),"%Y-%m-%d")
start.date<-today
start.date<-as.Date(end.date) %m-% months(1)
start.date<-as.Date(end.date) %m-% days(1)
```
