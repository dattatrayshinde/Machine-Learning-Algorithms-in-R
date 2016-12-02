data = read.csv(file.choose())
summary(data)
data

ind = sample(1:14,10)
training_data = data [ind,]
test_data = data [-ind,]

summary(test_data)
# data as it is
model <- svm(Computer.bought ~ ., data = training_data)
summary(model)

test_data
test_data$Computer.bought

predictions = predict(model,test_data[,-5])
predictions
mat=table(predictions,test_data$Computer.bought)
mat
accuracy = sum(diag(mat))/sum(mat)
accuracy
