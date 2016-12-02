install.packages("randomForest")
library("randomForest")
library("mlbench")

data(Glass,package="mlbench")
Glass

index= 1:nrow(Glass)
testindex = sample(index,trunc(length(index)/3))
train= Glass[-testindex,]
test = Glass[testindex,]

# fit=randomForest(Type~.,train,ntree=500)
fit=randomForest(Type~.,train,ntree=2)
summary(fit)
pred = predict(fit,test)
mat=table(pred,test$Type)
mat
accuracy = sum(diag(mat))/sum(mat)
accuracy
# -----------------------------------------------------
iris
# -----------------------------------------------------
set.seed(123)

ind<-sample(2,nrow(iris),replace=TRUE,prob=c(0.50,0.50))
iris.training<-iris[ind==1,1:5]
iris.test<-iris[ind==2,1:5]

model <- randomForest(Species~.,iris.training,ntree=100)
summary(model)
pred = predict(model,iris.test)
mat=table(pred,iris.test$Species)
mat
accuracy = sum(diag(mat))/sum(mat)
accuracy
# -----------------------------------------------------
