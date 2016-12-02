library("randomForest")
data = read.csv(file.choose())
summary(data)
data

ind = sample(1:10,8) 
training_data = data [ind,]
test_data = data [-ind,]

summary(test_data)
# data as it is

# model <- randomForest(Computer.bought~.,training_data,ntree=5)#0.5
# model <- randomForest(Computer.bought~.,training_data,ntree=10)#0.25
model <- randomForest(Computer.bought~.,training_data,ntree=50)
# model <- randomForest(Computer.bought~.,training_data,ntree=20)
# model <- randomForest(Computer.bought~.,training_data,ntree=100)

summary(model)
pred = predict(model,test_data)
mat=table(pred,test_data$Computer.bought)
mat
accuracy = sum(diag(mat))/sum(mat)
accuracy
