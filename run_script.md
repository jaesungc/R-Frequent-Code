### 특정한 작업을 수행하는 R script를 규칙적으로 실행하도록 설정하는 샘플 코드


#### Case 1. Batch File을 만들어서 동작시키기

Encoding 문제로 인해서 3단계로 작업을 했었음. 이보다 더 간단하게 설정하는 방법이 있을 수도 있지만 참고자료로 남겨둠. <br>
1. call script를 실행하는 batch file
2. script를 call하는 script
3. mian script

##### 1. Run a batch file in CMD or using windows task scheduler: **run_script.bat**
```
d:
cd D:\Folder_Name
R CMD BATCH "call_R_script.R"
```
위 과정을 수행하기 위해서는 R 실행파일이 있는 폴더를 환경변수 경로에 추가해야 함 <br>
(제어판 -> 시스템 및 보안 -> 시스템 -> 고급 시스템 설정 -> 고급탭 하단 환경변수 -> 상단 Box의 변수 중 Path 선택 -> 찾아보기 선택해서 경로 추가) <br>
환경변수 PATH에 특정 폴더를 추가하는 방법에 대한 상세한 설명은 아래 블로그 글을 참고하면 됨 <br>
[환경변수에 실행 파일이 들어있는 폴더를 PATH에 추가하기](https://rootblog.tistory.com/206)

##### 2. Call R script in R: **call_R_script.R**
```r
setwd("D:/Folder_Name")
source('main_script.R', encoding = 'UTF-8', echo=TRUE)
```

<br>

#### R Markdwon으로 작성된 Rmd 파일을 실행시키기
```r
today <- format(Sys.Date(),"%Y%m%d")
outfile <- str_c("Daily_Report_", today, ".html")
rmarkdown::render('file_name.Rmd', output_file=outfile)
```

<br>

#### Case 2. scheduleR 라이브러리를 사용해서 동작시키기 (call script에 한글이 있으면 인코딩 문제가 발생할 수 있음)

##### 1. scheduleR로 task 등록하기
(R-Studio add-in에서 "Schedule R scripts on Windows"를 열어서 설정할 수도 있음)
```r
library(taskscheduleR)

## 0. Schedule a task
letter_auto = file.path("D:/R_Project/Daily_report/Run_daily_letter.R") 

## Daily
taskscheduler_create(taskname = "Daily_letter", rscript = letter_auto,
                     schedule = "DAILY", 
                     starttime = "19:15", 
                     startdate = format(Sys.Date(), "%Y/%m/%d"))

# Hourly
taskscheduler_create(taskname = "Daily_letter_hourly", rscript = letter_auto,
                     schedule = "HOURLY",
                     starttime = format("14:00"),
                     startdate = format(Sys.Date(), "%Y/%m/%d"),
                     modifier = 1)

# Minute으로 test
taskscheduler_create(taskname = "Daily_letter_minute", rscript = letter_auto,
                     schedule = "MINUTE",
                     starttime = format(Sys.time() + 62, "%H:%M"),
                     startdate = format(Sys.time(), ""),
                     modifier = 3)

taskscheduler_delete("Daily_letter")
taskscheduler_delete("Daily_letter_hourly")
taskscheduler_delete("Daily_letter_minute")

alltasks <- taskscheduler_ls()
check.task <- subset(alltasks, TaskName %in% c("Daily_letter"))
```

##### 2. Call R script in R: **call_R_script.R**
```r
setwd("D:/Folder_Name")
source('main_script.R', encoding = 'UTF-8', echo=TRUE)
```

