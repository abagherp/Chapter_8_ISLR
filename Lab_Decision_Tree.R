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
tree.pred = predict(tree.carseats,Carseats[-train,],type = "class")
with(Carseats[-train,],table(tree.pred,High))

cv.carseats = cv.tree(tree.carseats,FUN = prune.misclass)
cv.carseats
plot(cv.carseats)
prune.carseats = prune.misclass(tree.carseats,best=13)
plot(prune.carseats)
text(prune.carseats,pretty = 1)

tree.pred = predict(tree.carseats,Carseats[-train,],type = "class")
with(Carseats[-train,],table(tree.pred,High))
