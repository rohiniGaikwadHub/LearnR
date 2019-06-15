install.packages("caret")
library(caret)
library(ISLR)

data("Hitters")
A = data.frame(Hitters)
A
A = na.omit(A)
colnames(A)
str(A)
set.seed(123)
sf = sample(2,nrow(A),replace = T,prob = c(0.6,0.4))
trd = A[sf == 1,]
tsd = A[sf == 2,]
tc =  trainControl(method = 'repeatedcv', number = 10, repeats = 3)

set.seed(123)

model1 = train(League ~ . ,
               data = trd, 
               method = 'knn', 
               trControl = tc, 
               preProc = c("center","scale"))

PR = predict(model1, newdata = tsd)

confusionMatrix(PR,tsd$League)
