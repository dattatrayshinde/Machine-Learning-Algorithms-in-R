# 
# 
library("arules")
# for association rule all transaction should 'be in list
grocery = list(
    c('I1','I2','I5'),
    c('I2','I4'),
    c('I2', 'I3'),
    c('I1', 'I2', 'I4'),
    c('I1','I3'),
    c('c(I2' ,'I3'),
    c('I1' ,'I3'),
    c('I1' ,'I2' ,'I3', 'I5'),
    c('I1' ,'I2' ,'I3' )
    )

grocery = as(grocery,"transactions")

itemFrequency(grocery)
grouceryRules=apriori(grocery,parameter=list(support=0.4, confidence=0.60))
inspect(grouceryRules)

