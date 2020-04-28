```r
outfile <- str_c("filename_", today, ".RDS")
saveRDS(df, outfile)
```

```r
library(writelxl)
outfile <- str_c("filename", today, ".xlsx")
write_xlsx(df, outfile)
```
