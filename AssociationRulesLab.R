#To Begin
#Install the packages and load libraries
#install.packages('arules')
#install.packages('arulesViz')
library('arules')
library ('arulesViz')

#read in the transactions
#data <- read.transactions ("AssociationRules.csv",rm.duplicates = FALSE,format="basket",sep=" ")
data("Groceries")
data <- Groceries
str(data)
summary(data)

###############################################################################
inspect(data[1:3])
#Part a
#most frequent bought item
itemFrequency(data[,1])
itemFrequencyPlot(data, support = 0.10)
itemFrequencyPlot(data, topN= 10)
# itemFrequency(data)


#part b largest Transaction
summary(data)

#part c
#mine rules
m1 <- apriori(data, parameter=list(support=0.007, confidence=0.25, minlen=2))
# m1

summary(m1)
inspect(m1[1:2])
inspect(sort(m1, by="lift")[1:10])
inspect(sort(m1, by="confidence")[1:20])

###################################################
#part d
m2 <- apriori(data, parameter=list(support=0.01, confidence=0.5))

#part f
#create a scatter plot
plot(m2)

#part g
plot(m2, measure=c("support", "lift"), shading="confidence")

#part j
plot(m2, measure=c("support", "lift"))