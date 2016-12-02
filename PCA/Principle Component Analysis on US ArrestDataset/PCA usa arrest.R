USArrests=USArrests
summary(USArrests)
data = USArrests

plot(USArrests)
pairs(USArrests, panel = panel.smooth, main = "USArrests data")


states=row.names(USArrests)
apply(USArrests, 2, mean)
apply(USArrests, 2, var)

pr.out=prcomp(USArrests,scale=TRUE)
pr.out$rotation


pr.out$x=pr.out$x
biplot(pr.out,sacle=0)

pr.out$sdev
pr.var=pr.out$sdev^2

pve=pr.var/sum(pr.var)

plot(pve,xlab="Principle component", ylab="Proportion of the variance explained"
     ,ylim=c(0,1),type="b")

plot(cumsum(pve),xlab="Principle component", ylab="Cumulative Proportion of the variance explained"
,ylim=c(0,1),type="b")






