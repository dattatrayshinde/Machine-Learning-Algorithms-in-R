iris
#ScatterPlot
library(ggvis)
iris %>% ggvis(~Sepal.Length,~Sepal.Width,fill=~Species) %>% layer_points()
iris %>% ggvis(~Petal.Length,~Petal.Width,fill=~Species) %>% layer_points()

#K-Means

set.seed(1)
grpIris<-kmeans(iris[,-5],centers=3)
grpIris$cluster
class(grpIris$cluster)

# Method 1
o=order(grpProtien$cluster)
o
data.frame(iris$Species[o],grpProtien$cluster[o])

# Method 2
table(grpIris$cluster, iris$Species)

# Method 3
iris[grpIris$cluster==1,]
iris[grpIris$cluster==2,]
iris[grpIris$cluster==3,]
