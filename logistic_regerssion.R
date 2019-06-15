library(ISLR)

A = data.frame(Hitters)
A = na.omit(A)
str(A)
A$NewLeague1 = ifelse(A$NewLeague == "A", 1 , 0 )

sf = sample(2,nrow(A),replace = TRUE,prob = c(0.7,0.3))

trd = A[sf == 1,]

tsd = A[sf == 2,]

model1 = glm(NewLeague1 ~ AtBat + League ,data = trd,family = "binomial")

TRP = predict(model1,tsd,type = "response")

TRP1 = ifelse(TRP > 0.5,"A","N")

W = data.frame(tsd$AtBat,tsd$League,tsd$NewLeague,TRP1)

table(W$tsd.NewLeague,W$TRP1)

#===============ANOTHER EXAMPLE================

install.packages("MASS")
library(MASS)
A = data.frame(Cars93)

A1 = A[AirBags == "Driver only",c(5,9)]

library(psych)
library(sqldf)

A1 = sqldf("select AirBags,Price from A where AirBags == 'Driver only' OR AirBags == 'None'")

A1$AirBags1 = ifelse(A1$AirBags == "None",0,1)

model1 = glm(AirBags1 ~ Price,data = A1,family = "binomial")











