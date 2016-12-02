library("e1071")
#----------------------------------------------------------------
data=iris

head(data)

data(iris)
attach(iris)

## classification mode
# default with factor response:
model <- svm(Species ~ ., data = iris)
summary(model)
pred = predict(model,iris[1:4])
table(pred,iris$Species)
#----------------------------------------------------------
iris
set.seed(123)

ind<-sample(2,nrow(iris),replace=TRUE,prob=c(0.90,0.10))
iris.training<-iris[ind==1,1:5]
iris.test<-iris[ind==2,1:5]

model <- svm(Species ~ ., data = iris.training)
summary(model)
pred = predict(model,iris.test[1:4])
mat=table(pred,iris.test$Species)

accuracy = sum(diag(mat))/sum(mat)
accuracy

#----------------------------------------------------------
library("mlbench")
#----------------------------------------------------------------
data(Glass,package="mlbench")
Glass
summary(Glass)
head(Glass)
set.seed(123)

library(dplyr)

type1=Glass%>%
        filter(Type == 1)
type2=Glass%>%
  filter(Type == 2)
type3=Glass%>%
  filter(Type == 3)
type4=Glass%>%
  filter(Type == 4)
type5=Glass%>%
  filter(Type == 5)
type6=Glass%>%
  filter(Type == 6)
type7=Glass%>%
  filter(Type == 7)

# Glass[sample(1:nrow(type1),round(nrow(type1)*(10/100))),]
# sample(1:nrow(type2),round(nrow(type2)*(10/100)))

type1_ind=sample(1:nrow(type1),round(nrow(type1)*(30/100)))
type2_ind =sample(1:nrow(type2),round(nrow(type2)*(30/100)))
type3_ind=sample(1:nrow(type3),round(nrow(type3)*(30/100)))
type4_ind=sample(1:nrow(type4),round(nrow(type4)*(30/100)))
type5_ind=sample(1:nrow(type5),round(nrow(type5)*(30/100)))
type6_ind=sample(1:nrow(type6),round(nrow(type6)*(30/100)))
type7_ind=sample(1:nrow(type7),round(nrow(type7)*(30/100)))

# training_data = rbind(Glass[sample(1:nrow(type1),round(nrow(type1)*(70/100))),],
#                       Glass[sample(1:nrow(type2),round(nrow(type2)*(70/100))),],
#                       Glass[sample(1:nrow(type3),round(nrow(type3)*(70/100))),],
#                       Glass[sample(1:nrow(type4),round(nrow(type4)*(70/100))),],
#                       Glass[sample(1:nrow(type5),round(nrow(type5)*(70/100))),],
#                       Glass[sample(1:nrow(type6),round(nrow(type6)*(70/100))),],
#                       Glass[sample(1:nrow(type7),round(nrow(type7)*(70/100))),]
#                       )

training_data = rbind(Glass[type1_ind,],
                      Glass[type2_ind,],
                      Glass[type3_ind,],
                      Glass[type4_ind,],
                      Glass[type5_ind,],
                      Glass[type6_ind,],
                      Glass[type7_ind,]
)

test_data = rbind(Glass[-type1_ind,],
                  Glass[-type2_ind,],
                  Glass[-type3_ind,],
                  Glass[-type4_ind,],
                  Glass[-type5_ind,],
                  Glass[-type6_ind,],
                  Glass[-type7_ind,]
)
nrow(training_data)
nrow(test_data)

temp = training_data
training_data = test_data
test_data = temp

nrow(training_data)
nrow(test_data)

summary(training_data)

model <- svm(Type ~ ., data = training_data)
summary(model)
pred = predict(model,data = test_data[,-10])
pred
mat=table(pred,test_data[10])
mat
accuracy = sum(diag(mat))/sum(mat)
accuracy
#----------------------------------------------------------
# Create index new column and do the partition
#----------------------------------------------------------
index= 1:nrow(Glass)
testindex = sample(index,trunc(length(index)/3))
testindex

nrow(Glass)

train= Glass[-testindex,]
nrow(train)
test = Glass[testindex,]

# model <- svm(Type ~ ., data = train,cost=50, gamma= 1)
model <- svm(Type ~ ., data = train)
summary(model)
pred = predict(model,test[-10])
mat=table(pred,test$Type)

accuracy = sum(diag(mat))/sum(mat)
accuracy
#----------------------------------------------------------
# Partition  with caret package
#----------------------------------------------------------

inTraining <- createDataPartition(Glass$Type, p = .5, list = FALSE,times=1)
Glass_train=Glass[inTraining,]
summary(Glass_train)
Glass_test=Glass[-inTraining,]
summary(Glass_test)
#----------------------------------------------------------
