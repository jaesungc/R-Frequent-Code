## You can do both by restarting your R session in RStudio with the keyboard shortcut 
## Ctrl+Shift+F10 
## which will totally clear your global environment of both objects and loaded packages.


## ggsave() 명령어로 그림을 파일에 저장: ggplot2 팩키지를 사용하는 경우, 그림을 ggsave() 명령어로 파일에 저장한다.
ggsave("my-awesome-graph.png")

p <- ggplot(gapminder, aes(x = year, y = lifeExp)) + geom_jitter()
ggsave("fig-io-practice.png", p)



# Remove some rows which satisfying conditions
Stack.final<-Stack %>% filter(x1!="합계")

# Replace all commas into empty
myFun <- function(x) {gsub(",","",x)}
D2<-apply(D1, 2, myFun) %>% data.frame()



## URL을 생성하는 효율적인 코드: XML2::url_absolute
lego_url <- "http://www.imdb.com/title/tt1490017/"
link <- "name101" %>% 
  url_absolute(lego_url)
link



## 날짜, 시간 생성하기
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



## Regression 결과 내보내기
install.packages("outreg")
library("outreg")
fitlist = list(lm(mpg ~ cyl, data = mtcars),
               lm(mpg ~ cyl + wt + hp , data = mtcars),
               lm(mpg ~ cyl + wt + hp + drat, data = mtcars))
outreg(fitlist)

library(AER)
data("CigarettesSW", package = "AER")
CigarettesSW$rprice <- with(CigarettesSW, price/cpi)
CigarettesSW$rincome <- with(CigarettesSW, income/population/cpi)
CigarettesSW$tdiff <- with(CigarettesSW, (taxs - tax)/cpi)

fitlist6 <- list(OLS = lm(log(packs) ~ log(rprice) + log(rincome),
                          data = CigarettesSW, subset = year == "1995"),
                 IV1 = ivreg(log(packs) ~ log(rprice) + log(rincome) |
                               log(rincome) + tdiff + I(tax/cpi),
                             data = CigarettesSW, subset = year == "1995"),
                 IV2 = ivreg(log(packs) ~ log(rprice) + log(rincome) |
                               log(population) + tdiff + I(tax/cpi),
                             data = CigarettesSW, subset = year == "1995"))
outreg(fitlist6)



## Youtube 검색 결과 보기
library("rvest")
read_html(paste0("https://www.youtube.com/results?search_query=", URLencode("love"))) %>%
  html_nodes(xpath = '//*[@class="yt-lockup-content"]') %>%
  html_nodes(xpath = '//*[@rel="spf-prefetch"]') %>%
  html_attr("title")
