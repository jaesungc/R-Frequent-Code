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
