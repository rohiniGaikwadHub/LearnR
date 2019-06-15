install.packages("tree")
library(tree)
library(ISLR)

A = data.frame(Hitters)
A = na.omit(A)
A$Salary1 = log(A$Salary)
fivenum(A$Salary1)
HighSal = ifelse(A$Salary1 < 6.05,"No","Yes")

A = data.frame(A,HighSal)

# Classification Tree
table(A$HighSal)

model1=tree(HighSal~Years+Hits,A)
model2 = tree(Species ~ .,data = iris)
model2 = tree(race ~ .,data = Wage)

Cars93$Make


plot(model1)

text(model1)

summary(model1)
model1
partition.tree(model1)
