#### R에서 생성한 Table을 HTML 파일이나 Dashboard로 내보낼 때 사용하는 코드

#### knitr, kable_extra 패키지 사용
```r
library(knitr)
library(kable_extra)

df <- mtcars %>% 
  mutate(model=row.names(.)) %>% 
  head(30) 

df.out <- df %>% 
  select(model, mpg, cyl, disp, hp)

df.out %>% 
  kable(format="html", escape=FALSE) %>% 
  kable_styling(bootstrap_options = c("striped", "hover", "condensed")) %>% 
  column_spec(1, width = "8em") %>%
  column_spec(2, width = "4em") %>%
  column_spec(3, width = "4em") %>% 
  column_spec(4, width = "4em") %>% 
  column_spec(5, width = "4em") 

## HTML 파일로 저장하기
outfile <- "filename.html"
df.out %>%
  kable(format="html", escape=FALSE) %>% 
  kable_styling(bootstrap_options = c("striped", "hover", "condensed")) %>% 
  column_spec(1, width = "8em") %>%
  column_spec(2, width = "4em") %>%
  column_spec(3, width = "4em") %>% 
  column_spec(4, width = "4em") %>% 
  column_spec(5, width = "4em") 
  save_kable(file = outfile, self_contained = T)
```

#### DT 패키지 사용
```r
library(DT)

df.out <- mtcars %>% head(30)

df.out %>% 
  datatable(escape=FALSE)
```
