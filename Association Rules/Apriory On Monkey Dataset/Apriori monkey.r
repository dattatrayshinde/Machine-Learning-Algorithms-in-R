# --------------------------
# Load the library
# --------------------------
library("arules")

# ----------------------------------------------------
# for association rule all transaction should 'be in list
# ----------------------------------------------------
data = list(
  c('M', 'O', 'N', 'K' ,'E', 'Y'),
  c('D', 'O', 'N', 'K' ,'E', 'Y'),
  c('M', 'A', 'K', 'E'  ),
  c('M', 'U', 'C', 'K', 'Y'),
  c('C', 'O', 'K', 'I', 'E')
)

data = as(data,"transactions")

itemFrequency
# ----------------------------------------------------
# Get the association rules with provide suport and confidence
# ----------------------------------------------------  
grouceryRules=apriori(data,parameter=list(support=0.4, confidence=0.60))
inspect(grouceryRules)
