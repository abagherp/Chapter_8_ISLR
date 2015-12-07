library(ISLR)
library(tree)
attach(Carseats)

hist(Sales)
High = ifelse(Sales<=8.0,"No","Yes")
Carseats = data.frame(Carseats,High)

tree.carseats = tree(High~.-Sales,data=Carseats)
summary(tree.carseats)
plot(tree.carseats)
text(tree.carseats,pretty = 0)
