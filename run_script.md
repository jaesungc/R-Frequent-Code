### 특정한 작업을 수행하는 R script를 규칙적으로 실행하도록 설정하는 샘플 코드
Encoding 문제로 인해서 3단계로 작업을 했었음. 이보다 더 간단하게 설정하는 방법이 있을 수도 있지만 참고자료로 남겨둠. <br>
1. call script를 실행하는 batch file
2. script를 call하는 script
3. mian script

#### 1. Run a batch file in CMD or using windows task scheduler: **run_script.bat**
```
d:
cd D:\Folder_Name
R CMD BATCH "call_R_script.R"
```
위 과정을 수행하기 위해서는 R 실행파일이 있는 하드디스크의 경로를 환경변수에 추가해야 함. 환경변수에 경로를 추가하는 방법은 다음 글을 참고하면 됨
[환경변수에 실행 파일 경로 추가하기](https://rootblog.tistory.com/206)

<br>

#### 2. Call a R script in R: **call_R_script.R**
```r
setwd("D:/Folder_Name")
source('main_script.R', encoding = 'UTF-8', echo=TRUE)
```

<br>

### R Markdwon으로 작성된 Rmd 파일을 실행시키기
```r
today <- format(Sys.Date(),"%Y%m%d")
outfile <- str_c("Daily_Report_", today, ".html")
rmarkdown::render('file_name.Rmd', output_file=outfile)
```
