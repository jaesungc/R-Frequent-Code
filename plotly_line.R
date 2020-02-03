library(ggplot2)
library(plotly)

setwd("D:/OneDrive/temp")

Data<-read.csv("by_cohort_0131.csv",stringsAsFactors = FALSE)
names(Data)

# x<-Data$year
# group<-Data$cohort
# y1<-Data$d_sm_self_high
# y2<-Data$d_sm_child_high

a <- list(
  title = "Year",
  showticklabels = TRUE,
  autotick = FALSE,
  ticks = "outside",
  tick0 = 2009,
  dtick = 2,
  ticklen = 5,
  tickwidth = 2,
  tickcolor = toRGB("blue")
)

b <- list(
  title = "Proportion",
  showticklabels = TRUE,
  autotick = FALSE,
  ticks = "outside",
  tick0 = 0,
  dtick = 0.05,
  ticklen = 5,
  tickwidth = 2,
  tickcolor = toRGB("blue"),
  range=c(0,0.7)
)


fig1 <- plot_ly(Data, x=~year, y=~d_sm_self_high, color=~cohort) %>% 
  add_lines() %>% e
  layout(xaxis = a, yaxis = b, showlegend = TRUE)

fig1

fig2 <- plot_ly(Data, x=~year, y=~d_sm_child_high, color=~cohort) %>% 
  add_lines() %>% 
  layout(xaxis = a, yaxis = b, showlegend = TRUE)

fig2

p <- subplot(fig1, fig2, nrows=2, shareX=TRUE)

p

htmlwidgets::saveWidget(fig1, "figure_sm1.html")
htmlwidgets::saveWidget(fig2, "figure_sm2.html")


# https://plot.ly/r/axes/
