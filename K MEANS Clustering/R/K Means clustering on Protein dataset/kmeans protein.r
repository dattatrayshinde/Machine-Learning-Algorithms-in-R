# using file protiens.csv
data<-read.csv(file.choose(),header = T)

#ScatterPlot
library(ggvis)
data %>% ggvis(~RedMeat,~WhiteMeat,fill=~Country) %>% layer_points()
data %>% ggvis(~Eggs,~Milk,fill=~Country) %>% layer_points()

#K-Means

set.seed(1)
grpProtien<-kmeans(data[,-1],centers=7)

o=order(grpProtien$cluster)
data.frame(data$Country[o],grpProtien$cluster[o])

set.seed(1)
grpProtien<-kmeans(data[,-1],centers=3)

o=order(grpProtien$cluster)
data.frame(data$Country[o],grpProtien$cluster[o])
