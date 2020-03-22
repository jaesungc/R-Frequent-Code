## 날짜, 시간 생성하기
library(lubridate)

t <- Sys.time()
year<-year(t)
month<-month(t)
day<-day(t)
hour<-hour(t)
min<-minute(t)
sec<-second(t) %>% round()

t
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
