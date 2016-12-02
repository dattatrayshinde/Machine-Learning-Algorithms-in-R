# ==============================================================================
# APRIORI / ASSOCIATION RULE / MARKET BASKET ANALYSIS
# ==============================================================================
library("arules")
# get the data
data = read.csv("Apriori FM.CSV")
# split the data x into groups defined by f..unsplit will reverse the effect
playlist= split(x=data[,"artist"],f=data$user)
# get the list
playlist = lapply(playlist,unique)
playlist[1:2]
class(playlist)
# CONVERT LIST TO TRANSACTION
playlist = as(playlist,"transactions")
# see the freqency(support for each item)
itemFrequency(playlist)
# sort to get the item with maximum frequency
sort(itemFrequency(playlist))
# Run the algorithm and create association rules
musicRules=apriori(playlist,parameter=list(support=0.1, confidence=0.1))
musicRules
# print the rules
inspect(musicRules)
# ==============================================================================

