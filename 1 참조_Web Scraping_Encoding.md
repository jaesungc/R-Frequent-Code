### Method 2: html_table() 이용해서 data.frame으로 뽑아내기
```r
res %>% html_table(fill=TRUE) ## Encoding 문제가 있어서 table이 바로 생성되지 않음.
```

박찬엽씨가 하듯이 Sys.setlocale을 변경하면 일부 해결되기도 함.
```r
Sys.setlocale("LC_ALL", "C")
tab <- res %>% html_nodes(xpath="//table") %>% .[[1]] %>% 
  html_table(fill=TRUE)
Sys.setlocale("LC_ALL", "Korean_Korea.949")
```

### <U+00A0> 제거하고, 필요한 행만 남기기
```r
names(tab) <- LETTERS[1:dim(tab)[2]]
tab2 <- tab %>% mutate_all( ~ str_replace_all(., "[[:space:]]", "")) %>% 
  slice(3:5)
tab2
```

### Data.frame에서 모든 열에 있는 공백 지우기.
```r
res %>% html_nodes("ul.type01 li dd.txt_inline") %>% html_text() %>% 
  str_remove_all("보내기|네이버뉴스|선정") %>% str_trim() %>% str_split_fixed(" ", 2) %>% 
  as.data.frame() %>% mutate_all(~ str_trim(.)) -> e1
```

### 변수의 수가 많을 때는 'LETTERS' 대신 아래 방법을 사용
```r
n.col <- dim(tab)[2]
names(tab) <- str_c("v",(1:n.col))
```



### [이현열, Post 방식 예제: 기업공시채널에서 오늘의 공시 불러오기]
(https://hyunyulhenry.github.io/quant_cookbook/%ED%81%AC%EB%A1%A4%EB%A7%81-%EC%9D%B4%ED%95%B4%ED%95%98%EA%B8%B0.html)
```r
Sys.setlocale("LC_ALL", "English")

url = 'http://kind.krx.co.kr/disclosure/todaydisclosure.do'
data = POST(url, body =
              list(
                method = 'searchTodayDisclosureSub',
                currentPageSize = '15',
                pageIndex = '1',
                orderMode = '0',
                orderStat = 'D',
                forward = 'todaydisclosure_sub',
                chose = 'S',
                todayFlag = 'Y',
                selDate = '2019-01-08'
              ))

data = read_html(data) %>%
  html_table(fill = TRUE) %>%
  .[[1]]

Sys.setlocale("LC_ALL", "Korean")
```
