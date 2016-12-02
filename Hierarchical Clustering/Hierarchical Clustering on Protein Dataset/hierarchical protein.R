#using file protiens.csv

data<-read.csv(file.choose(),header = T)

#ScatterPlot
library(ggvis)
data %>% ggvis(~RedMeat,~WhiteMeat,fill=~Country) %>% layer_points()
data %>% ggvis(~Eggs,~Milk,fill=~Country) %>% layer_points()

#H-clustering
set.seed(1)
#method euclidean or manhattan or others
distance<-dist(data[,-1],method="euclidean")
distance
#method= single or average or complete
cluster<-hclust(distance,method="complete")
plot(cluster,hang = -1,label=data$Country)
rect.hclust(cluster,k=3)

