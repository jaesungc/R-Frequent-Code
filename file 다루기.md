```r
today <- Sys.time() %>% format("%Y%m%d")
outfile <- str_c("filename_", today, ".RDS")
saveRDS(df, outfile)
```

```r
library(writelxl)
today <- Sys.time() %>% format("%Y%m%d")
outfile <- str_c("filename", today, ".xlsx")
write_xlsx(df, outfile)
```

### 폴더에 있는 파일 다른 폴더로 복사하기
```r
current_folder <- "D:\\folder1"
new_folder <- "D:\\folder2"
list_of_files <- list.files(current_folder)
file.copy(file.path(current_folder,list_of_files), new_folder)
```
