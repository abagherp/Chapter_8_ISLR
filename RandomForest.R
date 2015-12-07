require(randomForest)
require(MASS)

set.seed(101)
dim(Boston)
train = sample(1:nrow(Boston),300)
