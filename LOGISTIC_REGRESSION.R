library(ggplot2)
install.packages("psych")
library("psych")

A = read.csv(file.choose())  
profit_size = ifelse(A$PROFIT < 107978.19,0,1)

A_cor = cor(A[,c(1:3,5)])
pairs(A)
pairs.panels(A)

A = data.frame(A,profit_size)
A$profit_size = as.factor(A$profit_size)

model1 = glm(profit_size ~ RND , data = A,family = binomial)

set.seed(123)
divfun = sample(2,nrow(A),replace = T,prob = c(0.7,0.3))
trd = A[divfun == 1,]
tsd = A[divfun == 2,]

trp = predict(model1,trd,type = 'response')
p1 = ifelse(trp > 0.5,1,0)
cmtrd = table(Predicted = p1, Actual = trd$profit_size)

tsp = predict(model1,tsd,type = 'response')
p2 = ifelse(tsp > 0.5,1,0)
cmtsd = table(Predicted = p2, Actual = tsd$profit_size)

