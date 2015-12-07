library(ISLR)
library(tree)
attach(Carseats)

hist(Sales)
High = ifelse(Sales<=8.0,"No","Yes")
Carseats = data.frame(Carseats,High)

tree.carseats = tree(High~.-Sales,data=Carseats)
summary(tree.carseats)
plot(tree.carseats)
text(tree.carseats,pretty = 1)

set.seed(1011)
train = sample(1:nrow(Carseats),250)
tree.carseats = tree(High~.-Sales,data=Carseats,subset = train)
plot(tree.carseats)
text(tree.carseats,pretty = 1)


