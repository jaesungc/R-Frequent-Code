# Remove some rows which satisfying conditions
Stack.final<-Stack %>% filter(x1!="합계")

# Replace all commas into empty
myFun <- function(x) {gsub(",","",x)}
D2<-apply(D1, 2, myFun) %>% data.frame()
