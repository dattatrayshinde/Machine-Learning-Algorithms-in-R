#using file protiens.csv
iris


#iris
set.seed(1)
sampleiris<-iris[sample(1:150,40),]
distance<-dist(sampleiris[,-5],method="euclidean")
cluster<-hclust(distance,method="complete")
plot(cluster,hang=-1,label=sampleiris$Species)
