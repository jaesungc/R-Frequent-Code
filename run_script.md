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

#### 2. Call a R script in R: **call_R_script.R**
```r
setwd("D:/Folder_Name")
source('main_script.R', encoding = 'UTF-8', echo=TRUE)
```
